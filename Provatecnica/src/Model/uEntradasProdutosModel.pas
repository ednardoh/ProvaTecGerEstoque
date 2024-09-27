unit uEntradasProdutosModel;

interface

uses
  uEnumerado, FireDAC.Comp.Client;

type
  TEntradasProdutosModel = class
    private
      FAcao: TAcao;
      FId: Integer;
      FIdProduto: Integer;
      FQuantidadeEntrada: Double;
      FValorUnitarioCompra: Double;
      FValorTotal: Double;

      procedure SetAcao(const Value: TAcao);
      procedure SetId(const Value: Integer);
      procedure SetIdProduto(const Value: Integer);
      procedure SetQuantidadeEntrada(const Value: Double);
      procedure SetValorUnitarioCompra(const Value: Double);
      procedure SetValorTotal(const Value: Double);
    public
      function Obter(AValorpesquisa: string): TFDQuery;
      function Salvar: Boolean;
      function GetId: Integer;

      property Acao: TAcao                  read FAcao                 write SetAcao;
      property Id: integer                  read FID                   write SetID;
      property IdProduto: Integer           read FIdProduto            write SetIdProduto;
      property QuantidadeEntrada: Double    read FQuantidadeEntrada    write SetQuantidadeEntrada;
      property ValorUnitarioCompra: Double  read FValorUnitarioCompra  write SetValorUnitarioCompra;
      property ValorTotal: Double           read FValorTotal           write SetValorTotal;

  end;

implementation

Uses uEntradasProdutosDAO;

{ TEntradasProdutosModel }

function TEntradasProdutosModel.GetId: Integer;
var
  vEntradasProdutosDao: TEntradasProdutosDao;
begin
  vEntradasProdutosDao := TEntradasProdutosDao.Create;
  try
    Result := vEntradasProdutosDao.GetId;
  finally
    vEntradasProdutosDao.Free;
  end;
end;

function TEntradasProdutosModel.Obter(AValorpesquisa: string): TFDQuery;
var
  vEntradasProdutosDao: TEntradasProdutosDao;
begin
  vEntradasProdutosDao := TEntradasProdutosDao.Create;
  try
    Result := vEntradasProdutosDao.Obter(AValorpesquisa);
  finally
    vEntradasProdutosDao.Free;
  end;
end;

function TEntradasProdutosModel.Salvar: Boolean;
var
  vEntradasProdutosDao: TEntradasProdutosDao;
begin
  Result := False;

  vEntradasProdutosDao := TEntradasProdutosDao.Create;
  try
    case FAcao of
      uEnumerado.tacIncluir: Result := vEntradasProdutosDao.Incluir(Self);
      uEnumerado.tacAlterar: Result := vEntradasProdutosDao.Alterar(Self);
      uEnumerado.tacExcluir: Result := vEntradasProdutosDao.Excluir(Self);
    end;
  finally
    vEntradasProdutosDao.Free;
  end;
end;

procedure TEntradasProdutosModel.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TEntradasProdutosModel.SetIdProduto(const Value: Integer);
begin
  FIdProduto := Value;
end;

procedure TEntradasProdutosModel.SetQuantidadeEntrada(const Value: Double);
begin
  FQuantidadeEntrada := Value;
end;

procedure TEntradasProdutosModel.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

procedure TEntradasProdutosModel.SetValorUnitarioCompra(const Value: Double);
begin
  FValorUnitarioCompra := Value;
end;

procedure TEntradasProdutosModel.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;

end.
