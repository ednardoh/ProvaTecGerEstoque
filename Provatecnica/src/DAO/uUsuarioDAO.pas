unit uUsuarioDAO;

interface

uses
  FireDAC.Comp.Client, uConexao, uUsuarioModel, System.SysUtils, uSistemaControl;

type
  TUsuarioDAO = class
    private
      FConexao: TConexao;
    public
      constructor Create;

      function Incluir(AUsuarioModel: TUsuarioModel): Boolean;
      function Alterar(AUsuarioModel: TUsuarioModel): Boolean;
      function Excluir(AUsuarioModel: TUsuarioModel): Boolean;
      function GetId: Integer;
      function ObterUsuario(AValorparcial: string): TFDQuery;
  end;

implementation

{ TUsuarioDAO }


constructor TUsuarioDAO.Create;
begin
  FConexao := TSistemaControl.GetInstance().Conexao;
end;

function TUsuarioDAO.GetId: Integer;
var
  vQry: TFDQuery;
begin
  vQry := FConexao.CriarQuery();
  try
    vQry.Open('SELECT coalesce(MAX(ID),0)+1 AS ID FROM USUARIO');
    try
      Result := vQry.Fields[0].AsInteger;
    finally
      vQry.Close;
    end;
  finally
    vQry.Free;
  end;
end;

function TUsuarioDAO.Incluir(AUsuarioModel: TUsuarioModel): Boolean;
var
  vQry: TFDQuery;
begin
  vQry := FConexao.CriarQuery();
  try
    try
      vQry.Connection.StartTransaction;
      vQry.ExecSQL('INSERT INTO USUARIO (ID,            '+
                   '                     NOMEUSUARIO,   '+
                   '                     SENHA)         '+
                   '                    VALUES (        '+
                   '                      :ID,          '+
                   '                      :NOMEUSUARIO, '+
                   '                      :SENHA)       ',
                   [AUsuarioModel.ID,
                    AUsuarioModel.NOMEUSUARIO,
                    AUsuarioModel.SENHA]);

      vQry.Connection.Commit;
      Result := True;
      except
      on E: Exception do
        begin
          vQry.Connection.Rollback;  //desfaz a transa��o
        end;
    end;
  finally
    vQry.Free;
  end;
end;

function TUsuarioDAO.Alterar(AUsuarioModel: TUsuarioModel): Boolean;
var
  vQry: TFDQuery;
  strSQL: string;
begin
  vQry := FConexao.CriarQuery();
  try
    try
      strSQL :='';
      vQry.Connection.StartTransaction;
      vQry.Close;
      vQry.SQL.Clear;

      strSQL := ' UPDATE USUARIO SET NOMEUSUARIO=:NOMEUSUARIO,  '+
                '                    SENHA=:SENHA               '+
                ' where ID=:ID                                  ';

      vQry.SQL.Add(strSQL);
      vQry.ParamByName('NOMEUSUARIO').AsString := AUsuarioModel.NOMEUSUARIO;
      vQry.ParamByName('SENHA').AsString       := AUsuarioModel.SENHA;
      vQry.ParamByName('ID').AsInteger         := AUsuarioModel.ID;

      vQry.ExecSQL();
      vQry.Connection.Commit;
      except
      on E: Exception do
        begin
          vQry.Connection.Rollback;  //desfaz a transa��o
        end;
      end;
      Result := True;
  finally
    vQry.Free;
  end;
end;

function TUsuarioDAO.Excluir(AUsuarioModel: TUsuarioModel): Boolean;
var
  vQry: TFDQuery;
begin
  vQry := FConexao.CriarQuery();
  try
    try
      vQry.Connection.StartTransaction;
      vQry.ExecSQL(' DELETE FROM USUARIO WHERE ID =:ID ', [AUsuarioModel.ID]);

      vQry.Connection.Commit;
      Result := True;
      except
      on E: Exception do
        begin
          vQry.Connection.Rollback;  //desfaz a transa��o
        end;
    end;
  finally
    vQry.Free;
  end;
end;

function TUsuarioDAO.ObterUsuario(AValorparcial: string): TFDQuery;
var
  vQry: TFDQuery;
begin
  vQry := FConexao.CriarQuery();

  vQry.Open('select ID, NOMEUSUARIO, SENHA from USUARIO where NOMEUSUARIO = ' + quotedstr(AValorparcial));

  Result := vQry;
end;

end.
