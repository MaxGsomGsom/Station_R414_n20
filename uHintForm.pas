unit uHintForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  THintForm = class(TForm)
    lblHintString: TLabel;
    btnGetHint: TImage;
    imgGetHintMoved: TImage;
    imgBtnGetHintStd: TImage;
    HintText: TMemo;
    procedure btnGetHintClick(Sender: TObject);
    procedure btnGetHintMouseEnter(Sender: TObject);
    procedure btnGetHintMouseLeave(Sender: TObject);
    procedure lblHintStringMouseEnter(Sender: TObject);
    procedure FormMouseEnter(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure setFormPosition();
    procedure setComponentsPosition();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HintForm: THintForm;

implementation

{$R *.dfm}

uses
  uDefinitionsDM,
  uAdditionalFormMethods,
  uFilterForm,
  uStationStateDM,
  uConstantsDM;

/// <summary>
/// Установить форму в один ряд с Р414-mini
/// </summary>
procedure THintForm.setFormPosition();
begin
  Self.Left    := R414miniFormWidth + frequencyTCurrentTaskFormWidth;
  Self.Width   := Screen.Width - Self.Left;
  Self.Height  := R414miniFormHeight;
  Self.Top     := Screen.Height - GetTaskBarHeight() - Self.Height;
end;

/// <summary>
/// Устнавливает положение компонентов на форме
/// </summary>
procedure THintForm.setComponentsPosition;
begin
  HintText.Left   := 0;
  HintText.Top    := 0;
  HintText.Width  := Self.Width;
  HintText.Height := Self.Height;
end;

procedure THintForm.btnGetHintClick(Sender: TObject);
begin
//  if Station.WorkType = wtTrening then
//  begin
//    //HideHint;
//    DisplayHint;
//  end;
end;

procedure THintForm.btnGetHintMouseEnter(Sender: TObject);
begin
  if btnGetHint.Visible then
  begin
    btnGetHint.Picture := imgGetHintMoved.Picture;
    btnGetHint.Invalidate;
  end;
end;

procedure THintForm.btnGetHintMouseLeave(Sender: TObject);
begin
  if btnGetHint.Visible then
  begin
    btnGetHint.Picture := imgBtnGetHintStd.Picture;
    btnGetHint.Invalidate;
  end;
end;

///////////////////////////////////////////////////
/// Временная обработка события, скрывает форму ///
procedure THintForm.FormClick(Sender: TObject);
begin
   Visible := False;
end;

procedure THintForm.FormCreate(Sender: TObject);
begin
  SetFormPosition();
  //SetComponentsPosition();
end;

procedure THintForm.FormMouseEnter(Sender: TObject);
begin
  if btnGetHint.Visible then
  begin
    btnGetHint.Picture := imgBtnGetHintStd.Picture;
    btnGetHint.Invalidate;
  end;
end;

procedure THintForm.lblHintStringMouseEnter(Sender: TObject);
begin
  if btnGetHint.Visible then
  begin
    btnGetHint.Picture := imgBtnGetHintStd.Picture;
    btnGetHint.Invalidate;
  end;
end;

end.
