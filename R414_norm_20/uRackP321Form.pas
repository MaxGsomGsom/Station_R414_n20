unit uRackP321Form;

interface

uses
  Windows,
  uDefinitionsDM,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  pngimage,
  ExtCtrls,
  ImgList,
  StdCtrls,
  uAdditionalFormMethods,
  uStationStateDM,
  uTaskControllerDM,
  uButtonBackForm;

type
  TRackP321Form = class(TForm)
    imgBG: TImage;
    P1_1: TImage;
    P1_2: TImage;
    P1_3: TImage;
    P1_4: TImage;
    P1_5: TImage;
    P1_6: TImage;
    P1_7: TImage;
    P1_8: TImage;
    P1_9: TImage;
    P1_10: TImage;
    P1_11: TImage;
    P2_1: TImage;
    P2_2: TImage;
    P2_3: TImage;
    P2_4: TImage;
    P2_5: TImage;
    P2_6: TImage;
    P2_7: TImage;
    P2_8: TImage;
    P2_9: TImage;
    P2_10: TImage;
    P2_11: TImage;
    P2_12: TImage;
    P2_13: TImage;
    P2_14: TImage;
    P2_15: TImage;
    P2_16: TImage;
    P2_17: TImage;
    P2_18: TImage;
    P2_19: TImage;
    P2_20: TImage;
    P2_21: TImage;
    P2_22: TImage;
    P2_23: TImage;
    P2_24: TImage;
    imgButPowerPositionUp: TImage;
    imgButPowerPositionDown: TImage;
    imgMeasureButPositionUp: TImage;
    imgButMeasureButPositionDown: TImage;
    imgBut600OhmButPositionUp: TImage;
    imgBut600OhmButPositionDown: TImage;
    P6_1: TImage;
    P6_2: TImage;
    P6_3: TImage;
    P6_4: TImage;
    P6_5: TImage;
    P6_7: TImage;
    P6_8: TImage;
    P6_9: TImage;
    P6_10: TImage;
    P6_11: TImage;
    P6_6: TImage;
    ilGradPit: TImageList;
    imgGradPit: TImage;
    imgCableGeneratorJumper: TImage;
    imgCableGeneratorConnected: TImage;
    imgCableInputYYConnected: TImage;
    imgDisplay: TImage;
    imgHint1: TImage;
    imgHint2: TImage;
    imgHint3: TImage;
    lblHint1: TLabel;
    lblHint3: TLabel;
    lblHint2: TLabel;
    ilDisplay: TImageList;
    imgSwGradGen1: TImage;
    imgSwGradGen2: TImage;
    imgGradYY1: TImage;
    imgGradYY2: TImage;
    imgCableInputYYJumper: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Reload;
    procedure ReloadHints;
    procedure imgCableGeneratorJumperClick(Sender: TObject);
    procedure imgCableInputYYDisconnectedClick(Sender: TObject);
    procedure P1_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P2_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgButPowerPositionDownClick(Sender: TObject);
    procedure imgBut600OhmButPositionDownClick(Sender: TObject);
    procedure imgButMeasureButPositionDownClick(Sender: TObject);
    procedure P6_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgButPowerPositionUpClick(Sender: TObject);
    procedure imgMeasureButPositionUpClick(Sender: TObject);
    procedure imgBut600OhmButPositionUpClick(Sender: TObject);
    procedure imgGradPitMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwGradGen1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwGradYYMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgGradYY1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCableInputYYJumperClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure FreeCallDeInit;
    procedure FreeCallInit;
    procedure PaintDisplay;
    constructor Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;




var
  //RackP321Form: TRackP321Form;

   bmp:tbitmap;
   arrNepGen: array [1..11] of TImage;
   arrNepGenYY: array [1..11] of TImage;
   arrFrequency: array [1..24] of TImage;
   P321FreeCall: Boolean;
   CurFormId: integer;
   Station: TStation;
  ButtonBackForm: TButtonBackForm;
  TaskController: TTaskController;
   const
    idP321A=1;
  idP321B=2;
  idP321C=3;
  end;

  //������� ���������� ������ ����������� ������ �������� ��������� ������������� � ��� �
  //������������ ��� ������� ����� ��������� � ������������ � p-321
  function AnalyseTune(Rack1500: pRack1500; Rack1920: pRack1920;
    Rack1600: pRack1600; Mshu: pLittleNoisyAmplifier;
    Duplexer: pDuplexer; Litera: Char): string;

implementation

uses
  uStationR414Form,
  uEducationForm,
  uBlockRemoteControllerForm,
  uP321DisplayForm,
  uRackP321MinForm,
  uConstantsDM;

{$R *.dfm}

constructor TRackP321Form.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
//  idP321A:=1;
P321FreeCall:= False;
//  idP321B:=2;
//  idP321C:=3;
if (Half=1) then begin Self.Caption:='�-321 �'; end;
if (Half=2) then begin Self.Caption:='�-321 �'; end
  else Self.Caption:='�-321 �';

  CurFormId:=Half;
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;

procedure TRackP321Form.FreeCallInit;
begin
  P321FreeCall := True;
end;

procedure TRackP321Form.FreeCallDeInit;
begin
  P321FreeCall := False;
end;

function GetInvertedByte(EnterByte: Byte): Integer;
begin
  if EnterByte = 1 then
    Result := 2
  else
  begin
    Result := 1;
  end;
