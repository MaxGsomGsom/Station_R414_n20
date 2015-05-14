unit uRack1600Form;

interface

uses
  Windows,
  Messages,
  uDefinitionsDM,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  jpeg,
  ExtCtrls,
  StdCtrls,
  pngimage,
  ImgList,
  uAdditionalFormMethods,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm,
  uRack1600BForm;

type
  TRack1600Form = class(TForm)
    {$REGION 'Объявление элементов формы'}
    imgBG: TImage;
    Image2: TImage;
    imgButModeControlDownPosition: TImage;
    imgButModeControl: TImage;
    imgButDmchDownPosition: TImage;
    imgButDmch: TImage;
    imgAutomaticLeftPosition: TImage;
    imgAutomatic: TImage;
    img1610_0_sw: TImage;
    imgSw1610_0: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    img1610_R_sw: TImage;
    imgSw1610_R: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    imgSw1600_1: TImage;
    imgSw1610: TImage;
    lbl1600: TLabel;
    imgWarningLight: TImage;
    Image27: TImage;
    Image29: TImage;
    Image28: TImage;
    Image30: TImage;
    Image31: TImage;
    Image32: TImage;
    imgCableMdMain: TImage;
    imgCableMdR: TImage;
    imgDmchMainLight: TImage;
    imgDmchReserveLight: TImage;
    imgArrowDown: TImage;
    imgArrowUp: TImage;
    imgLineOk: TImage;
    imgUpchMainLight: TImage;
    imgUpchReserveLight: TImage;
    img1610ReserveLight: TImage;
    img1610Light: TImage;
    imgUpchMainSelected: TImage;
    imgDmchReserveSelected: TImage;
    imgUpchReserveSelected: TImage;
    img1610ReserveSelected: TImage;
    img1610MainSelected: TImage;
    imgDmchMainSelected: TImage;
    img1610Reserve: TImage;
    imgUpchMain: TImage;
    imgUpchReserve: TImage;
    imgDmchMain: TImage;
    imgDmchReserve: TImage;
    img1610Main: TImage;
    tmrMain: TTimer;
    img1600_sw: TImage;
    imgChannelSwitcher: TImage;
    ilChannelControl: TImageList;
    Button1: TButton;
    Button2: TButton;
    imgWindow0: TImage;
    imgWindow1: TImage;
    imgWindow10: TImage;
    imgWindow2: TImage;
    imgWindow3: TImage;
    imgWindow4: TImage;
    imgWindow5: TImage;
    imgWindow6: TImage;
    imgWindow7: TImage;
    imgWindow8: TImage;
    imgWindow9: TImage;
    imgWaveMeterMain: TImage;
    imgWaveMeterMain1: TImage;
    imgWaveMeterReserv1: TImage;
    imgSWCH9: TImage;
    imgSWCH8: TImage;
    imgSWCH7: TImage;
    imgSWCH6: TImage;
    imgSWCH5: TImage;
    imgSWCH4: TImage;
    imgSWCH3: TImage;
    imgSWCH2: TImage;
    imgSWCH10: TImage;
    imgSWCH1: TImage;
    imgSWCH0: TImage;
    img1: TImage;
    img2: TImage;
    {$ENDREGION}

    {$REGION 'Объявление обработчиков событий формы'}
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Reload;
    procedure FormCreate(Sender: TObject);
    {$ENDREGION}

    {$REGION 'Объявление обработчиков событий элементов формы'}
    procedure Image30Click(Sender: TObject);
    procedure Image28Click(Sender: TObject);
    //procedure Image33MouseMove(Sender: TObject; Shift: TShiftState; X,
      //Y: Integer);
    procedure Image30MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgSw1610MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSw1610_RMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSw1610_0MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwChannelControl1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tmrMainTimer(Sender: TObject);
    procedure imgAutomaticClick(Sender: TObject);
    procedure imgButDmchClick(Sender: TObject);
    procedure imgButModeControlClick(Sender: TObject);
    procedure imgChannelSwitcherMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgUpchReserveSelectedClick(Sender: TObject);
    procedure imgUpchMainSelectedClick(Sender: TObject);
    procedure imgDmchMainSelectedClick(Sender: TObject);
    procedure imgDmchReserveSelectedClick(Sender: TObject);
    procedure img1610MainSelectedClick(Sender: TObject);
    procedure img1610ReserveSelectedClick(Sender: TObject);
    procedure img1610MainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img1610MainSelectedMouseLeave(Sender: TObject);
    procedure img1610ReserveMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img1610ReserveSelectedMouseLeave(Sender: TObject);
    procedure imgUpchReserveMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgUpchReserveSelectedMouseLeave(Sender: TObject);
    procedure imgUpchMainSelectedMouseLeave(Sender: TObject);
    procedure imgUpchMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgDmchMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgDmchMainSelectedMouseLeave(Sender: TObject);
    procedure imgDmchReserveMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgDmchReserveSelectedMouseLeave(Sender: TObject);
    procedure Image32MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image30MouseLeave(Sender: TObject);
    procedure Image31MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image28MouseLeave(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure imgCableMdMainClick(Sender: TObject);
    procedure imgWaveMeterMain1Click(Sender: TObject);
    procedure imgWaveMeterReserv1Click(Sender: TObject);
    procedure imgCableMdRClick(Sender: TObject);
    {$ENDREGION}

  private
    { Private declarations }
     bmp: tbitmap;

     IsMovedToRight : Boolean;
     procedure MoveToCenter();

  public
    { Public declarations }
      Herna:integer;
      dd,hd,Skrol:integer;
      Vidimost:boolean;
      procedure MoveToRight();
     constructor Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;


  var
  Rack1600back: TRack1600BForm;
  imgsSWCH: array [0..10] of ^TImage;
  imgsWindow: array [0..10] of ^TImage;
  deltaWaveO: Integer;

  const
  idRack1600A=1;
  idRack1600B=2;
  end;

implementation

uses
  uStationR414Form,
  uEducationForm,
  uRack1500bForm,
  uWaveMeterPanelForm,
  uBlockPowerPanelForm,
  uBlockWaveMeterForm,
  uConstantsDM;

{$R *.dfm}

var
  CurFormId : Integer;
  ButtonBackForm: TButtonBackForm;
  Station: TStation;
  TaskController: TTaskController;
  WaveMeterForm: TBlockWaveMeterForm;


constructor TRack1600Form.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  CurFormId:=Half;
  Station:=Station0;
  if (Half=1) then begin Self.Caption:='1600 А'; end
  else Self.Caption:='1600 Б';
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
  TaskController.Subscribe(self);
end;

{$REGION 'Функция TRack1600Form.Reload()'}
procedure TRack1600Form.Reload;
begin
  case CurFormId of
    idRack1600A:
      begin
        if Station.IsPluggedIn then
        begin
          imgWarningLight.Visible := Boolean(Station.HalfSetA.Rack1600.butAutomatic = butPositionRight);
        end;
        imgAutomaticLeftPosition.Visible := Boolean(Station.HalfSetA.Rack1600.butAutomatic = butPositionLeft);
        imgButModeControlDownPosition.Visible := Boolean(Station.HalfSetA.Rack1600.butChannelControl = butPositionDown);
        imgButDmchDownPosition.Visible := Boolean(Station.HalfSetA.Rack1600.butDmch = butPositionDown);

        imgCableMdMain.Visible := Boolean(Station.HalfSetA.Rack1600.CableMdMainState = csConnected);
        imgCableMdR.Visible := Boolean(Station.HalfSetA.Rack1600.CableMdReservState = csConnected);

        ilChannelControl.GetBitmap(Station.HalfSetA.Rack1600.swChannelControl - 1, imgChannelSwitcher.Picture.Bitmap);
        imgChannelSwitcher.Invalidate;
        lbl1600.Caption := IntToStr(Station.HalfSetA.Rack1600.wave1600);

        img1610_0_sw.Visible := Boolean(Station.HalfSetA.Rack1600.wave1610_0 mod 2);
        img1610_R_sw.Visible := Boolean(Station.HalfSetA.Rack1600.wave1610_R mod 2);
        img1600_sw.Visible := Boolean(Station.HalfSetA.Rack1600.wave1600 mod 2);

        if (Station.HalfSetA.Rack1600.wave1610_R < 10) then
          Label5.Caption := '0' + IntToStr(Station.HalfSetA.Rack1600.wave1610_R)
        else
          Label5.Caption := IntToStr(Station.HalfSetA.Rack1600.wave1610_R);
        if (Station.HalfSetA.Rack1600.wave1610_R - 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetA.Rack1600.wave1610_R - 1) < 10 then
            Label6.Caption := '0' + IntToStr(Station.HalfSetA.Rack1600.wave1610_R - 1)
          else
            Label6.Caption := IntToStr(Station.HalfSetA.Rack1600.wave1610_R - 1)
        else
          Label6.Caption := '';
        if (Station.HalfSetA.Rack1600.wave1610_R + 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetA.Rack1600.wave1610_R + 1) < 10 then
            Label4.Caption := '0' + IntToStr(Station.HalfSetA.Rack1600.wave1610_R + 1)
          else
            Label4.Caption := IntToStr(Station.HalfSetA.Rack1600.wave1610_R + 1)
        else
          Label4.Caption := '';

        if (Station.HalfSetA.Rack1600.wave1610_0 < 10) then
          Label2.Caption := '0' + IntToStr(Station.HalfSetA.Rack1600.wave1610_0)
        else
          Label2.Caption := IntToStr(Station.HalfSetA.Rack1600.wave1610_0);
        if (Station.HalfSetA.Rack1600.wave1610_0 - 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetA.Rack1600.wave1610_0 - 1) < 10 then
            Label3.Caption := '0' + IntToStr(Station.HalfSetA.Rack1600.wave1610_0 - 1)
          else
            Label3.Caption := IntToStr(Station.HalfSetA.Rack1600.wave1610_0 - 1)
        else
          Label3.Caption := '';
        if (Station.HalfSetA.Rack1600.wave1610_0 + 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetA.Rack1600.wave1610_0 + 1) < 10 then
            Label1.Caption := '0' + IntToStr(Station.HalfSetA.Rack1600.wave1610_0 + 1)
          else
            Label1.Caption := IntToStr(Station.HalfSetA.Rack1600.wave1610_0 + 1)
        else
          Label1.Caption := '';
      end;

    idRack1600B:
      begin
        if Station.IsPluggedIn then
        begin
          imgWarningLight.Visible := Boolean(Station.HalfSetB.Rack1600.butAutomatic = butPositionRight);
        end;

        imgAutomaticLeftPosition.Visible := Boolean(Station.HalfSetB.Rack1600.butAutomatic = butPositionLeft);
        imgButModeControlDownPosition.Visible := Boolean(Station.HalfSetB.Rack1600.butChannelControl = butPositionDown);
        imgButDmchDownPosition.Visible := Boolean(Station.HalfSetB.Rack1600.butDmch = butPositionDown);

        imgCableMdMain.Visible := Boolean(Station.HalfSetB.Rack1600.CableMdMainState = csConnected);
        imgCableMdR.Visible := Boolean(Station.HalfSetB.Rack1600.CableMdReservState = csConnected);

        ilChannelControl.GetBitmap(Station.HalfSetB.Rack1600.swChannelControl - 1, imgChannelSwitcher.Picture.Bitmap);
        imgChannelSwitcher.Invalidate;
        lbl1600.Caption := IntToStr(Station.HalfSetB.Rack1600.wave1600);

        img1610_0_sw.Visible := Boolean(Station.HalfSetB.Rack1600.wave1610_0 mod 2);
        img1610_R_sw.Visible := Boolean(Station.HalfSetB.Rack1600.wave1610_R mod 2);
        img1600_sw.Visible := Boolean(Station.HalfSetB.Rack1600.wave1600 mod 2);

        if (Station.HalfSetB.Rack1600.wave1610_R < 10) then
          Label5.Caption := '0' + IntToStr(Station.HalfSetB.Rack1600.wave1610_R)
        else
          Label5.Caption := IntToStr(Station.HalfSetB.Rack1600.wave1610_R);
        if (Station.HalfSetB.Rack1600.wave1610_R - 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetB.Rack1600.wave1610_R - 1) < 10 then
            Label6.Caption := '0' + IntToStr(Station.HalfSetB.Rack1600.wave1610_R - 1)
          else
            Label6.Caption := IntToStr(Station.HalfSetB.Rack1600.wave1610_R - 1)
        else
          Label6.Caption := '';
        if (Station.HalfSetB.Rack1600.wave1610_R + 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetB.Rack1600.wave1610_R + 1) < 10 then
            Label4.Caption := '0' + IntToStr(Station.HalfSetB.Rack1600.wave1610_R + 1)
          else
            Label4.Caption := IntToStr(Station.HalfSetB.Rack1600.wave1610_R + 1)
        else
          Label4.Caption := '';

        if (Station.HalfSetB.Rack1600.wave1610_0 < 10) then
          Label2.Caption := '0' + IntToStr(Station.HalfSetB.Rack1600.wave1610_0)
        else
          Label2.Caption := IntToStr(Station.HalfSetB.Rack1600.wave1610_0);
        if (Station.HalfSetB.Rack1600.wave1610_0 - 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetB.Rack1600.wave1610_0 - 1) < 10 then
            Label3.Caption := '0' + IntToStr(Station.HalfSetB.Rack1600.wave1610_0 - 1)
          else
            Label3.Caption := IntToStr(Station.HalfSetB.Rack1600.wave1610_0 - 1)
        else
          Label3.Caption := '';
        if (Station.HalfSetB.Rack1600.wave1610_0 + 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetB.Rack1600.wave1610_0 + 1) < 10 then
            Label1.Caption := '0' + IntToStr(Station.HalfSetB.Rack1600.wave1610_0 + 1)
          else
            Label1.Caption := IntToStr(Station.HalfSetB.Rack1600.wave1610_0 + 1)
        else
          Label1.Caption := '';
      end;
  end;

  imgWarningLight.Invalidate;
  imgAutomaticLeftPosition.Invalidate;
  imgButModeControlDownPosition.Invalidate;
  imgButDmchDownPosition.Invalidate;
end;
{$ENDREGION}

{$REGION 'Обработчик TRack1600Form.tmrMainTimer(Sender: TObject)'}
procedure TRack1600Form.tmrMainTimer(Sender: TObject);
begin
  tmrMain.Interval := 1000;

  case CurFormId of
    idRack1600A:
      begin

        if Station.IsPluggedIn then
        begin
          with Station.HalfSetA.Rack1600 do
          begin
            if ((SelectedMd = smdMain) and (SelectedUpch = sUpchMain) and (SelectedDmch = sDmchMain)) then
            begin
              img1610Light.Visible := True;
              imgDmchMainLight.Visible := True;
              imgUpchMainLight.Visible := True;
              imgArrowDown.Visible := True;



              if ((Station.HalfSetA.Rack1500.GeterodinTunedMain = True) and
              (Station.HalfSetA.Rack1600.wave1610_0 = TaskController.NetWorker.ClientState.ReceiverWaveA) and
              (Station.HalfSetA.Rack1600.wave1610_R = TaskController.NetWorker.ClientState.ReceiverWaveA) and
              (Station.HalfSetA.Rack1600.wave1600 = TaskController.NetWorker.ClientState.ReceiverWaveA) and
              (Station.Is1500BTransmited) and
              (Station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionUp) and
              (Station.HalfSetA.LittleNoisyAmplifier.swWave = TaskController.NetWorker.ClientState.ReceiverWaveA) and
              (((Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeLeft) or
              (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeRight)) and
              ((Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeLeft)or
              (Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeRight) or
              (Station.HalfSetA.Duplexer.cb1840 = csConnectedAtDuplexeLeft) or
              (Station.HalfSetA.Duplexer.cb1840 = csConnectedAtDuplexeRight))))
              then
              begin
                imgLineOk.Visible := True;
                Station.HalfSetA.Rack1600.stMoshnost := True;
              end
              else
              begin
                imgLineOk.Visible := not(imgLineOk.Visible);
                Station.HalfSetA.Rack1600.stMoshnost := False;
              end;

              if DropError then
              begin
                img1610ReserveLight.Visible := False;
                imgUpchReserveLight.Visible := False;
                imgDmchReserveLight.Visible := False;
                imgArrowUp.Visible := False;
              end
              else
              begin
                img1610ReserveLight.Visible := not(img1610ReserveLight.Visible);
                imgUpchReserveLight.Visible := not(imgUpchReserveLight.Visible);
                imgDmchReserveLight.Visible := not(imgDmchReserveLight.Visible);
                imgArrowUp.Visible := not(imgArrowUp.Visible);
              end;

              Exit;
            end
            else
              if ((SelectedMd = smdRetr) and (SelectedUpch = sUpchReserve) and (SelectedDmch = sDmchReserve)) then
              begin
                img1610ReserveLight.Visible := True;
                imgUpchReserveLight.Visible := True;
                imgDmchReserveLight.Visible := True;
                imgArrowUp.Visible := True;

                if (GeterodinTunedReserve and Station.Is1500BTransmited) then
                begin
                  imgLineOk.Visible := True;
                  Station.HalfSetA.Rack1600.stMoshnost := True;
                end
                else
                begin
                  imgLineOk.Visible := not(imgLineOk.Visible);
                  Station.HalfSetA.Rack1600.stMoshnost := False;
                end;

                if DropError then
                begin
                  img1610Light.Visible := False;
                  imgDmchMainLight.Visible := False;
                  imgUpchMainLight.Visible := False;
                  imgArrowDown.Visible := False;
                end
                else
                begin
                  img1610Light.Visible := not(img1610Light.Visible);
                  imgUpchMainLight.Visible := not(imgUpchMainLight.Visible);
                  imgDmchMainLight.Visible := not(imgDmchMainLight.Visible);
                  imgArrowDown.Visible := not(imgArrowDown.Visible);
                end;

                Exit;
              end
              else
              begin
                if SelectedMd <> NotSelected then
                begin
                  if SelectedMd = smdMain then
                  begin
                    img1610ReserveLight.Visible := not(img1610ReserveLight.Visible);
                    img1610Light.Visible := True;
                  end
                  else
                    if SelectedMd = smdRetr then
                    begin
                      img1610Light.Visible := not(img1610Light.Visible);
                      img1610ReserveLight.Visible := True;
                    end;
                end
                else
                begin
                  img1610ReserveLight.Visible := not(img1610ReserveLight.Visible);
                  img1610Light.Visible := True;
                  img1610Light.Visible := not(img1610Light.Visible);
                  img1610ReserveLight.Visible := True;
                end;

                if SelectedUpch <> NotSelected then
                begin
                  if SelectedUpch = sUpchMain then
                  begin
                    imgUpchReserveLight.Visible := not(imgUpchReserveLight.Visible);
                    imgUpchMainLight.Visible := True;
                  end
                  else
                    if SelectedUpch = sUpchReserve then
                    begin
                      imgUpchMainLight.Visible := not(imgUpchMainLight.Visible);
                      imgUpchReserveLight.Visible := True;
                    end;
                end
                else
                begin
                  imgUpchMainLight.Visible := not(imgUpchMainLight.Visible);
                  imgUpchReserveLight.Visible := True;
                  imgUpchReserveLight.Visible := not(imgUpchReserveLight.Visible);
                  imgUpchMainLight.Visible := True;
                end;

                if SelectedDmch <> NotSelected then
                begin
                  if SelectedDmch = sDmchMain then
                  begin
                    imgDmchReserveLight.Visible := not(imgDmchReserveLight.Visible);
                    imgDmchMainLight.Visible := True;
                  end
                  else
                    if SelectedDmch = sDmchReserve then
                    begin
                      imgDmchMainLight.Visible := not(imgDmchMainLight.Visible);
                      imgDmchReserveLight.Visible := True;
                    end;
                end
                else
                begin
                  imgDmchReserveLight.Visible := not(imgDmchReserveLight.Visible);
                  imgDmchMainLight.Visible := True;
                  imgDmchMainLight.Visible := not(imgDmchMainLight.Visible);
                  imgDmchReserveLight.Visible := True;
                end;

                imgArrowUp.Visible := not(imgArrowUp.Visible);
                imgArrowDown.Visible := not(imgArrowDown.Visible);

                imgLineOk.Visible := not(imgLineOk.Visible);
              end;
          end;
        end
        else
        begin
          img1610Light.Visible := False;
          imgDmchMainLight.Visible := False;
          imgUpchMainLight.Visible := False;
          imgArrowDown.Visible := False;
          img1610ReserveLight.Visible := False;
          imgUpchReserveLight.Visible := False;
          imgDmchReserveLight.Visible := False;
          imgArrowUp.Visible := False;
        end;
      end;

    idRack1600B:
      begin
        if Station.IsPluggedIn then
        begin
          with Station.HalfSetB.Rack1600 do
          begin
            if ((SelectedMd = smdMain) and (SelectedUpch = sUpchMain) and (SelectedDmch = sDmchMain)) then
            begin
              img1610Light.Visible := True;
              imgDmchMainLight.Visible := True;
              imgUpchMainLight.Visible := True;
              imgArrowDown.Visible := True;

              if ((Station.HalfSetB.Rack1500.GeterodinTunedMain = True) and
              (Station.HalfSetB.Rack1600.wave1610_0 = TaskController.NetWorker.ClientState.ReceiverWaveB) and
              (Station.HalfSetB.Rack1600.wave1610_R = TaskController.NetWorker.ClientState.ReceiverWaveB) and
              (Station.HalfSetB.Rack1600.wave1600 = TaskController.NetWorker.ClientState.ReceiverWaveB) and
              (Station.Is1500ATransmited = True) and
              (Station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionUp) and
              (Station.HalfSetB.LittleNoisyAmplifier.swWave = TaskController.NetWorker.ClientState.ReceiverWaveB) and
              (((Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeLeft) or
              (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeRight)) and
              ((Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeLeft)or
              (Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeRight) or
              (Station.HalfSetA.Duplexer.cb1840 = csConnectedAtDuplexeLeft) or
              (Station.HalfSetA.Duplexer.cb1840 = csConnectedAtDuplexeRight)))) then
              begin
                imgLineOk.Visible := True;
                Station.HalfSetB.Rack1600.stMoshnost := True;
              end
              else
              begin
                imgLineOk.Visible := not(imgLineOk.Visible);
                Station.HalfSetB.Rack1600.stMoshnost := False;
              end;

              if DropError then
              begin
                img1610ReserveLight.Visible := False;
                imgUpchReserveLight.Visible := False;
                imgDmchReserveLight.Visible := False;
                imgArrowUp.Visible := False;
              end
              else
              begin
                img1610ReserveLight.Visible := not(img1610ReserveLight.Visible);
                imgUpchReserveLight.Visible := not(imgUpchReserveLight.Visible);
                imgDmchReserveLight.Visible := not(imgDmchReserveLight.Visible);
                imgArrowUp.Visible := not(imgArrowUp.Visible);
              end;

              Exit;
            end
            else
              if ((SelectedMd = smdRetr) and (SelectedUpch = sUpchReserve) and (SelectedDmch = sDmchReserve)) then
              begin
                img1610ReserveLight.Visible := True;
                imgUpchReserveLight.Visible := True;
                imgDmchReserveLight.Visible := True;
                imgArrowUp.Visible := True;

                if (GeterodinTunedReserve and Station.Is1500ATransmited) then
                begin
                  imgLineOk.Visible := True;
                  Station.HalfSetB.Rack1600.stMoshnost := True;
                end
                else
                begin
                  imgLineOk.Visible := not(imgLineOk.Visible); //
                  Station.HalfSetB.Rack1600.stMoshnost := False;
                end;

                if DropError then
                begin
                  img1610Light.Visible := False;
                  imgDmchMainLight.Visible := False;
                  imgUpchMainLight.Visible := False;
                  imgArrowDown.Visible := False;
                end
                else
                begin
                  img1610Light.Visible := not(img1610Light.Visible);
                  imgUpchMainLight.Visible := not(imgUpchMainLight.Visible);
                  imgDmchMainLight.Visible := not(imgDmchMainLight.Visible);
                  imgArrowDown.Visible := not(imgArrowDown.Visible);
                end;

                Exit;
              end
              else
              begin
                if SelectedMd <> NotSelected then
                begin
                  if SelectedMd = smdMain then
                  begin
                    img1610ReserveLight.Visible := not(img1610ReserveLight.Visible);
                    img1610Light.Visible := True;
                  end
                  else
                    if SelectedMd = smdRetr then
                    begin
                      img1610Light.Visible := not(img1610Light.Visible);
                      img1610ReserveLight.Visible := True;
                    end;
                end
                else
                begin
                  img1610ReserveLight.Visible := not(img1610ReserveLight.Visible);
                  img1610Light.Visible := True;
                  img1610Light.Visible := not(img1610Light.Visible);
                  img1610ReserveLight.Visible := True;
                end;

                if SelectedUpch <> NotSelected then
                begin
                  if SelectedUpch = sUpchMain then
                  begin
                    imgUpchReserveLight.Visible := not(imgUpchReserveLight.Visible);
                    imgUpchMainLight.Visible := True;
                  end
                  else
                    if SelectedUpch = sUpchReserve then
                    begin
                      imgUpchMainLight.Visible := not(imgUpchMainLight.Visible);
                      imgUpchReserveLight.Visible := True;
                    end;
                end
                else
                begin
                  imgUpchMainLight.Visible := not(imgUpchMainLight.Visible);
                  imgUpchReserveLight.Visible := True;
                  imgUpchReserveLight.Visible := not(imgUpchReserveLight.Visible);
                  imgUpchMainLight.Visible := True;
                end;

                if SelectedDmch <> NotSelected then
                begin
                  if SelectedDmch = sDmchMain then
                  begin
                    imgDmchReserveLight.Visible := not(imgDmchReserveLight.Visible);
                    imgDmchMainLight.Visible := True;
                  end
                  else
                    if SelectedDmch = sDmchReserve then
                    begin
                      imgDmchMainLight.Visible := not(imgDmchMainLight.Visible);
                      imgDmchReserveLight.Visible := True;
                    end;
                end
                else
                begin
                  imgDmchReserveLight.Visible := not(imgDmchReserveLight.Visible);
                  imgDmchMainLight.Visible := True;
                  imgDmchMainLight.Visible := not(imgDmchMainLight.Visible);
                  imgDmchReserveLight.Visible := True;
                end;

                imgArrowUp.Visible := not(imgArrowUp.Visible);
                imgArrowDown.Visible := not(imgArrowDown.Visible);

                imgLineOk.Visible := not(imgLineOk.Visible);
              end;
          end;
        end
        else
        begin
          img1610Light.Visible := False;
          imgDmchMainLight.Visible := False;
          imgUpchMainLight.Visible := False;
          imgArrowDown.Visible := False;
          img1610ReserveLight.Visible := False;
          imgUpchReserveLight.Visible := False;
          imgDmchReserveLight.Visible := False;
          imgArrowUp.Visible := False;
        end;
      end;
  end;
end;
{$ENDREGION}

{$REGION 'Смещение формы влево/вправо, чтобы не перекрывать волномер'}
procedure TRack1600Form.MoveToRight();
begin
  if Self.Left < WaveMeterPanelForm.Width then
  begin
    Self.Left := WaveMeterPanelForm.Width;
    IsMovedToRight := True;
  end;
end;

procedure TRack1600Form.MoveToCenter;
begin
  if (IsMovedToRight) then
  begin
    Self.Left := Screen.Width div 2 - Self.width div 2;
    IsMovedToRight := False;
  end;
end;
{$ENDREGION}

{$REGION 'Обработчики событий формы'}
procedure TRack1600Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TaskController.CheckFormBeforeClosing(CanClose);
end;

procedure TRack1600Form.FormCreate(Sender: TObject);
begin
  Self.Width := imgBG.Width + 20;
  MoveFormInScreenCenter(Self);

  case CurFormId of
    idRack1600A: deltaWaveO:= TaskController.NetWorker.ClientState.ReceiverWaveA-Station.HalfSetA.Rack1600.wave1610_0;
    idRack1600B:  deltaWaveO:= TaskController.NetWorker.ClientState.ReceiverWaveB-Station.HalfSetB.Rack1600.wave1610_0;
  end;

  imgsWindow[0] := @imgWindow0;
  imgsWindow[1] := @imgWindow1;
  imgsWindow[2] := @imgWindow2;
  imgsWindow[3] := @imgWindow3;
  imgsWindow[4] := @imgWindow4;
  imgsWindow[5] := @imgWindow5;
  imgsWindow[6] := @imgWindow6;
  imgsWindow[7] := @imgWindow7;
  imgsWindow[8] := @imgWindow8;
  imgsWindow[9] := @imgWindow9;
  imgsWindow[10] := @imgWindow10;


  imgsSWCH[0] := @imgSWCH0;
  imgsSWCH[1] := @imgSWCH1;
  imgsSWCH[2] := @imgSWCH2;
  imgsSWCH[3] := @imgSWCH3;
  imgsSWCH[4] := @imgSWCH4;
  imgsSWCH[5] := @imgSWCH5;
  imgsSWCH[6] := @imgSWCH6;
  imgsSWCH[7] := @imgSWCH7;
  imgsSWCH[8] := @imgSWCH8;
  imgsSWCH[9] := @imgSWCH9;
  imgsSWCH[10] := @imgSWCH10;


  if (Station.IsPluggedIn) then
  begin
    case CurFormId of
    idRack1600A:
    begin
          if (Station.HalfSetA.Rack1600.swChannelControl=9) and (Station.IsPolukomplektATuned) and (Abs(deltaWaveO)<=5)  then
          begin
           imgsWindow[Abs(deltaWaveO)].Visible:=true;
           imgsSWCH[(5-Abs(deltaWaveO))].Visible:=true;
          end;
    end;
    idRack1600B:
    begin
          if (Station.HalfSetB.Rack1600.swChannelControl=9) and (Station.IsPolukomplektBTuned) and (Abs(deltaWaveO)<=5)  then
          begin
           imgsWindow[Abs(deltaWaveO)].Visible:=true;
           imgsSWCH[(5-Abs(deltaWaveO))].Visible:=true;
          end;
    end;

    end;


   end;

end;

procedure TRack1600Form.FormHide(Sender: TObject);
begin
  self.MoveToCenter;
end;

procedure TRack1600Form.FormKeyPress(Sender: TObject; var Key: Char);
var StationR414FormminiHWND : HWND;
begin
  if Ord(Key) = 27 then
  begin
    //Инициация события "Закрытие окна стойки"
    StationR414FormminiHWND := FindWindow(StationR414FormminiClassName, StationR414FormminiObjectName);
    PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  end;
end;

procedure TRack1600Form.FormShow(Sender: TObject);
begin
  tmrMain.Interval := 10;
  tmrMain.Enabled := True;
  Reload;
end;



procedure TRack1600Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrMain.Enabled := False;
  Station.CheckMoshnostA;
  Station.CheckMoshnostB;
  ReturnFromRack;
end;
{$ENDREGION}

{$REGION 'Прокрутка изображения стойки колесом мыши'}
procedure TRack1600Form.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TRack1600Form.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;
{$ENDREGION}

{$REGION 'Обработчики событий элементов формы'}
//procedure TRack1600Form.Image33MouseMove(Sender: TObject; Shift: TShiftState; X,
//  Y: Integer);
//begin
//  Image33.Hide;
//end;

procedure TRack1600Form.imgCableMdMainClick(Sender: TObject);
begin
case CurFormId of
    idRack1600A:
      begin
        Station.HalfSetA.Rack1600.CableMdMainState := csDisconected;
        Station.HalfSetA.Rack1600.CableMdReservState := csDisconected;
      end;
    idRack1600B:
      begin
        Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
        Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
      end;
  end;
  imgCableMdMain.Hide;
  WaveMeterForm.Close;
     Reload;
end;

procedure TRack1600Form.imgCableMdRClick(Sender: TObject);
begin
case CurFormId of
    idRack1600A:
      begin
        Station.HalfSetA.Rack1600.CableMdMainState := csDisconected;
        Station.HalfSetA.Rack1600.CableMdReservState := csDisconected;
      end;
    idRack1600B:
      begin
        Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
        Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
      end;
  end;
  imgCableMdMain.Hide;
  WaveMeterForm.Close;
     Reload;
end;

procedure TRack1600Form.imgChannelSwitcherMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1600A:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1600.swChannelControl < 11) then
        begin
          Inc(Station.HalfSetA.Rack1600.swChannelControl, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetA.Rack1600.swChannelControl > 1) then
        begin
          Dec(Station.HalfSetA.Rack1600.swChannelControl, 1);
        end;
      end;
    idRack1600B:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1600.swChannelControl < 11) then
        begin
          Inc(Station.HalfSetB.Rack1600.swChannelControl, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetB.Rack1600.swChannelControl > 1) then
        begin
          Dec(Station.HalfSetB.Rack1600.swChannelControl, 1);
        end;
      end;
  end;

  Reload;
