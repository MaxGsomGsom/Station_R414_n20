unit uBlockDuplexerForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, ImgList, uImageRotator, StdCtrls, Menus, pngimage,
  uAdditionalFormMethods,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm;

type

  TBlockDuplexerForm = class(TForm)
    PanelDuplexer: TPanel;
    ImageBackground: TImage;
    ImageListSwitcherRound: TImageList;
    LabelOutputCounter: TLabel;
    LabelInputCounter: TLabel;
    ImageSplitter: TImage;
    img1840ConnectedAtLeft: TImage;
    ImageCableDisconnected: TImage;
    PopupMenuCable: TPopupMenu;
    pmcDisconnect: TMenuItem;
    pmcConnect: TMenuItem;
    imgSh1InitialState: TImage;
    img1840ConnectedAtRight: TImage;
    imgSh2InitialState: TImage;
    imgSh2ConnecteAtLeft: TImage;
    imgSh1ConnectedAtRight: TImage;
    imgSpawnLeft: TImage;
    imgSpawnRight: TImage;
    imgSelectSpawn: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    imgSwWaveTransmit: TImage;
    imgSwWaveReceive: TImage;
    procedure pmcDisconnectClick(Sender: TObject);
    procedure pmcConnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure imgSh1InitialStateClick(Sender: TObject);
    procedure imgSelectSpawnClick(Sender: TObject);
    procedure imgSpawnLeftClick(Sender: TObject);
    procedure imgSpawnRightClick(Sender: TObject);
    procedure imgSh1ConnectedAtRightClick(Sender: TObject);
    procedure ImageCableDisconnectedClick(Sender: TObject);
    procedure img1840ConnectedAtLeftClick(Sender: TObject);
    procedure img1840ConnectedAtRightClick(Sender: TObject);
    procedure imgSh2InitialStateClick(Sender: TObject);
    procedure imgSh2ConnecteAtLeftClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Reload;
    procedure imgSwWaveTransmitMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwWaveReceiveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    CurFormId: Integer;
  public
  constructor Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;



var
  //BlockDuplexerForm: TBlockDuplexerForm;

  Station: TStation;
  ButtonBackForm: TButtonBackForm;
  TaskController: TTaskController;
  const
  idDuplexerA=1;
  idDuplexerB=2;
  end;

implementation

uses
  uStationR414Form,
  uDefinitionsDM,
  uEducationForm,
  uConstantsDM,
  uRandomMethods;

{$R *.dfm}

constructor TBlockDuplexerForm.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  //idDuplexerA:=1;
  //idDuplexerB:=2;
  CurFormId:=Half;
  Station:=Station0;
  if (Half=1) then begin Self.Caption:='Дуплексер А'; end
  else Self.Caption:='Дуплексер Б';
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;

procedure TBlockDuplexerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReturnFromRack;
end;

procedure TBlockDuplexerForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TaskController.CheckFormBeforeClosing(CanClose);
end;

procedure TBlockDuplexerForm.FormCreate(Sender: TObject);
begin
  MoveFormInScreenCenter(Self);
end;

procedure TBlockDuplexerForm.FormKeyPress(Sender: TObject; var Key: Char);
var StationR414FormminiHWND : HWND;
begin
  if Ord(Key) = 27 then
  begin
    //Инициация события "Закрытие окна стойки"
    StationR414FormminiHWND := FindWindow(StationR414FormminiClassName, StationR414FormminiObjectName);
    PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  end;
end;

procedure TBlockDuplexerForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;

procedure TBlockDuplexerForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TBlockDuplexerForm.FormShow(Sender: TObject);
begin
  Reload;
end;

