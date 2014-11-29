object ReportForm: TReportForm
  Left = 0
  Top = 0
  Anchors = []
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090
  ClientHeight = 691
  ClientWidth = 700
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
  object lblFormCaption: TLabel
    Left = 8
    Top = 8
    Width = 687
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 12
    Top = 50
    Width = 78
    Height = 26
    AutoSize = False
    Caption = #1047#1072#1076#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object lblTaskName: TLabel
    Left = 120
    Top = 56
    Width = 402
    Height = 17
    AutoSize = False
    Caption = '#'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object lblFIOCaption: TLabel
    Left = 12
    Top = 87
    Width = 97
    Height = 17
    AutoSize = False
    Caption = #1042#1099#1087#1086#1083#1085#1080#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object lblFIO: TLabel
    Left = 117
    Top = 88
    Width = 405
    Height = 20
    AutoSize = False
    Caption = '#'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 12
    Top = 115
    Width = 97
    Height = 26
    AutoSize = False
    Caption = #1054#1094#1077#1085#1082#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object lblOzenka: TLabel
    Left = 116
    Top = 120
    Width = 93
    Height = 17
    AutoSize = False
    Caption = '#'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object lblMistakesCount: TLabel
    Left = 340
    Top = 120
    Width = 93
    Height = 17
    AutoSize = False
    Caption = '#'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label5: TLabel
    Left = 237
    Top = 115
    Width = 97
    Height = 26
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1054#1096#1080#1073#1086#1082':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 5
    Top = 438
    Width = 687
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = #1054#1096#1080#1073#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTaskTimeCapt: TLabel
    Left = 12
    Top = 147
    Width = 96
    Height = 24
    AutoSize = False
    Caption = #1042#1088#1077#1084#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object lbTaskTime: TLabel
    Left = 116
    Top = 152
    Width = 111
    Height = 17
    AutoSize = False
    Caption = '#'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object lblWorkModeCapt: TLabel
    Left = 13
    Top = 177
    Width = 96
    Height = 24
    AutoSize = False
    Caption = #1056#1077#1078#1080#1084':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object lblWorkMode: TLabel
    Left = 115
    Top = 180
    Width = 111
    Height = 17
    AutoSize = False
    Caption = '#'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object lvErrors: TListView
    Left = 5
    Top = 477
    Width = 687
    Height = 198
    Columns = <
      item
        Caption = 'ID'
      end
      item
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1083#1086#1082#1072
        MinWidth = 250
        Width = 250
      end
      item
        AutoSize = True
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1096#1080#1073#1082#1080
        MinWidth = 380
      end>
    ReadOnly = True
    TabOrder = 3
    ViewStyle = vsReport
    OnCustomDrawItem = lvErrorsCustomDrawItem
  end
  object lvTask: TListView
    Left = 8
    Top = 232
    Width = 687
    Height = 200
    Columns = <
      item
        Caption = 'ID'
      end
      item
        Caption = #1047#1072#1076#1072#1085#1080#1077
        MinWidth = 250
        Width = 250
      end
      item
        Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
        Width = 100
      end
      item
        Caption = #1047#1072#1082#1086#1085#1095#1077#1085#1086
        Width = 100
      end>
    ReadOnly = True
    TabOrder = 2
    ViewStyle = vsReport
    OnCustomDrawItem = lvErrorsCustomDrawItem
  end
  object btnShowHideErrors: TButton
    Left = 552
    Top = 110
    Width = 143
    Height = 36
    Caption = 'Show/Hide errors'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnShowHideErrorsClick
  end
  object btnExit: TButton
    Left = 552
    Top = 68
    Width = 143
    Height = 36
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnExitClick
  end
end
