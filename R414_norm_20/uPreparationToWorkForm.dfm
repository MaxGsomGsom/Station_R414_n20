object PreparationToWorkForm: TPreparationToWorkForm
  Left = 0
  Top = 0
  Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1082' '#1088#1072#1073#1086#1090#1077
  ClientHeight = 499
  ClientWidth = 634
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 650
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    634
    499)
  PixelsPerInch = 96
  TextHeight = 13
  object lblWorkMode: TLabel
    Left = 12
    Top = 64
    Width = 106
    Height = 18
    Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblUsername: TLabel
    Left = 12
    Top = 19
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
  object lblPriorityText: TLabel
    Left = 12
    Top = 101
    Width = 79
    Height = 18
    Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblStationPriority: TLabel
    Left = 136
    Top = 101
    Width = 5
    Height = 18
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 12
    Top = 135
    Width = 98
    Height = 18
    Caption = #1057#1086#1087#1088#1103#1078#1077#1085#1085#1072#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblLinkedR414: TLabel
    Left = 136
    Top = 135
    Width = 5
    Height = 18
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCross: TLabel
    Left = 12
    Top = 170
    Width = 44
    Height = 18
    Caption = #1050#1088#1086#1089#1089':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCrossName: TLabel
    Left = 136
    Top = 170
    Width = 5
    Height = 18
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object grpWaveTuning: TGroupBox
    Left = 346
    Top = 8
    Width = 280
    Height = 117
    Anchors = [akTop, akRight]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1086#1083#1085
    TabOrder = 0
    object grpHalfSetA: TGroupBox
      Left = 19
      Top = 17
      Width = 110
      Height = 90
      Caption = #1055#1086#1083#1091#1082#1086#1084#1087#1083#1077#1082#1090' '#1040
      TabOrder = 0
      object lblReceiverWaveA: TLabel
        Left = 11
        Top = 23
        Width = 30
        Height = 18
        Caption = #1055#1056#1052
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblTransmitterWaveA: TLabel
        Left = 13
        Top = 57
        Width = 28
        Height = 18
        Caption = #1055#1056#1044
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtReceiverWaveA: TEdit
        Left = 47
        Top = 25
        Width = 50
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 2
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
      end
      object edtTransmitterWaveA: TEdit
        Left = 47
        Top = 57
        Width = 50
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 1
      end
    end
    object grpHalfSetB: TGroupBox
      Left = 135
      Top = 17
      Width = 110
      Height = 90
      Caption = #1055#1086#1083#1091#1082#1086#1084#1087#1083#1077#1082#1090' '#1041
      TabOrder = 1
      object lblReceiverWaveB: TLabel
        Left = 16
        Top = 23
        Width = 30
        Height = 18
        Caption = #1055#1056#1052
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblTransmitterWaveB: TLabel
        Left = 16
        Top = 57
        Width = 28
        Height = 18
        Caption = #1055#1056#1044
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtReceiverWaveB: TEdit
        Left = 50
        Top = 25
        Width = 50
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
      end
      object edtTransmitterWaveB: TEdit
        Left = 50
        Top = 57
        Width = 50
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object btnStart: TButton
    Left = 496
    Top = 451
    Width = 130
    Height = 40
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1089#1090#1091#1087#1080#1090#1100
    TabOrder = 1
    OnClick = btnStartClick
  end
  object btnCancel: TButton
    Left = 8
    Top = 451
    Width = 130
    Height = 40
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object cbbWorkMode: TComboBox
    Left = 136
    Top = 63
    Width = 204
    Height = 26
    AutoDropDown = True
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnChange = cbbWorkModeChange
  end
  object grpTaskChoice: TGroupBox
    Left = 8
    Top = 220
    Width = 618
    Height = 225
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1042#1099#1073#1086#1088' '#1079#1072#1076#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    DesignSize = (
      618
      225)
    object lstTaskChoice: TListBox
      Left = 20
      Top = 29
      Width = 585
      Height = 180
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 18
      Items.Strings = (
        '')
      TabOrder = 0
      OnClick = lstTaskChoiceClick
    end
  end
  object edtUserName: TEdit
    Left = 136
    Top = 20
    Width = 204
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
end
