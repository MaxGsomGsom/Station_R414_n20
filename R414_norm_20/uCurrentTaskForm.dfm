object CurrentTaskForm: TCurrentTaskForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'CurrentTaskForm'
  ClientHeight = 153
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TaskInfo: TRichEdit
    Left = 128
    Top = 40
    Width = 185
    Height = 89
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      #1047#1072#1075#1088#1091#1079#1082#1072'...')
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ScrollBars = ssVertical
    ShowHint = False
    TabOrder = 0
    OnClick = TaskInfoClick
  end
  object tmrColor: TTimer
    OnTimer = tmrColorTimer
    Left = 392
    Top = 96
  end
end
