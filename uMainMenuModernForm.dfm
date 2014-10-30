object MainMenuModernForm: TMainMenuModernForm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #1056#1072#1076#1080#1086#1088#1077#1083#1077#1081#1085#1072#1103' '#1089#1090#1072#1085#1094#1080#1103' '#1056'414'
  ClientHeight = 263
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object imgLogo: TImage
    Left = 7
    Top = 8
    Width = 753
    Height = 201
  end
  object btnEducation: TButton
    Left = 8
    Top = 213
    Width = 169
    Height = 45
    Caption = #1054#1073#1091#1095#1077#1085#1080#1077
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnEducationClick
  end
  object btnSettings: TButton
    Left = 203
    Top = 213
    Width = 169
    Height = 45
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnSettingsClick
  end
  object btnAboutProgram: TButton
    Left = 398
    Top = 213
    Width = 169
    Height = 45
    Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnAboutProgramClick
  end
  object btnExit: TButton
    Left = 591
    Top = 213
    Width = 169
    Height = 45
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnExitClick
  end
end