end;

procedure TRackP321Form.ReloadHints;
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;

  if (Station.WorkMode = mdStartParametersSetup) and (Station.WorkType = wtLearn) then
  begin
    case TmpCurFormId of
      idP321A:
        begin
          imgHint1.Visible := Boolean(Station.HalfSetA.P321.swNepGen <> 8);
          imgHint2.Visible := Boolean(Station.HalfSetA.P321.swFrequency <> 4);
          imgHint3.Visible := Boolean(Station.HalfSetA.P321.swNepGenYY <> 7);
          lblHint1.Visible := Boolean(Station.HalfSetA.P321.swNepGen <> 8);
          lblHint2.Visible := Boolean(Station.HalfSetA.P321.swFrequency <> 4);
          lblHint3.Visible := Boolean(Station.HalfSetA.P321.swNepGenYY <> 7);
        end;
      idP321B:
        begin
          imgHint1.Visible := Boolean(Station.HalfSetB.P321.swNepGen <> 8);
          imgHint2.Visible := Boolean(Station.HalfSetB.P321.swFrequency <> 4);
          imgHint3.Visible := Boolean(Station.HalfSetB.P321.swNepGenYY <> 7);
          lblHint1.Visible := Boolean(Station.HalfSetB.P321.swNepGen <> 8);
          lblHint2.Visible := Boolean(Station.HalfSetB.P321.swFrequency <> 4);
          lblHint3.Visible := Boolean(Station.HalfSetB.P321.swNepGenYY <> 7);
        end;
      idP321C:
        begin
          imgHint1.Visible := Boolean(Station.P321C.swNepGen <> 8);
          imgHint2.Visible := Boolean(Station.P321C.swFrequency <> 4);
          imgHint3.Visible := Boolean(Station.P321C.swNepGenYY <> 7);
          lblHint1.Visible := Boolean(Station.P321C.swNepGen <> 8);
          lblHint2.Visible := Boolean(Station.P321C.swFrequency <> 4);
          lblHint3.Visible := Boolean(Station.P321C.swNepGenYY <> 7);
        end;
    end;
  end
  else
  begin
    imgHint1.Visible := False;
    imgHint2.Visible := False;
    imgHint3.Visible := False;
    lblHint1.Visible := False;
    lblHint2.Visible := False;
    lblHint3.Visible := False;
  end;

  imgHint1.Invalidate;
  imgHint2.Invalidate;
  imgHint3.Invalidate;

  lblHint1.Invalidate;
  lblHint2.Invalidate;
  lblHint3.Invalidate;
end;

//������� ���������� ������ ����������� ������ �������� ��������� ������������� � ��� �
//������������ ��� ������� ����� ��������� � ������������ � p-321
function AnalyseTune(Rack1500: pRack1500; Rack1920: pRack1920; Rack1600: pRack1600; Mshu: pLittleNoisyAmplifier; Duplexer: pDuplexer; Litera: Char): string;
var
  strError: string;

  procedure AddAnalyseTuneError(ErrDesc: string);
  begin
    if strError = '' then
      strError := ErrDesc
    else
      strError := strError + '. ' + ErrDesc;
  end;

begin
//Station.IsPolukomplektATuned
  Result := '';
  strError := '';