end;

procedure TRack1600Form.imgDmchMainMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  imgDmchMainSelected.Visible := True;
  imgDmchMainSelected.BringToFront;
end;

procedure TRack1600Form.imgDmchMainSelectedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      begin
        if Station.HalfSetA.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetA.Rack1600.SelectedDmch := sDmchMain;
      end;
    idRack1600B:
      begin
        if Station.HalfSetB.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetB.Rack1600.SelectedDmch := sDmchMain;
      end;
  end;
end;

procedure TRack1600Form.imgDmchMainSelectedMouseLeave(Sender: TObject);
begin
  imgDmchMainSelected.Visible := False;
end;

procedure TRack1600Form.imgDmchReserveMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  imgDmchReserveSelected.Visible := True;
  imgDmchReserveSelected.BringToFront;
end;

procedure TRack1600Form.imgDmchReserveSelectedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      begin
        if Station.HalfSetA.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetA.Rack1600.SelectedDmch := sDmchReserve;
      end;
    idRack1600B:
      begin
        if Station.HalfSetB.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetB.Rack1600.SelectedDmch := sDmchReserve;
      end;
  end;
end;

procedure TRack1600Form.imgDmchReserveSelectedMouseLeave(Sender: TObject);
begin
  imgDmchReserveSelected.Visible := False;
