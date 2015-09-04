unit uRack1920Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ImgList, StdCtrls, pngimage, uAdditionalFormMethods, uStationStateDM, uTaskControllerDM,
  uButtonBackForm;

type
  TRack1920Form = class(TForm)
    imgBG: TImage;
    imgHignOnClicked: TImage;
    imgHighOn: TImage;
    imgCurrent5MAClicked: TImage;
    imgZamedlSys1: TImage;
    imgZamedlSys2: TImage;
    imgZamedlSys3: TImage;
    imgZamedlSys4: TImage;
    imgNaprAnod2KV1: TImage;
    imgNaprAnod2KV2: TImage;
    imgNaprAnod2KV3: TImage;
    imgCollectorScope1: TImage;
    imgCollectorScope2: TImage;
    imgCollectorScope3: TImage;
    imgCollectorScope4: TImage;
    imgNetOn: TImage;
    imgNet: TImage;
    imgWarningLight: TImage;
    img1920Net: TImage;
    imgSlowSystemAnod: TImage;
    imgCollector: TImage;
    img1920NetMain: TImage;
    imgWarningLight2: TImage;
    img1920Net2: TImage;
    imgSlowSystemAnod2: TImage;
    imgCollector2: TImage;
    img1920NetMain2: TImage;
    imgHighOffClicked: TImage;
    imgHighOff: TImage;
    Panel1,
    pnlLBV1: TPanel;
    imgBG_LBV2: TImage;
    imgHighOn2Clicked: TImage;
    imgHighOn2: TImage;
    imgCurrent5MA2Clicked: TImage;
    imgCurrent5MA2: TImage;
    imgZamedlSys1_1: TImage;
    imgZamedlSys1_2: TImage;
    imgZamedlSys1_3: TImage;
    imgZamedlSys1_4: TImage;
    imgNaprAnodKV1: TImage;
    imgNaprAnodKV2: TImage;
    imgNaprAnodKV3: TImage;
    imgCollectorScope1_1: TImage;
    imgCollectorScope1_2: TImage;
    imgCollectorScope1_3: TImage;
    imgCollectorScope1_4: TImage;
    imgNetOn2: TImage;
    imgNet2: TImage;
    imgHighOff2Clicked: TImage;
    imgHighOff2: TImage;
    pnlFooter: TPanel;
    Image26: TImage;
    ImageList1: TImageList;
    img1910: TImage;
    img1910_2: TImage;
    ImageList2: TImageList;
    img1930: TImage;
    img1960_1: TImage;
    Image31: TImage;
    Image36: TImage;
    Label6: TLabel;
    Image34: TImage;
    Image32: TImage;
    Image35: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image37: TImage;
    Label3: TLabel;
    Image38: TImage;
    Label4: TLabel;
    Image39: TImage;
    Label5: TLabel;
    Image40: TImage;
    Label7: TLabel;
    Image33: TImage;
    Label8: TLabel;
    imgCurrent5MA: TImage;
    img1910ALight: TImage;
    img1910Light: TImage;
    img1930Light: TImage;
    img1360_1Light: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure img1960_1Click(Sender: TObject);
    procedure img1930Click(Sender: TObject);
    procedure img1910_2Click(Sender: TObject);
    procedure img1910Click(Sender: TObject);
    procedure imgNetClick(Sender: TObject);
    procedure imgNet2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Reload;
    procedure imgHighOnClick(Sender: TObject);
    procedure imgCurrent5MAClick(Sender: TObject);

    procedure Current5MAGiven_LBV1(Delay: Boolean = True);
    procedure Current5MAGiven_LBV2(Delay: Boolean = True);
    procedure TurnOffLBV1(Delay: Boolean = True);
    procedure TurnOffLBV2(Delay: Boolean = True);
    procedure Current5MANotGiven_LBV1(Delay: Boolean = True);
    procedure Current5MANotGiven_LBV2(Delay: Boolean = True);
    procedure TurnOnLBV1(Delay: Boolean = True);
    procedure TurnOnLBV2(Delay: Boolean = True);

    procedure imgHighOffClick(Sender: TObject);
    procedure imgHighOffClickedClick(Sender: TObject);
    procedure imgCurrent5MAClickedClick(Sender: TObject);
    procedure imgHighOn2Click(Sender: TObject);
    procedure imgHighOff2Click(Sender: TObject);
    procedure imgHighOff2ClickedClick(Sender: TObject);
    procedure imgCurrent5MA2Click(Sender: TObject);
    procedure imgCurrent5MA2ClickedClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    bmp: tbitmap;
    constructor Create(AOwner: TComponent; Half: Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;



var
  CurFormId: Integer;
  Station: TStation;
  TaskController: TTaskController;
  ButtonBackForm: TButtonBackForm;


  const
  idRack1920A=1;
  idRack1920B=2;

  end;

implementation

uses
  uStationR414Form,
  uDefinitionsDM,
  uEducationForm,
  uRack1500Form,
  uConstantsDM;

{$R *.dfm}




constructor TRack1920Form.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  //idRack1920A:=1;
  //idRack1920B:=2;
  CurFormId:=Half;
  if (Half=1) then begin Self.Caption:='1920 А'; end
  else Self.Caption:='1920 Б';
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;


procedure TRack1920Form.imgNetClick(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      begin  
        if Station.WorkMode = mdPowerOn then
        begin
          if (Station.HalfSetA.Rack1920.but1930 = butPositionDown) or
          (Station.HalfSetA.Rack1920.but1910 = butPositionDown) or
          (Station.HalfSetA.Rack1920.but1910A = butPositionDown) or
          (Station.HalfSetA.Rack1920.butPower2 = butPositionDown) then
          begin
            TaskController.AddError(CurFormId, 'Сперва необходимо настроить предыдущие блоки');
            if Station.WorkType = wtLearn then
            begin
              Application.MessageBox('Сперва необходимо настроить предыдущие блоки',
              PChar(PName), MB_OK + MB_ICONINFORMATION);
              Exit;
            end;
          end;
        end;

        if Station.HalfSetA.Rack1920.butPower = butPositionDown then
        begin
          Station.HalfSetA.Rack1920.butPower := butPositionUp;
        end
        else
        begin
          Station.HalfSetA.Rack1920.butPower := butPositionDown;
          if Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 then
            Current5MANotGiven_LBV1;
          if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn) then
            TurnOffLBV1;
          Station.HalfSetA.Rack1920.butHighOn := butPositionUp;
          Station.HalfSetA.Rack1920.butHighOff := butPositionDown;
        end;
      end;
    idRack1920B:
      begin
          if Station.WorkMode = mdPowerOn then
          begin
            if (Station.HalfSetB.Rack1920.but1930 = butPositionDown) or
            (Station.HalfSetB.Rack1920.but1910 = butPositionDown) or
            (Station.HalfSetB.Rack1920.but1910A = butPositionDown) or
            (Station.HalfSetB.Rack1920.butPower2 = butPositionDown) then
            begin
              TaskController.AddError(CurFormId, 'Сперва необходимо настроить предыдущие блоки');
              if Station.WorkType = wtLearn then
              begin
                Application.MessageBox('Сперва необходимо настроить предыдущие блоки',
                PChar(PName), MB_OK + MB_ICONINFORMATION);
                Exit;
              end;
            end;
          end;

          if Station.HalfSetB.Rack1920.butPower = butPositionDown then
          begin
            Station.HalfSetB.Rack1920.butPower := butPositionUp;
          end
          else
          begin
            Station.HalfSetB.Rack1920.butPower := butPositionDown;
            if Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 then
              Current5MANotGiven_LBV1;    
            if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn) then
              TurnOffLBV1;
            Station.HalfSetB.Rack1920.butHighOn := butPositionUp;
            Station.HalfSetB.Rack1920.butHighOff := butPositionDown;
          end;      
      end;
  end;

  Reload;
