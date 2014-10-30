unit uRack1600BForm;

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
  jpeg,
  ExtCtrls,
  ImgList,
  pngimage,
  uAdditionalFormMethods,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm;

type
  TRack1600BForm = class(TForm)
    {$REGION 'ќбъ€вление элементов формы'}
    Panel1: TPanel;
    imgBG: TImage;
    ImageList1: TImageList;
    il1621Main: TImageList;
    img1621Main: TImage;
    ilKukushka: TImageList;
    imgKukushka: TImage;
    img1621Reserve: TImage;
    il1621Reserve: TImageList;
    imgUGS: TImage;
    ilUGS: TImageList;
    imgUGS2: TImage;
    ilUPT: TImageList;
    imgUPT: TImage;
    imgUPT2: TImage;
    img1622Main: TImage;
    il1622Main: TImageList;
    il1622Reserve: TImageList;
    img1622Reserve: TImage;
    imgDropError: TImage;
    imgDropErrorPressed: TImage;
    img1621MainLight: TImage;
    img1621ReserveLight: TImage;
    img1622MainLight: TImage;
    img1622ReserveLight: TImage;
    imgCloseMeBG: TImage;
    imgCloseMe: TImage;
    {$ENDREGION}

    {$REGION 'ќбъ€вление обработчиков событий формы'}
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
                                  MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
                                MousePos: TPoint; var Handled: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    {$ENDREGION}

    {$REGION 'ќбъ€вление обработчиков событий элементов формы'}
    procedure imgKukushkaMouseDown(Sender: TObject; Button: TMouseButton;
                                    Shift: TShiftState; X, Y: Integer);
    procedure imgUGSMouseDown(Sender: TObject; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
    procedure imgUGS2MouseDown(Sender: TObject; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
    procedure imgUPT2Click(Sender: TObject);
    procedure imgUPTClick(Sender: TObject);
    procedure img1622ReserveClick(Sender: TObject);
    procedure img1622MainClick(Sender: TObject);
    procedure img1621ReserveClick(Sender: TObject);
    procedure img1621MainClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgDropErrorMouseDown(Sender: TObject; Button: TMouseButton;
                                    Shift: TShiftState; X, Y: Integer);
    procedure imgDropErrorMouseUp(Sender: TObject; Button: TMouseButton;
                                  Shift: TShiftState; X, Y: Integer);
    procedure imgCloseMeClick(Sender: TObject);
    procedure imgCloseMeBGMouseEnter(Sender: TObject);
    procedure imgCloseMeMouseLeave(Sender: TObject);
    {$ENDREGION}

  
  private
    { Private declarations }
    procedure Reload;
  public
    { Public declarations }
    bmp: tbitmap;
    i,p,g,l,s,t,o,t1,t2,Skrol:integer;    // то так назвал переменные?? ѕечаль..
    Avaria3:boolean;
    constructor Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;
  end;


implementation

uses
  uDefinitionsDM,
  uRack1600Form,
  uEducationForm,
  uBlockWaveMeterForm,
  uStationR414Form,
  uConstantsDM;

  var
  CurFormId : Integer;
  ButtonBackForm: TButtonBackForm;
  Station: TStation;
  TaskController: TTaskController;

  const
  idRack1600Aback=1;
  idRack1600Bback=2;

{$R *.dfm}

constructor TRack1600BForm.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  CurFormId:=Half;
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;

{$REGION 'ќбработчики событий элементов формы'}
procedure TRack1600BForm.img1621MainClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600Aback:
      begin
        if Station.HalfSetA.Rack1600B.but1621Main = butPositionUp then
          Station.HalfSetA.Rack1600B.but1621Main := butPositionDown
        else
          Station.HalfSetA.Rack1600B.but1621Main := butPositionUp;
      end;

    idRack1600Bback:
      begin
        if Station.HalfSetB.Rack1600B.but1621Main = butPositionUp then
          Station.HalfSetB.Rack1600B.but1621Main := butPositionDown
        else
          Station.HalfSetB.Rack1600B.but1621Main := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1600BForm.img1621ReserveClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600Aback:
      begin
        if Station.HalfSetA.Rack1600B.but1621Reserve = butPositionUp then
          Station.HalfSetA.Rack1600B.but1621Reserve := butPositionDown
        else
          Station.HalfSetA.Rack1600B.but1621Reserve := butPositionUp;
      end;

    idRack1600Bback:
      begin
        if Station.HalfSetB.Rack1600B.but1621Reserve = butPositionUp then
          Station.HalfSetB.Rack1600B.but1621Reserve := butPositionDown
        else
          Station.HalfSetB.Rack1600B.but1621Reserve := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1600BForm.img1622MainClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600Aback:
      begin
        if Station.HalfSetA.Rack1600B.but1622Main = butPositionUp then
          Station.HalfSetA.Rack1600B.but1622Main := butPositionDown
        else
          Station.HalfSetA.Rack1600B.but1622Main := butPositionUp;
      end;

    idRack1600Bback:
      begin
        if Station.HalfSetB.Rack1600B.but1622Main = butPositionUp then
          Station.HalfSetB.Rack1600B.but1622Main := butPositionDown
        else
          Station.HalfSetB.Rack1600B.but1622Main := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1600BForm.img1622ReserveClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600Aback:
      begin
        if Station.HalfSetA.Rack1600B.but1622Reserve = butPositionUp then
          Station.HalfSetA.Rack1600B.but1622Reserve := butPositionDown
        else
          Station.HalfSetA.Rack1600B.but1622Reserve := butPositionUp;
      end;

    idRack1600Bback:
      begin
        if Station.HalfSetB.Rack1600B.but1622Reserve = butPositionUp then
          Station.HalfSetB.Rack1600B.but1622Reserve := butPositionDown
        else
          Station.HalfSetB.Rack1600B.but1622Reserve := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1600BForm.imgCloseMeBGMouseEnter(Sender: TObject);
begin
  imgCloseMe.Show;
  imgCloseMeBG.Visible := False;
end;

procedure TRack1600BForm.imgCloseMeClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600Aback:
        (Parent as TStationR414Form).SpawnForm(idRack1600A);
    idRack1600Bback:
        (Parent as TStationR414Form).SpawnForm(idRack1600B);
  end;

  Close;
end;

procedure TRack1600BForm.imgCloseMeMouseLeave(Sender: TObject);
begin
  imgCloseMe.Visible := False;
  imgCloseMeBG.Visible := False;
  imgCloseMeBG.Show;
end;

procedure TRack1600BForm.imgDropErrorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgDropError.Visible := False;
  case CurFormId of
    idRack1600Aback:
      Station.HalfSetA.Rack1600.DropError := True;
    idRack1600Bback:
      Station.HalfSetB.Rack1600.DropError := True;
  end;
end;

procedure TRack1600BForm.imgDropErrorMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgDropError.Visible := True;
end;

procedure TRack1600BForm.imgKukushkaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1600Aback:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1600B.swKukushka < 2) then
          Inc(Station.HalfSetA.Rack1600B.swKukushka, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1600B.swKukushka > 1) then
          Dec(Station.HalfSetA.Rack1600B.swKukushka, 1);
      end;

    idRack1600Bback:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1600B.swKukushka < 2) then
          Inc(Station.HalfSetB.Rack1600B.swKukushka, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1600B.swKukushka > 1) then
          Dec(Station.HalfSetB.Rack1600B.swKukushka, 1);
      end;
  end;

  Reload;