procedure TBlockDuplexerForm.imgSh1InitialStateClick(Sender: TObject);
begin
  case CurFormId of
    idDuplexerA:
      begin
        if imgSelectSpawn.Visible = False then
        begin
          imgSelectSpawn.Visible:=true;
          imgSelectSpawn.Top:=66;
          imgSelectSpawn.Left:=266;
          imgSpawnLeft.Visible:=true;
          imgSpawnRight.Visible:=true;
          imgSpawnRight.BringToFront;
          imgSpawnLeft.BringToFront;
          imgSelectSpawn.BringToFront;
        end
        else
        begin
          imgSelectSpawn.Visible:=false;
          imgSpawnLeft.Visible:=false;
          imgSpawnRight.Visible:=false;
          Station.HalfSetA.Duplexer.cbSh1 := csDisconected;
        end;
        if  (imgSh1InitialState.Top=-64) and (imgSh1InitialState.Left=343) then
        begin
          imgSh1InitialState.Top:=-16;
          imgSh1InitialState.Left:=207;
          imgSelectSpawn.Visible:=false;
          imgSpawnLeft.Visible:=false;
          imgSpawnRight.Visible:=false;
          Station.HalfSetA.Duplexer.cbSh1 := csDisconected;
        end;
      end;

    idDuplexerB:
      begin
        if imgSelectSpawn.Visible = False then
        begin
          imgSelectSpawn.Visible := True;
          imgSelectSpawn.Top:=66;
          imgSelectSpawn.Left:=266;
          imgSpawnLeft.Visible:=true;
          imgSpawnRight.Visible:=true;
          imgSpawnRight.BringToFront;
          imgSpawnLeft.BringToFront;
          imgSelectSpawn.BringToFront;
        end
        else
        begin
          imgSelectSpawn.Visible:=false;
          imgSpawnLeft.Visible:=false;
          imgSpawnRight.Visible:=false;
          Station.HalfSetB.Duplexer.cbSh1 := csDisconected;
        end;
        if  (imgSh1InitialState.Top=-64) and (imgSh1InitialState.Left=343) then
        begin
          imgSh1InitialState.Top:=-16;
          imgSh1InitialState.Left:=207;
          imgSelectSpawn.Visible:=false;
          imgSpawnLeft.Visible:=false;
          imgSpawnRight.Visible:=false;
          Station.HalfSetB.Duplexer.cbSh1 := csDisconected;
        end;
      end;
  end;
end;

procedure TBlockDuplexerForm.img1840ConnectedAtRightClick(Sender: TObject);
begin
  case CurFormId of
    idDuplexerA:
      begin
        Station.HalfSetA.Duplexer.cb1840 := csDisconected;
      end;

    idDuplexerB:
      begin
        Station.HalfSetB.Duplexer.cb1840 := csDisconected;
      end;
  end;

  Reload;
end;

procedure TBlockDuplexerForm.imgSh2InitialStateClick(Sender: TObject);
begin
  case CurFormId of
    idDuplexerA:
      begin
        if imgSelectSpawn.Visible=false then
        begin
          imgSelectSpawn.Visible:=true;
          imgSelectSpawn.Top:=330;
          imgSelectSpawn.Left:=625;
          imgSpawnLeft.Visible:=true;
          imgSpawnRight.Visible:=true;
          imgSpawnRight.BringToFront;
          imgSpawnLeft.BringToFront;
          imgSelectSpawn.BringToFront;
        end
        else
        begin
          imgSelectSpawn.Visible:=false;
          imgSpawnLeft.Visible:=false;
          imgSpawnRight.Visible:=false;
          Station.HalfSetA.Duplexer.cbSh2 := csDisconected;
        end;

        if  (imgSh2InitialState.Top=6)and(imgSh2InitialState.Left=435) then
        begin
          imgSh2InitialState.Top:=320;
          imgSh2InitialState.Left:=457;
          imgSelectSpawn.Visible:=false;
          imgSpawnLeft.Visible:=false;
          imgSpawnRight.Visible:=false;
          Station.HalfSetA.Duplexer.cbSh2 := csDisconected;
        end;
      end;

    idDuplexerB:
      begin
        if imgSelectSpawn.Visible=false then
        begin
          imgSelectSpawn.Visible:=true;
          imgSelectSpawn.Top:=330;
          imgSelectSpawn.Left:=625;
          imgSpawnLeft.Visible:=true;
          imgSpawnRight.Visible:=true;
          imgSpawnRight.BringToFront;
          imgSpawnLeft.BringToFront;
          imgSelectSpawn.BringToFront;
        end
        else
        begin
          imgSelectSpawn.Visible:=false;
          imgSpawnLeft.Visible:=false;
          imgSpawnRight.Visible:=false;
          Station.HalfSetB.Duplexer.cbSh2 := csDisconected;
        end;

        if  (imgSh2InitialState.Top=6)and(imgSh2InitialState.Left=435) then
        begin
          imgSh2InitialState.Top:=320;
          imgSh2InitialState.Left:=457;
          imgSelectSpawn.Visible:=false;
          imgSpawnLeft.Visible:=false;
          imgSpawnRight.Visible:=false;
          Station.HalfSetB.Duplexer.cbSh2 := csDisconected;
        end;
      end;
  end;
