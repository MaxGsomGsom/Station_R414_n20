unit uBlockLittleNoisyAmplifierForm;

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
  pngimage,
  ExtCtrls,
  StdCtrls,
  uAdditionalFormMethods,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm;

type
  TBlockLittleNoisyAmplifierForm = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label1: TLabel;
    imgNet: TImage;
    imgMain: TImage;
    imgReserve: TImage;
    imgNet2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Reload;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;


var
  //BlockLittleNoisyAmplifierForm: TBlockLittleNoisyAmplifierForm;
  CurFormId1: Integer;
  Station: TStation;
  ButtonBackForm: TButtonBackForm;
  TaskController: TTaskController;
  const
  idMshuA=1;
  idMshuB=2;
   end;

implementation

uses
  uStationR414Form,
  uDefinitionsDM,
  uEducationForm,
  uReportForm,
  uMainMenuForm,
  uConstantsDM;

{$R *.dfm}

constructor TBlockLittleNoisyAmplifierForm.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);

  CurFormId1:=Half;
  if (Half=1) then begin Self.Caption:='МШУ А'; end
  else Self.Caption:='МШУ Б';
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;


procedure TBlockLittleNoisyAmplifierForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReturnFromRack;
end;

procedure TBlockLittleNoisyAmplifierForm.Reload;
begin
  case CurFormId1 of
    idMshuA:
      begin
        if station.HalfSetA.LittleNoisyAmplifier.butNet = butPositionDown then
        begin
          Image5.Visible:=false;
          Image4.Visible:=true;
          imgNet.Visible := False;
        end
        else
        begin
          imgNet.Visible := Boolean(Station.PowerPanel.swNet = 1);
          Image4.Visible:=false;
          Image5.Visible:=true;
        end;
        imgNet.Invalidate;

        if station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionUp then
        begin
          imgNet2.Visible := Boolean(Station.PowerPanel.swNet = 1);
          Image6.Visible:=false;
          Image7.Visible:=true;
        end
        else
        begin
          Image7.Visible:=false;
          Image6.Visible:=true;
          imgNet2.Visible := False;
        end;
        imgNet2.Invalidate;

        if Station.HalfSetA.LittleNoisyAmplifier.butMshu = butMain then
        begin
          Image9.Visible:=false;
          Image8.Visible:=true;
        end
        else
        begin
          Image8.Visible:=false;
          Image9.Visible:=true;
        end;

        if Station.IsPluggedIn then
        begin
          if (Station.HalfSetA.LittleNoisyAmplifier.butNet = butPositionDown) and (Station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionUp) then
          begin
            imgReserve.Visible := True;
            imgMain.Visible := False;
          end
          else
            if (Station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionDown) and (Station.HalfSetA.LittleNoisyAmplifier.butNet = butPositionUp) then
            begin
              imgReserve.Visible := False;
              imgMain.Visible := True;
            end
            else
            if (Station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionUp) and (Station.HalfSetA.LittleNoisyAmplifier.butNet = butPositionUp) then
            begin
              if Station.HalfSetA.LittleNoisyAmplifier.butMshu = butPositionLeft then
              begin
                imgMain.Visible := True;
                imgReserve.Visible := False;
              end
              else
              begin
                imgReserve.Visible := True;
                imgMain.Visible := False;
              end;
            end
            else
            if (Station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionDown) and (Station.HalfSetA.LittleNoisyAmplifier.butNet = butPositionDown) then
            begin
              imgMain.Visible := Boolean(Station.HalfSetA.LittleNoisyAmplifier.butMshu = butPositionLeft);
              imgReserve.Visible := Boolean(Station.HalfSetA.LittleNoisyAmplifier.butMshu = butPositionRight);
            end;
        end
        else
        begin
          imgReserve.Visible := False;
          imgMain.Visible := False;
        end;
        imgReserve.Invalidate;
        imgMain.Invalidate;

        label1.Caption:= IntToStr(Station.HalfSetA.LittleNoisyAmplifier.swWave);
      end;

    idMshuB:
      begin
        if station.HalfSetB.LittleNoisyAmplifier.butNet = butPositionDown then
        begin
          Image5.Visible:=false;
          Image4.Visible:=true;
          imgNet.Visible := False;
        end
        else
        begin
          imgNet.Visible := Boolean(Station.PowerPanel.swNet = 1);
          Image4.Visible:=false;
          Image5.Visible:=true;
        end;
        imgNet.Invalidate;

        if station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionUp then
        begin
          imgNet2.Visible := Boolean(Station.PowerPanel.swNet = 1);
          Image6.Visible:=false;
          Image7.Visible:=true;
        end
        else
        begin
          Image7.Visible:=false;
          Image6.Visible:=true;
          imgNet2.Visible := False;
        end;
        imgNet2.Invalidate;

        if Station.HalfSetB.LittleNoisyAmplifier.butMshu = butMain then
        begin
          Image9.Visible:=false;
          Image8.Visible:=true;
        end
        else
        begin
          Image8.Visible:=false;
          Image9.Visible:=true;
        end;

        if Station.IsPluggedIn then
        begin
          if (Station.HalfSetB.LittleNoisyAmplifier.butNet = butPositionDown) and (Station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionUp) then
          begin
            imgReserve.Visible := True;
            imgMain.Visible := False;
          end
          else
            if (Station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionDown) and (Station.HalfSetB.LittleNoisyAmplifier.butNet = butPositionUp) then
            begin
              imgReserve.Visible := False;
              imgMain.Visible := True;
            end
            else
            if (Station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionUp) and (Station.HalfSetB.LittleNoisyAmplifier.butNet = butPositionUp) then
            begin
              if Station.HalfSetB.LittleNoisyAmplifier.butMshu = butPositionLeft then
              begin
                imgMain.Visible := True;
                imgReserve.Visible := False;
              end
              else
              begin
                imgReserve.Visible := True;
                imgMain.Visible := False;
              end;
            end
            else
            if (Station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionDown) and (Station.HalfSetB.LittleNoisyAmplifier.butNet = butPositionDown) then
            begin
              imgMain.Visible := Boolean(Station.HalfSetB.LittleNoisyAmplifier.butMshu = butPositionLeft);
              imgReserve.Visible := Boolean(Station.HalfSetB.LittleNoisyAmplifier.butMshu = butPositionRight);
            end;
        end
        else
        begin
          imgReserve.Visible := False;
          imgMain.Visible := False;
        end;
        imgReserve.Invalidate;
        imgMain.Invalidate;

        label1.Caption:= IntToStr(Station.HalfSetB.LittleNoisyAmplifier.swWave);
      end;
  end;
