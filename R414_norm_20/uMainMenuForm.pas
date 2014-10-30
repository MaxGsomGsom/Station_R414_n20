unit uMainMenuForm;

interface

uses
  Windows,
  WinSock,
  ShellAPI,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  jpeg,
  ExtCtrls,
  ComCtrls,
  pngimage,
  StdCtrls,
  Menus,
  PlatformDefaultStyleActnCtrls,
  ActnPopup,
  XPStyleActnCtrls,
  Sockets,
  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdAntiFreezeBase,
  IdAntiFreeze,
  uCurrentTaskForm;

const
  WM_SocketEvent = WM_User + 1;

type
  TMainMenuForm = class(TForm)

    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    Image3: TImage;
    Svet: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Knopka1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SvetMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Label4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TcpServer1Accept(Sender: TObject; ClientSocket: TCustomIpClient);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function GetSelectedId: Byte;
  public
    { Public declarations }
    VisibleK1, VisibleK2, VisibleK3, VisibleK4: boolean;
    VisibleK5, VisibleK6, VisibleK7:boolean;
    procedure SwitchImagesAndLabels(Selected: Byte);
    procedure SetStationR414FormHeight;
  end;

const
  mmOverview = 1;
  mmLearn = 2;
  mmStatistic = 3;
  mmSettings = 4;
  mmAboutStation = 5;
  mmAboutProgram = 6;
  mmExit = 7;

var
  LabelsArr: Array [1..7] of ^TLabel;
  ImagesArr: Array [1..7] of ^TImage;
  mmSelected: Byte;
  MainMenuForm: TMainMenuForm;

implementation

uses
  uDefinitionsDM,
  uStationR414Form,
  uEducationForm,
  uUsersForm,
  uStatisticForm,
  uSettingsForm,
  uAboutStationForm,
  uAboutProgramForm,
  uPassWordForm,
  uStationStateDM,
  uConstantsDM;

{$R *.dfm}



procedure TMainMenuForm.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  SwitchImagesAndLabels((Sender as TImage).Tag);
end;

procedure TMainMenuForm.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If VisibleK2=false then
  begin
    Svet.BringToFront;
    Svet.Top:=247;
    VisibleK2:=true;
    Label2.Font.Color:=clWhite;
  end;
end;

procedure TMainMenuForm.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  SwitchImagesAndLabels(0);
end;

procedure TMainMenuForm.Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If VisibleK7 = false then
  begin
    Svet.BringToFront;
    Svet.Top:=595;
    VisibleK7:=true;
    Label3.Font.Color:=clWhite;
  end;
end;

procedure TMainMenuForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//  if not(StationR414Form.Visible) and not(UsersForm.Visible) then
//  begin
//    Application.Terminate;
//  end;
end;

procedure TMainMenuForm.SwitchImagesAndLabels(Selected: Byte);
var
  btA: Byte;
begin
  mmSelected := Selected;

  for btA := 1 to 7 do
  begin
    if Selected <> btA then
    begin
      LabelsArr[btA].Font.Color := clWhite;
    end;
  end;
  if Selected <> 0 then
  begin
    Svet.Left := ImagesArr[Selected].Left;
    Svet.Top := ImagesArr[Selected].Top;
    LabelsArr[Selected].Font.Color := clMaroon;
    Svet.BringToFront;
    Svet.Visible := True;
  end;
end;

procedure TMainMenuForm.FormCreate(Sender: TObject);
begin
  LabelsArr[1] := @Label1;
  LabelsArr[2] := @Label2;
  LabelsArr[3] := @Label4;
  LabelsArr[4] := @Label5;
  LabelsArr[5] := @Label6;
  LabelsArr[6] := @Label7;
  LabelsArr[7] := @Label3;

  ImagesArr[1] := @Image2;
  ImagesArr[2] := @Image3;
  ImagesArr[3] := @Image5;
  ImagesArr[4] := @Image6;
  ImagesArr[5] := @Image7;
  ImagesArr[6] := @Image8;
  ImagesArr[7] := @Image4;

  VisibleK1 := false;
  VisibleK2 := false;
  VisibleK3 := false;
  VisibleK4 := false;
  VisibleK5 := false;
  VisibleK6 := false;
  VisibleK7 := false;

  try
    PutLog(0, 'Загрузка программы');
  except
    ShowMessage('Data Base is Locked!');
    Application.ProcessMessages;
  end;

  Self.Left := Screen.Width div 2 - Self.width div 2; //Разместить форму по центру

end;