//  if (Station.HalfSetA.Rack1500.swPhaseMover <> 10) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): ������������ �� ��������� ');
//  end;
//  if (Station.HalfSetA.Rack1500.btnAutomatic <> butPositionRight) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): ���������� �� ��������');
//  end;
//  if (Station.HalfSetA.Rack1500.swWave1610_0 <> Station.WaveTransmitA) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): ����� ����� 1610 ���������� �� �����');
//  end;
//  if (Station.HalfSetA.Rack1500.swWave1500 <> Station.WaveTransmitA) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): ����� ����� 1500 ���������� �� �����');
//  end;
//  if (Station.HalfSetA.Rack1500.swWave161_R <> Station.WaveTransmitA) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): ����� 1610-� ���������� �� �����');
//  end;
//  if (((Station.HalfSetA.Rack1500.SelectedMd <> smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr <> sRetrMain)) and
//  ((Station.HalfSetA.Rack1500.SelectedMd <> smdRetr) and (Station.HalfSetA.Rack1500.SelectedRetr <> sRetrReserv))) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): �� ������ ���������� ������������ ������������');
//  end;
//  if (Station.HalfSetA.Rack1500.DropError <> True) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): ������ �� ��������');
//  end;
//  if (Station.HalfSetA.Rack1500.GeterodinTunedMain <> True) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): ��������� ������� ������������� �� ��������');
//  end;
//  if (Station.HalfSetA.Rack1500.GeterodinTunedReserve <> True) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): ��������� ���������� ������������� �� ��������');
//  end;
//  if (Station.HalfSetA.Rack1500.stCableLoad <> csConnectedAtRack1500Sh1) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): ������ �������� ��������� � �������');
//  end;
//  if (Station.HalfSetA.Rack1500.stCableSh1 <> csConnectedAtRack1500NoName) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): ������ �1 ��������� �� �����');
//  end;
//  if (Station.HalfSetA.Rack1920.butPower <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������� �� ��� 1 �� ���������');
//  end;
//  if (Station.HalfSetA.Rack1920.butPower2 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������� �� ��� 2 �� ���������');
//  end;
//  if (Station.HalfSetA.Rack1920.but1910 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������������� ������� ����� 1910 �� ��������');
//  end;
//  if (Station.HalfSetA.Rack1920.but1910A <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������������ ������� ���������� ����� 1910 �� �������');
//  end;
//  if (Station.HalfSetA.Rack1920.but1930 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������������ ������� ����� 1930 �� �������');
//  end;
//  if (Station.HalfSetA.Rack1920.but1960_1 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������������ ������� ����� 1960 �� �������');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOn <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������ ������ ������� �� ���1 �� ������');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOn2 <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������ ������ ������� �� ���2 �� ������');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOff <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������ ���������� ������� ��� 1 ������');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOff2 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������ ���������� ������� ��� 2 ������');
//  end;
//  if (Station.HalfSetA.Rack1920.butCurrent5MA <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������ ������ ���� �� ��� 1 �� ������');
//  end;
//  if (Station.HalfSetA.Rack1920.butCurrent5MA2 <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ������ ������ ���� �� ��� 2 �� ������');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ���������� �� ��� 1 �� ������');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ���������� �� ��� 2 �� ������');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ��� 1 �� ��������');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ��� 2 �� ��������');
//  end;
//  if (Station.HalfSetA.Rack1600.GeterodinTunedMain <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): �������� ��������� �� ��������');
//  end;
//  if (Station.HalfSetA.Rack1600.GeterodinTunedReserve <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): �������� ��������� �� ��������');
//  end;
//  if (Station.HalfSetA.Rack1600.butAutomatic <> butPositionLeft) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): ���������� �� ��������');
//  end;
//  if (((Station.HalfSetA.Rack1600.SelectedMd <> smdMain) and (Station.HalfSetA.Rack1600.SelectedUpch <> sUpchMain) and (Station.HalfSetA.Rack1600.SelectedDmch <> sDmchMain)) and
//  ((Station.HalfSetA.Rack1600.SelectedMd <> smdRetr) and (Station.HalfSetA.Rack1600.SelectedUpch <> sUpchReserve) and (Station.HalfSetA.Rack1600.SelectedDmch <> sDmchReserve))) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): �� ������ �� ���� �� ��������������');
//  end;
//  if (Station.HalfSetA.Rack1600.wave1610_0 <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): ����� �� ����� 1610 ���������� �� �����');
//  end;
//  if (Station.HalfSetA.Rack1600.wave1600 <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): ����� �� ����� 1600 ���������� �� �����');
//  end;
//  if (Station.HalfSetA.Rack1600.wave1610_R <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): ����� �� ����� 1610-� ���������� �� �����');
//  end;
//  if (Station.HalfSetA.Rack1600.DropError <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): ������ �� ��������');
//  end;
//  if (Station.HalfSetA.Rack1600.stMoshnost <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): ��� �������� �� ����� ����� 1600!');
//  end;
//  if (Station.HalfSetA.LittleNoisyAmplifier.swWave <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('����� � ���(' + Litera + ') ���������� �� �����');
//  end;
//  if ((Station.HalfSetA.LittleNoisyAmplifier.butNet <> butPositionUp) and (Station.HalfSetA.LittleNoisyAmplifier.butNet2 <> butPositionUp)) then
//  begin
//    AddAnalyseTuneError('��� (' + Litera + '): ������������� ��������� ��������� ��� ���������� ������ �� �������');
//  end;
//  if (((Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeLeft) and (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeRight)) and
//    ((Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeRight) and (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeLeft))) then
//  begin
//    AddAnalyseTuneError('��������� (' + Litera + ') ������ ��������� �� �����');
//  end;
//  if not(Station.IsPowerPanelPoweredOn) then
//  begin
//    AddAnalyseTuneError('������� � ���� ������ �� �� ��� �����(�� �����)');
//  end;
//
//  if strError <> '' then
//    strError := '������ ��������� ������������� (' + Litera + '): '+ strError;
  Result := strError;
end;

procedure TRackP321Form.PaintDisplay;
const
  csBlockPowerPanelForm = 1;
  csGenerator = 2;
  csInputYY = 3;
var
  CurTuneValue: Byte;
  NeededTuneValue: Byte;

  procedure ReloadP321Image;
  begin
    imgDisplay.Invalidate;
    if imgDisplay.Picture <> nil then
    begin
      imgDisplay.Picture := imgDisplay.Picture;
      imgDisplay.Invalidate;
      imgDisplay.Picture := imgDisplay.Picture;
    end
    else
    begin
      ilDisplay.GetBitmap(0, RackP321MinForm.imgDisplay.Picture.Bitmap);
    end;
    RackP321MinForm.imgDisplay.Invalidate;
  end;

  procedure ShowNull;
  begin
    ilDisplay.GetBitmap(0, imgDisplay.Picture.Bitmap);
    imgDisplay.Invalidate;
    ReloadP321Image;
  end;