end;

procedure TBlockDuplexerForm.imgSh2ConnecteAtLeftClick(Sender: TObject);
begin
  case CurFormId of
    idDuplexerA:
      begin
        Station.HalfSetA.Duplexer.cbSh2 := csDisconected;
      end;

    idDuplexerB:
      begin
        Station.HalfSetB.Duplexer.cbSh2 := csDisconected;
      end;
  end;

  Reload;
end;

procedure TBlockDuplexerForm.imgSh1ConnectedAtRightClick(Sender: TObject);
begin
  case CurFormId of
    idDuplexerA:
      begin
        Station.HalfSetA.Duplexer.cbSh1 := csDisconected;
      end;

    idDuplexerB:
      begin
        Station.HalfSetB.Duplexer.cbSh1 := csDisconected;
      end;
  end;

  Reload;
end;

procedure TBlockDuplexerForm.imgSpawnLeftClick(Sender: TObject);
begin
  case CurFormId of
    idDuplexerA:
      begin
        if (imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=66)and(imgSh2ConnecteAtLeft.Visible<>true)and
        (imgSelectSpawn.Left=266)and(img1840ConnectedAtLeft.Visible<>true) then
        begin
          Station.HalfSetA.Duplexer.cbSh1 := csConnectedAtDuplexeLeft;
        end;
        if ( imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=170)and(imgSh2ConnecteAtLeft.Visible<>true)and
        (imgSelectSpawn.Left=450)and(imgSh1InitialState.Top<>-64) then
        begin
          Station.HalfSetA.Duplexer.cb1840 := csConnectedAtDuplexeLeft;
        end;
        if (imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=330)and
        (imgSelectSpawn.Left=625)and(img1840ConnectedAtLeft.Visible<>true)and
        (imgSh1InitialState.Top<>-64) then
        begin
          Station.HalfSetA.Duplexer.cbSh2 := csConnectedAtDuplexeLeft;
        end;
      end;

    idDuplexerB:
      begin
        if (imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=66)and(imgSh2ConnecteAtLeft.Visible<>true)and
        (imgSelectSpawn.Left=266)and(img1840ConnectedAtLeft.Visible<>true) then
        begin
          Station.HalfSetB.Duplexer.cbSh1 := csConnectedAtDuplexeLeft;
        end;
        if ( imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=170)and(imgSh2ConnecteAtLeft.Visible<>true)and
        (imgSelectSpawn.Left=450)and(imgSh1InitialState.Top<>-64) then
        begin
          Station.HalfSetB.Duplexer.cb1840 := csConnectedAtDuplexeLeft;
        end;
        if (imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=330)and
        (imgSelectSpawn.Left=625)and(img1840ConnectedAtLeft.Visible<>true)and
        (imgSh1InitialState.Top<>-64) then
        begin
          Station.HalfSetB.Duplexer.cbSh2 := csConnectedAtDuplexeLeft;
        end;
      end;
  end;

  Reload;
end;