procedure TMainMenuForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key <> '1') and (Key <> '2') and (Key <> '3')
      and (Key <> '4') and (Key <> '5')
      and (Key <> '6') and (Key <> '7')
  then
  begin
    Exit;
  end;

  mmSelected := StrToInt(Key);

  //Закроем основную форму, если кнопка выход - закроем её красиво...
  if mmSelected <> mmExit then
  begin
    //Application.Terminate;
    MainMenuForm.Hide;
    //TUnRevealMenuThread.Create(False);
  end
  else begin
    Application.Terminate;
  end;

  case mmSelected of
    mmOverview:
      begin
        CloseStationR414FormFlag := 2;
        Station.WorkType := mdExternalView;
        Initialise;
        //StationR414Form.Show;
      end;
    mmLearn:
      begin
        UsersForm.Show;
      end;
    mmStatistic:
      begin
        StatisticForm.Show;
      end;
    mmSettings:
      begin
        PassWordForm.Tag := 1;
        MainMenuForm.Close;
        //ControlAdminPassword;
      end;
    mmAboutStation:
      begin
        AboutStationForm.Show;
      end;
    mmAboutProgram:
      begin
        AboutProgramForm.Show;
      end;
  end;
  if mmSelected <> 0 then
  begin
    MainMenuForm.Hide;
  end;
end;

procedure TMainMenuForm.FormShow(Sender: TObject);
begin
  //CurrentTaskForm.Hide;    //скрыть форму для текста текущего задания
                    //это шаманство необходимо, т.к. свойство формы
                    //visible = false тупит, и я не нашёл способа это
                    //исправить
end;

procedure TMainMenuForm.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  SwitchImagesAndLabels((Sender as TLabel).Tag);
end;

procedure TMainMenuForm.Label4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    Svet.BringToFront;
    Svet.Top:=Image3.Top;
    Label4.Font.Color:=clWhite;
end;

function TMainMenuForm.GetSelectedId: Byte;
var
  id: Byte;
begin
  case Svet.Top of
    176:
      begin
        id := mmOverview;
      end;
    248:
      begin
        id := mmLearn;
      end;
    320: //+8
      begin
        id := mmStatistic;
      end;
    384:
      begin
        id := mmSettings;
      end;
    456:
      begin
        id := mmAboutStation;
      end;
    528:
      begin
        id := mmAboutProgram;
      end;
    599:
      begin
        id := mmExit;
      end;
  end;
  Result := id;
end;

//Что за нах? Нарушение всех принципов ООП...
procedure TMainMenuForm.SetStationR414FormHeight;
begin
//  StationR414Form.Height := 412;
//  case Station.WorkMode of
//    mdOverview:;
//  else
//    if Station.WorkType <> wtExam then
//      StationR414Form.Height := 1036
//    else
//      StationR414Form.Height := 412;
//  end;
end;

procedure TMainMenuForm.SvetMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mmSelected := GetSelectedId;
  if mmSelected = 0 then
    Exit;

  //Закроем основную форму, если кнопка выход - закроем её красиво...
  if mmSelected <> mmExit then
  begin
    MainMenuForm.Hide;
    //TUnRevealMenuThread.Create(False);
  end
  else
  begin
    Application.Terminate;
  end;

  case mmSelected of
    mmOverview:
      begin
        Station.WorkType := wtFree;
        Station.WorkMode := mdExternalView;
        CloseStationR414FormFlag := 1;
        //StationR414Form.Show;
      end;
    mmLearn:
      begin
        UsersForm.Show;
      end;
    mmStatistic:
      begin
        Application.MessageBox('У Вас не хватает прав для просмотра статистики!',
          PChar(PName + ' version: ' + Pversion), MB_OK +//MB_YESNO +
          MB_ICONINFORMATION + MB_TOPMOST);
        MainMenuForm.Show();
        Exit;
        ShellExecute(Application.Handle, PChar('open'), PChar(ExtractFilePath(Application.ExeName) + 'ViewStatistic.exe'), PChar(IntToStr(MainMenuForm.Handle)), nil, 2);
      end;
    mmSettings:
      begin
        PassWordForm.Tag := 1;
        MainMenuForm.Hide;
        //ControlAdminPassword;
      end;
    mmAboutStation:
      begin
        AboutStationForm.Show;
      end;
    mmAboutProgram:
      begin
        AboutProgramForm.Show;
      end;
  end;
  //tStationR414FormHeight;
  if mmSelected <> 0 then
  begin
    ShowWindow(MainMenuForm.Handle, SW_HIDE);
  end;
end;

procedure TMainMenuForm.Knopka1Click(Sender: TObject);
begin
  //StationR414Form.Show;
  MainMenuForm.Hide;
  Svet.SendToBack;
  VisibleK1:=false;
end;

procedure TMainMenuForm.TcpServer1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);
var
  myDate : TDateTime;
  formattedDateTime : string;
begin
  mydate:=Now;
  DateTimeToString(formattedDateTime, 'c', myDate);
  ShowMessage(formattedDateTime);
  {далее вы можете вставить свой код}
end;

end.
