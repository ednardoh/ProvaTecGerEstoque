unit uProdutoXImagemModel;

interface

uses
  uEnumerado, FireDAC.Comp.Client;

type
  TProdutoXImagemModel = class
  private
    FAcao: TAcao;
    FIDProduto: integer;
    FPATHImagem: string;

    procedure SetAcao(const Value: TAcao);
    procedure SetIDProduto(const Value: integer);
    procedure SetPATHImagem(const Value: string);
  public
    function Obter(AorderBy: Integer;AValorparcial: string): TFDQuery;
    function Salvar: Boolean;
    function ObterProdutoImgID(AValorpesquisa: string): TFDQuery;

    property Acao: TAcao read FAcao write SetAcao;
    property IDProduto: integer read FIDProduto write SetIDProduto;
    property PATHImagem: string read FPATHImagem write SetPATHImagem;
  end;

implementation

Uses uProdutoXImagemDAO;

{ TProdutoXImagem }

function TProdutoXImagemModel.Obter(AorderBy: Integer;
  AValorparcial: string): TFDQuery;
var
  VProdutoXImagemDAO: TProdutoXImagemDAO;
begin
  VProdutoXImagemDAO := TProdutoXImagemDAO.Create;
  try
    Result := VProdutoXImagemDAO.Obter(AorderBy,AValorparcial);
  finally
    VProdutoXImagemDAO.Free;
  end;
end;

function TProdutoXImagemModel.ObterProdutoImgID(
  AValorpesquisa: string): TFDQuery;
var
  VProdutoXImagemDAO: TProdutoXImagemDAO;
begin
  VProdutoXImagemDAO := TProdutoXImagemDAO.Create;
  try
    Result := VProdutoXImagemDAO.ObterProdutoImgID(AValorpesquisa);
  finally
    VProdutoXImagemDAO.Free;
  end;
end;

function TProdutoXImagemModel.Salvar: Boolean;
var
  VProdutoXImagemDAO: TProdutoXImagemDAO;
begin
  Result := False;

  VProdutoXImagemDAO := TProdutoXImagemDAO.Create;
  try
    case FAcao of
      uEnumerado.tacIncluir: Result := VProdutoXImagemDAO.Incluir(Self);
      uEnumerado.tacAlterar: Result := VProdutoXImagemDAO.Alterar(Self);
      uEnumerado.tacExcluir: Result := VProdutoXImagemDAO.Excluir(Self);
    end;
  finally
    VProdutoXImagemDAO.Free;
  end;
end;

procedure TProdutoXImagemModel.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;

procedure TProdutoXImagemModel.SetIDProduto(const Value: integer);
begin
  FIDProduto := Value;
end;

procedure TProdutoXImagemModel.SetPATHImagem(const Value: string);
begin
  FPATHImagem := Value;
end;

end.
