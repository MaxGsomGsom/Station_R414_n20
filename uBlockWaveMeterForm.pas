unit uBlockWaveMeterForm;

interface

uses
  Windows,
  uDefinitionsDM,
  Messages,
  uWaveMeterPanelForm,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  jpeg,
  ExtCtrls,
  ImgList,
  StdCtrls,
  pngimage,
  uConstantsDM,
  uStationStateDM,
  uTaskControllerDM,
  uButtonBackForm;

type
  TBlockWaveMeterForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    ImageList1: TImageList;
    Timer1: TTimer;
    Timer2: TTimer;
    Image3: TImage;
    ImageList3: TImageList;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    Image29: TImage;
    Image30: TImage;
    Image31: TImage;
    Image32: TImage;
    Image33: TImage;
    Image34: TImage;
    Image35: TImage;
    Image36: TImage;
    Image37: TImage;
    Image38: TImage;
    Image39: TImage;
    Image40: TImage;
    Image41: TImage;
    Image42: TImage;
    Image43: TImage;
    Image44: TImage;
    Image45: TImage;
    Image46: TImage;
    Image47: TImage;
    Image48: TImage;
    Image49: TImage;
    Image50: TImage;
    Image51: TImage;
    Image52: TImage;
    Image53: TImage;
    Image54: TImage;
    edtFloat: TEdit;
    Image2: TImage;
    Image55: TImage;
    edtInt: TEdit;
    imgGeterodinTuned: TImage;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Image5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);

  private
    geterodinWasTuned : Boolean;
    procedure UpdateGeterodinImage(wave : Byte; var tuned: Boolean); overload;
    procedure UpdateGeterodinImage(wave : Byte); overload;
    function IsGeterodinTuned(WaveToTune: Byte): Boolean;

  public

    { Public declarations }
    Tr1,Tr2,Tr3,Tr4,Tr5,Tr6,Tr7,Tr8:boolean;
    //
     bmp1: tbitmap;
     bmp2:tbitmap;
     bmp3:tbitmap;
     //i1,i2,k,s1,s2,Nazad,T:integer;
    //

     Moment,Start:boolean;
     x1,y1:integer;
     x2,y2:integer;
     i,p:integer;
     NachZnach,Vpered,NachZnachS:boolean;
     Znach,Zx1,Zy1,Zx2,Zy2:integer;
     A,B:double;
     Schetchik,Schetchik2:integer;
     //
    Shkala1:integer;
    Shkala2:integer;
    L:integer;
    TunedFormId: Byte;
    procedure Reload;
    constructor Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;




const
idRack1500A = 1;
idRack1500B = 2;
idRack1600A = 3;
idRack1600B = 4;

var
  //BlockWaveMeterForm: TBlockWaveMeterForm;
  Station: TStation;
  ButtonBackForm: TButtonBackForm;
  TaskController: TTaskController;
  waveInt: Byte;
  waveFloat: byte;
  CurFormID: Integer;
  end;

implementation

uses
  uRack1500Form,
  uEducationForm,
  uRack1600Form,
  uRack1500bForm,
  uRack1600BForm,
  uAdditionalFormMethods;

{$R *.dfm}


constructor TBlockWaveMeterForm.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
  //idRack1500A:=1;
  //idRack1500B:=2;
  CurFormId:=Half;
end;

/// <summary>
/// Обработчик события нажатия на кнопку "Свернуть"
/// </summary>
/// <param name="Sender"></param>
procedure TBlockWaveMeterForm.btnCloseClick(Sender: TObject);
begin
  //ButtonBackForm.Show;    // Мы её скрывали, когда открыли Волномер в зад.4
  Self.Close;             // Ранее эту функцию выполнял крест в Border
end;

procedure TBlockWaveMeterForm.FormCreate(Sender: TObject);
begin
  i:=0;