end;

procedure TRack1600Form.imgSw1610MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  strDigit: string;
  btDigit: Byte;
begin
  case CurFormId of
    idRack1600A:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetA.Rack1600.wave1600 := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;

        if (Button = mbLeft) and (Station.HalfSetA.Rack1600.wave1600 < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetA.Rack1600.wave1600, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetA.Rack1600.wave1600 > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetA.Rack1600.wave1600, 1);
        end;
      end;

    idRack1600B:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetB.Rack1600.wave1600 := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;

        if (Button = mbLeft) and (Station.HalfSetB.Rack1600.wave1600 < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetB.Rack1600.wave1600, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetB.Rack1600.wave1600 > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetB.Rack1600.wave1600, 1);
        end;
      end;
  end;

  Reload;
end;

procedure TRack1600Form.imgSw1610_0MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  strDigit: string;
  btDigit: Byte;
begin

  case CurFormId of
    idRack1600A:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetA.Rack1600.wave1610_0 := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;
        if (Button = mbLeft) and (Station.HalfSetA.Rack1600.wave1610_0 < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetA.Rack1600.wave1610_0, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetA.Rack1600.wave1610_0 > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetA.Rack1600.wave1610_0, 1);
        end;


        //===========================


        if (Station.IsPluggedIn) and (Station.IsPolukomplektATuned) and
          (Station.HalfSetA.Rack1600.butDmch = butPositionUp) and (Station.HalfSetA.Rack1600.SelectedMd = smdMain) and
        (Station.HalfSetA.Rack1600.SelectedUpch = sUpchMain) and (Station.HalfSetA.Rack1600.SelectedDmch = sDmchMain)
        and (Station.HalfSetA.Rack1600.butChannelControl = butPositionUp) and (Station.HalfSetA.Rack1600.swChannelControl=9) then
        begin

        if (Abs(deltaWaveO)<=5) then imgsWindow[Abs(deltaWaveO)].Visible:=false;
        if (Abs(deltaWaveO)<=5) then imgsSWCH[(5-Abs(deltaWaveO))].Visible:=false;
        deltaWaveO:= TaskController.NetWorker.ClientState.ReceiverWaveA-Station.HalfSetA.Rack1600.wave1610_0;
        if (Abs(deltaWaveO)<=5) then imgsWindow[Abs(deltaWaveO)].Visible:=True;
        if (Abs(deltaWaveO)<=5) then imgsSWCH[(5-Abs(deltaWaveO))].Visible:=true;

        end;

      end;

    idRack1600B:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetB.Rack1600.wave1610_0 := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;
        if (Button = mbLeft) and (Station.HalfSetB.Rack1600.wave1610_0 < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetB.Rack1600.wave1610_0, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetB.Rack1600.wave1610_0 > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetB.Rack1600.wave1610_0, 1);
        end;


        //===========================


        if (Station.IsPluggedIn) and (Station.IsPolukomplektATuned) and
          (Station.HalfSetB.Rack1600.butDmch = butPositionUp) and (Station.HalfSetB.Rack1600.SelectedMd = smdMain) and
        (Station.HalfSetB.Rack1600.SelectedUpch = sUpchMain) and (Station.HalfSetB.Rack1600.SelectedDmch = sDmchMain)
        and (Station.HalfSetB.Rack1600.butChannelControl = butPositionUp) and (Station.HalfSetB.Rack1600.swChannelControl=9) then
        begin

        if (Abs(deltaWaveO)<=5) then imgsWindow[Abs(deltaWaveO)].Visible:=false;
        if (Abs(deltaWaveO)<=5) then imgsSWCH[(5-Abs(deltaWaveO))].Visible:=false;
        deltaWaveO:= TaskController.NetWorker.ClientState.ReceiverWaveB-Station.HalfSetB.Rack1600.wave1610_0;
        if (Abs(deltaWaveO)<=5) then imgsWindow[Abs(deltaWaveO)].Visible:=True;
        if (Abs(deltaWaveO)<=5) then imgsSWCH[(5-Abs(deltaWaveO))].Visible:=true;

        end;



      end;
  end;

  Reload;