begin
//  if Station.IsPluggedIn then
//  begin
//    case Station.P321C.swNepGenYY of
//      csBlockPowerPanelForm:
//        begin
//          ilDisplay.GetBitmap(Station.P321C.swGradPit - 1, imgDisplay.Picture.Bitmap);
//        end;
//      csGenerator:
//        begin
//          ilDisplay.GetBitmap(Station.P321C.swGradGen - 1, imgDisplay.Picture.Bitmap);
//        end;
//      csInputYY:
//        begin
//          ilDisplay.GetBitmap(Station.P321C.swGradYY - 1, imgDisplay.Picture.Bitmap);
//        end;
//      6:
//        begin
//          //�������� ��������� �� ���������� ���������
//          if (Station.P321C.swNepGen = 5) and
//          (Station.P321C.swGradPit = 31) and
//          (Station.P321C.swGradGen = 31) and
//          (Station.P321C.swGradYY = 31) and
//          (Station.P321C.swFrequency = 4) then
//          begin
//            //��������� ���������� �����
//            //���������� �� ������
//            if (Station.cbGenerator.stConnectedToPlaceId <> csDisconected) and
//            (Station.cbInputYY.stConnectedToPlaceId <> csDisconected) then
//            begin
//              //������ ����������
//              //����������� ���������� ����� 1200
//              //ShowMessage(IntToStr(Station.cbGenerator.stConnectedToPlaceId));
//              //ShowMessage(IntToStr(Station.cbInputYY.stConnectedToPlaceId));
//              if (Station.IsPolukomplektATuned and Station.IsPolukomplektBTuned) then
//              begin
//                //==============���� ��������� �����===================
//                if (Station.IsChannelBlocksTunedAt2ChannelMode) then
//                begin
//                  if Station.IsP321ShuntsConnectedAt2ChannelMode then
//                  begin
//                    CurTuneValue := Station.GetTransmitBlockTune;
//                    NeededTuneValue := GetTransmitBlockTunedValue;
//                    if (CurTuneValue = NeededTuneValue) then
//                    begin
//                      //���� ��������
//                      ilDisplay.GetBitmap(20, imgDisplay.Picture.Bitmap);
//                    end
//                    else
//                      if (CurTuneValue < NeededTuneValue) then
//                      begin
//                        ilDisplay.GetBitmap(20 - (NeededTuneValue - CurTuneValue), imgDisplay.Picture.Bitmap);
//                      end
//                      else
//                        ilDisplay.GetBitmap(20 + (CurTuneValue - NeededTuneValue), imgDisplay.Picture.Bitmap);
//                    ReloadP321Image;
//                    Exit;
//                  end
//                  else
//                    ShowNull;
//                end;
//                //==============������� ��������� �����===================
//                if (Station.IsChannelBlocksTunedAt4ChannelMode) then
//                begin
//                  if Station.IsP321ShuntsConnectedAt4ChannelMode then
//                  begin
//                    CurTuneValue := Station.GetTransmitBlockTune;
//                    NeededTuneValue := GetTransmitBlockTunedValue;
//                    if ((CurTuneValue - NeededTuneValue) = 0) then
//                    begin
//                      //���� ��������
//                      ilDisplay.GetBitmap(14, imgDisplay.Picture.Bitmap);
//                    end
//                    else
//                      if (CurTuneValue < NeededTuneValue) then
//                      begin
//                        ilDisplay.GetBitmap(14 - (NeededTuneValue - CurTuneValue), imgDisplay.Picture.Bitmap);
//                      end
//                      else
//                        ilDisplay.GetBitmap(14 + (CurTuneValue - NeededTuneValue), imgDisplay.Picture.Bitmap);
//                    ReloadP321Image;
//                    Exit;
//                  end
//                  else
//                    ShowNull;
//                end
//                else
//                begin
//                  AddError(idP321C, '��������� ��������� ������������ �� ������������� �� 2-� �� 4-� ���������� ������, ������ ��������� �� ��������');
//                end;
//
//                if (Station.IsChannelBlocksTunedAt2ChannelMode = False) and (Station.IsChannelBlocksTunedAt2ChannelMode = False) then
//                begin
//                  ShowNull;
//                end;
//              end
//              else
//              begin
//                ShowNull;
//                AddError(idP321A, AnalyseTune(Station.HalfSetA.Rack1500, Station.HalfSetA.Rack1920, Station.HalfSetA.Rack1600, Station.HalfSetA.LittleNoisyAmplifier, Station.HalfSetA.Duplexer, 'A') +
//                AnalyseTune(Station.HalfSetA.Rack1500, Station.HalfSetA.Rack1920, Station.HalfSetA.Rack1600, Station.HalfSetA.LittleNoisyAmplifier, Station.HalfSetA.Duplexer, 'B'));
//              end;
//            end;
//          end
//          else
//          begin
//            AddError(idP321C, '��������� P-321 ��������� �� �����, ������ ��������� �� ��������');
//          end;
//        end;
//    else
//      ilDisplay.GetBitmap(0, imgDisplay.Picture.Bitmap);
//    end;
//    ReloadP321Image;
//  end;
end;