//  i1:=0;
//  i2:=0;
//  k:=0;
//  s1:=15;
//  s2:=0;
//  Nazad:=0;
//  T:=0;
  NachZnachS:=false;
  bmp1:= tbitmap.Create;

  i:=1;
  bmp3:= tbitmap.Create;
  bmp3.Width:= 140;
  bmp3.Height:= 140;
  ImageList1.Draw(bmp3.Canvas,0,0,1);
  Image5.Picture.Bitmap:= bmp3;
  Moment:=true;
  Start:=true;
  Vpered:=true;
  NachZnach:=false;
  Zx2:=0;Zy2:=0;
  Schetchik:=0;
  Schetchik2:=0;
  Shkala1:=0;
  Shkala2:=0;
  //



  Self.Height := Panel1.Height;
  Self.Width := Panel1.Width;
                                        //Расположить форму сверху по центру:
  Self.Top := 0;
  Self.Left := Screen.Width div 2 - Self.width div 2;
   MoveFormInScreenCenter(Self);
end;

procedure TBlockWaveMeterForm.FormKeyPress(Sender: TObject; var Key: Char);
var StationR414FormminiHWND : HWND;
begin
  if Ord(Key) = 27 then
  begin
    //Инициация события "Закрытие окна стойки"
    StationR414FormminiHWND := FindWindow(StationR414FormminiClassName, StationR414FormminiObjectName);
    PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  end;
end;

procedure TBlockWaveMeterForm.FormShow(Sender: TObject);
begin
//  if WaveMeterPanelForm.Visible then
//    btnClose.Visible := True
//  else
//    btnClose.Visible := False;
  Self.BringToFront();
  Reload;
end;

procedure TBlockWaveMeterForm.Reload;
begin


    case CurFormId of
      idRack1500A:
        begin
          if (Station.HalfSetA.Rack1500.CableMdMainState = csConnected) then
          begin
            waveInt := Station.HalfSetA.Rack1500.GeterodinIntMain;
            waveFloat := Station.HalfSetA.Rack1500.GeterodinFloatMain;
          end;
          if (Station.HalfSetA.Rack1500.CableMdReservState = csConnected) then
          begin
            waveInt := Station.HalfSetA.Rack1500.GeterodinIntReserve;
            waveFloat := Station.HalfSetA.Rack1500.GeterodinFloatReserve;
          end;

          UpdateGeterodinImage(Station.WaveTransmitA);
        end;
      idRack1500B:
        begin
          if (Station.HalfSetB.Rack1500.CableMdMainState = csConnected) then
          begin
            waveInt := Station.HalfSetB.Rack1500.GeterodinIntMain;
            waveFloat := Station.HalfSetB.Rack1500.GeterodinFloatMain;
          end;
          if (Station.HalfSetB.Rack1500.CableMdReservState = csConnected) then
          begin
            waveInt := Station.HalfSetB.Rack1500.GeterodinIntReserve;
            waveFloat := Station.HalfSetB.Rack1500.GeterodinFloatReserve;
          end;

          UpdateGeterodinImage(Station.WaveTransmitB);
        end;
      idRack1600A:
        begin
          if (Station.HalfSetA.Rack1600.CableMdMainState = csConnected) then
          begin
            waveInt := Station.HalfSetA.Rack1600.GeterodinIntMain;
            waveFloat := Station.HalfSetA.Rack1600.GeterodinFloatMain;
          end;
          if (Station.HalfSetA.Rack1600.CableMdReservState = csConnected) then
          begin
            waveInt := Station.HalfSetA.Rack1600.GeterodinIntReserve;
            waveFloat := Station.HalfSetA.Rack1600.GeterodinFloatReserve;
          end;

          UpdateGeterodinImage(Station.WaveReceiveA);
        end;
      idRack1600B:
        begin
          if (Station.HalfSetB.Rack1600.CableMdMainState = smdMain) then
          begin
            waveInt := Station.HalfSetB.Rack1600.GeterodinIntMain;
            waveFloat := Station.HalfSetB.Rack1600.GeterodinFloatMain;
          end;
          if (Station.HalfSetB.Rack1600.CableMdReservState = csConnected) then
          begin
            waveInt := Station.HalfSetB.Rack1600.GeterodinIntReserve;
            waveFloat := Station.HalfSetB.Rack1600.GeterodinFloatReserve;
          end;

          UpdateGeterodinImage(Station.WaveReceiveB);
        end;
    end;

    edtInt.Text := IntToStr(waveInt);
    edtFloat.Text := IntToStr(waveFloat);


  imgGeterodinTuned.Invalidate;
