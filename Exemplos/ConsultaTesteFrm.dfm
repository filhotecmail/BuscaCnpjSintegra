object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 513
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 24
    Top = 39
    Width = 249
    Height = 105
  end
  object Label1: TLabel
    Left = 24
    Top = 273
    Width = 105
    Height = 13
    Caption = 'Digite aqui o Captcha '
  end
  object Label2: TLabel
    Left = 24
    Top = 217
    Width = 131
    Height = 13
    Caption = 'Digite o Cnpj para pesquisa'
  end
  object Label14: TLabel
    Left = 8
    Top = 401
    Width = 98
    Height = 13
    Caption = 'Atividade Econ'#244'mica'
  end
  object Label15: TLabel
    Left = 8
    Top = 452
    Width = 99
    Height = 13
    Caption = 'Regime de Apura'#231#227'o'
  end
  object Label16: TLabel
    Left = 295
    Top = 452
    Width = 119
    Height = 13
    Caption = 'Data de Obrigatoriedade'
  end
  object Label17: TLabel
    Left = 440
    Top = 452
    Width = 110
    Height = 13
    Caption = 'Indice Obrigatoriedade'
  end
  object Button1: TButton
    Left = 24
    Top = 8
    Width = 139
    Height = 25
    Caption = 'Carregar Captcha'
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 24
    Top = 292
    Width = 249
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button2: TButton
    Left = 24
    Top = 330
    Width = 249
    Height = 25
    Caption = 'Executar Pesquisa'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 24
    Top = 236
    Width = 249
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 396
    Top = 8
    Width = 386
    Height = 392
    TabOrder = 4
    object Label3: TLabel
      Left = 16
      Top = 12
      Width = 60
      Height = 13
      Caption = 'Raz'#227'o Social'
    end
    object Label4: TLabel
      Left = 16
      Top = 68
      Width = 22
      Height = 13
      Caption = 'Cnpj'
    end
    object Label5: TLabel
      Left = 16
      Top = 121
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label6: TLabel
      Left = 17
      Top = 224
      Width = 37
      Height = 13
      Caption = 'Numero'
    end
    object Label7: TLabel
      Left = 137
      Top = 224
      Width = 65
      Height = 13
      Caption = 'Complemento'
    end
    object Label8: TLabel
      Left = 22
      Top = 275
      Width = 43
      Height = 13
      Caption = 'Municipio'
    end
    object Label9: TLabel
      Left = 255
      Top = 224
      Width = 19
      Height = 13
      Caption = 'Cep'
    end
    object Label10: TLabel
      Left = 22
      Top = 327
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label11: TLabel
      Left = 208
      Top = 68
      Width = 88
      Height = 13
      Caption = 'INscri'#231#227'o estadual'
    end
    object Label12: TLabel
      Left = 20
      Top = 172
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label13: TLabel
      Left = 320
      Top = 327
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object EdRazao: TEdit
      Left = 16
      Top = 31
      Width = 353
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object EdtCnpj: TEdit
      Left = 16
      Top = 87
      Width = 186
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EdEndereco: TEdit
      Left = 16
      Top = 140
      Width = 353
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EdNumero: TEdit
      Left = 17
      Top = 243
      Width = 113
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object EdComplemento: TEdit
      Left = 136
      Top = 243
      Width = 113
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object EdMunicipio: TEdit
      Left = 17
      Top = 295
      Width = 352
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object EdCep: TEdit
      Left = 255
      Top = 243
      Width = 114
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object EdEstado: TEdit
      Left = 17
      Top = 346
      Width = 297
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object EdtIE: TEdit
      Left = 208
      Top = 87
      Width = 161
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object EdtBairro: TEdit
      Left = 16
      Top = 192
      Width = 353
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object EdtUf: TEdit
      Left = 320
      Top = 346
      Width = 47
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
  end
  object EdtAtividade: TEdit
    Left = 8
    Top = 420
    Width = 774
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object EdtRegime: TEdit
    Left = 8
    Top = 468
    Width = 281
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object EdtDataObrigatoriedade: TEdit
    Left = 295
    Top = 468
    Width = 139
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object EdtIndice: TEdit
    Left = 440
    Top = 468
    Width = 342
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object Button3: TButton
    Left = 169
    Top = 8
    Width = 104
    Height = 25
    Caption = 'Atualiza Captcha'
    TabOrder = 9
    OnClick = Button3Click
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 172
    Width = 49
    Height = 27
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    Text = 'SP'
    OnChange = ComboBox1Change
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE')
  end
end