procedure TRackP321Form.Reload;
var
  TmpCurFormId, Freq, NepGen, InputYY, intA: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  //protect against not free call spawn
  case TmpCurFormId of
    idP321A, idP321B, idP321C:;
  else
    FreeCallInit;
    TmpCurFormId := idP321C;
  end;
  case TmpCurFormId of
    idP321A:
      begin
        imgButPowerPositionUp.Visible := Boolean(Station.HalfSetA.P321.butPower = butPositionUp);
        imgButPowerPositionDown.Visible := Boolean(Station.HalfSetA.P321.butPower = butPositionDown);
        imgButMeasureButPositionDown.Visible := Boolean(Station.HalfSetA.P321.butMeasure = butPositionDown);
        imgMeasureButPositionUp.Visible := Boolean(Station.HalfSetA.P321.butMeasure = butPositionUp);
        imgBut600OhmButPositionUp.Visible := Boolean(Station.HalfSetA.P321.but600Ohm = butPositionUp);
        imgBut600OhmButPositionDown.Visible := Boolean(Station.HalfSetA.P321.but600Ohm = butPositionDown);
        Freq := Station.HalfSetA.P321.swFrequency;
        NepGen := Station.HalfSetA.P321.swNepGen;
        InputYY := Station.HalfSetA.P321.swNepGenYY;
        imgCableGeneratorJumper.Visible := Boolean(Station.HalfSetA.P321.cblVihGen = csDisconected);
        imgCableInputYYJumper.Visible := Boolean(Station.HalfSetA.P321.cblVhYY = csDisconected);
        intA := Station.HalfSetA.P321.swGradPit;
        while intA > 7 do
        begin
          Dec(intA, 7);
        end;
        ilGradPit.GetBitmap(intA, imgGradPit.Picture.Bitmap);
        imgGradYY2.Visible := Boolean(Station.HalfSetA.P321.swGradYY mod 2 = 1);
        imgGradYY1.Visible := Boolean(Station.HalfSetA.P321.swGradYY mod 2 = 0);
        imgSwGradGen2.Visible := Boolean(Station.HalfSetA.P321.swGradGen mod 2 = 1);
        imgSwGradGen1.Visible := Boolean(Station.HalfSetA.P321.swGradGen mod 2 = 0);
        imgGradPit.Invalidate;
      end;
    idP321B:
      begin
        imgButPowerPositionUp.Visible := Boolean(Station.HalfSetB.P321.butPower = butPositionUp);
        imgButPowerPositionDown.Visible := Boolean(Station.HalfSetB.P321.butPower = butPositionDown);
        imgButMeasureButPositionDown.Visible := Boolean(Station.HalfSetB.P321.butMeasure = butPositionDown);
        imgMeasureButPositionUp.Visible := Boolean(Station.HalfSetB.P321.butMeasure = butPositionUp);
        imgBut600OhmButPositionUp.Visible := Boolean(Station.HalfSetB.P321.but600Ohm = butPositionUp);
        imgBut600OhmButPositionDown.Visible := Boolean(Station.HalfSetB.P321.but600Ohm = butPositionDown);
        Freq := Station.HalfSetB.P321.swFrequency;
        NepGen := Station.HalfSetB.P321.swNepGen;
        InputYY := Station.HalfSetB.P321.swNepGenYY;
        imgCableGeneratorJumper.Visible := Boolean(Station.HalfSetB.P321.cblVihGen = csDisconected);
        imgCableInputYYJumper.Visible := Boolean(Station.HalfSetB.P321.cblVhYY = csDisconected);
        intA := Station.HalfSetA.P321.swGradPit;
        while intA > 7 do
        begin
          Dec(intA, 7);
        end;
        ilGradPit.GetBitmap(intA, imgGradPit.Picture.Bitmap);
        imgGradYY2.Visible := Boolean(Station.HalfSetB.P321.swGradYY mod 2 = 1);
        imgGradYY1.Visible := Boolean(Station.HalfSetB.P321.swGradYY mod 2 = 0);
        imgSwGradGen2.Visible := Boolean(Station.HalfSetB.P321.swGradGen mod 2 = 1);
        imgSwGradGen1.Visible := Boolean(Station.HalfSetB.P321.swGradGen mod 2 = 0);
        imgGradPit.Invalidate;
      end;
    idP321C:
      begin
        imgButPowerPositionUp.Visible := Boolean(Station.P321C.butPower = butPositionUp);
        imgButPowerPositionDown.Visible := Boolean(Station.P321C.butPower = butPositionDown);
        imgButMeasureButPositionDown.Visible := Boolean(Station.P321C.butMeasure = butPositionDown);
        imgMeasureButPositionUp.Visible := Boolean(Station.P321C.butMeasure = butPositionUp);
        imgBut600OhmButPositionUp.Visible := Boolean(Station.P321C.but600Ohm = butPositionUp);
        imgBut600OhmButPositionDown.Visible := Boolean(Station.P321C.but600Ohm = butPositionDown);
        Freq := Station.P321C.swFrequency;
        NepGen := Station.P321C.swNepGen;
        InputYY := Station.P321C.swNepGenYY;
        imgCableGeneratorJumper.Visible := Boolean(Station.cbGenerator.stConnectedToPlaceId = csDisconected);
        imgCableInputYYJumper.Visible := Boolean(Station.cbInputYY.stConnectedToPlaceId  = csDisconected);
        intA := Station.P321C.swGradPit;
        while intA > 7 do
        begin
          Dec(intA, 7);
        end;
        ilGradPit.GetBitmap(intA, imgGradPit.Picture.Bitmap);
        imgGradYY2.Visible := Boolean(Station.P321C.swGradYY mod 2 = 1);
        imgGradYY1.Visible := Boolean(Station.P321C.swGradYY mod 2 = 0);
        imgSwGradGen2.Visible := Boolean(Station.P321C.swGradGen mod 2 = 1);
        imgSwGradGen1.Visible := Boolean(Station.P321C.swGradGen mod 2 = 0);
        imgGradPit.Invalidate;
      end;
  end;

  ReloadHints;

  for intA := 1 to Length(arrNepGen) do
    arrNepGen[intA].Visible := False;
  arrNepGen[NepGen].Visible := True;
  arrNepGen[NepGen].BringToFront;

  for intA := 1 to Length(arrFrequency) do
    arrFrequency[intA].Visible := False;
  arrFrequency[Freq].Visible := True;
  arrFrequency[Freq].BringToFront;

  for intA := 1 to Length(arrNepGenYY) do
    arrNepGenYY[intA].Visible := False;
  arrNepGenYY[InputYY].Visible := True;
  arrNepGenYY[InputYY].BringToFront;

  imgBG.Invalidate;
  imgGradYY2.Invalidate;
  imgGradYY1.Invalidate;
  imgSwGradGen2.Invalidate;
  imgSwGradGen1.Invalidate;
  imgGradPit.BringToFront;
  PaintDisplay;