end;

/// <summary>
/// Анимирует колёсико сотых долей
/// </summary>
/// <param name="Sender"></param>
procedure TBlockWaveMeterForm.Timer1Timer(Sender: TObject);
begin
  if Shkala1 = 0 then
  begin
    Shkala1 := 1;
    Image2.BringToFront;
    Image3.SendToBack;
  end
  else begin
    Shkala1 := 0;
    Image2.SendToBack;
    Image3.BringToFront;
  end;
  Timer1.Enabled:=false;
end;

/// <summary>
/// Анимирует колёсико целой части
/// </summary>
/// <param name="Sender"></param>
procedure TBlockWaveMeterForm.Timer2Timer(Sender: TObject);
begin
  if Shkala2 = 0 then begin
    Shkala2 := 1;
    Image4.BringToFront;
    Image55.SendToBack;
  end
  else begin
    Shkala2 := 0;
    Image4.SendToBack;
    Image55.BringToFront;
  end;
  Timer2.Enabled := false;
end;

procedure TBlockWaveMeterForm.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (X > (Sender as TImage).Width - CloseLabelXAxesOffset)
     and (Y < CloseLabelYAxesOffset)
  then
    //SetCloseLabelState(True, Y)
  else
    //SetCloseLabelState(False, Y);
end;

/// <summary>
/// Проверяет, настроен ли гетеродин
/// </summary>
/// <param name="WaveToTune">Текущее выставленное значение волны</param>
/// <returns></returns>
function TBlockWaveMeterForm.IsGeterodinTuned(WaveToTune: Byte): Boolean;
begin
  //Result := False;
  //if (GeterodinWaves[WaveToTune].Int = waveInt)
  //    and (((GeterodinWaves[WaveToTune].Float - 2) <= waveFloat)
  //          and (waveFloat <= (GeterodinWaves[WaveToTune].Float + 2)))
  //then begin
  //  Result := True;
  //end;



    case TunedFormId of
      idRack1500A:
        begin
          if (Station.HalfSetA.Rack1500.CableMdMainState = csConnected) then
          begin
            Station.HalfSetA.Rack1500.GeterodinIntMain := StrToInt(edtInt.Text);
            Station.HalfSetA.Rack1500.GeterodinFloatMain := StrToInt(edtFloat.Text);
          end;
          if (Station.HalfSetA.Rack1500.CableMdReservState = csConnected) then
          begin
            Station.HalfSetA.Rack1500.GeterodinIntReserve := StrToInt(edtInt.Text);
            Station.HalfSetA.Rack1500.GeterodinFloatReserve:= StrToInt(edtFloat.Text);
          end;
        end;
      idRack1500B:
        begin
          if (Station.HalfSetB.Rack1500.CableMdMainState = csConnected) then
          begin
            Station.HalfSetB.Rack1500.GeterodinIntMain := StrToInt(edtInt.Text);
            Station.HalfSetB.Rack1500.GeterodinFloatMain := StrToInt(edtFloat.Text);
          end;
          if (Station.HalfSetB.Rack1500.CableMdReservState = csConnected) then
          begin
            Station.HalfSetB.Rack1500.GeterodinIntReserve := StrToInt(edtInt.Text);
            Station.HalfSetB.Rack1500.GeterodinFloatReserve:= StrToInt(edtFloat.Text);
          end;
        end;
      idRack1600A:
        begin
          if (Station.HalfSetA.Rack1600.CableMdMainState = csConnected) then
          begin
            Station.HalfSetA.Rack1600.GeterodinIntMain := StrToInt(edtInt.Text);
            Station.HalfSetA.Rack1600.GeterodinFloatMain := StrToInt(edtFloat.Text);
          end;
          if (Station.HalfSetA.Rack1600.CableMdReservState = csConnected) then
          begin
            Station.HalfSetA.Rack1600.GeterodinIntReserve := StrToInt(edtInt.Text);
            Station.HalfSetA.Rack1600.GeterodinFloatReserve:= StrToInt(edtFloat.Text);
          end;
        end;
      idRack1600B:
        begin
          if (Station.HalfSetB.Rack1600.CableMdMainState = csConnected) then
          begin
            Station.HalfSetB.Rack1600.GeterodinIntMain := StrToInt(edtInt.Text);
            Station.HalfSetB.Rack1600.GeterodinFloatMain := StrToInt(edtFloat.Text);
          end;
          if (Station.HalfSetB.Rack1600.CableMdReservState = csConnected) then
          begin
            Station.HalfSetB.Rack1600.GeterodinIntReserve := StrToInt(edtInt.Text);
            Station.HalfSetB.Rack1600.GeterodinFloatReserve:= StrToInt(edtFloat.Text);
          end;
        end;
    end;