end;

procedure TRack1920Form.imgNet2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      begin
        if Station.WorkMode = mdPowerOn then
        begin
          if (Station.HalfSetA.Rack1920.but1930 = butPositionDown) or
          (Station.HalfSetA.Rack1920.but1910 = butPositionDown) or
          (Station.HalfSetA.Rack1920.but1910A = butPositionDown) then
          begin
            TaskController.AddError(CurFormId, 'Сперва необходимо настроить предыдущие блоки');
            if Station.WorkType = wtLearn then
            begin
              Application.MessageBox('Сперва необходимо настроить предыдущие блоки',
              PChar(PName), MB_OK + MB_ICONINFORMATION);
              Exit;
            end;
          end;
        end;

        if Station.HalfSetA.Rack1920.butPower2 = butPositionDown then
        begin
          Station.HalfSetA.Rack1920.butPower2 := butPositionUp;
        end
        else
        begin
          Station.HalfSetA.Rack1920.butPower2 := butPositionDown;
          if Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 then
            Current5MANotGiven_LBV2;
          if (Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
            TurnOffLBV2;
          Station.HalfSetA.Rack1920.butHighOn := butPositionUp;
          Station.HalfSetA.Rack1920.butHighOff := butPositionDown;
        end;
      end;

    idRack1920B:
      begin
        if Station.WorkMode = mdPowerOn then
        begin
          if (Station.HalfSetB.Rack1920.but1930 = butPositionDown) or
          (Station.HalfSetB.Rack1920.but1910 = butPositionDown) or
          (Station.HalfSetB.Rack1920.but1910A = butPositionDown) then
          begin
            TaskController.AddError(CurFormId, 'Сперва необходимо настроить предыдущие блоки');
            if Station.WorkType = wtLearn then
            begin
              Application.MessageBox('Сперва необходимо настроить предыдущие блоки',
              PChar(PName), MB_OK + MB_ICONINFORMATION);
              Exit;
            end;
          end;
        end;

        if Station.HalfSetB.Rack1920.butPower2 = butPositionDown then
        begin
          Station.HalfSetB.Rack1920.butPower2 := butPositionUp;
        end
        else
        begin
          Station.HalfSetB.Rack1920.butPower2 := butPositionDown;
          if Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 then
            Current5MANotGiven_LBV2;
          if (Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
            TurnOffLBV2;
          Station.HalfSetB.Rack1920.butHighOn := butPositionUp;
          Station.HalfSetB.Rack1920.butHighOff := butPositionDown;
        end;
      end;
  end;

  Reload;
end;

procedure TRack1920Form.img1910Click(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      begin
        if Station.WorkMode = mdPowerOn then
        begin
          if Station.HalfSetA.Rack1920.but1930 = butPositionDown then
          begin
            TaskController.AddError(CurFormId, 'Сперва необходимо настроить предыдущий блок');
            if Station.WorkType = wtLearn then
            begin
              Application.MessageBox('Сперва необходимо настроить предыдущий блок',
              PChar(PName), MB_OK + MB_ICONINFORMATION);
              Exit;
            end;
          end;
        end;

        if Station.HalfSetA.Rack1920.but1910 = butPositionDown then
        begin
          Station.HalfSetA.Rack1920.but1910 := butPositionUp;
        end
        else
        begin
          Station.HalfSetA.Rack1920.but1910 := butPositionDown;
        end;
      end;
    idRack1920B:
      begin
        if Station.WorkMode = mdPowerOn then
        begin
          if Station.HalfSetB.Rack1920.but1930 = butPositionDown then
          begin
            TaskController.AddError(CurFormId, 'Сперва необходимо настроить предыдущий блок');
            if Station.WorkType = wtLearn then
            begin
              Application.MessageBox('Сперва необходимо настроить предыдущий блок',
              PChar(PName), MB_OK + MB_ICONINFORMATION);
              Exit;
            end;
          end;
        end;

        if Station.HalfSetB.Rack1920.but1910 = butPositionDown then
        begin
          Station.HalfSetB.Rack1920.but1910 := butPositionUp;
        end
        else
        begin
          Station.HalfSetB.Rack1920.but1910 := butPositionDown;
        end;
      end;
  end;

  Reload;
end;

procedure TRack1920Form.img1910_2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      begin
        if Station.WorkMode = mdPowerOn then
        begin
          if (Station.HalfSetA.Rack1920.but1930 = butPositionDown) or
          (Station.HalfSetA.Rack1920.but1910 = butPositionDown) then
          begin
            TaskController.AddError(CurFormId, 'Сперва необходимо настроить предыдущие блоки');
            if Station.WorkType = wtLearn then
            begin
              Application.MessageBox('Сперва необходимо настроить предыдущие блоки',
              PChar(PName), MB_OK + MB_ICONINFORMATION);
              Exit;
            end;
          end;
        end;

        if Station.HalfSetA.Rack1920.but1910A = butPositionDown then
        begin
          Station.HalfSetA.Rack1920.but1910A := butPositionUp;
        end
        else
        begin
          Station.HalfSetA.Rack1920.but1910A := butPositionDown;
        end;
      end;
    idRack1920B:
      begin
        if Station.WorkMode = mdPowerOn then
        begin
          if (Station.HalfSetB.Rack1920.but1930 = butPositionDown) or
          (Station.HalfSetB.Rack1920.but1910 = butPositionDown) then
          begin
            TaskController.AddError(CurFormId, 'Сперва необходимо настроить предыдущие блоки');
            if Station.WorkType = wtLearn then
            begin
              Application.MessageBox('Сперва необходимо настроить предыдущие блоки',
              PChar(PName), MB_OK + MB_ICONINFORMATION);
              Exit;
            end;
          end;
        end;

        if Station.HalfSetB.Rack1920.but1910A = butPositionDown then
        begin
          Station.HalfSetB.Rack1920.but1910A := butPositionUp;
        end
        else
        begin
          Station.HalfSetB.Rack1920.but1910A := butPositionDown;
        end;
      end;
  end;

  Reload;
end;

procedure TRack1920Form.img1930Click(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      begin
        if Station.HalfSetA.Rack1920.but1930 = butPositionDown then
        begin
          Station.HalfSetA.Rack1920.but1930 := butPositionUp;
        end
        else
        begin
          Station.HalfSetA.Rack1920.but1930 := butPositionDown;
        end;
      end;
    idRack1920B:
      begin
        if Station.HalfSetB.Rack1920.but1930 = butPositionDown then
        begin
          Station.HalfSetB.Rack1920.but1930 := butPositionUp;
        end
        else
        begin
          Station.HalfSetB.Rack1920.but1930 := butPositionDown;
        end;
      end;
  end;

  Reload;
end;

procedure TRack1920Form.Reload;
begin
  case CurFormId of
    idRack1920A:
      begin
        //------------------------Световые индикаторы активности блоков-----------------------
        if (Station.PowerPanel.swNet = 1) and (Station.PowerPanel.sw1900Power = 1) then
        begin
          img1910Light.Visible := Boolean(Station.HalfSetA.Rack1920.but1910 = butPositionUp);
          img1910ALight.Visible := Boolean(Station.HalfSetA.Rack1920.but1910A = butPositionUp);
          img1930Light.Visible := Boolean(Station.HalfSetA.Rack1920.but1930 = butPositionUp);
          img1360_1Light.Visible := Boolean(Station.HalfSetA.Rack1920.but1960_1 = butPositionUp);

          if Station.HalfSetA.Rack1920.butPower = butPositionUp then
          begin
            if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn) then
            begin
              TurnOnLBV1(False);
              Current5MAGiven_LBV1(False);
            end;
          end
          else
          begin
            TurnOffLBV1(False);
            Current5MANotGiven_LBV1(False);
          end;

          if Station.HalfSetA.Rack1920.butPower2 = butPositionUp then
          begin
            if (Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
            begin
              TurnOnLBV2(False);
              Current5MAGiven_LBV2(False);
            end;
          end
          else
          begin
            TurnOffLBV2(False);
            Current5MANotGiven_LBV2(False);
          end;
        end
        else
        begin
          if not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn) then
          begin
            img1910Light.Visible := False;
            img1910ALight.Visible := False;
            img1930Light.Visible := False;
            img1360_1Light.Visible := False;
            TurnOffLBV1(False);
            Current5MANotGiven_LBV1(False);
            TurnOffLBV2(False);
            Current5MANotGiven_LBV2(False);
          end;
        end;
        //------------------------------------------------------------------------------------
        ImageList2.GetBitmap(NotByte(Station.HalfSetA.Rack1920.but1930), img1930.Picture.Bitmap);
        img1930.Invalidate;

        ImageList1.GetBitmap(NotByte(Station.HalfSetA.Rack1920.but1910A), img1910_2.Picture.Bitmap);
        img1910_2.Invalidate;

        //If Station.HalfSetA.Rack1920.but1930=0 then begin
        ImageList1.GetBitmap(NotByte(Station.HalfSetA.Rack1920.but1910), img1910.Picture.Bitmap);
        img1910.Invalidate;

        imgNetOn2.Visible := Boolean(Station.HalfSetA.Rack1920.butPower2 = butPositionUp);
        imgNetOn.Visible := Boolean(Station.HalfSetA.Rack1920.butPower = butPositionUp);

        ImageList2.GetBitmap(NotByte(Station.HalfSetA.Rack1920.but1960_1), img1960_1.Picture.Bitmap);
        img1960_1.Invalidate;

        imgHighOn.Visible := Boolean(station.HalfSetA.Rack1920.butHighOn = butPositionUp);
        imgHignOnClicked.Visible := Boolean(station.HalfSetA.Rack1920.butHighOn = butPositionDown);
        imgHighOn2.Visible := Boolean(station.HalfSetA.Rack1920.butHighOn2 = butPositionUp);
        imgHighOn2Clicked.Visible := Boolean(station.HalfSetA.Rack1920.butHighOn2 = butPositionDown);

        imgHighOff.Visible := Boolean(station.HalfSetA.Rack1920.butHighOff = butPositionUp);
        if imgHighOff.Visible then
          imgHighOff.BringToFront;
        imgHighOffClicked.Visible := Boolean(station.HalfSetA.Rack1920.butHighOff = butPositionDown);
        if imgHighOffClicked.Visible then
          imgHighOffClicked.BringToFront;

        imgHighOff2.Visible := Boolean(station.HalfSetA.Rack1920.butHighOff2 = butPositionUp);
        if imgHighOff2.Visible then
          imgHighOff2.BringToFront;
        imgHighOff2Clicked.Visible := Boolean(station.HalfSetA.Rack1920.butHighOff2 = butPositionDown);
        if imgHighOff2Clicked.Visible then
          imgHighOff2Clicked.BringToFront;

        if (TaskController.NetWorker.ClientState.WorkMode = wmLearning) then
        begin
          Image35.Visible := Boolean(Station.HalfSetA.Rack1920.but1930 = butPositionDown);
          Label2.Visible := Boolean(Station.HalfSetA.Rack1920.but1930 = butPositionDown);
          image37.Visible := Boolean(Station.HalfSetA.Rack1920.but1910 = butPositionDown);
          label3.Visible := Boolean(Station.HalfSetA.Rack1920.but1910 = butPositionDown);
          image38.Visible := Boolean(Station.HalfSetA.Rack1920.but1910A = butPositionDown);
          label4.Visible := Boolean(Station.HalfSetA.Rack1920.but1910A = butPositionDown);
          image39.Visible:= Boolean(Station.HalfSetA.Rack1920.butPower2 = butPositionDown);
          label5.Visible:= Boolean(Station.HalfSetA.Rack1920.butPower2 = butPositionDown);
          image40.Visible := Boolean(Station.HalfSetA.Rack1920.butPower = butPositionDown);
          label7.Visible := Boolean(Station.HalfSetA.Rack1920.butPower = butPositionDown);
          image33.Visible := Boolean(Station.HalfSetA.Rack1920.but1960_1 = butPositionDown);
          label8.Visible := Boolean(Station.HalfSetA.Rack1920.but1960_1 = butPositionDown);
        end
        else
        begin
          Image35.Visible := False;
          Label2.Visible := False;
          image37.Visible := False;
          label3.Visible := False;
          image38.Visible := False;
          label4.Visible := False;
          image39.Visible:= False;
          label5.Visible:= False;
          image40.Visible := False;
          label7.Visible := False;
          image33.Visible := False;
          label8.Visible := False;
        end;

        if Station.IsPluggedIn then
        begin          
          if Station.PowerPanel.sw1900Power = 1 then
          begin
            imgWarningLight.Visible := not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn);
            img1920Net.Visible := Boolean(Station.HalfSetA.Rack1920.butPower = butPositionUp);
            imgSlowSystemAnod.Visible := Station.HalfSetA.Rack1920.stLBV1_TurnedOn; //Boolean(Station.HalfSetA.Rack1920.butPower = butPositionUp);
            imgCollector.Visible := Station.HalfSetA.Rack1920.stLBV1_TurnedOn; //Boolean(Station.HalfSetA.Rack1920.butPower = butPositionUp);
            img1920NetMain.Visible := Boolean(Station.HalfSetA.Rack1920.butPower = butPositionUp);

            if (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1)
              and (not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn)) then
            begin
              TurnOnLBV1(False);
            end;
            if (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1)
              and (Station.HalfSetA.Rack1920.stLBV1_TurnedOn) then
            begin
              TurnOnLBV1(False);
              Current5MAGiven_LBV1(False);
            end;
            if not(Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1) then
            begin
              TurnOffLBV1(False);
              Current5MANotGiven_LBV1(False);
            end;
          end
          else
          begin
            img1920Net.Visible := False;
            img1920NetMain.Visible := False;
            imgWarningLight.Visible := False;
            imgSlowSystemAnod.Visible := False;
            imgCollector.Visible := False;
          end;

          if Station.PowerPanel.sw1900Power = 1 then
          begin
            imgWarningLight2.Visible := not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn);
            img1920Net2.Visible :=
              Boolean(Station.HalfSetA.Rack1920.butPower2 = butPositionUp);
            imgSlowSystemAnod2.Visible :=
              Station.HalfSetA.Rack1920.stLBV2_TurnedOn; //Boolean(Station.HalfSetA.Rack1920.butPower2 = butPositionUp);
            imgCollector2.Visible :=
              Station.HalfSetA.Rack1920.stLBV2_TurnedOn; //Boolean(Station.HalfSetA.Rack1920.butPower2 = butPositionUp);
            img1920NetMain2.Visible :=
              Boolean(Station.HalfSetA.Rack1920.butPower2 = butPositionUp);

            if (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2)
              and (not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn)) then
            begin
              TurnOnLBV2(False);
            end;
            if (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2)
              and (Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
            begin
              TurnOnLBV2(False);
              Current5MAGiven_LBV2(False);
            end;
            if not(Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2) then
            begin
              TurnOffLBV2(False);
              Current5MANotGiven_LBV2(False);
            end;
          end
          else
          begin
            img1920Net2.Visible := False;
            img1920NetMain2.Visible := False;
            imgWarningLight2.Visible := False;
            imgSlowSystemAnod2.Visible := False;
            imgCollector2.Visible := False;
          end;
        end
        else
        begin
          imgWarningLight2.Visible := False;
          img1920Net2.Visible := False;
          imgSlowSystemAnod2.Visible := False;
          imgCollector2.Visible := False;
          img1920NetMain2.Visible := False;

          imgWarningLight.Visible := False;
          img1920Net.Visible := False;
          imgSlowSystemAnod.Visible := False;
          imgCollector.Visible := False;
          img1920NetMain.Visible := False;

          TurnOffLBV1(False);
          Current5MANotGiven_LBV1(False);
          TurnOffLBV2(False);
          Current5MANotGiven_LBV2(False);
        end;

        imgCurrent5MAClicked.Visible :=
          Boolean(Station.HalfSetA.Rack1920.butCurrent5MA = butPositionDown);
        imgCurrent5MA.Visible :=
          Boolean(Station.HalfSetA.Rack1920.butCurrent5MA = butPositionUp);

        imgCurrent5MA2Clicked.Visible := Boolean(Station.HalfSetA.Rack1920.butCurrent5MA2 = butPositionDown);
        imgCurrent5MA2.Visible :=
          Boolean(Station.HalfSetB.Rack1920.butCurrent5MA2 = butPositionUp);
      end;


    idRack1920B:
      begin
        //------------------------Световые индикаторы активности блоков-----------------------
        if (Station.PowerPanel.swNet = 1) and (Station.PowerPanel.sw1900Power_2 = 1) then
        begin
          img1910Light.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1910 = butPositionUp);
          img1910ALight.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1910A = butPositionUp);
          img1930Light.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1930 = butPositionUp);
          img1360_1Light.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1960_1 = butPositionUp);

          if Station.HalfSetB.Rack1920.butPower = butPositionUp then
          begin
            if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn) then
            begin
              TurnOnLBV1(False);
              Current5MAGiven_LBV1(False);
            end;
          end
          else
          begin
            TurnOffLBV1(False);
            Current5MANotGiven_LBV1(False);
          end;

          if Station.HalfSetB.Rack1920.butPower2 = butPositionUp then
          begin
            if (Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
            begin
              TurnOnLBV2(False);
              Current5MAGiven_LBV2(False);
            end;
          end
          else
          begin
            TurnOffLBV2(False);
            Current5MANotGiven_LBV2(False);
          end;
        end
        else
        begin
          img1910Light.Visible := False;
          img1910ALight.Visible := False;
          img1930Light.Visible := False;
          img1360_1Light.Visible := False;
        end;
        //------------------------------------------------------------------------------------
        ImageList2.GetBitmap(NotByte(Station.HalfSetB.Rack1920.but1930),
          img1930.Picture.Bitmap);
        img1930.Invalidate;

        ImageList1.GetBitmap(NotByte(Station.HalfSetB.Rack1920.but1910A),
          img1910_2.Picture.Bitmap);
        img1910_2.Invalidate;

        //If Station.HalfSetA.Rack1920.but1930=0 then begin
        ImageList1.GetBitmap(NotByte(Station.HalfSetB.Rack1920.but1910),
          img1910.Picture.Bitmap);
        img1910.Invalidate;

        imgNetOn2.Visible :=
          Boolean(Station.HalfSetB.Rack1920.butPower2 = butPositionUp);
        imgNetOn.Visible :=
          Boolean(Station.HalfSetB.Rack1920.butPower = butPositionUp);

        ImageList2.GetBitmap(NotByte(Station.HalfSetB.Rack1920.but1960_1),
          img1960_1.Picture.Bitmap);
        img1960_1.Invalidate;

        imgHighOn.Visible :=
          Boolean(station.HalfSetB.Rack1920.butHighOn = butPositionUp);
        imgHignOnClicked.Visible :=
          Boolean(station.HalfSetB.Rack1920.butHighOn = butPositionDown);
        imgHighOn2.Visible :=
          Boolean(station.HalfSetB.Rack1920.butHighOn2 = butPositionUp);
        imgHighOn2Clicked.Visible :=
          Boolean(station.HalfSetB.Rack1920.butHighOn2 = butPositionDown);
        
        imgHighOff2.Visible :=
          Boolean(station.HalfSetB.Rack1920.butHighOff2 = butPositionUp);
        if imgHighOff2.Visible then
          imgHighOff2.BringToFront;
        imgHighOff2Clicked.Visible :=
          Boolean(station.HalfSetB.Rack1920.butHighOff2 = butPositionDown);
        if imgHighOff2Clicked.Visible then
          imgHighOff2Clicked.BringToFront;

        if (TaskController.NetWorker.ClientState.WorkMode = wmLearning) then
        begin
          Image35.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1930 = butPositionDown);
          Label2.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1930 = butPositionDown);
          image37.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1910 = butPositionDown);
          label3.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1910 = butPositionDown);
          image38.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1910A = butPositionDown);
          label4.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1910A = butPositionDown);
          image39.Visible:=
            Boolean(Station.HalfSetB.Rack1920.butPower2 = butPositionDown);
          label5.Visible:=
            Boolean(Station.HalfSetB.Rack1920.butPower2 = butPositionDown);
          image40.Visible :=
            Boolean(Station.HalfSetB.Rack1920.butPower = butPositionDown);
          label7.Visible :=
            Boolean(Station.HalfSetB.Rack1920.butPower = butPositionDown);
          image33.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1960_1 = butPositionDown);
          label8.Visible :=
            Boolean(Station.HalfSetB.Rack1920.but1960_1 = butPositionDown);
        end
        else
        begin
          Image35.Visible := False;
          Label2.Visible := False;
          image37.Visible := False;
          label3.Visible := False;
          image38.Visible := False;
          label4.Visible := False;
          image39.Visible:= False;
          label5.Visible:= False;
          image40.Visible := False;
          label7.Visible := False;
          image33.Visible := False;
          label8.Visible := False;
        end;

        if Station.IsPluggedIn then
        begin
          if Station.PowerPanel.sw1900Power = 1 then
          begin
            imgWarningLight2.Visible :=
              not(Station.HalfSetB.Rack1920.stLBV2_TurnedOn);
            img1920Net2.Visible :=
              Boolean(Station.HalfSetB.Rack1920.butPower2 = butPositionUp);
            imgSlowSystemAnod2.Visible :=
              Station.HalfSetB.Rack1920.stLBV2_TurnedOn; //Boolean(Station.HalfSetA.Rack1920.butPower2 = butPositionUp);
            imgCollector2.Visible :=
              Station.HalfSetB.Rack1920.stLBV2_TurnedOn; //Boolean(Station.HalfSetA.Rack1920.butPower2 = butPositionUp);
            img1920NetMain2.Visible :=
              Boolean(Station.HalfSetB.Rack1920.butPower2 = butPositionUp);

            if (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1)
              and (not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn)) then
            begin
              TurnOnLBV1(False);
            end;
            if (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1)
              and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn) then
            begin
              TurnOnLBV1(False);
              Current5MAGiven_LBV1(False);
            end;
            if not(Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1) then
            begin
              TurnOffLBV1(False);
              Current5MANotGiven_LBV1(False);
            end;
          end
          else
          begin
            img1920Net.Visible := False;
            img1920NetMain.Visible := False;
            imgWarningLight.Visible := False;
            imgSlowSystemAnod.Visible := False;
            imgCollector.Visible := False;
          end;

          if Station.PowerPanel.sw1900Power = 1 then
          begin
            imgWarningLight.Visible := not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn);
            img1920Net.Visible :=
              Boolean(Station.HalfSetB.Rack1920.butPower = butPositionUp);
            imgSlowSystemAnod.Visible :=
              Station.HalfSetB.Rack1920.stLBV1_TurnedOn; //Boolean(Station.HalfSetA.Rack1920.butPower = butPositionUp);
            imgCollector.Visible :=
              Station.HalfSetB.Rack1920.stLBV1_TurnedOn; //Boolean(Station.HalfSetA.Rack1920.butPower = butPositionUp);
            img1920NetMain.Visible :=
              Boolean(Station.HalfSetB.Rack1920.butPower = butPositionUp);

            if (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2)
              and (not(Station.HalfSetB.Rack1920.stLBV2_TurnedOn)) then
            begin
              TurnOnLBV2(False);
            end;
            if (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2)
              and (Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
            begin
              TurnOnLBV2(False);
              Current5MAGiven_LBV2(False);
            end;
            if not(Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2) then
            begin
              TurnOffLBV2(False);
              Current5MANotGiven_LBV2(False);
            end;
          end
          else
          begin
            img1920Net2.Visible := False;
            img1920NetMain2.Visible := False;
            imgWarningLight2.Visible := False;
            imgSlowSystemAnod2.Visible := False;
            imgCollector2.Visible := False;
          end;
        end
        else
        begin
          imgWarningLight2.Visible := False;
          img1920Net2.Visible := False;
          imgSlowSystemAnod2.Visible := False;
          imgCollector2.Visible := False;
          img1920NetMain2.Visible := False;

          imgWarningLight.Visible := False;
          img1920Net.Visible := False;
          imgSlowSystemAnod.Visible := False;
          imgCollector.Visible := False;
          img1920NetMain.Visible := False;
        end;

        imgCurrent5MAClicked.Visible :=
          Boolean(Station.HalfSetB.Rack1920.butCurrent5MA = butPositionDown);
        imgCurrent5MA.Visible :=
          Boolean(Station.HalfSetB.Rack1920.butCurrent5MA = butPositionUp);

        imgCurrent5MA2Clicked.Visible :=
          Boolean(Station.HalfSetB.Rack1920.butCurrent5MA2 = butPositionDown);
        imgCurrent5MA2.Visible :=
          Boolean(Station.HalfSetB.Rack1920.butCurrent5MA2 = butPositionUp);
      end;
  end;
end;

procedure TRack1920Form.img1960_1Click(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      begin
        if Station.WorkMode = mdPowerOn then
        begin
          if (Station.HalfSetA.Rack1920.but1930 = butPositionDown) or
          (Station.HalfSetA.Rack1920.but1910 = butPositionDown) or
          (Station.HalfSetA.Rack1920.but1910A = butPositionDown) or
          (Station.HalfSetA.Rack1920.butPower2 = butPositionDown) or
          ( Station.HalfSetA.Rack1920.butPower = butPositionDown) then
          begin
            TaskController.AddError(CurFormId, 'Сперва необходимо настроить предыдущие блоки');
            if Station.WorkType = wtLearn then
            begin
              Application.MessageBox('Сперва необходимо настроить предыдущие блоки',
              PChar(PName), MB_OK + MB_ICONINFORMATION);
              Exit;
            end;
            Exit;
          end;
        end;

        if Station.HalfSetA.Rack1920.but1960_1 = butPositionDown then
        begin
          Station.HalfSetA.Rack1920.but1960_1 := butPositionUp;
        end
        else
        begin
          Station.HalfSetA.Rack1920.but1960_1 := butPositionDown;
        end;
      end;
    idRack1920B:
      begin
        if Station.WorkMode = mdPowerOn then
        begin
          if (Station.HalfSetB.Rack1920.but1930 = butPositionDown) or
          (Station.HalfSetB.Rack1920.but1910 = butPositionDown) or
          (Station.HalfSetB.Rack1920.but1910A = butPositionDown) or
          (Station.HalfSetB.Rack1920.butPower2 = butPositionDown) or
          ( Station.HalfSetB.Rack1920.butPower = butPositionDown) then
          begin
            TaskController.AddError(CurFormId, 'Сперва необходимо настроить предыдущие блоки');
            if Station.WorkType = wtLearn then
            begin
              Application.MessageBox('Сперва необходимо настроить предыдущие блоки',
              PChar(PName), MB_OK + MB_ICONINFORMATION);
              Exit;
            end;
            Exit;
          end;
        end;

        if Station.HalfSetB.Rack1920.but1960_1 = butPositionDown then
        begin
          Station.HalfSetB.Rack1920.but1960_1 := butPositionUp;
        end
        else
        begin
          Station.HalfSetB.Rack1920.but1960_1 := butPositionDown;
        end;
      end;
  end;

  Reload;
end;

procedure TRack1920Form.Current5MANotGiven_LBV1(Delay: Boolean = True);
var
  btA: Byte;
  imgsCollectorScopes: array[1..4] of ^TImage;
  imgsNaprAnodKV: array [1..3] of ^TImage;
begin
  imgsNaprAnodKV[1] := @imgNaprAnod2KV1;
  imgsNaprAnodKV[2] := @imgNaprAnod2KV2;
  imgsNaprAnodKV[3] := @imgNaprAnod2KV3;

  imgsCollectorScopes[1] := @imgCollectorScope1;
  imgsCollectorScopes[2] := @imgCollectorScope2;
  imgsCollectorScopes[3] := @imgCollectorScope3;
  imgsCollectorScopes[4] := @imgCollectorScope4;

  for btA := 4 downto 2 do
  begin
    if btA < 4 then
      imgsNaprAnodKV[btA].Visible := False;
    imgsCollectorScopes[btA].Visible := False;
    imgsNaprAnodKV[btA - 1].Visible := True;
    imgsCollectorScopes[btA - 1].Visible := True;
    if Delay then
    begin
      Application.ProcessMessages;
      Sleep(600);
    end;
  end;
  if Delay then
    Sleep(600);
  imgsNaprAnodKV[1].Visible := False;
  imgsCollectorScopes[1].Visible := False;
  Station.HalfSetB.Rack1920.stLBV1_TurnedOn := False;
end;

procedure TRack1920Form.Current5MANotGiven_LBV2(Delay: Boolean = True);
var
  btA: Byte;
  imgsCollectorScopes: array[1..4] of ^TImage;
  imgsNaprAnodKV: array [1..3] of ^TImage;
begin
  imgsNaprAnodKV[1] := @imgNaprAnodKV1;
  imgsNaprAnodKV[2] := @imgNaprAnodKV2;
  imgsNaprAnodKV[3] := @imgNaprAnodKV3;

  imgsCollectorScopes[1] := @imgCollectorScope1_1;
  imgsCollectorScopes[2] := @imgCollectorScope1_2;
  imgsCollectorScopes[3] := @imgCollectorScope1_3;
  imgsCollectorScopes[4] := @imgCollectorScope1_4;

  for btA := 4 downto 2 do
  begin
    if btA < 4 then
      imgsNaprAnodKV[btA].Visible := False;
    imgsCollectorScopes[btA].Visible := False;
    imgsNaprAnodKV[btA - 1].Visible := True;
    imgsCollectorScopes[btA - 1].Visible := True;
    if Delay then
    begin
      Application.ProcessMessages;
      Sleep(600);
    end;
  end;
  if Delay then
    Sleep(600);
  imgsNaprAnodKV[1].Visible := False;
  imgsCollectorScopes[1].Visible := False;
  Station.HalfSetB.Rack1920.stLBV2_TurnedOn := False;
end;

procedure TRack1920Form.Current5MAGiven_LBV1(Delay: Boolean = True);
var
  btA: Byte;
  imgsZamedlSys: array[1..3] of ^TImage;
  imgsCollectorScopes: array[1..4] of ^TImage;
begin
  imgsZamedlSys[1] := @imgNaprAnod2KV1;
  imgsZamedlSys[2] := @imgNaprAnod2KV2;
  imgsZamedlSys[3] := @imgNaprAnod2KV3;

  imgsCollectorScopes[1] := @imgCollectorScope1;
  imgsCollectorScopes[2] := @imgCollectorScope2;
  imgsCollectorScopes[3] := @imgCollectorScope3;
  imgsCollectorScopes[4] := @imgCollectorScope4;

  for btA := 1 to 4 do
  begin
    if btA < 4 then
    begin
      imgsZamedlSys[btA].Visible := True;
      if btA > 1 then
        imgsZamedlSys[btA - 1].Visible := False;
    end;
    imgsCollectorScopes[btA].Visible := True;
    if btA > 1 then
      imgsCollectorScopes[btA - 1].Visible := False;
    if Delay then
      Sleep(800);
    Application.ProcessMessages;
  end;

  case CurFormId of
    idRack1920A:
      Station.HalfSetA.Rack1920.stLBV1_TurnedOn := True;
    idRack1920B:
      Station.HalfSetB.Rack1920.stLBV1_TurnedOn := True;
  end;

  if Delay then
    Reload;
end;

procedure TRack1920Form.Current5MAGiven_LBV2(Delay: Boolean = True);
var
  btA: Byte;
  imgsZamedlSys: array[1..3] of ^TImage;
  imgsCollectorScopes: array[1..4] of ^TImage;
begin
  imgsZamedlSys[1] := @imgNaprAnodKV1;
  imgsZamedlSys[2] := @imgNaprAnodKV2;
  imgsZamedlSys[3] := @imgNaprAnodKV3;

  imgsCollectorScopes[1] := @imgCollectorScope1_1;
  imgsCollectorScopes[2] := @imgCollectorScope1_2;
  imgsCollectorScopes[3] := @imgCollectorScope1_3;
  imgsCollectorScopes[4] := @imgCollectorScope1_4;

  for btA := 1 to 4 do
  begin
    if btA < 4 then
    begin
      imgsZamedlSys[btA].Visible := True;
      if btA > 1 then
        imgsZamedlSys[btA - 1].Visible := False;
    end;
    imgsCollectorScopes[btA].Visible := True;
    if btA > 1 then
      imgsCollectorScopes[btA - 1].Visible := False;
    if Delay then
      Sleep(800);
    Application.ProcessMessages;
  end;

  case CurFormId of
    idRack1920A:
      Station.HalfSetA.Rack1920.stLBV2_TurnedOn := True;
    idRack1920B:
      Station.HalfSetB.Rack1920.stLBV2_TurnedOn := True;
  end;

  if Delay then
    Reload;
end;

procedure TRack1920Form.imgCurrent5MA2Click(Sender: TObject);
begin

       case CurFormId of
    idRack1920A:
      begin
        Station.HalfSetA.Rack1920.butCurrent5MA2 := butPositionDown;

        Reload;

        if (Station.Is1920A2ReadyToTurnHighON)
          and (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2) then
        begin
          Current5MAGiven_LBV2;
        end
        else
        begin
          if Station.WorkType = wtLearn then
          begin
            Application.MessageBox('Не удалось подать высокое напряжение!',
              PChar(PName), MB_OK + MB_ICONWARNING);
          end;
        end;
      end;
    idRack1920B:
      begin
        Station.HalfSetB.Rack1920.butCurrent5MA2 := butPositionDown;

        Reload;

        if (Station.Is1920B2ReadyToTurnHighON)
          and (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2) then
        begin
          Current5MAGiven_LBV2;
        end
        else
        begin
          if Station.WorkType = wtLearn then
          begin
            Application.MessageBox('Не удалось подать высокое напряжение!',
              PChar(PName), MB_OK + MB_ICONWARNING);
          end;
        end;
      end;
  end;
end;

procedure TRack1920Form.imgCurrent5MA2ClickedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      begin
        Station.HalfSetA.Rack1920.butCurrent5MA2 := butPositionUp;
        if Station.HalfSetA.Rack1920.stLBV2_TurnedOn then
          Current5MANotGiven_LBV2;
      end;

    idRack1920B:
      begin
        Station.HalfSetB.Rack1920.butCurrent5MA2 := butPositionUp;
        if Station.HalfSetB.Rack1920.stLBV2_TurnedOn then
          Current5MANotGiven_LBV2;
      end;
  end;

  Reload;
end;

procedure TRack1920Form.imgCurrent5MAClick(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      begin  
        Station.HalfSetA.Rack1920.butCurrent5MA := butPositionDown;

        Reload;
    
        if (Station.Is1920A1ReadyToTurnHighON)
          and (Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1) then
        begin
          Current5MAGiven_LBV1;
        end
        else
        begin
          if Station.WorkType = wtLearn then
          begin
            Application.MessageBox('Не удалось подать высокое напряжение!',
              PChar(PName), MB_OK + MB_ICONWARNING);
          end;
        end;
      end;
    idRack1920B:
      begin
        Station.HalfSetB.Rack1920.butCurrent5MA := butPositionDown;

        Reload;
    
        if (Station.Is1920B1ReadyToTurnHighON)
          and (Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1) then
        begin
          Current5MAGiven_LBV1;
        end
        else
        begin
          if Station.WorkType = wtLearn then
          begin
            Application.MessageBox('Не удалось подать высокое напряжение!',
              PChar(PName), MB_OK + MB_ICONWARNING);
          end;
        end;
      end;
  end;
end;

procedure TRack1920Form.imgCurrent5MAClickedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1920B:
      begin  
        Station.HalfSetB.Rack1920.butCurrent5MA := butPositionUp;
        if Station.HalfSetB.Rack1920.stLBV1_TurnedOn then
          Current5MANotGiven_LBV1;
      end;
    idRack1920A:
      begin  
        Station.HalfSetA.Rack1920.butCurrent5MA := butPositionUp;
        if Station.HalfSetA.Rack1920.stLBV1_TurnedOn then
          Current5MANotGiven_LBV1;
      end;
  end;

  Reload;
end;

procedure TRack1920Form.TurnOffLBV1(Delay: Boolean = True);
var
  btA: Byte;
  imgsZamedlSys: array[1..3] of ^TImage;
begin
  imgsZamedlSys[1] := @imgZamedlSys2;
  imgsZamedlSys[2] := @imgZamedlSys3;
  imgsZamedlSys[3] := @imgZamedlSys4;

  for btA := 3 downto 2 do
  begin
    imgsZamedlSys[btA].Visible := False;
    imgsZamedlSys[btA - 1].Visible := True;
    Application.ProcessMessages;
    if Delay then
      Sleep(600);
  end;
  if Delay then
    Sleep(600);
  imgsZamedlSys[1].Visible := False;

  case CurFormId of
    idRack1920A:
    begin
        Station.HalfSetA.Rack1920.stLBV1_TurnedOn := False;
        Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 := False;
    end;
    idRack1920B:
    begin
        Station.HalfSetB.Rack1920.stLBV1_TurnedOn := False;
        Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 := False;
    end;
  end;
end;

procedure TRack1920Form.TurnOffLBV2(Delay: Boolean = True);
var
  btA: Byte;
  imgsZamedlSys: array[1..3] of ^TImage;
begin
  imgsZamedlSys[1] := @imgZamedlSys1_2;
  imgsZamedlSys[2] := @imgZamedlSys1_3;
  imgsZamedlSys[3] := @imgZamedlSys1_4;

  for btA := 3 downto 2 do
  begin
    imgsZamedlSys[btA].Visible := False;
    imgsZamedlSys[btA - 1].Visible := True;
    Application.ProcessMessages;
    if Delay then
      Sleep(600);
  end;
  if Delay then
    Sleep(600);
  imgsZamedlSys[1].Visible := False;
  case CurFormId of
    idRack1920A:
    begin
        Station.HalfSetA.Rack1920.stLBV2_TurnedOn := False;
        Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 := False;
    end;
    idRack1920B:
    begin
        Station.HalfSetB.Rack1920.stLBV2_TurnedOn := False;
        Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 := False;
    end;
  end;
end;


procedure TRack1920Form.TurnOnLBV1(Delay: Boolean = True);
var
  btA: Byte;
  imgsZamedlSys: array[1..3] of ^TImage;
begin
  imgsZamedlSys[1] := @imgZamedlSys1;
  imgsZamedlSys[2] := @imgZamedlSys2;
  imgsZamedlSys[3] := @imgZamedlSys3;

  for btA := 1 to 3 do
  begin
    imgsZamedlSys[btA].Visible := True;
    if btA > 1 then
      imgsZamedlSys[btA - 1].Visible := False;
    Application.ProcessMessages;
    if Delay then
      Sleep(500);
  end;
  case CurFormId of
    idRack1920A:
      Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 := True;
    idRack1920B:
      Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 := True;
  end;
end;

procedure TRack1920Form.TurnOnLBV2(Delay: Boolean = True);
var
  btA: Byte;
  imgsZamedlSys: array[1..3] of ^TImage;
begin
  imgsZamedlSys[1] := @imgZamedlSys1_1;
  imgsZamedlSys[2] := @imgZamedlSys1_2;
  imgsZamedlSys[3] := @imgZamedlSys1_3;

  for btA := 1 to 3 do
  begin
    imgsZamedlSys[btA].Visible := True;
    if btA > 1 then
      imgsZamedlSys[btA - 1].Visible := False;
    Application.ProcessMessages;
    if Delay then
      Sleep(500);
  end;
  case CurFormId of
    idRack1920A:
      begin
        Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 := True;
      end;
    idRack1920B:
      begin
        Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 := True;
      end;
  end;
end;

procedure TRack1920Form.imgHighOff2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      begin
        Station.HalfSetA.Rack1920.butHighOff2 := butPositionDown;
        Station.HalfSetA.Rack1920.butHighOn2 := butPositionUp;

        if (Station.Is1920A2ReadyToTurnHighON) and (imgZamedlSys1_3.Visible) then
          Current5MANotGiven_LBV2;
        if (Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
          TurnOffLBV2;
      end;

    idRack1920B:
      begin
        Station.HalfSetB.Rack1920.butHighOff2 := butPositionDown;
        Station.HalfSetB.Rack1920.butHighOn2 := butPositionUp;

        if (Station.Is1920B2ReadyToTurnHighON) and (imgZamedlSys1_3.Visible) then
          Current5MANotGiven_LBV2;
        if (Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
          TurnOffLBV2;
      end;
  end;

  Reload;
end;

procedure TRack1920Form.imgHighOff2ClickedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      Station.HalfSetA.Rack1920.butHighOff2 := butPositionUp;
    idRack1920B:
      Station.HalfSetB.Rack1920.butHighOff2 := butPositionUp;
  end;

  Reload;
end;

procedure TRack1920Form.imgHighOffClick(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      begin
        Station.HalfSetA.Rack1920.butHighOff := butPositionDown;
        Station.HalfSetA.Rack1920.butHighOn := butPositionUp;

        if (Station.Is1920A1ReadyToTurnHighON) and (imgZamedlSys3.Visible) then
          Current5MANotGiven_LBV1;    
        if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn) then
          TurnOffLBV1;
      end;
    idRack1920B:
      begin
        Station.HalfSetB.Rack1920.butHighOff := butPositionDown;
        Station.HalfSetB.Rack1920.butHighOn := butPositionUp;

        if (Station.Is1920B1ReadyToTurnHighON) and (imgZamedlSys3.Visible) then
          Current5MANotGiven_LBV1;    
        if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn) then
          TurnOffLBV1;
      end;      
  end;

  Reload;
end;

procedure TRack1920Form.imgHighOffClickedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      Station.HalfSetA.Rack1920.butHighOff := butPositionUp;
    idRack1920B:
      Station.HalfSetB.Rack1920.butHighOff := butPositionUp;
  end;

  Reload;
end;

procedure TRack1920Form.imgHighOn2Click(Sender: TObject);
begin

     case CurFormId of
    idRack1920A:
      begin

          if (not(Station.HalfSetA.Rack1500.GeterodinTunedMain))
            and (not(Station.HalfSetA.Rack1500.GeterodinTunedReserve)) then
          begin
            TaskController.AddError(CurFormId, 'Попытка подать высокое на ЛБВ1 '
              +'прежде чем настроен гетеродин');
            Application.MessageBox('Сперва необходимо настроить '
              +'гетеродин в стойке 1500!',
            PChar(PName),
            MB_OK + MB_ICONWARNING);
            Exit;
          end;


        if Station.HalfSetA.Rack1920.butHighOn2 = butPositionDown then
          Station.HalfSetA.Rack1920.butHighOn2 := butPositionUp
        else
        begin
          Station.HalfSetA.Rack1920.butHighOn2 := butPositionDown;
          Station.HalfSetA.Rack1920.butHighOff2 := butPositionUp;
        end;

        Reload;

        if (not(Station.Is1920A2ReadyToTurnHighON)) then
        begin
          if Station.WorkType = wtLearn then
          begin
            Application.MessageBox('Стойка настроена не верно! '
              +'Подача высокого не возможна!',
            PChar(PName), MB_OK + MB_ICONWARNING);
            Exit;
          end;
        end
        else
        begin
            TurnOnLBV2;
          end;
      end;
    idRack1920B:
      begin
          if (not(Station.HalfSetB.Rack1500.GeterodinTunedMain))
            and (not(Station.HalfSetB.Rack1500.GeterodinTunedReserve)) then
          begin
            TaskController.AddError(CurFormId, 'Попытка подать высокое на ЛБВ1 '
              +'прежде чем настроен гетеродин');
            Application.MessageBox('Сперва необходимо настроить '
              +'гетеродин в стойке 1500!',
            PChar(PName),
            MB_OK + MB_ICONWARNING);
            Exit;
          end;


        if Station.HalfSetB.Rack1920.butHighOn2 = butPositionDown then
          Station.HalfSetB.Rack1920.butHighOn2 := butPositionUp
        else
        begin
          Station.HalfSetB.Rack1920.butHighOn2 := butPositionDown;
          Station.HalfSetB.Rack1920.butHighOff2 := butPositionUp;
        end;

        Reload;

        if (not(Station.Is1920B2ReadyToTurnHighON)) then
        begin
          if Station.WorkType = wtLearn then
          begin
            Application.MessageBox('Стойка настроена не верно! '
              +'Подача высокого не возможна!',
            PChar(PName), MB_OK + MB_ICONWARNING);
            Exit;
          end;
        end
        else
          begin
            TurnOnLBV2;
          end;
      end;
  end;


end;

procedure TRack1920Form.imgHighOnClick(Sender: TObject);
begin
  case CurFormId of
    idRack1920A:
      begin

          if (not(Station.HalfSetA.Rack1500.GeterodinTunedMain))
            and (not(Station.HalfSetA.Rack1500.GeterodinTunedReserve)) then
          begin
            TaskController.AddError(CurFormId, 'Попытка подать высокое на ЛБВ1 '
              +'прежде чем настроен гетеродин');
            Application.MessageBox('Сперва необходимо настроить '
              +'гетеродин в стойке 1500!',
            PChar(PName),
            MB_OK + MB_ICONWARNING);
            Exit;
          end;


        if (not(Station.Is1920A1ReadyToTurnHighON)) then
        begin
          if Station.WorkType = wtLearn then
          begin
            Application.MessageBox('Стойка настроена не верно! '
              +'Подача высокого не возможна!',
            PChar(PName), MB_OK + MB_ICONWARNING);
            Exit;
          end;
        end
        else
        begin
            TurnOnLBV1;

          Station.HalfSetA.Rack1920.butHighOn := butPositionDown;
          Station.HalfSetA.Rack1920.butHighOff := butPositionUp;

           Reload;

        end;





      end;
    idRack1920B:
      begin
          if (not(Station.HalfSetB.Rack1500.GeterodinTunedMain))
            and (not(Station.HalfSetB.Rack1500.GeterodinTunedReserve)) then
          begin
            TaskController.AddError(CurFormId, 'Попытка подать высокое на ЛБВ1 '
              +'прежде чем настроен гетеродин');
            Application.MessageBox('Сперва необходимо настроить '
              +'гетеродин в стойке 1500!',
            PChar(PName),
            MB_OK + MB_ICONWARNING);
            Exit;
          end;


        if (not(Station.Is1920B1ReadyToTurnHighON)) then
        begin
          if Station.WorkType = wtLearn then
          begin
            Application.MessageBox('Стойка настроена не верно! '
              +'Подача высокого не возможна!',
            PChar(PName), MB_OK + MB_ICONWARNING);
            Exit;
          end;
        end
        else
          begin
            TurnOnLBV1;

         Station.HalfSetB.Rack1920.butHighOn := butPositionDown;
          Station.HalfSetB.Rack1920.butHighOff := butPositionUp;

        Reload;
          end;
      end;
  end;
end;

procedure TRack1920Form.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TRack1920Form.FormShow(Sender: TObject);
var
  btA: Byte;
begin
  //CurFormId := self.Tag;

  TaskController.ChangeEvent;

  imgHighOn.BringToFront;

  SetLength(HelpImages, 0);
  SetLength(HelpImages, 6);
  HelpImages[0].HelpImage := Image35;
  HelpImages[0].HelpLabel := Label2;
  HelpImages[1].HelpImage := Image37;
  HelpImages[1].HelpLabel := Label3;
  HelpImages[2].HelpImage := Image38;
  HelpImages[2].HelpLabel := Label4;
  HelpImages[3].HelpImage := Image39;
  HelpImages[3].HelpLabel := Label5;
  HelpImages[4].HelpImage := Image40;
  HelpImages[4].HelpLabel := Label7;
  HelpImages[5].HelpImage := Image33;
  HelpImages[5].HelpLabel := Label8;
  if TaskController.NetWorker.ClientState.WorkMode = wmLearning then
  begin
    for btA := 0 to Length(HelpImages) - 1 do
    begin
      HelpImages[btA].HelpImage.Visible := True;
      HelpImages[btA].HelpLabel.Visible := True;
    end;
  end
  else
  begin
    for btA := 0 to Length(HelpImages) - 1 do
    begin
      HelpImages[btA].HelpImage.Visible := False;
      HelpImages[btA].HelpLabel.Visible := False;
    end;
  end;

  Reload;
end;

procedure TRack1920Form.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin

  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;

procedure TRack1920Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Parent.Show;
  //Station.CheckMoshnostA;
  //Station.CheckMoshnostB;
  //ReturnFromRack;
end;

procedure TRack1920Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //CheckFormBeforeClosing(CanClose);
end;

procedure TRack1920Form.FormCreate(Sender: TObject);
begin
  MoveFormInScreenCenter(Self);

end;

procedure TRack1920Form.FormKeyPress(Sender: TObject; var Key: Char);
var StationR414FormminiHWND : HWND;
begin
  if Ord(Key) = 27 then
  begin
    //Инициация события "Закрытие окна стойки"
    StationR414FormminiHWND := FindWindow(StationR414FormminiClassName,
      StationR414FormminiObjectName);
    PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  end;
end;

end.
