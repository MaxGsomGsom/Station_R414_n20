object UsersForm: TUsersForm
  Left = 0
  Top = 0
  Anchors = []
  BorderStyle = bsDialog
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 355
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 25
    Top = 8
    Width = 386
    Height = 30
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 27
    Top = 289
    Width = 100
    Height = 25
    Align = alCustom
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 27
    Top = 206
    Width = 100
    Height = 25
    Align = alCustom
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1042#1079#1074#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 27
    Top = 248
    Width = 100
    Height = 25
    Align = alCustom
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1050#1091#1088#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 29
    Top = 86
    Width = 100
    Height = 25
    Align = alCustom
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1048#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSurname: TLabel
    Left = 27
    Top = 127
    Width = 100
    Height = 25
    Margins.Right = 5
    Align = alCustom
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1060#1072#1084#1080#1083#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblPatronomyc: TLabel
    Left = 27
    Top = 167
    Width = 100
    Height = 25
    Margins.Right = 5
    Align = alCustom
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblNetworkMode: TLabel
    Left = 8
    Top = 44
    Width = 121
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnOk: TBitBtn
    Left = 265
    Top = 322
    Width = 153
    Height = 25
    Caption = #1042#1086#1081#1090#1080
    Kind = bkOK
    TabOrder = 10
    OnClick = btnOkClick
  end
  object btnCanel: TBitBtn
    Left = 8
    Top = 322
    Width = 153
    Height = 25
    Kind = bkCancel
    TabOrder = 9
    OnClick = btnCanelClick
  end
  object btnRegistration: TBitBtn
    Left = 8
    Top = 8
    Width = 121
    Height = 25
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    Kind = bkAll
    TabOrder = 0
    OnClick = btnRegistrationClick
  end
  object edtVzvod: TEdit
    Left = 146
    Top = 207
    Width = 270
    Height = 23
    Cursor = crIBeam
    AutoSelect = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 5
  end
  object edtPassword: TEdit
    Left = 144
    Top = 289
    Width = 114
    Height = 23
    Cursor = crIBeam
    AutoSelect = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 7
  end
  object edtKurs: TEdit
    Left = 146
    Top = 249
    Width = 270
    Height = 23
    Cursor = crIBeam
    AutoSelect = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 6
  end
  object edtName: TEdit
    Left = 148
    Top = 87
    Width = 270
    Height = 23
    Cursor = crIBeam
    AutoSelect = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object chkShowPassword: TCheckBox
    Left = 273
    Top = 292
    Width = 145
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = chkShowPasswordClick
  end
  object edtSurname: TEdit
    Left = 146
    Top = 128
    Width = 270
    Height = 23
    Cursor = crIBeam
    AutoSelect = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object edtPatronomyc: TEdit
    Left = 146
    Top = 168
    Width = 270
    Height = 23
    Cursor = crIBeam
    AutoSelect = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object cbbNetworkMode: TComboBox
    Left = 150
    Top = 44
    Width = 268
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    Items.Strings = (
      #1056#1072#1073#1086#1090#1072#1090#1100' '#1072#1074#1090#1086#1085#1086#1084#1085#1086
      #1055#1086#1076#1082#1083#1102#1095#1072#1090#1100#1089#1103' '#1082' '#1089#1077#1088#1074#1077#1088#1091)
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.Connection = 'Keep-Alive'
    Request.ContentLanguage = 'ru'
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.Host = '192.168.0.12'
    Request.UserAgent = 'UVC data report'
    HTTPOptions = [hoForceEncodeParams]
    Left = 19
    Top = 259
  end
end