end;

procedure TRack1600BForm.imgUGS2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1600Aback:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1600B.swUGS2 < 5) then
          Inc(Station.HalfSetA.Rack1600B.swUGS2, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1600B.swUGS2 > 1) then
          Dec(Station.HalfSetA.Rack1600B.swUGS2, 1);
      end;

    idRack1600Bback:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1600B.swUGS2 < 5) then
          Inc(Station.HalfSetB.Rack1600B.swUGS2, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1600B.swUGS2 > 1) then
          Dec(Station.HalfSetB.Rack1600B.swUGS2, 1);
      end;
  end;

  Reload;
end;

procedure TRack1600BForm.imgUGSMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1600Aback:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1600B.swUGS < 5) then
          Inc(Station.HalfSetA.Rack1600B.swUGS, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1600B.swUGS > 1) then
          Dec(Station.HalfSetA.Rack1600B.swUGS, 1);
      end;

    idRack1600Bback:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1600B.swUGS < 5) then
          Inc(Station.HalfSetB.Rack1600B.swUGS, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1600B.swUGS > 1) then
          Dec(Station.HalfSetB.Rack1600B.swUGS, 1);
      end;
  end;

  Reload;
end;

procedure TRack1600BForm.imgUPT2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1600Aback:
      begin
        if Station.HalfSetA.Rack1600B.butUPT2 = butPositionLeft then
          Station.HalfSetA.Rack1600B.butUPT2 := butPositionRight
        else
          Station.HalfSetA.Rack1600B.butUPT2 := butPositionLeft;
      end;

    idRack1600Bback:
      begin
        if Station.HalfSetB.Rack1600B.butUPT2 = butPositionLeft then
          Station.HalfSetB.Rack1600B.butUPT2 := butPositionRight
        else
          Station.HalfSetB.Rack1600B.butUPT2 := butPositionLeft;
      end;
  end;

  Reload;
