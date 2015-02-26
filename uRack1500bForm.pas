unit uRack1500bForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, pngimage, uAdditionalFormMethods,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm;

type
  TRack1500bForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    ImageList1: TImageList;
    Image2: TImage;
    Image3: TImage;
    ImageList2: TImageList;
    ImageList3: TImageList;
    img1500b_md_osn: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    imgDropErrorClicked: TImage;
    imgDropError: TImage;

    procedure Image6Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure img1500b_md_osnClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure imgDropErrorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgDropErrorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Reload;
  public
    { Public declarations }
      bmp: tbitmap;
      Avaria:boolean;
      constructor Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;


var
Station: TStation;
  ButtonBackForm: TButtonBackForm;
  TaskController: TTaskController;
   CurFormId: Integer;
//  Rack1500bForm: TRack1500bForm;
const
idRack1500Aback= 1;
idRack1500Bback=2;
  end;

implementation

uses
  uDefinitionsDM,
  uRack1500Form,
  uEducationForm,
  uBlockWaveMeterForm,
  uStationR414Form,
  uConstantsDM;

{$R *.dfm}

constructor TRack1500bForm.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);

     CurFormId:=Half;
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;


procedure TRack1500bForm.FormCreate(Sender: TObject);
begin
  MoveFormInScreenCenter(Self);
end;

procedure TRack1500bForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TRack1500bForm.FormShow(Sender: TObject);
begin
  Reload;
end;

procedure TRack1500bForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = 27 then
  begin
    Close;
  end;
end;

procedure TRack1500bForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;

procedure TRack1500bForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //case CurFormId of
    //idRack1500Aback:
      //StationR414Form.SpawnForm(idRack1500A);
    //idRack1500Bback:
      //StationR414Form.SpawnForm(idRack1500B);
  //end;
end;

procedure TRack1500bForm.Image2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1500Aback:
      begin
        If Station.HalfSetA.Rack1500B.but1622_1 = butPositionUp then
          Station.HalfSetA.Rack1500B.but1622_1 := butPositionDown
        else
          Station.HalfSetA.Rack1500B.but1622_1 := butPositionUp;
      end;

    idRack1500Bback:
      begin
        If Station.HalfSetB.Rack1500B.but1622_1 = butPositionUp then
          Station.HalfSetB.Rack1500B.but1622_1 := butPositionDown
        else
          Station.HalfSetB.Rack1500B.but1622_1 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1500bForm.Image3Click(Sender: TObject);
begin
  case CurFormId of
    idRack1500Aback:
      begin
        If Station.HalfSetA.Rack1500B.but1622_2 = butPositionUp then
          Station.HalfSetA.Rack1500B.but1622_2 := butPositionDown
        else
          Station.HalfSetA.Rack1500B.but1622_2 := butPositionUp;
      end;

    idRack1500Bback:
      begin
        If Station.HalfSetB.Rack1500B.but1622_2 = butPositionUp then
          Station.HalfSetB.Rack1500B.but1622_2 := butPositionDown
        else
          Station.HalfSetB.Rack1500B.but1622_2 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1500bForm.Reload;
