object StatisticForm: TStatisticForm
  Left = 0
  Top = 0
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
  ClientHeight = 488
  ClientWidth = 918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lvStat: TListView
    Left = 8
    Top = 8
    Width = 897
    Height = 425
    Columns = <
      item
        Caption = 'ID'
      end
      item
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      end
      item
        Caption = #1054#1094#1077#1085#1082#1072
      end>
    TabOrder = 0
    ViewStyle = vsReport
  end
  object btnОчистить: TButton
    Left = 744
    Top = 456
    Width = 161
    Height = 24
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnОчиститьClick
  end
  object btnClose: TButton
    Left = 8
    Top = 456
    Width = 161
    Height = 24
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object cbb1: TComboBox
    Left = 224
    Top = 456
    Width = 145
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 2
    Text = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
    OnChange = cbb1Change
    Items.Strings = (
      #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
      #1054#1073#1097#1072#1103)
  end
end