end;

procedure TRack1600Form.imgSw1610_RMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  strDigit: string;
  btDigit: Byte;
begin
  case CurFormId of
    idRack1600A:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetA.Rack1600.wave1610_R := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;

        if (Button = mbLeft) and (Station.HalfSetA.Rack1600.wave1610_R < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetA.Rack1600.wave1610_R, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetA.Rack1600.wave1610_R > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetA.Rack1600.wave1610_R, 1);
        end;
      end;

    idRack1600B:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetB.Rack1600.wave1610_R := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;

        if (Button = mbLeft) and (Station.HalfSetB.Rack1600.wave1610_R < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetB.Rack1600.wave1610_R, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetB.Rack1600.wave1610_R > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetB.Rack1600.wave1610_R, 1);
        end;
      end;
  end;

  Reload;
end;

procedure TRack1600Form.imgSwChannelControl1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1600A:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1600.swChannelControl < 11) then
        begin
          Inc(Station.HalfSetA.Rack1600.swChannelControl, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetA.Rack1600.swChannelControl > 1) then
        begin
          Dec(Station.HalfSetA.Rack1600.swChannelControl, 1);
        end;
      end;

    idRack1600B:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1600.swChannelControl < 11) then
        begin
          Inc(Station.HalfSetB.Rack1600.swChannelControl, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetB.Rack1600.swChannelControl > 1) then
        begin
          Dec(Station.HalfSetB.Rack1600.swChannelControl, 1);
        end;
      end;
  end;

  Reload;
