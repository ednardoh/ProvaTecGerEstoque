unit uEntradasProdutosDAO;

interface

uses
  FireDAC.Comp.Client, uConexao, uEntradasProdutosModel, System.SysUtils, uSistemaControl;

type
  TEntradasProdutosDAO = class
    private
      FConexao: TConexao;
    public
      constructor Create;

      function Incluir(AEntradasProdutosModel: TEntradasProdutosModel): Boolean;
      function Alterar(AEntradasProdutosModel: TEntradasProdutosModel): Boolean;
      function Excluir(AEntradasProdutosModel: TEntradasProdutosModel): Boolean;
      function GetId: Integer;
      function Obter(AValorpesquisa: string): TFDQuery;

  end;

implementation

{ TEntradasProdutosDAO }

constructor TEntradasProdutosDAO.Create;
begin
  FConexao := TSistemaControl.GetInstance().Conexao;
end;

function TEntradasProdutosDAO.GetId: Integer;
var
  vQry: TFDQuery;
begin
  vQry := FConexao.CriarQuery();
  try
    vQry.Open('SELECT coalesce(MAX(ID),0)+1 AS ID FROM ENTRADAS_PRODUTOS');
    try
      Result := vQry.Fields[0].AsInteger;
    finally
      vQry.Close;
    end;
  finally
    vQry.Free;
  end;
end;

function TEntradasProdutosDAO.Incluir(
  AEntradasProdutosModel: TEntradasProdutosModel): Boolean;
var
  vQry: TFDQuery;
begin
  vQry := FConexao.CriarQuery();
  try
    vQry.Close;
    vQry.ExecSQL('insert into ENTRADAS_PRODUTOS (ID, ID_PRODUTO, QUANTIDADE_ENTRADA, VALOR_UNITARIO_COMPRA, VALOR_TOTAL) values (:ID, :ID_PRODUTO, :QUANTIDADE_ENTRADA, :VALOR_UNITARIO_COMPRA, :VALOR_TOTAL)',
                  [AEntradasProdutosModel.ID,
                   AEntradasProdutosModel.IdProduto,
                   AEntradasProdutosModel.QuantidadeEntrada,
                   AEntradasProdutosModel.ValorUnitarioCompra,
                   (AEntradasProdutosModel.QuantidadeEntrada*AEntradasProdutosModel.ValorUnitarioCompra)]);

    vQry.Connection.Commit;

    Result := True;
  finally
    VQry.Free;
  end;
end;

function TEntradasProdutosDAO.Alterar(
  AEntradasProdutosModel: TEntradasProdutosModel): Boolean;
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

      strSQL := 'update ENTRADAS_PRODUTOS set QUANTIDADE_ENTRADA=:QUANTIDADE_ENTRADA, '+
                '       VALOR_UNITARIO_COMPRA =:VALOR_UNITARIO_COMPRA,                '+
                '       VALOR_TOTAL=:VALOR_TOTAL                                      '+
                'where ID =:ID AND ID_PRODUTO =:ID_PRODUTO                            ';

      vQry.SQL.Add(strSQL);
      vQry.ParamByName('QUANTIDADE_ENTRADA').AsFloat    := AEntradasProdutosModel.QuantidadeEntrada;
      vQry.ParamByName('VALOR_UNITARIO_COMPRA').AsFloat := AEntradasProdutosModel.ValorUnitarioCompra;
      vQry.ParamByName('VALOR_TOTAL').AsFloat           := (AEntradasProdutosModel.QuantidadeEntrada*AEntradasProdutosModel.ValorUnitarioCompra);
      vQry.ParamByName('ID').AsInteger                  := AEntradasProdutosModel.ID;
      vQry.ParamByName('ID_PRODUTO').AsInteger          := AEntradasProdutosModel.IdProduto;

      vQry.ExecSQL();
      vQry.Connection.Commit;
      except
      on E: Exception do
        begin
          vQry.Connection.Rollback;  //desfaz a transação
        end;
      end;
      Result := True;
  finally
    vQry.Free;
  end;
end;

function TEntradasProdutosDAO.Excluir(
  AEntradasProdutosModel: TEntradasProdutosModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('delete from ENTRADAS_PRODUTOS where ID = :ID',
                  [AEntradasProdutosModel.ID]);

     VQry.Connection.Commit;

    Result := True;
  finally
    VQry.Free;
  end;
end;

function TEntradasProdutosDAO.Obter(AValorpesquisa: string): TFDQuery;
var
  vQry: TFDQuery;
begin
  vQry := FConexao.CriarQuery();

  if AValorpesquisa = '' then
  begin
    vQry.Open('select ep.ID,                                 '+
              '       ep.ID_PRODUTO,                         '+
              '       p.codigo_bar,                          '+
              '       p.descricao as DescricaoProduto,       '+
              '       ep.QUANTIDADE_ENTRADA,                 '+
              '       ep.VALOR_UNITARIO_COMPRA,              '+
              '       ep.VALOR_TOTAL                         '+
              'from ENTRADAS_PRODUTOS ep                     '+
              'Inner join PRODUTOS p on p.id = ep.id_produto '+
              'order by 1                                    ');
  end
  else
  begin
    vQry.Open('select ep.ID,                                 '+
              '       ep.ID_PRODUTO,                         '+
              '       p.codigo_bar,                          '+
              '       p.descricao as DescricaoProduto,       '+
              '       ep.QUANTIDADE_ENTRADA,                 '+
              '       ep.VALOR_UNITARIO_COMPRA,              '+
              '       ep.VALOR_TOTAL                         '+
              'from ENTRADAS_PRODUTOS ep                     '+
              'Inner join PRODUTOS p on p.id = ep.id_produto '+
              'WHERE ID=' + AValorpesquisa + ' order by 1    ');
  end;
  Result := VQry;
end;

end.
