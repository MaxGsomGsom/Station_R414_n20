object ChatForm: TChatForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'ChatForm'
  ClientHeight = 472
  ClientWidth = 918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnChat: TLabel
    Left = 8
    Top = 8
    Width = 306
    Height = 57
    AutoSize = False
    OnClick = btnChatClick
  end
  object lblChat: TLabel
    Left = 328
    Top = 8
    Width = 580
    Height = 369
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 306
    Height = 57
    AutoSize = False
    OnClick = btnChatClick
  end
  object Label2: TLabel
    Left = 8
    Top = 168
    Width = 306
    Height = 57
    AutoSize = False
    Caption = 'btnChat'
    OnClick = btnChatClick
  end
  object edtSend: TEdit
    Left = 328
    Top = 392
    Width = 385
    Height = 21
    TabOrder = 1
  end
  object btnSend: TButton
    Left = 768
    Top = 390
    Width = 142
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = btnSendClick
  end
end
