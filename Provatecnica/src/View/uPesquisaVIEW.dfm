object FrmPesquisa: TFrmPesquisa
  Left = 467
  Top = 285
  BorderStyle = bsSingle
  Caption = 'Pesquisa'
  ClientHeight = 453
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 906
    Height = 95
    Align = alTop
    BevelOuter = bvNone
    Color = 16758380
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 35
      Width = 50
      Height = 16
      Caption = 'Nome :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 69
      Top = 60
      Width = 435
      Height = 20
      Caption = 'Tecle <ENTER> para navegar e selecionar um registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 69
      Top = 13
      Width = 328
      Height = 16
      Caption = 'Digite um valor para filtrar exemplo: "%Maria%"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 633
      Top = 23
      Width = 127
      Height = 16
      Caption = 'Ordenr por c'#243'digo'
    end
    object Label5: TLabel
      Left = 632
      Top = 46
      Width = 148
      Height = 16
      Caption = 'Ordenr por descri'#231#227'o'
    end
    object edtNome: TEdit
      Left = 69
      Top = 30
      Width = 402
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edtNomeKeyDown
      OnKeyPress = edtNomeKeyPress
    end
    object btnPesquisar: TButton
      Left = 485
      Top = 30
      Width = 108
      Height = 25
      Caption = 'Pesquisar - F3'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object CheckBox1: TCheckBox
      Left = 617
      Top = 23
      Width = 15
      Height = 17
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 617
      Top = 46
      Width = 15
      Height = 17
      TabOrder = 3
      OnClick = CheckBox1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 404
    Width = 906
    Height = 49
    Align = alBottom
    Color = 16758380
    ParentBackground = False
    TabOrder = 1
    object btnSelecionar: TButton
      Left = 617
      Top = 11
      Width = 137
      Height = 25
      Caption = 'Selecionar - F5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSelecionarClick
    end
    object btnCancelar: TButton
      Left = 760
      Top = 11
      Width = 129
      Height = 25
      Caption = 'Cancelar <ESC>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object dbgPesquisa: TDBGrid
    Left = 0
    Top = 95
    Width = 906
    Height = 309
    Align = alClient
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgPesquisaDblClick
    OnKeyDown = dbgPesquisaKeyDown
    OnKeyPress = dbgPesquisaKeyPress
  end
  object dsPesquisa: TDataSource
    Left = 352
    Top = 104
  end
end
