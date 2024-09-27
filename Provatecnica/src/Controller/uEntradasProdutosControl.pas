unit uEntradasProdutosControl;

interface

uses
  uEntradasProdutosModel, System.SysUtils, FireDAC.Comp.Client;

type
  TEntradasProdutosControl = class
    private
      FEntradasProdutosModel: TEntradasProdutosModel;

    public
      constructor Create;
      destructor Destroy; override;

      function Salvar: Boolean;
      function Obter(AValorpesquisa: string): TFDQuery;
      function GetId: Integer;

      property EntradasProdutosModel: TEntradasProdutosModel read FEntradasProdutosModel write FEntradasProdutosModel;

  end;

implementation

{ TEntradasProdutosControl }

constructor TEntradasProdutosControl.Create;
begin
  FEntradasProdutosModel := TEntradasProdutosModel.Create;
end;

destructor TEntradasProdutosControl.Destroy;
begin
  FEntradasProdutosModel.Free;
  inherited;
end;

function TEntradasProdutosControl.GetId: Integer;
begin
  result := FEntradasProdutosModel.GetId;
end;

function TEntradasProdutosControl.Obter(AValorpesquisa: string): TFDQuery;
begin
  result := FEntradasProdutosModel.Obter(AValorpesquisa);
end;

function TEntradasProdutosControl.Salvar: Boolean;
begin
  result := FEntradasProdutosModel.Salvar;
end;

end.