end;

procedure TRackP321Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReturnFromRack;
end;

procedure TRackP321Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TaskController.CheckFormBeforeClosing(CanClose);
end;

procedure TRackP321Form.FormCreate(Sender: TObject);
begin
  arrNepGen[1] := P1_1;
  arrNepGen[2] := P1_2;
  arrNepGen[3] := P1_3;
  arrNepGen[4] := P1_4;
  arrNepGen[5] := P1_5;
  arrNepGen[6] := P1_6;
  arrNepGen[7] := P1_7;
  arrNepGen[8] := P1_8;
  arrNepGen[9] := P1_9;
  arrNepGen[10] := P1_10;
  arrNepGen[11] := P1_11;

  arrFrequency[1] := P2_1;
  arrFrequency[2] := P2_2;
  arrFrequency[3] := P2_3;
  arrFrequency[4] := P2_4;
  arrFrequency[5] := P2_5;
  arrFrequency[6] := P2_6;
  arrFrequency[7] := P2_7;
  arrFrequency[8] := P2_8;
  arrFrequency[9] := P2_9;
  arrFrequency[10] := P2_10;
  arrFrequency[11] := P2_11;
  arrFrequency[12] := P2_12;
  arrFrequency[13] := P2_13;
  arrFrequency[14] := P2_14;
  arrFrequency[15] := P2_15;
  arrFrequency[16] := P2_16;
  arrFrequency[17] := P2_17;
  arrFrequency[18] := P2_18;
  arrFrequency[19] := P2_19;
  arrFrequency[20] := P2_20;
  arrFrequency[21] := P2_21;
  arrFrequency[22] := P2_22;
  arrFrequency[23] := P2_23;
  arrFrequency[24] := P2_24;

  arrNepGenYY[1] := P6_1;
  arrNepGenYY[2] := P6_2;
  arrNepGenYY[3] := P6_3;
  arrNepGenYY[4] := P6_4;
  arrNepGenYY[5] := P6_5;
  arrNepGenYY[6] := P6_6;
  arrNepGenYY[7] := P6_7;
  arrNepGenYY[8] := P6_8;
  arrNepGenYY[9] := P6_9;
  arrNepGenYY[10] := P6_10;
  arrNepGenYY[11] := P6_11;

  MoveFormInScreenCenter(Self);
end;

procedure TRackP321Form.FormKeyPress(Sender: TObject; var Key: Char);
var StationR414FormminiHWND : HWND;
begin
  if Ord(Key) = 27 then
  begin
    //��������� ������� "�������� ���� ������"
    StationR414FormminiHWND := FindWindow(StationR414FormminiClassName, StationR414FormminiObjectName);
    PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  end;
end;

procedure TRackP321Form.FormShow(Sender: TObject);
var
  btA: Byte;
begin
  SetLength(HelpImages, 0);
  SetLength(HelpImages, 3);
  HelpImages[0].HelpImage := imgHint1;
  HelpImages[0].HelpLabel := lblHint1;
  HelpImages[1].HelpImage := imgHint2;
  HelpImages[1].HelpLabel := lblHint2;
  HelpImages[2].HelpImage := imgHint3;
  HelpImages[2].HelpLabel := lblHint3;

  if Station.WorkMode = mdStartParametersSetup then
  begin
    imgHint1.Visible:=true;
    imgHint2.Visible:=true;
    imgHint3.Visible:=true;
    lblHint1.Visible:=true;
    lblHint2.Visible:=true;
    lblHint3.Visible:=true;

    for btA := 0 to Length(HelpImages) - 1 do
    begin
      HelpImages[btA].HelpImage.Visible := True;
      HelpImages[btA].HelpLabel.Visible := True;
    end;
  end
  else
  begin
    imgHint1.Visible:=False;
    imgHint2.Visible:=False;
    imgHint3.Visible:=False;
    lblHint1.Visible:=False;
    lblHint2.Visible:=False;
    lblHint3.Visible:=False;

    for btA := 0 to Length(HelpImages) - 1 do
    begin
      HelpImages[btA].HelpImage.Visible := False;
      HelpImages[btA].HelpLabel.Visible := False;
    end;
  end;

  Reload;
  PaintDisplay;