end;

/// <summary>
/// Обновляет изображение стрелки гетеродина и параметр tuned
/// </summary>
/// <param name="wave">Значение волны, с которым сверяется значение гетеродина</param>
/// <param name="tuned">Изменяемый параметр</param>
procedure TBlockWaveMeterForm.UpdateGeterodinImage(wave: Byte; var tuned: Boolean);
begin
   if IsGeterodinTuned(wave) then
   begin
     if not geterodinWasTuned then
     begin
       imgGeterodinTuned.Visible := True;
       tuned := True;
       geterodinWasTuned := True;
       imgGeterodinTuned.Invalidate;
     end
   end
   else
   begin
     if geterodinWasTuned then
     begin
       imgGeterodinTuned.Visible := False;
       tuned := False;
       geterodinWasTuned := False;
       imgGeterodinTuned.Invalidate;
     end;
   end;
end;

/// <summary>
/// Обновляет изображение стрелки гетеродина и параметр tuned
/// </summary>
/// <param name="wave">Значение волны, с которым сверяется значение гетеродина</param>
procedure TBlockWaveMeterForm.UpdateGeterodinImage(wave: Byte);
begin
  if IsGeterodinTuned(wave) then
  begin
    if not geterodinWasTuned then
    begin
      imgGeterodinTuned.Visible := True;
      geterodinWasTuned := True;
      imgGeterodinTuned.Invalidate;
    end
  end
  else
  begin
    if geterodinWasTuned then
    begin
      imgGeterodinTuned.Visible := False;
      geterodinWasTuned := False;
      imgGeterodinTuned.Invalidate;
    end;
  end;
end;

/// <summary>
/// Мышь перемещается в квадрате, описанном возле колеса настройки
/// </summary>