procedure TBlockDuplexerForm.imgSpawnRightClick(Sender: TObject);
begin
  case CurFormId of
    idDuplexerA:
      begin
        if (imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=66)and( imgSh2InitialState.Top<>6)and
        (imgSelectSpawn.Left=266)and(img1840ConnectedAtRight.Visible<>true) then
        begin
          Station.HalfSetA.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
        end;
        if ( imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=170)and( imgSh2InitialState.Top<>6)and
        (imgSelectSpawn.Left=450)and(imgSh1ConnectedAtRight.Visible<>true) then
        begin
          Station.HalfSetA.Duplexer.cb1840 := csConnectedAtDuplexeRight;
        end;
        if  (imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=330)and(imgSelectSpawn.Left=625)and
        (img1840ConnectedAtRight.Visible<>true)and(imgSh1ConnectedAtRight.Visible<>true) then
        begin
          Station.HalfSetA.Duplexer.cbSh2 := csConnectedAtDuplexeRight;
        end;
      end;

    idDuplexerB:
      begin
        if (imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=66)and( imgSh2InitialState.Top<>6)and
        (imgSelectSpawn.Left=266)and(img1840ConnectedAtRight.Visible<>true) then
        begin
          Station.HalfSetB.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
        end;
        if ( imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=170)and( imgSh2InitialState.Top<>6)and
        (imgSelectSpawn.Left=450)and(imgSh1ConnectedAtRight.Visible<>true) then
        begin
          Station.HalfSetB.Duplexer.cb1840 := csConnectedAtDuplexeRight;
        end;
        if  (imgSelectSpawn.Visible=true)and(imgSelectSpawn.Top=330)and(imgSelectSpawn.Left=625)and
        (img1840ConnectedAtRight.Visible<>true)and(imgSh1ConnectedAtRight.Visible<>true) then
        begin
          Station.HalfSetB.Duplexer.cbSh2 := csConnectedAtDuplexeRight;
        end;
      end;
  end;

  Reload;
end;

procedure TBlockDuplexerForm.imgSwWaveReceiveMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  strDigit: string;
  btDigit: Byte;
begin
  case CurFormId of
    idDuplexerA:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
          Station.HalfSetA.Duplexer.waveReceive := btDigit;
        end;
        if ((Button = mbLeft) and (Station.HalfSetA.Duplexer.waveReceive < MAX_WAVE_VALUE)) or
        ((Button = mbRight) and (Station.HalfSetA.Duplexer.waveReceive > MIN_WAVE_VALUE)) then
        begin
          if Button = mbLeft then
            Inc(Station.HalfSetA.Duplexer.waveReceive, 1);
          if Button = mbRight then
            Dec(Station.HalfSetA.Duplexer.waveReceive, 1);

          if Station.HalfSetA.Duplexer.waveReceive >= 10 then
            LabelInputCounter.Caption:= IntToStr(Station.HalfSetA.Duplexer.waveReceive)
          else
            LabelInputCounter.Caption:= '0'+IntToStr(Station.HalfSetA.Duplexer.waveReceive);
        end;

        //настройка приемного и передающего трактов, если взятая по модулю разность < 6, то
        //сброс высокого в 1920 полукомплекта, расфазировка горит
        if Abs(Station.HalfSetA.Duplexer.waveTransmit - Station.HalfSetA.Duplexer.waveReceive) < 6 then
        begin
          if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn) or (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2) or
          (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1) or (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2) then
          begin
            Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 := False;
            Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 := False;
            Station.HalfSetA.Rack1920.stLBV1_TurnedOn := False;
            Station.HalfSetA.Rack1920.stLBV2_TurnedOn := False;
            Station.HalfSetA.Rack1500.swPhaseMover := GetRandomWaveValue;
          end;
        end;
      end;

    idDuplexerB:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
          Station.HalfSetB.Duplexer.waveReceive := btDigit;
        end;
        if ((Button = mbLeft) and (Station.HalfSetB.Duplexer.waveReceive < MAX_WAVE_VALUE)) or
        ((Button = mbRight) and (Station.HalfSetB.Duplexer.waveReceive > MIN_WAVE_VALUE)) then
        begin
          if Button = mbLeft then
            Inc(Station.HalfSetB.Duplexer.waveReceive, 1);
          if Button = mbRight then
            Dec(Station.HalfSetB.Duplexer.waveReceive, 1);

          if Station.HalfSetB.Duplexer.waveReceive >= 10 then
            LabelInputCounter.Caption:= IntToStr(Station.HalfSetB.Duplexer.waveReceive)
          else
            LabelInputCounter.Caption:= '0'+IntToStr(Station.HalfSetB.Duplexer.waveReceive);

          //настройка приемного и передающего трактов, если взятая по модулю разность < 6, то
          //сброс высокого в 1920 полукомплекта, расфазировка горит
          if Abs(Station.HalfSetB.Duplexer.waveTransmit - Station.HalfSetB.Duplexer.waveReceive) < 6 then
          begin
            if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn) or (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2) or
            (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1) or (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2) then
            begin
              Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 := False;
              Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 := False;
              Station.HalfSetB.Rack1920.stLBV1_TurnedOn := False;
              Station.HalfSetB.Rack1920.stLBV2_TurnedOn := False;
              Station.HalfSetB.Rack1500.swPhaseMover := GetRandomWaveValue;
            end;
          end;
        end;
      end;
  end;

  Reload;