end;

procedure TRackP321Form.imgCableGeneratorJumperClick(Sender: TObject);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
//  case TmpCurFormId of
//    idP321A:
//        _Pult.SelectedCable := stcblGenerator;
//    idP321B:
//        _Pult.SelectedCable := stcblGenerator;
//    idP321C:
//        _Pult.SelectedCable := stcblGenerator;
//  end;

  Reload;
end;

procedure TRackP321Form.imgCableInputYYDisconnectedClick(Sender: TObject);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      Station.HalfSetA.P321.cblVhYY := csConnected;
    idP321B:
      Station.HalfSetB.P321.cblVhYY := csConnected;
    idP321C:
      Station.P321C.cblVhYY := csConnected;
  end;

  Reload;
end;

procedure TRackP321Form.imgCableInputYYJumperClick(Sender: TObject);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
//  case TmpCurFormId of
//    idP321A:
//        _Pult.SelectedCable := stcblInputYY;
//    idP321B:
//        _Pult.SelectedCable := stcblInputYY;
//    idP321C:
//        _Pult.SelectedCable := stcblInputYY;
//  end;

  Reload;
end;

procedure TRackP321Form.imgGradPitMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.P321.swGradPit < 33) then
          Inc(Station.HalfSetA.P321.swGradPit, 1);
        if (Button = mbRight) and (Station.HalfSetA.P321.swGradPit > 1) then
          Dec(Station.HalfSetA.P321.swGradPit, 1);
      end;
    idP321B:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.P321.swGradPit < 33) then
          Inc(Station.HalfSetB.P321.swGradPit, 1);
        if (Button = mbRight) and (Station.HalfSetB.P321.swGradPit > 1) then
          Dec(Station.HalfSetB.P321.swGradPit, 1);
      end;
    idP321C:
      begin
        if (Button = mbLeft) and (Station.P321C.swGradPit < 33) then
          Inc(Station.P321C.swGradPit, 1);
        if (Button = mbRight) and (Station.P321C.swGradPit > 1) then
          Dec(Station.P321C.swGradPit, 1);
      end;
  end;

  Reload;
  PaintDisplay;
end;

procedure TRackP321Form.imgGradYY1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.P321.swGradYY < 33) then
          Inc(Station.HalfSetA.P321.swGradYY, 1);
        if (Button = mbRight) and (Station.HalfSetA.P321.swGradYY > 1) then
          Dec(Station.HalfSetA.P321.swGradYY, 1);
      end;
    idP321B:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.P321.swGradYY < 33) then
          Inc(Station.HalfSetB.P321.swGradYY, 1);
        if (Button = mbRight) and (Station.HalfSetB.P321.swGradYY > 1) then
          Dec(Station.HalfSetB.P321.swGradYY, 1);
      end;
    idP321C:
      begin
        if (Button = mbLeft) and (Station.P321C.swGradYY < 33) then
          Inc(Station.P321C.swGradYY, 1);
        if (Button = mbRight) and (Station.P321C.swGradYY > 1) then
          Dec(Station.P321C.swGradYY, 1);
      end;
  end;

  Reload;
  PaintDisplay;
end;

procedure TRackP321Form.imgMeasureButPositionUpClick(Sender: TObject);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        Station.HalfSetA.P321.butMeasure := butPositionDown;
      end;
    idP321B:
      begin
        Station.HalfSetB.P321.butMeasure := butPositionDown;
      end;
    idP321C:
      begin
        Station.P321C.butMeasure := butPositionDown;
      end;
  end;

  Reload;
end;

procedure TRackP321Form.imgSwGradGen1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.P321.swGradGen < 33) then
          Inc(Station.HalfSetA.P321.swGradGen, 1);
        if (Button = mbRight) and (Station.HalfSetA.P321.swGradGen > 1) then
          Dec(Station.HalfSetA.P321.swGradGen, 1);
      end;
    idP321B:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.P321.swGradGen < 33) then
          Inc(Station.HalfSetB.P321.swGradGen, 1);
        if (Button = mbRight) and (Station.HalfSetB.P321.swGradGen > 1) then
          Dec(Station.HalfSetB.P321.swGradGen, 1);
      end;
    idP321C:
      begin
        if (Button = mbLeft) and (Station.P321C.swGradGen < 33) then
          Inc(Station.P321C.swGradGen, 1);
        if (Button = mbRight) and (Station.P321C.swGradGen > 1) then
          Dec(Station.P321C.swGradGen, 1);
      end;
  end;

  Reload;
  PaintDisplay;
end;

procedure TRackP321Form.imgSwGradYYMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.P321.swGradYY < 33) then
          Inc(Station.HalfSetA.P321.swGradYY, 1);
        if (Button = mbRight) and (Station.HalfSetA.P321.swGradYY > 1) then
          Dec(Station.HalfSetA.P321.swGradYY, 1);
      end;
    idP321B:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.P321.swGradYY < 33) then
          Inc(Station.HalfSetB.P321.swGradYY, 1);
        if (Button = mbRight) and (Station.HalfSetB.P321.swGradYY > 1) then
          Dec(Station.HalfSetB.P321.swGradYY, 1);
      end;
    idP321C:
      begin
        if (Button = mbLeft) and (Station.P321C.swGradYY < 33) then
          Inc(Station.P321C.swGradYY, 1);
        if (Button = mbRight) and (Station.P321C.swGradYY > 1) then
          Dec(Station.P321C.swGradYY, 1);
      end;
  end;

  Reload;
  PaintDisplay;
