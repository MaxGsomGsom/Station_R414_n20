unit uReportForm;

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
  ComCtrls,
  uStationR414MinForm,
  uAdditionalFormMethods,
  uBackgroundForm ;

type
  TReportForm = class(TForm)
    lvErrors: TListView;
    lblFormCaption: TLabel;
    Label1: TLabel;
    lblTaskName: TLabel;
    lblFIOCaption: TLabel;
    lblFIO: TLabel;
    Label2: TLabel;
    lblOzenka: TLabel;
    lblMistakesCount: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    lvTask: TListView;
    btnShowHideErrors: TButton;
    btnExit: TButton;
    procedure lvErrorsCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnShowHideErrorsClick(Sender: TObject);
    procedure OtchetShowErorrs;
    procedure OtchetHideErorrs;
    procedure FormShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);

  private
    errorsShowing : Boolean;
  public
    { Public declarations }
  end;

var
  ReportForm: TReportForm;

implementation

uses
  uEducationForm,
  uDefinitionsDM,
  uRack1500Form,
  uRack1600Form,
  uUsersForm,
  uRack1500bForm,
  uStationR414Form,
  uConstantsDM,
  uStationStateDM;

{$R *.dfm}

procedure TReportForm.OtchetShowErorrs;
const
  fullHeight = 740;
begin
  if fullHeight > Screen.Height - GetTaskBarHeight() then
    Self.Height := Screen.Height - GetTaskBarHeight() - 10
  else
    Self.Height := fullHeight;
  Self.errorsShowing := True;
end;

procedure TReportForm.OtchetHideErorrs;
begin
  Self.Height := 402;
  Self.errorsShowing := False;
end;

procedure TReportForm.btnExitClick(Sender: TObject);
begin
  self.Close;
end;

procedure TReportForm.btnShowHideErrorsClick(Sender: TObject);
begin
  if errorsShowing then begin
    OtchetHideErorrs;
    btnShowHideErrors.Caption := 'Показать ошибки';
  end
  else begin
    OtchetShowErorrs;
    btnShowHideErrors.Caption := 'Скрыть ошибки';
    Self.Top := 5;
    Self.Left := Screen.Width div 2 - (Self.Width div 2);
  end;

end;

procedure TReportForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  mbRes: Integer;
begin
  if (Station.WorkType <> wtExam) and
  (Station.WorkMode < mdWorkWithLowFrequency) then
  begin
    //Если это не экзамен и не конечное занятие
    if Length(Errors) = 0 then
    begin
      mbRes := Application.MessageBox('Вы хотите перейти к выполнению следующего занятия?',
      PChar(PName + ' version: ' + Pversion), MB_YESNO + MB_ICONQUESTION);
      if mbRes = mrYes then
      begin
        //Переход к следующему занятию...
        Station.WorkMode := Station.WorkMode + 1;
        CurBlockSelected := 255;
        //Очистим задания
        //StationR414Form.lvTask.Clear;
        Initialise;
        //StationR414Form.Show;
      end
      else
      begin
        EducationForm.Show;
      end;
    end
    else
    begin
      EducationForm.Show;
    end;
  end
  else
  begin
    EducationForm.Show;
  end;
end;

procedure TReportForm.FormShow(Sender: TObject);
begin
  errorsShowing := False;
  btnShowHideErrors.Caption := 'Показать ошибки';
  Close;
  if useBackground then
    //BackgroundForm.Close;
end;

procedure TReportForm.lvErrorsCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  If Item.SubItems[1] = stTaskPassed then
    lvTask.Canvas.Brush.Color := clLime
  else
    lvTask.Canvas.Brush.Color := RGB($FD, $BF, $C1);
end;

end.