end;

procedure TRack1600BForm.imgUPTClick(Sender: TObject);
begin
  case CurFormId of
    idRack1600Aback:
      begin
        if Station.HalfSetA.Rack1600B.butUPT = butPositionLeft then
          Station.HalfSetA.Rack1600B.butUPT := butPositionRight
        else
          Station.HalfSetA.Rack1600B.butUPT := butPositionLeft;
      end;

    idRack1600Bback:
      begin
        if Station.HalfSetB.Rack1600B.butUPT = butPositionLeft then
          Station.HalfSetB.Rack1600B.butUPT := butPositionRight
        else
          Station.HalfSetB.Rack1600B.butUPT := butPositionLeft;
      end;
  end;

  Reload;
end;
{$ENDREGION}

{$REGION 'ќбработчики событий формы'}
procedure TRack1600BForm.FormCreate(Sender: TObject);
begin
  MoveFormInScreenCenter(Self);
end;

procedure TRack1600BForm.FormShow(Sender: TObject);
begin
  Reload;
end;

procedure TRack1600BForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = 27 then
  begin
    Self.Close;
  end;
end;

procedure TRack1600BForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  case CurFormId of
//    idRack1600Aback:
//        (Parent as TStationR414Form).SpawnForm(idRack1600A);
//    idRack1600Bback:
//        (Parent as TStationR414Form).SpawnForm(idRack1600B);
//  end;
end;
{$ENDREGION}

{$REGION 'ѕрокрутка изображени€ колесом мыши'}
procedure TRack1600BForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TRack1600BForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;
{$ENDREGION}

