object Form1: TForm1
  Left = 219
  Top = 148
  Width = 885
  Height = 362
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 248
    Top = 288
    Width = 81
    Height = 25
    AutoSize = False
    Caption = #1057' '#1076#1072#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 464
    Top = 288
    Width = 81
    Height = 25
    AutoSize = False
    Caption = #1055#1086' '#1076#1072#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lvStat: TListView
    Left = 8
    Top = 8
    Width = 849
    Height = 273
    Columns = <
      item
        Caption = #8470
      end
      item
        Caption = 'ID'
      end
      item
        Alignment = taCenter
        Caption = #1060#1048#1054
        MinWidth = 400
        Width = 400
      end
      item
        Caption = #1054#1094#1077#1085#1082#1072
        MinWidth = 80
        Width = 80
      end
      item
        Caption = #1042#1079#1074#1086#1076
      end
      item
        Caption = #1050#1091#1088#1089
      end
      item
        Caption = #1044#1072#1090#1072
        MaxWidth = 150
        MinWidth = 150
        Width = 150
      end>
    TabOrder = 0
    ViewStyle = vsReport
  end
  object btnOK: TButton
    Left = 12
    Top = 288
    Width = 131
    Height = 25
    Caption = #1054#1050
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnLoadState: TButton
    Left = 736
    Top = 288
    Width = 123
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnLoadStateClick
  end
  object medtFrom: TMaskEdit
    Left = 328
    Top = 288
    Width = 120
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '  .  .    '
  end
  object medtTill: TMaskEdit
    Left = 544
    Top = 288
    Width = 120
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  .  .    '
  end
end
