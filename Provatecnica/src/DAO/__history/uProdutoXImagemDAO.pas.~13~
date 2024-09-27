unit uProdutoXImagemDAO;

interface

uses
  FireDAC.Comp.Client, uConexao, uProdutoXImagemModel, System.SysUtils, uSistemaControl;

type
  TProdutoXImagemDAO = class
  private
    FConexao: TConexao;
  public
    constructor Create;

    function Incluir(AProdutoXImagemModel: TProdutoXImagemModel): Boolean;
    function Alterar(AProdutoXImagemModel: TProdutoXImagemModel): Boolean;
    function Excluir(AProdutoXImagemModel: TProdutoXImagemModel): Boolean;
    function Obter(AorderBy: Integer;AValorparcial: string): TFDQuery;
    function ObterProdutoImgID(AValorpesquisa: string): TFDQuery;

  end;

implementation

{ uProdutoXImagemDAO }

constructor TProdutoXImagemDAO.Create;
begin
  FConexao := TSistemaControl.GetInstance().Conexao;
end;

function TProdutoXImagemDAO.Incluir(AProdutoXImagemModel: TProdutoXImagemModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    try
      VQry.Connection.StartTransaction;
      VQry.ExecSQL('INSERT INTO PRODUTOS_IMAGENS (ID_PRODUTO,  '+
                   '                              PATH_IMAGEM  '+
                   '                             ) values (    '+
                   '                             :ID_PRODUTO,  '+
                   '                             :PATH_IMAGEM) ',
                   [AProdutoXImagemModel.IDProduto,
                    AProdutoXImagemModel.PATHImagem]);

      VQry.Connection.Commit;
      Result := True;
      except
      on E: Exception do
        begin
          VQry.Connection.Rollback;  //desfaz a transação
        end;
    end;
  finally
    VQry.Free;
  end;
end;

function TProdutoXImagemDAO.Excluir(AProdutoXImagemModel: TProdutoXImagemModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    try
      VQry.Connection.StartTransaction;
      VQry.ExecSQL(' DELETE FROM PRODUTOS_IMAGENS WHERE ID_PRODUTO =:ID_PRODUTO ', [AProdutoXImagemModel.IDProduto]);

      VQry.Connection.Commit;
      Result := True;
      except
      on E: Exception do
        begin
          VQry.Connection.Rollback;  //desfaz a transação
        end;
    end;
  finally
    VQry.Free;
  end;
end;

function TProdutoXImagemDAO.Alterar(AProdutoXImagemModel: TProdutoXImagemModel): Boolean;
var
  VQry: TFDQuery;
  strSQL: string;
begin
  VQry := FConexao.CriarQuery();
  try
    try
      strSQL :='';
      VQry.Connection.StartTransaction;
      VQry.Close;
      VQry.SQL.Clear;

      strSQL := ' UPDATE PRODUTOS_IMAGENS SET PATH_IMAGEM=:PATH_IMAGEM  '+
                ' where ID_PRODUTO=:ID_PRODUTO                          ';

      VQry.SQL.Add(strSQL);
      VQry.ParamByName('PATH_IMAGEM').AsString   := AProdutoXImagemModel.PATHImagem;
      VQry.ParamByName('ID_PRODUTO').AsInteger   :=AProdutoXImagemModel.IDProduto;

      VQry.ExecSQL();
      VQry.Connection.Commit;
      except
      on E: Exception do
        begin
          VQry.Connection.Rollback;  //desfaz a transação
        end;
      end;
      Result := True;
  finally
    VQry.Free;
  end;
end;

function TProdutoXImagemDAO.Obter(AorderBy: Integer;AValorparcial: string): TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();

  if AValorparcial = '' then
    VQry.Open('select ID_PRODUTO, PATH_IMAGEM from PRODUTOS_IMAGENS order by '+AorderBy.ToString)
  else
     VQry.Open('select ID_PRODUTO, PATH_IMAGEM from PRODUTOS_IMAGENS where PATH_IMAGEM like ' + quotedstr(AValorparcial) + ' order by '+AorderBy.ToString);

  Result := VQry;
end;

function TProdutoXImagemDAO.ObterProdutoImgID(AValorpesquisa: string): TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();

  VQry.Open('select ID_PRODUTO, PATH_IMAGEM from PRODUTOS_IMAGENS where ID_PRODUTO = '+AValorpesquisa);

  Result := VQry;
end;

end.