end;

procedure TBlockLittleNoisyAmplifierForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TaskController.CheckFormBeforeClosing(CanClose);
end;

procedure TBlockLittleNoisyAmplifierForm.FormCreate(Sender: TObject);
begin
  MoveFormInScreenCenter(Self);
end;

procedure TBlockLittleNoisyAmplifierForm.FormKeyPress(Sender: TObject; var Key: Char);
var StationR414FormminiHWND : HWND;
begin
  if Ord(Key) = 27 then
  begin
    //Инициация события "Закрытие окна стойки"
    StationR414FormminiHWND := FindWindow(StationR414FormminiClassName, StationR414FormminiObjectName);
    PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  end;
end;

procedure TBlockLittleNoisyAmplifierForm.FormShow(Sender: TObject);
begin
  Reload;
end;

procedure TBlockLittleNoisyAmplifierForm.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId1 of
    idMshuA:
      begin
        if (button=mbLeft)and(Station.HalfSetA.LittleNoisyAmplifier.swWave < MAX_WAVE_VALUE) then
        begin
          inc(Station.HalfSetA.LittleNoisyAmplifier.swWave);
          label1.Caption:=inttostr(Station.HalfSetA.LittleNoisyAmplifier.swWave);
          Image2.Hide;
          Image3.Show;
        end;
        if (button=mbRight)and(Station.HalfSetA.LittleNoisyAmplifier.swWave>MIN_WAVE_VALUE) then
        begin
          dec(Station.HalfSetA.LittleNoisyAmplifier.swWave);
          label1.Caption:=inttostr(Station.HalfSetA.LittleNoisyAmplifier.swWave);
          Image2.Hide;
          Image3.Show;
        end;
      end;

    idMshuB:
      begin
        if (button=mbLeft)and(Station.HalfSetB.LittleNoisyAmplifier.swWave < MAX_WAVE_VALUE) then
        begin
          inc(Station.HalfSetB.LittleNoisyAmplifier.swWave);
          label1.Caption:=inttostr(Station.HalfSetB.LittleNoisyAmplifier.swWave);
          Image2.Hide;
          Image3.Show;
        end;
        if (button=mbRight)and(Station.HalfSetB.LittleNoisyAmplifier.swWave>MIN_WAVE_VALUE) then
        begin
          dec(Station.HalfSetB.LittleNoisyAmplifier.swWave);
          label1.Caption:=inttostr(Station.HalfSetB.LittleNoisyAmplifier.swWave);
          Image2.Hide;
          Image3.Show;
        end;
      end;
  end;

  Reload;
end;

procedure TBlockLittleNoisyAmplifierForm.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  strDigit: string;
  btDigit: Byte;