end;

procedure TBlockDuplexerForm.imgSwWaveTransmitMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  strDigit: string;
  btDigit: Byte;
begin
  case CurFormId of
    idDuplexerA:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
          Station.HalfSetA.Duplexer.waveTransmit := btDigit;
        end;

        if ((Button = mbLeft) and (Station.HalfSetA.Duplexer.waveTransmit < MAX_WAVE_VALUE)) or
        ((Button = mbRight) and (Station.HalfSetA.Duplexer.waveTransmit > MIN_WAVE_VALUE)) then
        begin
          if Button = mbLeft then
            Inc(Station.HalfSetA.Duplexer.waveTransmit, 1);
          if Button = mbRight then
            Dec(Station.HalfSetA.Duplexer.waveTransmit, 1);
        end;

        if Station.HalfSetA.Duplexer.waveTransmit >= 10 then
          LabelOutputCounter.Caption:= IntToStr(Station.HalfSetA.Duplexer.waveTransmit)
        else
          LabelOutputCounter.Caption:= '0'+IntToStr(Station.HalfSetA.Duplexer.waveTransmit);

        //настройка приемного и передающего трактов, если взятая по модулю разность < 6, то
        //сброс высокого в 1920 полукомплекта, расфазировка горит
        if Abs(Station.HalfSetA.Duplexer.waveTransmit - Station.HalfSetA.Duplexer.waveReceive) < 6 then
        begin
          if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn) or (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2) or
          (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1) or (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2) then
          begin
            Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 := False;
            Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 := False;
            Station.HalfSetA.Rack1920.stLBV1_TurnedOn := False;
            Station.HalfSetA.Rack1920.stLBV2_TurnedOn := False;
            Station.HalfSetA.Rack1500.swPhaseMover := GetRandomWaveValue;
          end;
        end;
      end;

    idDuplexerB:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
          Station.HalfSetB.Duplexer.waveTransmit := btDigit;
        end;

        if ((Button = mbLeft) and (Station.HalfSetB.Duplexer.waveTransmit < MAX_WAVE_VALUE)) or
        ((Button = mbRight) and (Station.HalfSetB.Duplexer.waveTransmit > MIN_WAVE_VALUE)) then
        begin
          if Button = mbLeft then
            Inc(Station.HalfSetB.Duplexer.waveTransmit, 1);
          if Button = mbRight then
            Dec(Station.HalfSetB.Duplexer.waveTransmit, 1);
        end;

        if Station.HalfSetB.Duplexer.waveTransmit >= 10 then
          LabelOutputCounter.Caption:= IntToStr(Station.HalfSetB.Duplexer.waveTransmit)
        else
          LabelOutputCounter.Caption:= '0'+IntToStr(Station.HalfSetB.Duplexer.waveTransmit);

        //настройка приемного и передающего трактов, если взятая по модулю разность < 6, то
        //сброс высокого в 1920 полукомплекта, расфазировка горит
        if Abs(Station.HalfSetB.Duplexer.waveTransmit - Station.HalfSetB.Duplexer.waveReceive) < 6 then
        begin
          if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn) or (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2) or
          (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1) or (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2) then
          begin
            Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 := False;
            Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 := False;
            Station.HalfSetB.Rack1920.stLBV1_TurnedOn := False;
            Station.HalfSetB.Rack1920.stLBV2_TurnedOn := False;
            Station.HalfSetB.Rack1500.swPhaseMover := GetRandomWaveValue;
          end;
        end;
      end;
  end;

  Reload;
end;

procedure TBlockDuplexerForm.imgSelectSpawnClick(Sender: TObject);
begin
  imgSelectSpawn.Visible:=false;
  imgSpawnLeft.Visible:=false;
  imgSpawnRight.Visible:=false;
end;

procedure TBlockDuplexerForm.img1840ConnectedAtLeftClick(Sender: TObject);
begin
  img1840ConnectedAtLeft.Visible:=false;
  ImageCableDisConnected.Visible:=true;

  case CurFormId of
    idDuplexerA:
      begin
        Station.HalfSetA.Duplexer.cb1840 := csDisconected;
      end;

    idDuplexerB:
      begin
        Station.HalfSetB.Duplexer.cb1840 := csDisconected;
      end;
  end;

  Reload;