procedure TBlockWaveMeterForm.Image5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    case CurFormId of
      idRack1500A:
        begin
          if (Station.HalfSetA.Rack1500.CableMdMainState = csConnected)
            and (Station.HalfSetA.Rack1500.SelectedMd = smdMain)
            and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrMain) then
          begin
            TunedFormId := CurFormId;
            UpdateGeterodinImage(Station.WaveTransmitA,
              Station.HalfSetA.Rack1500.GeterodinTunedMain);
          end;

          if (Station.HalfSetA.Rack1500.CableMdReservState = csConnected)
            and (Station.HalfSetA.Rack1500.SelectedMd = smdRetr)
            and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrReserv) then
          begin
            TunedFormId := CurFormId;
            UpdateGeterodinImage(Station.WaveTransmitA,
            Station.HalfSetA.Rack1500.GeterodinTunedReserve);
          end;
        end;

      idRack1500B:
        begin
          if (Station.HalfSetB.Rack1500.CableMdMainState = csConnected)
          and (Station.HalfSetB.Rack1500.SelectedMd = smdMain)
          and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrMain) then
          begin
            TunedFormId := CurFormId;
            UpdateGeterodinImage(Station.WaveTransmitB,
              Station.HalfSetB.Rack1500.GeterodinTunedMain);
          end;
          if (Station.HalfSetB.Rack1500.CableMdReservState = csConnected)
            and (Station.HalfSetB.Rack1500.SelectedMd = smdRetr)
            and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrReserv) then
          begin
            TunedFormId := CurFormId;
            UpdateGeterodinImage(Station.WaveTransmitB,
              Station.HalfSetB.Rack1500.GeterodinTunedReserve);
          end;
        end;

      idRack1600A:
        begin
          if (Station.HalfSetA.Rack1600.CableMdMainState = csConnected)
            and (Station.HalfSetA.Rack1600.SelectedMd = smdMain)
            and (Station.HalfSetA.Rack1600.SelectedDmch = sDmchMain)
            and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchMain) then
          begin
            TunedFormId := CurFormId;
            UpdateGeterodinImage(Station.WaveReceiveA,
              Station.HalfSetA.Rack1600.GeterodinTunedMain);
          end;

          if (Station.HalfSetA.Rack1600.CableMdReservState = csConnected)
            and (Station.HalfSetA.Rack1600.SelectedMd = smdRetr)
            and (Station.HalfSetA.Rack1600.SelectedDmch = sDmchReserve)
            and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchReserve) then
          begin
            TunedFormId := CurFormId;
            UpdateGeterodinImage(Station.WaveReceiveA,
              Station.HalfSetA.Rack1600.GeterodinTunedReserve);
          end;
        end;

      idRack1600B:
        begin
          if (Station.HalfSetB.Rack1600.CableMdMainState = csConnected)
          and (Station.HalfSetB.Rack1600.SelectedMd = smdMain)
          and (Station.HalfSetB.Rack1600.SelectedDmch = sDmchMain)
          and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchMain) then
          begin
            TunedFormId := CurFormId;
            UpdateGeterodinImage(Station.WaveReceiveB,
              Station.HalfSetB.Rack1600.GeterodinTunedMain);
          end;

          if (Station.HalfSetB.Rack1600.CableMdReservState = csConnected)
          and (Station.HalfSetB.Rack1600.SelectedMd = smdRetr)
          and (Station.HalfSetB.Rack1600.SelectedDmch = sDmchReserve)
          and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchReserve) then
          begin
            TunedFormId := CurFormId;
            UpdateGeterodinImage(Station.WaveReceiveB,
              Station.HalfSetB.Rack1600.GeterodinTunedReserve);
          end;
        end;
    else
      TunedFormId := NotSelected;
      Exit;
    end;