begin
  //ChangeEvent;

  case CurFormId1 of
    idMshuA:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetA.LittleNoisyAmplifier.swWave := btDigit;
            Image3.OnMouseUp(TImage.Create(self), mbLeft, [], 0,0);
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;
        if (button=mbLeft)and(Station.HalfSetA.LittleNoisyAmplifier.swWave<MAX_WAVE_VALUE) then
        begin
          inc(Station.HalfSetA.LittleNoisyAmplifier.swWave);
          label1.Caption:=inttostr(Station.HalfSetA.LittleNoisyAmplifier.swWave);
          Image3.Hide;
          Image2.Show;
        end;
        if (button=mbRight)and(Station.HalfSetA.LittleNoisyAmplifier.swWave>MIN_WAVE_VALUE) then
        begin
          dec(Station.HalfSetA.LittleNoisyAmplifier.swWave);
          label1.Caption:=inttostr(Station.HalfSetA.LittleNoisyAmplifier.swWave);
          Image3.Hide;
          Image2.Show;
        end;
      end;

    idMshuB:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetB.LittleNoisyAmplifier.swWave := btDigit;
            Image3.OnMouseUp(TImage.Create(self), mbLeft, [], 0,0);
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;
        if (button=mbLeft)and(Station.HalfSetB.LittleNoisyAmplifier.swWave<MAX_WAVE_VALUE) then
        begin
          inc(Station.HalfSetB.LittleNoisyAmplifier.swWave);
          label1.Caption:=inttostr(Station.HalfSetB.LittleNoisyAmplifier.swWave);
          Image3.Hide;
          Image2.Show;
        end;
        if (button=mbRight)and(Station.HalfSetB.LittleNoisyAmplifier.swWave>MIN_WAVE_VALUE) then
        begin
          dec(Station.HalfSetB.LittleNoisyAmplifier.swWave);
          label1.Caption:=inttostr(Station.HalfSetB.LittleNoisyAmplifier.swWave);
          Image3.Hide;
          Image2.Show;
        end;
      end;
  end;

  Reload;
end;

procedure TBlockLittleNoisyAmplifierForm.Image4Click(Sender: TObject);
begin
  //ChangeEvent;

  case CurFormId1 of
    idMshuA:
      Station.HalfSetA.LittleNoisyAmplifier.butNet := butPositionUp;
    idMshuB:
      Station.HalfSetB.LittleNoisyAmplifier.butNet := butPositionUp;
  end;

  Reload;
end;

procedure TBlockLittleNoisyAmplifierForm.Image5Click(Sender: TObject);
begin
  //ChangeEvent;

  case CurFormId1 of
    idMshuA:
      Station.HalfSetA.LittleNoisyAmplifier.butNet := butPositionDown;
    idMshuB:
      Station.HalfSetB.LittleNoisyAmplifier.butNet := butPositionDown;
  end;

  Reload;
end;

procedure TBlockLittleNoisyAmplifierForm.Image6Click(Sender: TObject);
begin
  //ChangeEvent;

  case CurFormId1 of
    idMshuA:
      Station.HalfSetA.LittleNoisyAmplifier.butNet2 := butPositionUp;
    idMshuB:
      Station.HalfSetB.LittleNoisyAmplifier.butNet2 := butPositionUp;
  end;

  Reload;
end;

procedure TBlockLittleNoisyAmplifierForm.Image7Click(Sender: TObject);
begin
  //ChangeEvent;

  case CurFormId1 of
    idMshuA:
      Station.HalfSetA.LittleNoisyAmplifier.butNet2 := butPositionDown;

    idMshuB:
      Station.HalfSetB.LittleNoisyAmplifier.butNet2 := butPositionDown;
  end;

  Reload;
end;

procedure TBlockLittleNoisyAmplifierForm.Image8Click(Sender: TObject);
begin
  //ChangeEvent;

  case CurFormId1 of
    idMshuA:
      Station.HalfSetA.LittleNoisyAmplifier.butMshu := butReserve;
    idMshuB:
      Station.HalfSetB.LittleNoisyAmplifier.butMshu := butReserve;
  end;

  Reload;
end;

procedure TBlockLittleNoisyAmplifierForm.Image9Click(Sender: TObject);
begin
  ////ChangeEvent;

  case CurFormId1 of
    idMshuA:
      Station.HalfSetA.LittleNoisyAmplifier.butMshu := butMain;

    idMshuB:
      Station.HalfSetB.LittleNoisyAmplifier.butMshu := butMain;
  end;

  Reload;
end;

{$REGION 'Прокрутка изображения стойки колесом мыши'}
procedure TBlockLittleNoisyAmplifierForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
                                    MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TBlockLittleNoisyAmplifierForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
                                    MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;
{$ENDREGION}

end.
