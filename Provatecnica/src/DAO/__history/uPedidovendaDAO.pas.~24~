unit uPedidovendaDAO;

interface

uses
  FireDAC.Comp.Client, uConexao, uPedidovendaModel, System.SysUtils, uSistemaControl;

type
  TPedidovendaDAO = class
    private
      FConexao: TConexao;
    public
      constructor Create;

      function Incluir(APedidovendaModel: TPedidovendaModel): Boolean;
      function Alterar(APedidovendaModel: TPedidovendaModel): Boolean;
      function Excluir(APedidovendaModel: TPedidovendaModel): Boolean;
      function GetId: Integer;
      function Obter(AValorpesquisa: string): TFDQuery;

  end;

implementation

{ TPedidovendaDAO }

constructor TPedidovendaDAO.Create;
begin
  FConexao := TSistemaControl.GetInstance().Conexao;
end;

function TPedidovendaDAO.GetId: Integer;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.Open('SELECT coalesce(MAX(ID),0)+1 AS ID FROM PEDIDO');
    try
      Result := VQry.Fields[0].AsInteger;
    finally
      VQry.Close;
    end;
  finally
    VQry.Free;
  end;
end;

function TPedidovendaDAO.Incluir(APedidovendaModel: TPedidovendaModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.Close;
    VQry.ExecSQL('insert into PEDIDO (ID, NUMPEDI, DATA_EMISSAO, COD_CLIENTE, VALOR_TOTAL) values (:ID, :NUMPEDI, :DATA_EMISSAO, :COD_CLIENTE, :VALOR_TOTAL)',
                  [APedidovendaModel.ID,
                   APedidovendaModel.NUMPEDIDO,
                   APedidovendaModel.DATAEMISSAO,
                   APedidovendaModel.CODCLIENTE,
                   APedidovendaModel.VALORTOTAL]);

    VQry.Connection.Commit;

    Result := True;
  finally
    VQry.Free;
  end;
end;

function TPedidovendaDAO.Alterar(APedidovendaModel: TPedidovendaModel): Boolean;
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

      strSQL := 'update PEDIDO set NUMPEDI=:NUMPEDI, '+
                '       DATA_EMISSAO =:DATA_EMISSAO, '+
                '       COD_CLIENTE=:COD_CLIENTE,    '+
                '       VALOR_TOTAL=:VALOR_TOTAL     '+
                'where ID =:ID ';

      VQry.SQL.Add(strSQL);
      VQry.ParamByName('NUMPEDI').AsInteger        := APedidovendaModel.NUMPEDIDO;
      VQry.ParamByName('DATA_EMISSAO').AsDateTime  := APedidovendaModel.DATAEMISSAO;
      VQry.ParamByName('COD_CLIENTE').AsInteger    := APedidovendaModel.CODCLIENTE;
      VQry.ParamByName('VALOR_TOTAL').AsFloat      := APedidovendaModel.VALORTOTAL;
      VQry.ParamByName('ID').AsInteger             := APedidovendaModel.ID;

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

function TPedidovendaDAO.Excluir(APedidovendaModel: TPedidovendaModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('delete from PEDIDO where ID = :ID',
                  [APedidovendaModel.ID]);

     VQry.Connection.Commit;

    Result := True;
  finally
    VQry.Free;
  end;
end;

function TPedidovendaDAO.Obter(AValorpesquisa: string): TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();

  if AValorpesquisa = '' then
    VQry.Open('select ID, NUMPEDI , DATA_EMISSAO, COD_CLIENTE, VALOR_TOTAL from PEDIDO order by 1')
  else
    VQry.Open('select ID, NUMPEDI , DATA_EMISSAO, COD_CLIENTE, VALOR_TOTAL from PEDIDO WHERE ID=' + AValorpesquisa + ' order by 1');

  Result := VQry;
end;

end.
