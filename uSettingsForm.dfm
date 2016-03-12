object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 285
  ClientWidth = 354
  Color = clBtnFace
  Constraints.MaxHeight = 324
  Constraints.MaxWidth = 370
  Constraints.MinHeight = 324
  Constraints.MinWidth = 370
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  DesignSize = (
    354
    285)
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 6
    Top = 8
    Width = 340
    Height = 228
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1077#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblHostName: TLabel
      Left = 16
      Top = 40
      Width = 208
      Height = 19
      Caption = #1048#1084#1103' '#1089#1077#1088#1074#1077#1088#1072' ('#1080#1083#1080' IP-'#1072#1076#1088#1077#1089'):'
    end
    object lblPort: TLabel
      Left = 16
      Top = 112
      Width = 139
      Height = 19
      Caption = #1055#1086#1088#1090' ('#1085#1072' '#1089#1077#1088#1074#1077#1088#1077'):'
    end
    object edtHostName: TEdit
      Left = 16
      Top = 65
      Width = 305
      Height = 27
      TabOrder = 0
      Text = '192.168.43.86'
      OnChange = edtHostNameChange
    end
    object edtPort: TEdit
      Left = 16
      Top = 144
      Width = 81
      Height = 27
      TabOrder = 1
      Text = '2106'
      OnChange = edtPortChange
    end
  end
  object btnApply: TButton
    Left = 246
    Top = 247
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = btnApplyClick
  end
  object btnCancel: TButton
    Left = 140
    Top = 247
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnOK: TButton
    Left = 34
    Top = 247
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = #1054#1082
    TabOrder = 1
    OnClick = btnOKClick
  end
end