begin
  case CurFormId of
    idRack1500Aback:
      begin
        ImageList3.GetBitmap(Station.HalfSetA.Rack1500B.butMdOsn_1,
          img1500b_md_osn.Picture.Bitmap);
        ImageList3.GetBitmap(Station.HalfSetA.Rack1500B.butMdOsn_2 + 2,
          Image5.Picture.Bitmap);
        ImageList3.GetBitmap(Station.HalfSetA.Rack1500B.butMdOsn_3 + 4,
          Image6.Picture.Bitmap);
        ImageList1.GetBitmap(Station.HalfSetA.Rack1500B.but1622_1,
          Image2.Picture.Bitmap);
        ImageList1.GetBitmap(Station.HalfSetA.Rack1500B.but1622_2,
          Image3.Picture.Bitmap);
      end;

    idRack1500Bback:
      begin
        ImageList3.GetBitmap(Station.HalfSetB.Rack1500B.butMdOsn_1,
          img1500b_md_osn.Picture.Bitmap);
        ImageList3.GetBitmap(Station.HalfSetB.Rack1500B.butMdOsn_2 + 2,
          Image5.Picture.Bitmap);
        ImageList3.GetBitmap(Station.HalfSetB.Rack1500B.butMdOsn_3 + 4,
          Image6.Picture.Bitmap);
        ImageList1.GetBitmap(Station.HalfSetB.Rack1500B.but1622_1,
          Image2.Picture.Bitmap);
        ImageList1.GetBitmap(Station.HalfSetB.Rack1500B.but1622_2,
          Image3.Picture.Bitmap);
      end;
  end;

  img1500b_md_osn.Invalidate;
  Image5.Invalidate;
  Image6.Invalidate;
  Image2.Invalidate;
  Image3.Invalidate;
end;

procedure TRack1500bForm.img1500b_md_osnClick(Sender: TObject);
begin
  case CurFormId of
    idRack1500Aback:
      begin
        If Station.HalfSetA.Rack1500B.butMdOsn_1 = butPositionLeft then
        begin
          Station.HalfSetA.Rack1500B.butMdOsn_1 := butPositionRight;
        end
        else
        begin
          Station.HalfSetA.Rack1500B.butMdOsn_1 := butPositionLeft;
        end;
      end;

    idRack1500Bback:
      begin
        If Station.HalfSetB.Rack1500B.butMdOsn_1 = butPositionLeft then
        begin
          Station.HalfSetB.Rack1500B.butMdOsn_1 := butPositionRight;
        end
        else
        begin
          Station.HalfSetB.Rack1500B.butMdOsn_1 := butPositionLeft;
        end;
      end;
  end;

  Reload;
end;

procedure TRack1500bForm.Image5Click(Sender: TObject);
begin
  case CurFormId of
    idRack1500Aback:
      begin
        If Station.HalfSetA.Rack1500B.butMdOsn_2 = butPositionLeft then
          Station.HalfSetA.Rack1500B.butMdOsn_2 := butPositionRight
        else
          Station.HalfSetA.Rack1500B.butMdOsn_2 := butPositionLeft;
      end;

    idRack1500Bback:
      begin
        If Station.HalfSetB.Rack1500B.butMdOsn_2 = butPositionLeft then
          Station.HalfSetB.Rack1500B.butMdOsn_2 := butPositionRight
        else
          Station.HalfSetB.Rack1500B.butMdOsn_2 := butPositionLeft;
      end;
  end;

  Reload;
end;

procedure TRack1500bForm.Image6Click(Sender: TObject);
begin
  case CurFormId of
    idRack1500Aback:
      begin
        If Station.HalfSetA.Rack1500B.butMdOsn_3 = butPositionLeft then
          Station.HalfSetA.Rack1500B.butMdOsn_3 := butPositionRight
        else
          Station.HalfSetA.Rack1500B.butMdOsn_3 := butPositionLeft;
      end;

    idRack1500Bback:
      begin
        If Station.HalfSetB.Rack1500B.butMdOsn_3 = butPositionLeft then
          Station.HalfSetB.Rack1500B.butMdOsn_3 := butPositionRight
        else
          Station.HalfSetB.Rack1500B.butMdOsn_3 := butPositionLeft;
      end;
  end;

  Reload;
end;




procedure TRack1500bForm.imgDropErrorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1500Aback:
      begin
        Station.HalfSetA.Rack1500.DropError := True;
      end;
    idRack1500Bback:
      begin
        Station.HalfSetB.Rack1500.DropError := True;
      end;
  end;
  imgDropError.Visible := False;
end;

procedure TRack1500bForm.imgDropErrorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgDropError.Visible := True;
end;

end.