end;

procedure TRack1600Form.imgUpchMainMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  imgUpchMainSelected.Visible := True;
  imgUpchMainSelected.BringToFront;
end;

procedure TRack1600Form.imgUpchMainSelectedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      begin
        if Station.HalfSetA.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetA.Rack1600.SelectedUpch := sUpchMain;
      end;
    idRack1600B:
      begin
        if Station.HalfSetB.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetB.Rack1600.SelectedUpch := sUpchMain;
      end;
  end;
end;

procedure TRack1600Form.imgUpchMainSelectedMouseLeave(Sender: TObject);
begin
  imgUpchMainSelected.Visible := False;
end;

procedure TRack1600Form.imgUpchReserveMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  imgUpchReserveSelected.Visible := True;
  imgUpchReserveSelected.BringToFront;
end;

procedure TRack1600Form.imgUpchReserveSelectedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      begin
        if Station.HalfSetA.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetA.Rack1600.SelectedUpch := sUpchReserve;
      end;
    idRack1600B:
      begin
        if Station.HalfSetB.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetB.Rack1600.SelectedUpch := sUpchReserve;
      end;
  end;
end;

procedure TRack1600Form.imgUpchReserveSelectedMouseLeave(Sender: TObject);
begin
  imgUpchReserveSelected.Visible := False;