{$REGION 'TRack1600BForm.Reload()'}
procedure TRack1600BForm.Reload();
begin
  case CurFormId of
    idRack1600Aback:
      begin
        ilKukushka.GetBitmap(Station.HalfSetA.Rack1600B.swKukushka - 1, imgKukushka.Picture.Bitmap);

        il1622Main.GetBitmap(Station.HalfSetA.Rack1600B.but1622Main, img1622Main.Picture.Bitmap);
        il1622Reserve.GetBitmap(Station.HalfSetA.Rack1600B.but1622Reserve, img1622Reserve.Picture.Bitmap);

        il1621Main.GetBitmap(Station.HalfSetA.Rack1600B.but1621Main, img1621Main.Picture.Bitmap);
        il1621Reserve.GetBitmap(Station.HalfSetA.Rack1600B.but1621Reserve, img1621Reserve.Picture.Bitmap);

        ilUPT.GetBitmap(Station.HalfSetA.Rack1600B.butUPT, imgUPT.Picture.Bitmap);
        ilUPT.GetBitmap(Station.HalfSetA.Rack1600B.butUPT2, imgUPT2.Picture.Bitmap );

        ilUGS.GetBitmap(Station.HalfSetA.Rack1600B.swUGS, imgUGS.Picture.Bitmap);
        ilUGS.GetBitmap(Station.HalfSetA.Rack1600B.swUGS2, imgUGS2.Picture.Bitmap);

        if Station.IsPluggedIn then
        begin
          img1622MainLight.Visible := Boolean(Station.HalfSetA.Rack1600B.but1622Main = butPositionUp);
          img1622ReserveLight.Visible := Boolean(Station.HalfSetA.Rack1600B.but1622Reserve = butPositionUp);
          img1621ReserveLight.Visible := Boolean(Station.HalfSetA.Rack1600B.but1621Reserve = butPositionUp);
          img1621MainLight.Visible := Boolean(Station.HalfSetA.Rack1600B.but1621Main = butPositionUp);
        end
        else
        begin
          img1622MainLight.Visible := False;
          img1622ReserveLight.Visible := False;
          img1621ReserveLight.Visible := False;
          img1621MainLight.Visible := False;
        end;
      end;

    idRack1600Bback:
      begin
        ilKukushka.GetBitmap(Station.HalfSetB.Rack1600B.swKukushka - 1, imgKukushka.Picture.Bitmap);

        il1622Main.GetBitmap(Station.HalfSetB.Rack1600B.but1622Main, img1622Main.Picture.Bitmap);
        il1622Reserve.GetBitmap(Station.HalfSetB.Rack1600B.but1622Reserve, img1622Reserve.Picture.Bitmap);

        il1621Main.GetBitmap(Station.HalfSetB.Rack1600B.but1621Main, img1621Main.Picture.Bitmap);
        il1621Reserve.GetBitmap(Station.HalfSetB.Rack1600B.but1621Reserve, img1621Reserve.Picture.Bitmap);


        ilUPT.GetBitmap(Station.HalfSetB.Rack1600B.butUPT, imgUPT.Picture.Bitmap);
        ilUPT.GetBitmap(Station.HalfSetB.Rack1600B.butUPT2, imgUPT2.Picture.Bitmap );

        ilUGS.GetBitmap(Station.HalfSetB.Rack1600B.swUGS, imgUGS.Picture.Bitmap);
        ilUGS.GetBitmap(Station.HalfSetB.Rack1600B.swUGS2, imgUGS2.Picture.Bitmap);

        if Station.IsPluggedIn then
        begin
          img1622MainLight.Visible := Boolean(Station.HalfSetB.Rack1600B.but1622Main = butPositionUp);
          img1622ReserveLight.Visible := Boolean(Station.HalfSetB.Rack1600B.but1622Reserve = butPositionUp);
          img1621ReserveLight.Visible := Boolean(Station.HalfSetB.Rack1600B.but1621Reserve = butPositionUp);
          img1621MainLight.Visible := Boolean(Station.HalfSetB.Rack1600B.but1621Main = butPositionUp);
        end
        else
        begin
          img1622MainLight.Visible := False;
          img1622ReserveLight.Visible := False;
          img1621ReserveLight.Visible := False;
          img1621MainLight.Visible := False;
        end;
      end;
  end;

  img1622MainLight.Invalidate;
  img1622ReserveLight.Invalidate;
  img1621ReserveLight.Invalidate;
  img1621MainLight.Invalidate;
  img1622Main.Invalidate;
  img1622Reserve.Invalidate;
  img1621Main.Invalidate;
  img1621Reserve.Invalidate;
  imgUPT.Invalidate;
  imgUPT2.Invalidate;
  imgUGS.Invalidate;
  imgUGS2.Invalidate;
  imgKukushka.Invalidate;
end;
{$ENDREGION}


end.
