unit uProdutoXImagemControl;

interface

uses
  uProdutoXImagemModel, System.SysUtils, FireDAC.Comp.Client;

type
  TProdutoXImagemControl = class
    private
      FProdutoXImagemModel: TProdutoXImagemModel;

    public
      constructor Create;
      destructor Destroy; override;

      function Obter(AorderBy: Integer;AValorparcial: string): TFDQuery;
      function Salvar: Boolean;
      function ObterProdutoImgID(AValorpesquisa: string): TFDQuery;

      property ProdutoXImagemModel: TProdutoXImagemModel read FProdutoXImagemModel write FProdutoXImagemModel;

  end;

implementation

{ TProdutoXImagemControl }

constructor TProdutoXImagemControl.Create;
begin
  FProdutoXImagemModel:= TProdutoXImagemModel.Create;
end;

destructor TProdutoXImagemControl.Destroy;
begin
  FProdutoXImagemModel.Free;
  inherited;
end;

function TProdutoXImagemControl.Obter(AorderBy: Integer;
  AValorparcial: string): TFDQuery;
begin
  Result := FProdutoXImagemModel.Obter(AorderBy,AValorparcial);
end;

function TProdutoXImagemControl.ObterProdutoImgID(
  AValorpesquisa: string): TFDQuery;
begin
  Result := FProdutoXImagemModel.ObterProdutoImgID(AValorpesquisa);
end;

function TProdutoXImagemControl.Salvar: Boolean;
begin
  Result := FProdutoXImagemModel.Salvar;
end;

end.