end;

procedure TRack1600Form.imgWaveMeterMain1Click(Sender: TObject);
begin
case CurFormId of
    idRack1600A:
      begin
              Station.HalfSetA.Rack1600.CableMdMainState := csConnected;
        Station.HalfSetA.Rack1600.CableMdReservState := csDisconected;
        if (Station.HalfSetA.Rack1600.SelectedMd = smdMain) and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchMain) and
        (Station.HalfSetA.Rack1600.SelectedDmch = sDmchMain) then
        begin
              WaveMeterForm:=TBlockWaveMeterForm.Create(Self, 3, Station, TaskController);
              WaveMeterForm.Show;
        end;
      end;
    idRack1600B:
      begin
              Station.HalfSetB.Rack1600.CableMdMainState := csConnected;
        Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
        if (Station.HalfSetB.Rack1600.SelectedMd = smdMain) and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchMain) and
        (Station.HalfSetB.Rack1600.SelectedDmch = sDmchMain) then
        begin
             WaveMeterForm:=TBlockWaveMeterForm.Create(Self, 4, Station, TaskController);
             WaveMeterForm.Show;
        end;
      end;
  end;
  imgCableMdMain.Show;
     Reload;
end;

procedure TRack1600Form.imgWaveMeterReserv1Click(Sender: TObject);
begin
    case CurFormId of
    idRack1600A:
      begin
              Station.HalfSetA.Rack1600.CableMdMainState := csDisconected;
        Station.HalfSetA.Rack1600.CableMdReservState := csConnected;
        if (Station.HalfSetA.Rack1600.SelectedMd = smdRetr) and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchReserve) and
        (Station.HalfSetA.Rack1600.SelectedDmch = sDmchReserve) then
        begin
              WaveMeterForm:=TBlockWaveMeterForm.Create(Self, 3, Station, TaskController);
              WaveMeterForm.Show;
        end;
      end;
    idRack1600B:
      begin
         Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
        Station.HalfSetB.Rack1600.CableMdReservState := csConnected;
        if (Station.HalfSetB.Rack1600.SelectedMd = smdRetr) and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchReserve) and
        (Station.HalfSetB.Rack1600.SelectedDmch = sDmchReserve) then
        begin
             WaveMeterForm:=TBlockWaveMeterForm.Create(Self, 4, Station, TaskController);
             WaveMeterForm.Show;
        end;
      end;
  end;
  imgCableMdMain.Show;
  Reload;
