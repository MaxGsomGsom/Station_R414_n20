object _Stat: T_Stat
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1041#1040#1047#1040' '#1044#1040#1053#1053#1067#1061
  ClientHeight = 567
  ClientWidth = 579
  Color = clDefault
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 121
    Height = 33
    AutoSize = False
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 303
    Top = 0
    Width = 266
    Height = 33
    AutoSize = False
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ListBox1: TListBox
    Left = 0
    Top = 24
    Width = 289
    Height = 385
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemHeight = 18
    ParentFont = False
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object ListBox2: TListBox
    Left = 295
    Top = 24
    Width = 282
    Height = 385
    ItemHeight = 13
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 295
    Top = 415
    Width = 282
    Height = 18
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1055#1086#1083#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Kind = bkCancel
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 295
    Top = 439
    Width = 282
    Height = 18
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Kind = bkIgnore
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end
