object EducationForm: TEducationForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1085#1103#1090#1080#1103
  ClientHeight = 321
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 582
    Height = 19
    AutoSize = False
    Caption = #1058#1080#1087' '#1079#1072#1085#1103#1090#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 61
    Width = 582
    Height = 19
    AutoSize = False
    Caption = #1047#1072#1085#1103#1090#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblLocation: TLabel
    Left = 8
    Top = 109
    Width = 582
    Height = 19
    AutoSize = False
    Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 157
    Width = 582
    Height = 19
    AutoSize = False
    Caption = #1055#1086#1079#1099#1074#1085#1086#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cbbTaskType: TComboBox
    Left = 8
    Top = 33
    Width = 582
    Height = 22
    Style = csOwnerDrawVariable
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 0
    Text = #1054#1073#1091#1095#1077#1085#1080#1077
    OnChange = cbbTaskTypeChange
    OnClick = cbbTaskTypeClick
    Items.Strings = (
      #1054#1073#1091#1095#1077#1085#1080#1077
      #1058#1088#1077#1085#1072#1078
      #1057#1076#1072#1095#1072' '#1085#1086#1088#1084#1072#1090#1080#1074#1072)
  end
  object cmbTaskNumber: TComboBox
    Left = 8
    Top = 82
    Width = 582
    Height = 22
    Style = csOwnerDrawVariable
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = cmbTaskNumberChange
    Items.Strings = (
      '1.'#1055#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1086#1089#1084#1086#1090#1088#1072
      '2.'#1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1086#1088#1075#1072#1085#1086#1074' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1074' '#1080#1089#1093#1086#1076#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
      '3.'#1042#1082#1083#1102#1095#1077#1085#1080#1077' '#1087#1080#1090#1072#1085#1080#1103
      '4.'#1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1080#1105#1084#1085#1086#1075#1086' '#1080' '#1087#1077#1088#1077#1076#1072#1102#1097#1077#1075#1086' '#1090#1088#1072#1082#1090#1086#1074
      '5.'#1056#1072#1073#1086#1090#1072' '#1089' '#1085#1080#1079#1082#1086#1095#1072#1089#1090#1086#1090#1085#1099#1084' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077#1084
      '6.'#1055#1077#1088#1077#1074#1086#1076' '#1089#1090#1072#1085#1094#1080#1080' '#1074' '#1086#1082#1086#1085#1077#1095#1085#1099#1081' '#1088#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099)
  end
  object btnOk: TButton
    Left = 471
    Top = 293
    Width = 119
    Height = 25
    Caption = #1055#1088#1080#1089#1090#1091#1087#1080#1090#1100
    Default = True
    TabOrder = 7
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 8
    Top = 293
    Width = 119
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    OnClick = btnCancelClick
  end
  object cbbLocation: TComboBox
    Left = 8
    Top = 130
    Width = 582
    Height = 22
    Style = csOwnerDrawVariable
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 2
    Text = #1052#1086#1089#1082#1074#1072
    Items.Strings = (
      #1052#1086#1089#1082#1074#1072
      #1056#1103#1079#1072#1085#1100
      #1057#1080#1073#1080#1088#1100
      #1042#1083#1072#1076#1080#1084#1080#1088
      #1042#1083#1072#1076#1080#1074#1086#1089#1090#1086#1082
      #1050#1072#1079#1072#1085#1100)
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 206
    Width = 288
    Height = 81
    Caption = #1055#1086#1083#1091#1082#1086#1084#1087#1083#1077#1082#1090' '#1040
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object lblWaveTransmit: TLabel
      Left = 3
      Top = 25
      Width = 137
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = #1042#1086#1083#1085#1072' '#1087#1077#1088#1077#1076#1072#1095#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 146
      Top = 25
      Width = 137
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = #1042#1086#1083#1085#1072' '#1087#1088#1080#1077#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtTransmitWaveA: TEdit
      Left = 3
      Top = 50
      Width = 137
      Height = 21
      Color = clHighlightText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      Text = '6'
      OnKeyPress = edtTransmitWaveAKeyPress
    end
    object edtReceiveWaveA: TEdit
      Left = 146
      Top = 50
      Width = 137
      Height = 21
      Color = clHighlightText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      Text = '12'
      OnKeyPress = edtTransmitWaveAKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 299
    Top = 206
    Width = 288
    Height = 81
    Caption = #1055#1086#1083#1091#1082#1086#1084#1087#1083#1077#1082#1090' B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object Label4: TLabel
      Left = 3
      Top = 25
      Width = 137
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = #1042#1086#1083#1085#1072' '#1087#1077#1088#1077#1076#1072#1095#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 146
      Top = 25
      Width = 137
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = #1042#1086#1083#1085#1072' '#1087#1088#1080#1077#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtTransmitWaveB: TEdit
      Left = 3
      Top = 50
      Width = 137
      Height = 21
      Color = clHighlightText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      Text = '6'
      OnKeyPress = edtTransmitWaveAKeyPress
    end
    object edtReceiveWaveB: TEdit
      Left = 146
      Top = 50
      Width = 137
      Height = 21
      Color = clHighlightText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      Text = '12'
      OnKeyPress = edtTransmitWaveAKeyPress
    end
  end
  object edtNick: TEdit
    Left = 8
    Top = 179
    Width = 285
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    TabOrder = 3
    Text = #1040#1082#1091#1083#1072
  end
end
