unit uPrintPEDVIEW;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  VCLTee.TeCanvas, VCLTee.TeeEdiGrad;

type
  Tfrm_PrintPED = class(TForm)
    Panel1: TPanel;
    pn_Statusbar: TPanel;
    pn_Relatorio: TPanel;
    RCE_Relatorio: TRichEdit;
    ButtonGradient1: TButtonGradient;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_PrintPED: Tfrm_PrintPED;

implementation

{$R *.dfm}

procedure Tfrm_PrintPED.ButtonGradient1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_PrintPED.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure Tfrm_PrintPED.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    close;
end;

end.
