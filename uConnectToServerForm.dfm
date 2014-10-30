object ConnectToServerForm: TConnectToServerForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1089#1077#1088#1074#1077#1088#1091
  ClientHeight = 162
  ClientWidth = 311
  Color = clBtnFace
  Constraints.MaxHeight = 200
  Constraints.MaxWidth = 327
  Constraints.MinHeight = 200
  Constraints.MinWidth = 327
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    311
    162)
  PixelsPerInch = 96
  TextHeight = 13
  object btnConnect: TButton
    Left = 185
    Top = 124
    Width = 120
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
    TabOrder = 0
    OnClick = btnConnectClick
  end
  object btnCancel: TButton
    Left = 8
    Top = 124
    Width = 65
    Height = 30
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object grpUserName: TGroupBox
    Left = 8
    Top = 8
    Width = 297
    Height = 110
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    DesignSize = (
      297
      110)
    object lblUserName: TLabel
      Left = 14
      Top = 51
      Width = 72
      Height = 18
      Caption = #1055#1086#1079#1099#1074#1085#1086#1081':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblAboutUserName: TLabel
      Left = 14
      Top = 11
      Width = 264
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1086#1079#1099#1074#1085#1086#1081' '#1076#1083#1103' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080' '#1085#1072' '#1089#1077#1088#1074#1077#1088#1077':'
    end
    object lblError: TLabel
      Left = 92
      Top = 85
      Width = 181
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = #1058#1072#1082#1086#1081' '#1087#1086#1079#1099#1074#1085#1086#1081' '#1091#1078#1077' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103'!'
      Visible = False
    end
    object edtUserName: TEdit
      Left = 92
      Top = 48
      Width = 186
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = #1044#1103#1090#1077#1083
      OnKeyPress = edtUserNameKeyPress
    end
  end
end
