object frm_PrintPED: Tfrm_PrintPED
  Left = 0
  Top = 0
  Caption = 'Impress'#227'o do Pedido'
  ClientHeight = 698
  ClientWidth = 963
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 57
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  Impress'#227'o do Pedido'
    Color = 16758380
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object pn_Statusbar: TPanel
    Left = 0
    Top = 663
    Width = 963
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Color = 16758380
    ParentBackground = False
    TabOrder = 1
    object ButtonGradient1: TButtonGradient
      Left = 888
      Top = 6
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = ButtonGradient1Click
    end
  end
  object pn_Relatorio: TPanel
    Left = 0
    Top = 57
    Width = 963
    Height = 606
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object RCE_Relatorio: TRichEdit
      Left = 0
      Top = 0
      Width = 963
      Height = 606
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier'
      Font.Style = []
      Lines.Strings = (
        '                       Sr(a). AMADEU RICARDO DE MATOS EPP'
        '                      NUMERO DO PEDIDO VENDA : 0000000005'
        
          '----------------------------------------------------------------' +
          '------------------------------------------------------'
        
          ' 01/06/2023 23:31:52                                            ' +
          ' PED. : 000005'
        '                  IMPRESSAO DO PEDIDO DE TESTE - PROVA TECNICA'
        ''
        
          '----------------------------------------------------------------' +
          '------------------------------------------------------'
        
          '1  3   BALCAO LONDRES BRANCO C/FRUTA/ MARMORIZADO5,000  52,5000 ' +
          '  262,50'
        
          '2  8   KIT 6PTS PAMPULHA II REF. 683 PRETO/BRANCO/GEOMETRICO PTO' +
          '4,000  186,0000   744,00'
        '3  33   REPIMBOCA SEM A PARAFUZETA3,000  22,5000   67,50'
        '4  34   PAR DE PARAFUZETA SEM SEMETRICA5,000  10,5000   52,50'
        
          '----------------------------------------------------------------' +
          '--------------------------------------------------------'
        
          ' TOTAL           R$                                             ' +
          '        1.126,50'
        
          '----------------------------------------------------------------' +
          '--------------------------------------------------------'
        '                           OBRIGADO VOLTE SEMPRE !!!')
      ParentFont = False
      TabOrder = 0
      Zoom = 100
    end
  end
end