end;

procedure TRackP321Form.P1_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.P321.swNepGen < 11) then
          Inc(Station.HalfSetA.P321.swNepGen, 1);
        if (Button = mbRight) and (Station.HalfSetA.P321.swNepGen > 1) then
          Dec(Station.HalfSetA.P321.swNepGen, 1);
      end;
    idP321B:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.P321.swNepGen < 11) then
          Inc(Station.HalfSetB.P321.swNepGen, 1);
        if (Button = mbRight) and (Station.HalfSetB.P321.swNepGen > 1) then
          Dec(Station.HalfSetB.P321.swNepGen, 1);
      end;
    idP321C:
      begin
        if (Button = mbLeft) and (Station.P321C.swNepGen < 11) then
          Inc(Station.P321C.swNepGen, 1);
        if (Button = mbRight) and (Station.P321C.swNepGen > 1) then
          Dec(Station.P321C.swNepGen, 1);
      end;
  end;

  PaintDisplay;
  ReloadHints;
  Reload;
end;

procedure TRackP321Form.P2_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.P321.swFrequency < 24) then
        begin
          Inc(Station.HalfSetA.P321.swFrequency, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetA.P321.swFrequency > 1) then
        begin
          Dec(Station.HalfSetA.P321.swFrequency, 1);
        end;
      end;
    idP321B:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.P321.swFrequency < 24) then
        begin
          Inc(Station.HalfSetB.P321.swFrequency, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetB.P321.swFrequency > 1) then
        begin
          Dec(Station.HalfSetB.P321.swFrequency, 1);
        end;
      end;
    idP321C:
      begin
        if (Button = mbLeft) and (Station.P321C.swFrequency < 24) then
        begin
          Inc(Station.P321C.swFrequency, 1);
        end;
        if (Button = mbRight) and (Station.P321C.swFrequency > 1) then
        begin
          Dec(Station.P321C.swFrequency, 1);
        end;
      end;
  end;

  ReloadHints;
  Reload;
  PaintDisplay;
end;

procedure TRackP321Form.P6_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.P321.swNepGenYY < 11) then
          Inc(Station.HalfSetA.P321.swNepGenYY, 1);
        if (Button = mbRight) and (Station.HalfSetA.P321.swNepGenYY > 1) then
          Dec(Station.HalfSetA.P321.swNepGenYY, 1);
      end;
    idP321B:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.P321.swNepGenYY < 11) then
          Inc(Station.HalfSetB.P321.swNepGenYY, 1);
        if (Button = mbRight) and (Station.HalfSetB.P321.swNepGenYY > 1) then
          Dec(Station.HalfSetB.P321.swNepGenYY, 1);
      end;
    idP321C:
      begin
        if (Button = mbLeft) and (Station.P321C.swNepGenYY < 11) then
          Inc(Station.P321C.swNepGenYY, 1);
        if (Button = mbRight) and (Station.P321C.swNepGenYY > 1) then
          Dec(Station.P321C.swNepGenYY, 1);
      end;
  end;

  ReloadHints;
  Reload;
  PaintDisplay;
end;

procedure TRackP321Form.imgBut600OhmButPositionDownClick(Sender: TObject);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        Station.HalfSetA.P321.but600Ohm := butPositionUp;
      end;
    idP321B:
      begin
        Station.HalfSetB.P321.but600Ohm := butPositionUp;
      end;
    idP321C:
      begin
        Station.P321C.but600Ohm := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRackP321Form.imgBut600OhmButPositionUpClick(Sender: TObject);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        Station.HalfSetA.P321.but600Ohm := butPositionDown;
      end;
    idP321B:
      begin
        Station.HalfSetB.P321.but600Ohm := butPositionDown;
      end;
    idP321C:
      begin
        Station.P321C.but600Ohm := butPositionDown;
      end;
  end;

  Reload;
end;

procedure TRackP321Form.imgButMeasureButPositionDownClick(Sender: TObject);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        Station.HalfSetA.P321.butMeasure := butPositionUp;
      end;
    idP321B:
      begin
        Station.HalfSetB.P321.butMeasure := butPositionUp;
      end;
    idP321C:
      begin
        Station.P321C.butMeasure := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRackP321Form.imgButPowerPositionDownClick(Sender: TObject);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        Station.HalfSetA.P321.butPower := butPositionUp;
      end;
    idP321B:
      begin
        Station.HalfSetB.P321.butPower := butPositionUp;
      end;
    idP321C:
      begin
        Station.P321C.butPower := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRackP321Form.imgButPowerPositionUpClick(Sender: TObject);
var
  TmpCurFormId: Byte;
begin
  TmpCurFormId := CurFormId;
  if P321FreeCall then
    TmpCurFormId := idP321C;
  case TmpCurFormId of
    idP321A:
      begin
        Station.HalfSetA.P321.butPower := butPositionDown;
      end;
    idP321B:
      begin
        Station.HalfSetB.P321.butPower := butPositionDown;
      end;
    idP321C:
      begin
        Station.P321C.butPower := butPositionDown;
      end;
  end;

  Reload;
end;

end.