//=========================================================================

  Schetchik:=strtoint(edtFloat.Text);
  Schetchik2:=strtoint(edtInt.Text);
  {глобальное условие}
  if ((ssRight in Shift) or (ssLeft in Shift))then
  begin
    {start}
    if Start=true then
    begin
      x2:=X;
      y2:=Y;
      Zx2:=X;
      Zy2:=Y;
      Start:=false;
    end
    else
    begin
      {end}
      if Moment=true then
      begin
        x1:=X;
        y1:=Y;
        {вычиcление значения при котором начнется вращение}
        Zx1:=X;
        Zy1:=Y;
        Zx2:=Zx2+1;
        Zy2:=Zy2+1;
        if (abs(Zx2-Zx1)+abs(Zy2-Zy1)) > 20 then
        begin
          NachZnach:=true;
          Zx2:=X;Zy2:=Y;
        end;
        if (abs(Zx2-Zx1)+abs(Zy2-Zy1))>10 then
        begin
          NachZnachS:=true;
        end;

      //------------------------------------------------------------------------
        {СЧЕТЧИК (ВРАЩЕНИЕ ВПЕРЕД)}
        if (NachZnachS=true) and (Schetchik>=0) and (Schetchik<=100) then
        begin
          if (Y<64)and(X<64) then
          begin
            if ((x1>x2)and(y1<y2))
              or ((x1>x2)and(y1=y2))
              or ((x1=x2)and(y1<y2)) then
            begin
              Schetchik:=Schetchik+1;
              if ssLeft in shift then
                Schetchik:=Schetchik+30;
              Vpered:=true;
            end;
          end;

          if (Y<64)and(X>64) then
          begin
            if ((x1>x2) and (y1>y2))
              or ((x1>x2) and (y1=y2))
              or ((x1=x2) and (y1>y2)) then
            begin
              Schetchik:=Schetchik+1;
              if ssLeft in shift then
                Schetchik:=Schetchik+30;
              Vpered:=true;
            end;
          end;

          if (Y>64)and(X<64) then
          begin
            if ((x1<x2) and (y1<y2))
              or ((x1<x2) and (y1=y2))
              or ((x1=x2) and (y1<y2)) then
            begin
              Schetchik:=Schetchik+1;
              if ssLeft in shift then
                Schetchik:=Schetchik+30;
              Vpered:=true;
            end;
          end;

          if (Y>64) and (X>64) then
          begin
            if ((x1<x2) and (y1>y2))
              or ((x1<x2) and (y1=y2))
              or ((x1=x2) and (y1>y2)) then
            begin
              Schetchik:=Schetchik+1;
              if ssLeft in shift then
                Schetchik:=Schetchik+30;
              Vpered:=true;
            end;
          end;
        end;
        {КОНЕЦ ВРАЩЕНИЯ ВПЕРЕД}
        {СЧЕТЧИК (ВРАЩЕНИЕ НАЗАД)}
        if (NachZnachS=true) and (Schetchik>=0) and (Schetchik<=100) then
        begin
          if (Y<64) and (X<64) then
          begin
            if ((x1<x2) and (y1>y2))
              or ((x1<x2) and (y1=y2))
              or ((x1=x2) and (y1>y2)) then
            begin
              Schetchik:=Schetchik-1;
              if ssLeft in shift then
                Schetchik:=Schetchik-30;
              Vpered:=false;
            end;
          end;

          if (Y<64) and (X>64) then
          begin
            if ((x1<x2) and (y1<y2))
              or ((x1<x2) and (y1=y2))
              or ((x1=x2) and (y1<y2)) then
            begin
              Schetchik:=Schetchik-1;
              if ssLeft in shift then
                Schetchik:=Schetchik-30;
              Vpered:=false;
            end;
          end;

          if (Y>64)and(X<64) then begin
            if ((x1>x2) and (y1>y2))
              or ((x1>x2) and (y1=y2))
              or ((x1=x2) and (y1>y2)) then
            begin
              Schetchik:=Schetchik-1;
              if ssLeft in shift then
                Schetchik:=Schetchik-30;
              Vpered:=false;
            end;
          end;

          if (Y>64) and (X>64) then
          begin
            if ((x1>x2) and (y1<y2))
              or ((x1>x2) and (y1=y2))
              or ((x1=x2)and(y1<y2)) then
            begin
              Schetchik:=Schetchik-1;
              if ssLeft in shift then
                Schetchik:=Schetchik-30;
              Vpered:=false;
            end;
          end;
             L:=Schetchik;
        end;
        {КОНЕЦ ВРАЩЕНИЯ НАЗАД}
        //вывод счетчика
        if (Vpered=true) and (Schetchik>=100) then
        begin
          Schetchik:=0;
          inc(Schetchik2);
        end
        else
        begin
          if (Vpered=true) and (Schetchik>100) then
          begin
            Schetchik:=0;
            inc(Schetchik2);
          end;
        end;
        if (Vpered=false) and (Schetchik<=0) then
        begin
          Schetchik:=100;
          dec(Schetchik2);
        end
        else
        begin
          if (Vpered=false) and (Schetchik<0) then
          begin
            Schetchik:=100;
            dec(Schetchik2);
          end;
        end;
        if Schetchik2<0 then
          Schetchik2:=30;
        if Schetchik2>30 then
          Schetchik2:=0;

        waveInt := Schetchik2;
        waveFloat := Schetchik;
        edtFloat.Text:=inttostr(Schetchik);
        edtInt.Text:=inttostr(Schetchik2);

        //конец вывода счетчика
        {шкала 1}
        if Timer1.Enabled=false then
          Timer1.Enabled:=true;
        if Timer2.Enabled=false then
          Timer2.Enabled:=true;
        //----------------------------------------------------------------------
        //ВРАЩЕНИЕ ВПЕРЕД
        if NachZnach then
        begin
          If (Y<64) and (X<64) then
          begin
            If ((x1>x2) and (y1<y2))
              or ((x1>x2) and (y1=y2))
              or ((x1=x2) and (y1<y2)) then
            begin
              if i=12 then
              begin
                i:=-1;
              end;
              i:=i+1;
              ImageList1.Draw(bmp3.Canvas,0,0,i);
              Image5.Picture.Bitmap:= bmp3;
            end;
          end;

          if (Y<64) and (X>64) then
          begin
            if ((x1>x2) and (y1>y2))
              or ((x1>x2) and (y1=y2))
              or ((x1=x2) and (y1>y2)) then
            begin
              If i=12 then
              begin
                i:=-1;
              end;
              i:=i+1;
              ImageList1.Draw(bmp3.Canvas,0,0,i);
              Image5.Picture.Bitmap:= bmp3;
            end;
          end;

          if (Y > 64) and (X < 64) then
          begin
            if ((x1 < x2) and (y1 < y2))
              or ((x1 < x2) and (y1=y2))
              or ((x1 = x2) and (y1 < y2)) then
            begin
              if i = 12 then
              begin
                i := -1;
              end;
              i := i + 1;
              ImageList1.Draw(bmp3.Canvas, 0, 0, i);
              Image5.Picture.Bitmap := bmp3;
            end;
          end;

          if (Y > 64) and (X > 64) then
          begin
            if ((x1 < x2) and (y1 > y2))
              or ((x1 < x2) and (y1 = y2))
              or ((x1 = x2) and (y1 > y2)) then
            begin
              if i = 12 then
              begin
                i := -1;
              end;
              i := i + 1;
              ImageList1.Draw(bmp3.Canvas, 0, 0, i);
              Image5.Picture.Bitmap := bmp3;
            end;
          end;
        end;//КОНЕЦ ВРАЩЕНИЯ ВПЕРЕД

        //ВРАЩЕНИЕ НАЗАД
        if NachZnach then
        begin
          if (Y < 64) and (X < 64) then
          begin
            if ((x1 < x2) and (y1 > y2))
              or ((x1 < x2) and (y1 = y2))
              or ((x1 = x2) and (y1 > y2)) then
            begin
              if i = 0 then
              begin
                i := 13;
              end;

              if i = -1 then
              begin
                i := 19;
              end;

              i := i - 1;
              ImageList1.Draw(bmp3.Canvas, 0, 0, i);
              Image5.Picture.Bitmap := bmp3;
            end;
          end;


          if (Y < 64) and (X > 64) then
          begin
            if ((x1 < x2) and (y1 < y2))
              or ((x1 < x2) and (y1 = y2))
              or ((x1 = x2) and (y1 < y2)) then
            begin
              if i = 0 then
              begin
                i := 13;
              end;

              if i = -1 then
              begin
                i := 12;
              end;

              i := i-1;
              ImageList1.Draw(bmp3.Canvas, 0, 0, i);
              Image5.Picture.Bitmap := bmp3;
            end;
          end;

          if (Y>64) and (X<64) then
          begin
            if ((x1>x2) and (y1>y2))
              or ((x1>x2) and (y1=y2))
              or ((x1=x2) and (y1>y2)) then
            begin
              if i=0 then
              begin
                i:=13;
              end;
              if i=-1 then
              begin
                i:=12;
              end;
              i:=i-1;
              ImageList1.Draw(bmp3.Canvas,0,0,i);
              Image5.Picture.Bitmap:= bmp3;
            end;
          end;

          if (Y>64) and (X>64) then
          begin
            if ((x1>x2) and (y1<y2))
              or ((x1>x2) and (y1=y2))
              or ((x1=x2) and (y1<y2)) then
            begin
              if i=0 then
              begin
                i:=13;
              end;
              if i=-1 then
              begin
                i:=12;
              end;
              i:=i-1;
              ImageList1.Draw(bmp3.Canvas,0,0,i);
              Image5.Picture.Bitmap:= bmp3;
            end;
          end;
         end;
        {КОНЕЦ ВРАЩЕНИЯ НАЗАД}
        NachZnach:=false;
        Moment:=false;
      end
      else
      begin
        x2:=X;
        y2:=Y;
        Moment:=true;
      end;
    end; {конец старта}
  //Edit1.Text:=inttostr(X)+'   '+inttostr(Y);
  end; {конец глобального условия}
end;

end.
