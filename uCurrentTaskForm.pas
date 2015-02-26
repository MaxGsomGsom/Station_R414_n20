unit uCurrentTaskForm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  uConstantsDM,
  DateUtils,
  uAdditionalFormMethods,
  uDefinitionsDM,
  uStationStateDM,
  uTaskControllerDM, ComCtrls;

type
  TCurrentTaskForm = class(TForm)
    TaskInfo: TRichEdit;
    tmrColor: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TaskInfoClick(Sender: TObject);
    procedure tmrColorTimer(Sender: TObject);
  private
    { Private declarations }
    procedure SetFontSize(FontSize : Integer);
    procedure SetFormPosition();
    procedure setComponentsPosition;
    //procedure setTextHandler(var Msg : TMessage); message MM_SETTEXT;
  public
    { Public declarations }
    ReturnWhite: Integer;
    procedure SetMyText(Text: String);
    constructor Create(Parent1:TComponent; Station1:TStation); reintroduce;


var
  Station: TStation;
  TaskController: TTaskController;

  end;

implementation



constructor TCurrentTaskForm.Create(Parent1: TComponent; Station1: TStation);
begin
  inherited Create(Parent1);
  Station:=Station1;
end;

procedure TCurrentTaskForm.FormCreate(Sender: TObject);
begin
  Self.Visible := True;
  Self.Visible := False;
  Self.SetFormPosition;
  Self.setComponentsPosition;
  Self.SetFontSize(12);
  Self.TaskInfo.Text := '';
  self.tmrColor.Enabled:=True;
end;


/// <summary>
/// Установить форму в один ряд с Р414-mini
/// </summary>
procedure TCurrentTaskForm.setFormPosition();
begin
  Self.Left    := R414miniFormWidth + frequencyTCurrentTaskFormWidth;
  Self.Width   := Screen.Width - Self.Left;
  Self.Height  := R414miniFormHeight;
  Self.Top     := Screen.Height - GetTaskBarHeight() - Self.Height;
end;

/// <summary>
/// Устнавливает положение компонентов на форме
/// </summary>
procedure TCurrentTaskForm.setComponentsPosition;
begin
  TaskInfo.Left   := 0;
  TaskInfo.Top    := 0;
  TaskInfo.Width  := Self.Width;
  TaskInfo.Height := Self.Height;
end;

/// <summary>
/// Устанавливает размер шрифта для компонента,
/// выводящего текст
/// </summary>
/// <param name="FontSize">размер шрифта</param>
procedure TCurrentTaskForm.setFontSize(FontSize: Integer);
begin
  Self.TaskInfo.Font.Size := FontSize;
end;

/// <summary>
/// Устанавливает текст отображаемого задания
/// </summary>
procedure TCurrentTaskForm.SetMyText(Text: String);
begin
  Self.TaskInfo.Text := Text;
end;

procedure TCurrentTaskForm.TaskInfoClick(Sender: TObject);
begin
  if Station.WorkType = wtTrening then
  begin
    DisplayHint;
  end;
end;

procedure TCurrentTaskForm.tmrColorTimer(Sender: TObject);
begin
if (ReturnWhite=0) then
begin
  self.TaskInfo.Color:= clWhite;
  ReturnWhite:=-1;
end;
if (ReturnWhite>0) then
begin
  ReturnWhite:=ReturnWhite-1;
end;
end;

//procedure TCurrentTaskForm.setTextHandler(var Msg: TMessage);
//type TPStr = ^string;
//var PStr : TPStr;
//s : string;
//begin
//  PStr := TPStr(Msg.WParam);
//  s := PStr^;
//  Self.SetMyText(PStr^);
//end;
{$R *.dfm}

end.