end;

procedure TBlockDuplexerForm.ImageCableDisconnectedClick(Sender: TObject);
begin
  if imgSelectSpawn.Visible=false then
  begin
    imgSelectSpawn.Visible:=true;
    imgSelectSpawn.Top:=170;
    imgSelectSpawn.Left:=450;
    imgSpawnLeft.Visible:=true;
    imgSpawnRight.Visible:=true;
  end
  else
  begin
    imgSelectSpawn.Visible:=false;
    imgSpawnLeft.Visible:=false;
    imgSpawnRight.Visible:=false;
  end;
end;

procedure TBlockDuplexerForm.Reload;
begin
  case CurFormId of
    idDuplexerA:
      begin
        case Station.HalfSetA.Duplexer.cbSh1 of
          csDisconected:
            begin
              imgSh1ConnectedAtRight.Visible := False;
              imgSh1InitialState.Visible := True;
              imgSh1InitialState.Top:=-16;
              imgSh1InitialState.Left:=207;
            end;
          csConnectedAtDuplexeLeft:
            begin
              imgSh1InitialState.Top:=-64;
              imgSh1InitialState.Left:=343;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
            end;
          csConnectedAtDuplexeRight:
            begin
              imgSh1InitialState.Visible:=false;
              imgSh1ConnectedAtRight.Visible:=true;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
            end;
        end;

        case Station.HalfSetA.Duplexer.cbSh2 of
          csConnectedAtDuplexeLeft:
            begin
              imgSh2ConnecteAtLeft.Visible:=true;
              imgSh2InitialState.Visible:=false;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
              imgSh2ConnecteAtLeft.BringToFront;
            end;
          csConnectedAtDuplexeRight:
            begin
              imgSh2InitialState.Top:=6;
              imgSh2InitialState.Left:=435;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
              imgSwWaveTransmit.BringToFront;
              imgSwWaveReceive.BringToFront;
            end;
          csDisconected:
            begin
              imgSh2InitialState.Visible:=true;
              imgSh2ConnecteAtLeft.Visible := False;
              imgSh2InitialState.Top:=320;
              imgSh2InitialState.Left:=457;
            end;
        end;

        case Station.HalfSetA.Duplexer.cb1840 of
          csConnectedAtDuplexeLeft:
            begin
              img1840ConnectedAtLeft.Visible:=true;
              ImageCableDisConnected.Visible:=false;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
            end;
          csConnectedAtDuplexeRight:
            begin
              img1840ConnectedAtRight.Visible:=true;
              ImageCableDisConnected.Visible:=false;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
              imgSh1InitialState.BringToFront;
              imgSpawnLeft.BringToFront;
              imgSpawnRight.BringToFront;
              imgSh2InitialState.BringToFront;
            end;
          csDisconected:
            begin
              img1840ConnectedAtRight.Visible := False;
              img1840ConnectedAtLeft.Visible := False;
              ImageCableDisConnected.Visible:=true;
            end;
        end;

        if Station.HalfSetA.Duplexer.waveTransmit >= 10 then
          LabelOutputCounter.Caption:= IntToStr(Station.HalfSetA.Duplexer.waveTransmit)
        else
          LabelOutputCounter.Caption:= '0'+IntToStr(Station.HalfSetA.Duplexer.waveTransmit);

        if Station.HalfSetA.Duplexer.waveReceive >= 10 then
          LabelInputCounter.Caption:= IntToStr(Station.HalfSetA.Duplexer.waveReceive)
        else
          LabelInputCounter.Caption:= '0'+IntToStr(Station.HalfSetA.Duplexer.waveReceive);
        imgSwWaveTransmit.Picture.Bitmap := nil;
        imgSwWaveReceive.Picture.Bitmap := nil;
        ImageListSwitcherRound.GetBitmap(Station.HalfSetA.Duplexer.waveTransmit mod 2, imgSwWaveTransmit.Picture.Bitmap);
        ImageListSwitcherRound.GetBitmap(Station.HalfSetA.Duplexer.waveReceive mod 2, imgSwWaveReceive.Picture.Bitmap);
      end;

    idDuplexerB:
      begin
        case Station.HalfSetB.Duplexer.cbSh1 of
          csDisconected:
            begin
              imgSh1ConnectedAtRight.Visible := False;
              imgSh1InitialState.Visible := True;
              imgSh1InitialState.Top:=-16;
              imgSh1InitialState.Left:=207;
            end;
          csConnectedAtDuplexeLeft:
            begin
              imgSh1InitialState.Top:=-64;
              imgSh1InitialState.Left:=343;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
            end;
          csConnectedAtDuplexeRight:
            begin
              imgSh1InitialState.Visible:=false;
              imgSh1ConnectedAtRight.Visible:=true;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
            end;
        end;

        case Station.HalfSetB.Duplexer.cbSh2 of
          csConnectedAtDuplexeLeft:
            begin
              imgSh2ConnecteAtLeft.Visible:=true;
              imgSh2InitialState.Visible:=false;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
              imgSh2ConnecteAtLeft.BringToFront;
            end;
          csConnectedAtDuplexeRight:
            begin
              imgSh2InitialState.Top:=6;
              imgSh2InitialState.Left:=435;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
              imgSwWaveTransmit.BringToFront;
              imgSwWaveReceive.BringToFront;
            end;
          csDisconected:
            begin
              imgSh2InitialState.Visible:=true;
              imgSh2ConnecteAtLeft.Visible := False;
              imgSh2InitialState.Top:=320;
              imgSh2InitialState.Left:=457;
            end;
        end;

        case Station.HalfSetB.Duplexer.cb1840 of
          csConnectedAtDuplexeLeft:
            begin
              img1840ConnectedAtLeft.Visible:=true;
              ImageCableDisConnected.Visible:=false;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
            end;
          csConnectedAtDuplexeRight:
            begin
              img1840ConnectedAtRight.Visible:=true;
              ImageCableDisConnected.Visible:=false;
              imgSelectSpawn.Visible:=false;
              imgSpawnLeft.Visible:=false;
              imgSpawnRight.Visible:=false;
              imgSh1InitialState.BringToFront;
              imgSpawnLeft.BringToFront;
              imgSpawnRight.BringToFront;
              imgSh2InitialState.BringToFront;
            end;
          csDisconected:
            begin
              img1840ConnectedAtRight.Visible := False;
              img1840ConnectedAtLeft.Visible := False;
              ImageCableDisConnected.Visible:=true;
            end;
        end;

        if Station.HalfSetB.Duplexer.waveTransmit >= 10 then
          LabelOutputCounter.Caption:= IntToStr(Station.HalfSetB.Duplexer.waveTransmit)
        else
          LabelOutputCounter.Caption:= '0'+IntToStr(Station.HalfSetB.Duplexer.waveTransmit);

        if Station.HalfSetB.Duplexer.waveReceive >= 10 then
          LabelInputCounter.Caption:= IntToStr(Station.HalfSetB.Duplexer.waveReceive)
        else
          LabelInputCounter.Caption:= '0'+IntToStr(Station.HalfSetB.Duplexer.waveReceive);

        imgSwWaveTransmit.Picture.Bitmap := nil;
        imgSwWaveReceive.Picture.Bitmap := nil;
        ImageListSwitcherRound.GetBitmap(Station.HalfSetB.Duplexer.waveTransmit mod 2, imgSwWaveTransmit.Picture.Bitmap);
        ImageListSwitcherRound.GetBitmap(Station.HalfSetB.Duplexer.waveReceive mod 2, imgSwWaveReceive.Picture.Bitmap);
      end;
  end;

  img1840ConnectedAtRight.Invalidate;
  imgSwWaveTransmit.Invalidate;
  imgSwWaveReceive.Invalidate;
end;

procedure TBlockDuplexerForm.pmcConnectClick(Sender: TObject);
begin
  ImageCableDisconnected.Visible:= False;
  img1840ConnectedAtLeft.Visible:= True;
  imgSh1InitialState.Top:=-16;
  imgSh1InitialState.Left:=207;
end;

procedure TBlockDuplexerForm.pmcDisconnectClick(Sender: TObject);
begin
  ImageCableDisconnected.Visible:= True;
  img1840ConnectedAtLeft.Visible:= False;
  imgSh1InitialState.Top:=-64;
  imgSh1InitialState.Left:=343;
end;

end.