end;

procedure TRack1600Form.Button1Click(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      Station.HalfSetA.Rack1600.GeterodinTunedMain := True;
    idRack1600B:
      Station.HalfSetB.Rack1600.GeterodinTunedMain := True;
  end;
end;

procedure TRack1600Form.Button2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      Station.HalfSetA.Rack1600.GeterodinTunedReserve := True;
    idRack1600B:
      Station.HalfSetB.Rack1600.GeterodinTunedReserve := True;
  end;
end;


procedure TRack1600Form.img1610MainMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  img1610MainSelected.Visible := True;
  img1610MainSelected.BringToFront;
end;

procedure TRack1600Form.img1610MainSelectedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      begin
        if Station.HalfSetA.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetA.Rack1600.SelectedMd := smdMain;
      end;
    idRack1600B:
      begin
        if Station.HalfSetB.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetB.Rack1600.SelectedMd := smdMain;
      end;
  end;
end;

procedure TRack1600Form.img1610MainSelectedMouseLeave(Sender: TObject);
begin
  img1610MainSelected.Visible := False;
end;

procedure TRack1600Form.img1610ReserveMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  img1610ReserveSelected.Visible := True;
  img1610ReserveSelected.BringToFront;
end;

procedure TRack1600Form.img1610ReserveSelectedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      begin
        if Station.HalfSetA.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetA.Rack1600.SelectedMd := smdRetr;
      end;
    idRack1600B:
      begin
        if Station.HalfSetB.Rack1600.butAutomatic = butPositionRight then
          Station.HalfSetB.Rack1600.SelectedMd := smdRetr;
      end;
  end;
end;

procedure TRack1600Form.img1610ReserveSelectedMouseLeave(Sender: TObject);
begin
  img1610ReserveSelected.Visible := False;
end;

procedure TRack1600Form.imgAutomaticClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      begin
        if Station.HalfSetA.Rack1600.butAutomatic = butPositionLeft then
          Station.HalfSetA.Rack1600.butAutomatic := butPositionRight
        else
          Station.HalfSetA.Rack1600.butAutomatic := butPositionLeft;
      end;

    idRack1600B:
      begin
        if Station.HalfSetB.Rack1600.butAutomatic = butPositionLeft then
          Station.HalfSetB.Rack1600.butAutomatic := butPositionRight
        else
          Station.HalfSetB.Rack1600.butAutomatic := butPositionLeft;
      end;
  end;

  Reload;
end;


procedure TRack1600Form.imgButDmchClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      begin
        if Station.HalfSetA.Rack1600.butDmch = butPositionUp then
          Station.HalfSetA.Rack1600.butDmch := butPositionDown
        else
          Station.HalfSetA.Rack1600.butDmch := butPositionUp;
      end;

    idRack1600B:
      begin
        if Station.HalfSetB.Rack1600.butDmch = butPositionUp then
          Station.HalfSetB.Rack1600.butDmch := butPositionDown
        else
          Station.HalfSetB.Rack1600.butDmch := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1600Form.imgButModeControlClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      begin
        if Station.HalfSetA.Rack1600.butChannelControl = butPositionUp then
          Station.HalfSetA.Rack1600.butChannelControl := butPositionDown
        else
          Station.HalfSetA.Rack1600.butChannelControl := butPositionUp;
      end;

    idRack1600B:
      begin
        if Station.HalfSetB.Rack1600.butChannelControl = butPositionUp then
          Station.HalfSetB.Rack1600.butChannelControl := butPositionDown
        else
          Station.HalfSetB.Rack1600.butChannelControl := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1600Form.Image28Click(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      //(ParentShowHint as TStationR414Form).SpawnForm(idRack1600Aback);
      Rack1600back:= TRack1600BForm.Create(Self, CurFormId, Station, TaskController);
    idRack1600B:
      //(ParentShowHint as TStationR414Form).SpawnForm(idRack1600Bback);
      Rack1600back:= TRack1600BForm.Create(Self, CurFormId, Station, TaskController);
  end;

end;

procedure TRack1600Form.Image28MouseLeave(Sender: TObject);
begin
  Image31.Visible := True;
  Image31.BringToFront;
  Image28.Visible := False;
end;

procedure TRack1600Form.Image30Click(Sender: TObject);
begin
  case CurFormId of
    idRack1600A:
      //(ParentShowHint as TStationR414Form).SpawnForm(idRack1600Aback);
      Rack1600back:= TRack1600BForm.Create(Self, CurFormId, Station, TaskController);
    idRack1600B:
      //(ParentShowHint as TStationR414Form).SpawnForm(idRack1600Bback);
      Rack1600back:= TRack1600BForm.Create(Self, CurFormId, Station, TaskController);
  end;

end;

procedure TRack1600Form.Image30MouseLeave(Sender: TObject);
begin
  Image32.Visible := True;
  Image32.BringToFront;
  Image30.Visible := False;
end;

procedure TRack1600Form.Image30MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//  if (Station.WorkMode = mdExternalView) then
//    Image33.Show;
end;

procedure TRack1600Form.Image31MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Image28.Visible := True;
  Image28.BringToFront;
  Image31.Visible := False;
end;

procedure TRack1600Form.Image32MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Image30.Visible := True;
  Image30.BringToFront;
  Image32.Visible := False;
end;
{$ENDREGION}

end.
