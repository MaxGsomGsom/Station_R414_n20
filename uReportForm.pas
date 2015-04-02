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
  uBackgroundForm,
  uTaskControllerDM,
  uStationStateDM,
  uClientStateDM ;

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
    lblTaskTimeCapt: TLabel;
    lbTaskTime: TLabel;
    lblWorkModeCapt: TLabel;
    lblWorkMode: TLabel;
    procedure lvErrorsCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnShowHideErrorsClick(Sender: TObject);
    procedure OtchetShowErorrs;
    procedure OtchetHideErorrs;
    procedure FormShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);


  private
    errorsShowing : Boolean;
  public
    { Public declarations }
    constructor Create(Sender1: TComponent; TaskController1: TTaskController); reintroduce;
  var
  TaskController: TTaskController;

  end;


implementation

uses
  uEducationForm,
  uDefinitionsDM,
  uRack1500Form,
  uRack1600Form,
  uUsersForm,
  uRack1500bForm,
  uStationR414Form,
  uConstantsDM;

{$R *.dfm}

 constructor TReportForm.Create(Sender1: TComponent; TaskController1: TTaskController);
 begin
     inherited Create(Sender1);
     TaskController:= TaskController1;

     lblTaskName.Caption:= TaskController.CurrentTask.Name;
     lbTaskTime.Caption:=  TimeToStr(TaskController.CurrentTask.TimeEnd - TaskController.CurrentTask.TimeStart);
     lblWorkMode.Caption:= GetWorkModeTitle(TaskController.NetWorker.ClientState.WorkMode);

 end;


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
//  if (Station.WorkType <> wtExam) and
//  (Station.WorkMode < mdWorkWithLowFrequency) then
//  begin
//    //Если это не экзамен и не конечное занятие
//    if Length(Errors) = 0 then
//    begin
//      mbRes := Application.MessageBox('Вы хотите перейти к выполнению следующего занятия?',
//      PChar(PName + ' version: ' + Pversion), MB_YESNO + MB_ICONQUESTION);
//      if mbRes = mrYes then
//      begin
//        //Переход к следующему занятию...
//        Station.WorkMode := Station.WorkMode + 1;
//        CurBlockSelected := 255;
//        //Очистим задания
//        //StationR414Form.lvTask.Clear;
//        Initialise;
//        //StationR414Form.Show;
//      end
//      else
//      begin
//        EducationForm.Show;
//      end;
//    end
//    else
//    begin
//      EducationForm.Show;
//    end;
//  end
//  else
//  begin
//    EducationForm.Show;
//  end;
end;

procedure TReportForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   (Owner as TForm).Show;
end;

procedure TReportForm.FormShow(Sender: TObject);
begin
  errorsShowing := False;
  btnShowHideErrors.Caption := 'Показать ошибки';
  //Close;
  //if useBackground then
   // //BackgroundForm.Close;
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
