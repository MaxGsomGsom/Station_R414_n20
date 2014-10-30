unit uBlockRemoteControllerForm;

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
  Menus,
  uDefinitionsDM,
  StdCtrls,
  uAdditionalFormMethods,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm;

type
  T_Pult = class(TForm)
    Panel1: TPanel;
    imgBG: TImage;
    ilSwPVU: TImageList;
    Image3: TImage;
    ilButCall1: TImageList;
    ilButCall3: TImageList;
    ilButCall4: TImageList;
    ilForceMachine: TImageList;
    imgButCall1: TImage;
    imgSwPVU: TImage;
    imgButCall2: TImage;
    imgButForceMachine: TImage;
    imgGeneratorConnected: TImage;
    rezLin12: TImage;
    slLin4: TImage;
    slLin5: TImage;
    slLin6: TImage;
    slLin7: TImage;
    imgInputYYConnected: TImage;
    ImageList8: TImageList;
    rezLin1: TImage;
    rezLin2: TImage;
    rezLin3: TImage;
    rezLin4: TImage;
    rezLin5: TImage;
    slLin1: TImage;
    slLin2: TImage;
    rezLin6: TImage;
    slLin3: TImage;
    rezLin7: TImage;
    rezLin8: TImage;
    rezLin9: TImage;
    rezLin10: TImage;
    rezLin11: TImage;
    rezLin13: TImage;
    rezLin14: TImage;
    imgPVU_PRM: TImage;
    imgPVU_PRD: TImage;
    imgUdA1PRD: TImage;
    imgUdA1PRM: TImage;
    imgUdA2PRD: TImage;
    imgUdA2PRM: TImage;
    imgChA1M: TImage;
    imgChA1D: TImage;
    imgAbonentA1PRD: TImage;
    imgAbonentA1PRM: TImage;
    imgUd2A1PRD: TImage;
    imgUd2A1PRM: TImage;
    imgChA2M: TImage;
    imgChA2D: TImage;
    imgAbonentA2PRD: TImage;
    imgAbonentA2PRM: TImage;
    imgUd2A2PRD: TImage;
    imgUd2A2PRM: TImage;
    imgUdA3PRD: TImage;
    imgUdA3PRM: TImage;
    imgChA3M: TImage;
    imgChA3D: TImage;
    imgAbonentA3PRD: TImage;
    imgAbonentA3PRM: TImage;
    imgUd2A3PRD: TImage;
    imgUd2A3PRM: TImage;
    imgUdA4PRD: TImage;
    imgChA4M: TImage;
    imgAbonentA4PRD: TImage;
    imgUd2A4PRD: TImage;
    imgUdA4PRM: TImage;
    imgChA4D: TImage;
    imgAbonentA4PRM: TImage;
    imgUd2A4PRM: TImage;
    imgUdA5PRD: TImage;
    imgUdA5PRM: TImage;
    imgChA5M: TImage;
    imgChA5D: TImage;
    imgAbonentA5PRD: TImage;
    imgAbonentA5PRM: TImage;
    imgUd2A5PRD: TImage;
    imgUd2A5PRM: TImage;
    imgUdA6PRD: TImage;
    imgChA6M: TImage;
    imgAbonentA6PRD: TImage;
    imgUd2A6PRD: TImage;
    imgUdA6PRM: TImage;
    imgChA6D: TImage;
    imgAbonentA6PRM: TImage;
    imgUd2A6PRM: TImage;
    imgUdA7PRD: TImage;
    imgChA7M: TImage;
    imgAbonentA7PRD: TImage;
    imgUd2A7PRD: TImage;
    imgUdA7PRM: TImage;
    imgChA7D: TImage;
    imgAbonentA7PRM: TImage;
    imgUd2A7PRM: TImage;
    imgUdB1PRD: TImage;
    imgChB1M: TImage;
    imgAbonentB1PRD: TImage;
    imgUdB1PRM: TImage;
    imgChB1D: TImage;
    imgAbonentB1PRM: TImage;
    imgUd2B1PRM: TImage;
    imgUdB2PRD: TImage;
    imgChB2M: TImage;
    imgAbonentB2PRD: TImage;
    imgUd2B2PRD: TImage;
    imgUdB2PRM: TImage;
    imgChB2D: TImage;
    imgAbonentB2PRM: TImage;
    imgUd2B2PRM: TImage;
    imgUdB3PRD: TImage;
    imgChB3M: TImage;
    imgAbonentB3PRD: TImage;
    imgUd2B3PRD: TImage;
    imgUdB3PRM: TImage;
    imgChB3D: TImage;
    imgAbonentB3PRM: TImage;
    imgUd2B3PRM: TImage;
    imgUdB4PRD: TImage;
    imgChB4M: TImage;
    imgAbonentB4PRD: TImage;
    imgUd2B4PRD: TImage;
    imgUdB4PRM: TImage;
    imgChB4D: TImage;
    imgAbonentB4PRM: TImage;
    imgUd2B4PRM: TImage;
    imgUdB5PRD: TImage;
    imgChB5M: TImage;
    imgAbonentB5PRD: TImage;
    imgUd2B5PRD: TImage;
    imgUdB5PRM: TImage;
    Image105: TImage;
    imgAbonentB5PRM: TImage;
    imgUd2B5PRM: TImage;
    imgChB5D: TImage;
    Black1: TImage;
    Black2: TImage;
    White1: TImage;
    White2: TImage;
    OnI1: TImage;
    OnI2: TImage;
    OnI3: TImage;
    OnI4: TImage;
    imgCable1_ST1: TImage;
    imgCable2_ST1: TImage;
    imgReserveLineConnected: TImage;
    imgbutPvuCallPressed: TImage;
    imgPvuCall: TImage;
    imgLightCallDiod5: TImage;
    imgLightCallDiod6: TImage;
    imgLightCallDiod7: TImage;
    imgLightCallDiod8: TImage;
    imgLightCallDiod9: TImage;
    imgButCall3: TImage;
    imgButCall4: TImage;
    ilButCall2: TImageList;
    imgChA8D: TImage;
    imgChA9D: TImage;
    imgChA10D: TImage;
    imgChA11D: TImage;
    imgChA12D: TImage;
    imgChA13D: TImage;
    imgChA14D: TImage;
    Image23: TImage;
    Image30: TImage;
    Image31: TImage;
    Image37: TImage;
    Image41: TImage;
    Image46: TImage;
    Image47: TImage;
    Image130: TImage;
    Image131: TImage;
    Image132: TImage;
    Image133: TImage;
    Image134: TImage;
    Image135: TImage;
    Image136: TImage;
    imgChA8M: TImage;
    imgChA9M: TImage;
    imgChA10M: TImage;
    imgChA11M: TImage;
    imgChA12M: TImage;
    imgChA13M: TImage;
    imgChA14M: TImage;
    Image158: TImage;
    Image159: TImage;
    Image160: TImage;
    Image161: TImage;
    Image162: TImage;
    Image163: TImage;
    Image164: TImage;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    imgChB6M: TImage;
    imgChB6D: TImage;
    imgChB7M: TImage;
    imgChB7D: TImage;
    Image11: TImage;
    Image13: TImage;
    imgUdB6PRD: TImage;
    imgUdB6PRM: TImage;
    imgUdB7PRD: TImage;
    imgUdB7PRM: TImage;
    imgAbonentB6PRD: TImage;
    imgAbonentB6PRM: TImage;
    imgUd2B6PRD: TImage;
    imgUd2B6PRM: TImage;
    imgAbonentB7PRD: TImage;
    imgAbonentB7PRM: TImage;
    imgUd2B7PRD: TImage;
    imgUd2B7PRM: TImage;
    imgUd2B1PRD: TImage;
    imgCable1_ST2: TImage;
    imgCable2_ST2: TImage;
    imgHighOhmInput1: TImage;
    imgHighOhmInput2: TImage;
    imgHighOhmInput3: TImage;
    imgHighOhmInput4: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    imgHighOhmInput8: TImage;
    imgHighOhmInput5: TImage;
    imgHighOhmInput6: TImage;
    imgHighOhmInput7: TImage;
    imgVihUKSH_NP: TImage;
    imgVihUKSH_UD: TImage;
    imgVihUKSH_UD2: TImage;
    img1ChannelUD: TImage;
    img1ChannelUD_2: TImage;
    img1ChannelUD_4PRM_PRD: TImage;
    img1ChannelUD_3: TImage;
    img1ChannelUD_4: TImage;
    img1ChannelUD_4PRM_PRD2: TImage;
    imgVihUKSH2_NP: TImage;
    imgVihUKSH2_UD: TImage;
    imgVihUKSH2_UD2: TImage;
    img2ChannelUD_4PRM_PRD: TImage;
    img2ChannelUD_4PRM_PRD2: TImage;
    img2ChannelUD_4: TImage;
    img2ChannelUD_2: TImage;
    img2ChannelUD: TImage;
    img2ChannelUD_3: TImage;
    imgMashTehObesp1: TImage;
    imgMashTehObesp2: TImage;
    Image2: TImage;
    Image9: TImage;
    Image10: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    Image29: TImage;
    Image32: TImage;
    Image33: TImage;
    Image34: TImage;
    Image35: TImage;
    Image36: TImage;
    Image38: TImage;
    Image39: TImage;
    Image40: TImage;
    Image42: TImage;
    Image43: TImage;
    Image44: TImage;
    Image45: TImage;
    Image48: TImage;
    Image49: TImage;
    Image50: TImage;
    Image51: TImage;
    Image52: TImage;
    Image53: TImage;
    Image54: TImage;
    Image55: TImage;
    Image56: TImage;
    Image57: TImage;
    Image58: TImage;
    Image59: TImage;
    Image60: TImage;
    Image61: TImage;
    Image62: TImage;
    Image63: TImage;
    Image64: TImage;
    Image65: TImage;
    Image66: TImage;
    Image67: TImage;
    Image68: TImage;
    Image69: TImage;
    Image70: TImage;
    Image71: TImage;
    Image72: TImage;
    Image73: TImage;
    Image74: TImage;
    Image75: TImage;
    Image76: TImage;
    Image77: TImage;
    Image78: TImage;
    Image79: TImage;
    Image80: TImage;
    Image81: TImage;
    Image82: TImage;
    Image83: TImage;
    Image84: TImage;
    Image85: TImage;
    Image86: TImage;
    Image87: TImage;
    Image88: TImage;
    Image89: TImage;
    Image90: TImage;
    Image91: TImage;
    Image92: TImage;
    Image93: TImage;
    Image94: TImage;
    Image95: TImage;
    Image96: TImage;
    Image97: TImage;
    Image98: TImage;
    Image99: TImage;
    Image100: TImage;
    Image101: TImage;
    Image102: TImage;
    Image103: TImage;
    Image104: TImage;
    Image106: TImage;
    Image107: TImage;
    Image108: TImage;
    Image109: TImage;
    Image110: TImage;
    Image112: TImage;
    Image114: TImage;
    Image115: TImage;
    Image117: TImage;
    Image137: TImage;
    Image138: TImage;
    Image139: TImage;
    Image140: TImage;
    Image141: TImage;
    Image142: TImage;
    Image143: TImage;
    Image144: TImage;
    Image145: TImage;
    Image146: TImage;
    Image147: TImage;
    Image148: TImage;
    Image149: TImage;
    Image150: TImage;
    Image151: TImage;
    Image152: TImage;
    Image153: TImage;
    Image154: TImage;
    Image155: TImage;
    Image156: TImage;
    Image157: TImage;
    Image165: TImage;
    Image166: TImage;
    Image167: TImage;
    Image168: TImage;
    Image169: TImage;
    Image170: TImage;
    Image171: TImage;
    Image172: TImage;
    Image173: TImage;
    Image174: TImage;
    Image175: TImage;
    Image176: TImage;
    Image177: TImage;
    Image178: TImage;
    Image179: TImage;
    Image180: TImage;
    Image181: TImage;
    Image182: TImage;
    Image183: TImage;
    Image184: TImage;
    Image185: TImage;
    Image186: TImage;
    Image187: TImage;
    Image188: TImage;
    Image189: TImage;
    Image190: TImage;
    Image191: TImage;
    Image192: TImage;
    Image193: TImage;
    Image194: TImage;
    Image195: TImage;
    Image196: TImage;
    Image197: TImage;
    Image198: TImage;
    Image199: TImage;
    Image200: TImage;
    Image201: TImage;
    Image202: TImage;
    Image203: TImage;
    Image204: TImage;
    Image205: TImage;
    Image206: TImage;
    Image207: TImage;
    Image208: TImage;
    Image209: TImage;
    Image210: TImage;
    Image211: TImage;
    Image212: TImage;
    Image213: TImage;
    Image214: TImage;
    Image215: TImage;
    Image216: TImage;
    Image217: TImage;
    Image218: TImage;
    Image219: TImage;
    Image220: TImage;
    Image221: TImage;
    Image222: TImage;
    Image223: TImage;
    Image224: TImage;
    Image225: TImage;
    Image226: TImage;
    Image227: TImage;
    Image228: TImage;
    Image229: TImage;
    Image230: TImage;
    Image231: TImage;
    Image232: TImage;
    Image233: TImage;
    Image234: TImage;
    Image235: TImage;
    Image236: TImage;
    Image237: TImage;
    Image238: TImage;
    Image239: TImage;
    Image240: TImage;
    Image241: TImage;
    Image242: TImage;
    Image243: TImage;
    Image244: TImage;
    Image245: TImage;
    Image246: TImage;
    Image247: TImage;
    Image248: TImage;
    Image249: TImage;
    Image250: TImage;
    Image251: TImage;
    Image252: TImage;
    Image253: TImage;
    Image254: TImage;
    Image255: TImage;
    Image256: TImage;
    Image257: TImage;
    Image258: TImage;
    Image259: TImage;
    Image260: TImage;
    Image261: TImage;
    Image262: TImage;
    Image263: TImage;
    Image264: TImage;
    Image265: TImage;
    Image266: TImage;
    Image267: TImage;
    Image268: TImage;
    Image269: TImage;
    Image270: TImage;
    Image271: TImage;
    Image272: TImage;
    Image273: TImage;
    Image274: TImage;
    Image275: TImage;
    Image276: TImage;
    Image277: TImage;
    Image278: TImage;
    Image279: TImage;
    Image280: TImage;
    Image281: TImage;
    Image282: TImage;
    Image283: TImage;
    Image284: TImage;
    Image285: TImage;
    Image286: TImage;
    Image287: TImage;
    Image288: TImage;
    Image289: TImage;
    Image290: TImage;
    Image291: TImage;
    Image292: TImage;
    Image293: TImage;
    Image294: TImage;
    Image295: TImage;
    Image296: TImage;
    Image297: TImage;
    Image298: TImage;
    Image299: TImage;
    Image300: TImage;
    Image301: TImage;
    Image302: TImage;
    Image303: TImage;
    Image304: TImage;
    Image305: TImage;
    Image306: TImage;
    Image307: TImage;
    Image308: TImage;
    tmrPvuCall: TTimer;
    imgLightCallDiod1: TImage;
    imgLightCallDiod2: TImage;
    Image113: TImage;
    Image119: TImage;
    Image309: TImage;
    Image310: TImage;
    imgLightCallDiod4: TImage;
    imgLightCallDiod3: TImage;
    imgbutCallLine1Pressed: TImage;
    imgbutCallLine2Pressed: TImage;
    imgbutCallLine3Pressed: TImage;
    imgbutCallLine4Pressed: TImage;
    imgbutCallLine8Pressed: TImage;
    imgbutCallLine7Pressed: TImage;
    imgbutCallLine6Pressed: TImage;
    imgbutCallLine5Pressed: TImage;
    imgbutCallLine9Pressed: TImage;
    imgButCallLine1: TImage;
    imgButCallLine2: TImage;
    imgButCallLine3: TImage;
    imgButCallLine4: TImage;
    imgButCallLine5: TImage;
    imgButCallLine6: TImage;
    imgButCallLine7: TImage;
    imgButCallLine8: TImage;
    imgButCallLine9: TImage;
    pmCell: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N111: TMenuItem;
    N121: TMenuItem;
    N211: TMenuItem;
    N221: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    imgSpawn1200A: TImage;
    imgSpawn1200B: TImage;
    imgSpawn1200APrm: TImage;
    imgSpawn1200APrd: TImage;
    pmSpawn1200BPrm: TImage;
    pmSpawn1200BPrd: TImage;
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgSwPVUMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgButCall1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgButCall2Click(Sender: TObject);
    procedure imgButCall3Click(Sender: TObject);
    procedure imgButCall4Click(Sender: TObject);
    procedure imgButForceMachineClick(Sender: TObject);
    procedure imgGeneratorConnectedClick(Sender: TObject);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure imgInputYYConnectedClick(Sender: TObject);
    procedure OnI1Click(Sender: TObject);
    procedure OnI2Click(Sender: TObject);
    procedure OnI3Click(Sender: TObject);
    procedure OnI4Click(Sender: TObject);
    procedure Image143Click(Sender: TObject);
    procedure imgCable2_ST2Click(Sender: TObject);
    procedure imgCable1_ST2Click(Sender: TObject);
    procedure imgCable2_ST1Click(Sender: TObject);
    procedure imgCable1_ST1Click(Sender: TObject);
    procedure imgGeneratorCableDisconnectedClick(Sender: TObject);
    procedure imgCableInputYYDisconnectedClick(Sender: TObject);
    procedure imgCableInputYYDisconnectedSelectedClick(Sender: TObject);
    procedure imgGeneratorCableDisconnectedSelectedClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure imgPvuCallMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgPvuCallMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmrPvuCallTimer(Sender: TObject);
    procedure imgButCallLine1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgButCallLine1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Image220MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N121Click(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure N211Click(Sender: TObject);
    procedure N221Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N12001Click(Sender: TObject);
    procedure N12002Click(Sender: TObject);
    procedure N12003Click(Sender: TObject);
    procedure N1200B1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure imgSpawn1200APrmClick(Sender: TObject);
    procedure imgSpawn1200APrdClick(Sender: TObject);
    procedure pmSpawn1200BPrmClick(Sender: TObject);
    procedure pmSpawn1200BPrdClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    procedure Reload;
    function IsGeneratorCableConnnected: Boolean;
    function IsInputYYCableConnnected: Boolean;
    procedure MoveImageToPlaceDirectly(var tmpImage: TImage;
      tmpImageMoveTo: TImage);
    function IsPlaceHolderEmpty(PlaceHolderId: Integer): Boolean;
    procedure CablePopUp;
  public
    SelectedCable: Byte;
    constructor Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController); reintroduce;
    //LastSelectedCable: Byte;   //Предыдущий взятый кабель
  end;

const
  stcblGenerator = 2;
  stcblInputYY = 3;

var
  //_Pult: T_Pult;
  ButtonBackForm: TButtonBackForm;
  Station: TStation;
  TaskController: TTaskController;
  cbUdlinitel1, cbUdlinitel2: pUdlinitelCable;
  imgsLightCallDiods: array [1..9] of ^TImage;
  imgsLightCallDiodsPressed: array [1..9] of ^TImage;
  btLeft, btTop, imgTopOffset, imgLeftOffset, btPlaceHolder: Integer;

implementation

uses
  uStationR414Form,
  uEducationForm,
  uBlockPowerPanelForm,
  uHandsetForm,
  uRack1200LeftForm,
  uRack1200RightForm,
  uBlockOscillographForm,
  uConstantsDM,
  uStationInitializer;

{$R *.dfm}

constructor T_Pult.Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;

procedure T_Pult.Reload;
var
  btA: Byte;
begin
  ilButCall1.GetBitmap(Station.RemoteController.butCall1, imgButCall1.Picture.Bitmap);
  imgButCall1.Invalidate;
  ilButCall2.GetBitmap(Station.RemoteController.butCall2, imgButCall2.Picture.Bitmap);
  imgButCall2.Invalidate;
  ilButCall3.GetBitmap(Station.RemoteController.butCall3, imgButCall3.Picture.Bitmap);
  imgButCall3.Invalidate;
  ilButCall4.GetBitmap(Station.RemoteController.butCall4, imgButCall4.Picture.Bitmap);
  imgButCall4.Invalidate;

  ilForceMachine.GetBitmap(Station.RemoteController.butForceMachine,
    imgButForceMachine.Picture.Bitmap);
  imgButForceMachine.Invalidate;
  ilSwPVU.GetBitmap(Station.RemoteController.SwPVU - 1, imgSwPVU.Picture.Bitmap);
  imgSwPVU.Invalidate;

  //Состояние лампочек приема - вызова
  for btA := 1 to 9 do
  begin
    imgsLightCallDiods[btA].Visible := Station.RemoteController.indCallLineVisible[btA];
    imgsLightCallDiods[btA].Invalidate;
  end;

  //-----------------------------------Кабели-----------------------------------
    //=============================Генератор====================================
    //--------------------------Полукомплект А----------------------------------


    //==========================Вход Указателя уровня (УУ)======================
  if cbUdlinitel1.stKonez1.stKonez <> csDisconected then
  begin
    imgCable1_ST1.Left := cbUdlinitel1.stKonez1.offsetLeft;
    imgCable1_ST1.Top := cbUdlinitel1.stKonez1.offsetTop;
  end;
  Black1.Visible := Boolean(cbUdlinitel1.stKonez1.stKonez = csDisconected);
  imgCable1_ST1.Visible :=
    Boolean(cbUdlinitel1.stKonez1.stKonez <> csDisconected);
  imgCable1_ST1.Invalidate;
  Black1.Invalidate;

  if cbUdlinitel1.stKonez2.stKonez <> csDisconected then
  begin
    imgCable1_ST2.Left := cbUdlinitel1.stKonez2.offsetLeft;
    imgCable1_ST2.Top := cbUdlinitel1.stKonez2.offsetTop;
  end;
  Black2.Visible :=
    Boolean(cbUdlinitel1.stKonez2.stKonez = csDisconected);
  imgCable1_ST2.Visible :=
    Boolean(cbUdlinitel1.stKonez2.stKonez <> csDisconected);
  imgCable1_ST2.Invalidate;
  Black2.Invalidate;

  if cbUdlinitel2.stKonez1.stKonez <> csDisconected then
  begin
    imgCable2_ST1.Left := cbUdlinitel2.stKonez1.offsetLeft;
    imgCable2_ST1.Top := cbUdlinitel2.stKonez1.offsetTop;
  end;
  White1.Visible :=
    Boolean(cbUdlinitel2.stKonez1.stKonez = csDisconected);
  imgCable2_ST1.Visible :=
    Boolean(cbUdlinitel2.stKonez1.stKonez <> csDisconected);
  imgCable2_ST1.Invalidate;
  White1.Invalidate;

  if cbUdlinitel2.stKonez2.stKonez <> csDisconected then
  begin
    imgCable2_ST2.Left := cbUdlinitel2.stKonez2.offsetLeft;
    imgCable2_ST2.Top := cbUdlinitel2.stKonez2.offsetTop;
  end;
  White2.Visible := Boolean(cbUdlinitel2.stKonez2.stKonez = csDisconected);
  imgCable2_ST2.Visible :=
    Boolean(cbUdlinitel2.stKonez2.stKonez <> csDisconected);
  imgCable2_ST2.Invalidate;
  White2.Invalidate;

  if Station.cbGenerator.stConnectedToPlaceId <> csDisconected then
  begin
    imgGeneratorConnected.Left := Station.cbGenerator.offsetLeft;
    imgGeneratorConnected.Top := Station.cbGenerator.offsetTop;
  end;
  imgGeneratorConnected.Visible :=
    Boolean(Station.cbGenerator.stConnectedToPlaceId <> csDisconected);
  imgGeneratorConnected.Invalidate;

  if Station.cbInputYY.stConnectedToPlaceId <> csDisconected then
  begin
    imgInputYYConnected.Left := Station.cbInputYY.offsetLeft;
    imgInputYYConnected.Top := Station.cbInputYY.offsetTop;
  end;
  imgInputYYConnected.Visible :=
    Boolean(Station.cbInputYY.stConnectedToPlaceId <> csDisconected);
  imgInputYYConnected.Invalidate;
end;

procedure T_Pult.tmrPvuCallTimer(Sender: TObject);

const
  dwFreq = 1200;
  dwLong = 2000;      //Продолжительность писка, мс

  procedure LightCallDiod(tmpUdlinitel: pUdlinitelCable);
  var
    btA, btLineSelected: Byte;
  begin
    btLineSelected := GetReserveLineCellIdByUdlinitelCableId(tmpUdlinitel);
    if ((btLineSelected < 9) and (btLineSelected > 4)) or
    ((btLineSelected < 20) and (btLineSelected > 14)) then
    begin
      case btLineSelected of
        5:
          btLineSelected := 1;
        6:
          btLineSelected := 2;
        7:
          btLineSelected := 3;
        8:
          btLineSelected := 4;
        15:
          btLineSelected := 5;
        16:
          btLineSelected := 6;
        17:
          btLineSelected := 7;
        18:
          btLineSelected := 8;
        19:
          btLineSelected := 9;
      end;

      for btA := 1 to Length(imgsLightCallDiods) do
      begin
        imgsLightCallDiods[btA].Visible := False;
        imgsLightCallDiods[btA].Invalidate;
      end;
      imgsLightCallDiods[btLineSelected].Visible := True;
      imgsLightCallDiods[btLineSelected].Invalidate;
    end;
  end;

  procedure BeepEx(Tone: Word = dwFreq; Duration: Word = dwLong);
  begin
    if useSounds and (SysUtils.Win32Platform = VER_PLATFORM_WIN32_NT) then
      Windows.Beep(Tone, Duration)     //издаём "бип"
    else
      Windows.Sleep(Duration);         //просто ожидаем с нажатой кнопкой
  end;

begin
  tmrPvuCall.Interval := 100;
  if Station.IsPolukomplektATuned and Station.IsPolukomplektBTuned then
  begin
    //Станция включена

    //=======================4-х канальный режим==============================
    if Station.IsChannelBlocksTunedAt4ChannelMode and (Station.RemoteController.SwPVU = 2) then
    begin
      if (IsUdlinitelCableConnectedAtModulator(cbUdlinitel1)) then
      begin
        //Определим какой именно конец подключен к модулятору
        if IsUdlinitelCableKonezConnectedAtModulator(cbUdlinitel1, 1) then
        begin
          //Подключен первый конец первого удлинительного кабеля
          //Проверим куда подключен второй конец кабеля
          if cbUdlinitel1.stKonez2.stKonez = cell_PVU_PRD then
          begin
            //Кабель подключен на передачу
            //Проверяем второй кабель
            if IsUdlinitelCableConnectedAtDeModulator(cbUdlinitel2) then
            begin
              //Определим какой именно конец подключен к демодулятору
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel2, 1) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 2) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez) = GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)) then
                    begin
                      BeepEx;
                      //Какой именно полукомплект настроен
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez1) = 2 then
                        stCallPassed.FourChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez1) = 1 then
                        stCallPassed.FourChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)].State := stPassed;
                    end;
                  end;
                end;
              end;
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel2, 2) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 1) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez) = GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)) then
                    begin
                      BeepEx;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez2) = 2 then
                        stCallPassed.FourChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez2) = 1 then
                        stCallPassed.FourChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)].State := stPassed;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
        if IsUdlinitelCableKonezConnectedAtModulator(cbUdlinitel1, 2) then
        begin
          //Подключен второй конец первого удлинительного кабеля
          //Проверим куда подключен первый конец кабеля
          if cbUdlinitel1.stKonez1.stKonez = cell_PVU_PRD then
          begin
            //Кабель подключен на передачу
            //Проверяем второй кабель
            if IsUdlinitelCableConnectedAtDeModulator(cbUdlinitel2) then
            begin
              //Определим какой именно конец подключен к демодулятору
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel2, 1) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 2) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez) = GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez) then
                  begin
                  //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)) then
                    begin
                      BeepEx;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez1) = 2 then
                        stCallPassed.FourChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez1) = 1 then
                        stCallPassed.FourChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)].State := stPassed;
                    end;
                  end;
                end;
              end;
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel2, 2) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 1) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez) = GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)) then
                    begin
                      BeepEx;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez2) = 2 then
                        stCallPassed.FourChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez2) = 1 then
                        stCallPassed.FourChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)].State := stPassed;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;

      if (IsUdlinitelCableConnectedAtModulator(cbUdlinitel2)) then
      begin
        //Определим какой именно конец подключен к модулятору
        if IsUdlinitelCableKonezConnectedAtModulator(cbUdlinitel2, 1) then
        begin
          //Подключен первый конец первого удлинительного кабеля
          //Проверим куда подключен второй конец кабеля
          if cbUdlinitel2.stKonez2.stKonez = cell_PVU_PRD then
          begin
            //Кабель подключен на передачу
            //Проверяем второй кабель
            if IsUdlinitelCableConnectedAtDeModulator(cbUdlinitel1) then
            begin
              //Определим какой именно конец подключен к демодулятору
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel1, 1) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 2) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez) = GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)) then
                    begin
                      BeepEx;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez1) = 2 then
                        stCallPassed.FourChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez1) = 1 then
                        stCallPassed.FourChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)].State := stPassed;
                    end;
                  end;
                end;
              end;
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel1, 2) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 1) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez) = GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)) then
                    begin
                      BeepEx;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez2) = 2 then
                        stCallPassed.FourChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez2) = 1 then
                        stCallPassed.FourChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)].State := stPassed;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
        if IsUdlinitelCableKonezConnectedAtModulator(cbUdlinitel2, 2) then
        begin
          //Подключен второй конец первого удлинительного кабеля
          //Проверим куда подключен первый конец кабеля
          if cbUdlinitel2.stKonez1.stKonez = cell_PVU_PRD then
          begin
            //Кабель подключен на передачу
            //Проверяем второй кабель
            if IsUdlinitelCableConnectedAtDeModulator(cbUdlinitel1) then
            begin
              //Определим какой именно конец подключен к демодулятору
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel1, 1) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 2) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez) = GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)) then
                    begin
                      BeepEx;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez1) = 2 then
                        stCallPassed.FourChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez1) = 1 then
                        stCallPassed.FourChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)].State := stPassed;
                    end;
                  end;
                end;
              end;
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel1, 2) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 1) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez) = GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)) then
                    begin
                      BeepEx;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez2) = 2 then
                        stCallPassed.FourChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez2) = 1 then
                        stCallPassed.FourChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)].State := stPassed;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;


    //=======================2-х канальный режим==============================
    if Station.IsChannelBlocksTunedAt2ChannelMode() and (Station.RemoteController.SwPVU = 1) then
    begin
      if (IsUdlinitelCableConnectedAtDeModulator(cbUdlinitel1)) then
      begin
        //Определим какой именно конец подключен к модулятору
        if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel1, 1) then
        begin
          //Подключен первый конец первого удлинительного кабеля
          //Проверим куда подключен второй конец кабеля
          if cbUdlinitel1.stKonez2.stKonez = cell_PVU_PRM then
          begin
            //Кабель подключен на передачу
            //Проверяем второй кабель
            if IsUdlinitelCableConnectedAtDeModulator(cbUdlinitel2) then
            begin
              //Определим какой именно конец подключен к демодулятору
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel2, 1) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 2) or IsUdlinitelCableConnectedAtReserveLineCell(cbUdlinitel2) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez) = GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)) then
                    begin
                      LightCallDiod(cbUdlinitel2);
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez1) = 2 then
                        stCallPassed.TwoChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez2) = 1 then
                        stCallPassed.TwoChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)].State := stPassed;
                      if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 2) then
                        BeepEx(dwFreq, dwLong)
                      else
                        Beep;
                    end;
                  end;
                end;
              end;
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel2, 2) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 1) or IsUdlinitelCableConnectedAtReserveLineCell(cbUdlinitel2) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez) = GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)) then
                    begin
                      LightCallDiod(cbUdlinitel2);
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez2) = 1 then
                        stCallPassed.TwoChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez2) = 2 then
                        stCallPassed.TwoChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez)].State := stPassed;
                      if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 1) then
                        BeepEx(dwFreq, dwLong)
                      else
                        Beep;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
        if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel1, 2) then
        begin
          //Подключен второй конец первого удлинительного кабеля
          //Проверим куда подключен первый конец кабеля
          if cbUdlinitel1.stKonez1.stKonez = cell_PVU_PRM then
          begin
            //Кабель подключен на передачу
            //Проверяем второй кабель
            if IsUdlinitelCableConnectedAtDeModulator(cbUdlinitel2) then
            begin
              //Определим какой именно конец подключен к демодулятору
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel2, 1) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 2) or IsUdlinitelCableConnectedAtReserveLineCell(cbUdlinitel2) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez) = GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)) then
                    begin
                      LightCallDiod(cbUdlinitel2);
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez1) = 2 then
                        stCallPassed.TwoChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez1) = 1 then
                        stCallPassed.TwoChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)].State := stPassed;
                      if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 2) then
                        BeepEx(dwFreq, dwLong)
                      else
                        Beep;
                    end;
                  end;
                end;
              end;
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel2, 2) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 1) or IsUdlinitelCableConnectedAtReserveLineCell(cbUdlinitel2) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez) = GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)) then
                    begin
                      LightCallDiod(cbUdlinitel2);
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez2) = 2 then
                        stCallPassed.TwoChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel2.stKonez2) = 1 then
                        stCallPassed.TwoChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez)].State := stPassed;
                      if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel2, 1) then
                        BeepEx(dwFreq, dwLong)
                      else
                        Beep;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;

      if (IsUdlinitelCableConnectedAtDeModulator(cbUdlinitel2)) then
      begin
        //Определим какой именно конец подключен к модулятору
        if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel2, 1) then
        begin
          //Подключен первый конец первого удлинительного кабеля
          //Проверим куда подключен второй конец кабеля
          if cbUdlinitel2.stKonez2.stKonez = cell_PVU_PRM then
          begin
            //Кабель подключен на передачу
            //Проверяем второй кабель
            if IsUdlinitelCableConnectedAtDeModulator(cbUdlinitel1) then
            begin
              //Определим какой именно конец подключен к демодулятору
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel1, 1) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 2) or IsUdlinitelCableConnectedAtReserveLineCell(cbUdlinitel1) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez) = GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)) then
                    begin
                      LightCallDiod(cbUdlinitel1);
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez1) = 2 then
                        stCallPassed.TwoChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez1) = 1 then
                        stCallPassed.TwoChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)].State := stPassed;
                      if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 2) then
                        BeepEx(dwFreq, dwLong)
                      else
                        Beep;
                    end;
                  end;
                end;
              end;
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel1, 2) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 1) or IsUdlinitelCableConnectedAtReserveLineCell(cbUdlinitel1)then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez) = GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)) then
                    begin
                      LightCallDiod(cbUdlinitel1);
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez2) = 1 then
                        stCallPassed.TwoChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez2) = 2 then
                        stCallPassed.TwoChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel2.stKonez1.stKonez)].State := stPassed;
                      if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 1) then
                        BeepEx(dwFreq, dwLong)
                      else
                        Beep;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
        if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel2, 2) then
        begin
          //Подключен второй конец первого удлинительного кабеля
          //Проверим куда подключен первый конец кабеля
          if cbUdlinitel2.stKonez1.stKonez = cell_PVU_PRM then
          begin
            //Кабель подключен на передачу
            //Проверяем второй кабель
            if IsUdlinitelCableConnectedAtDeModulator(cbUdlinitel1) then
            begin
              //Определим какой именно конец подключен к демодулятору
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel1, 1) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 2) or IsUdlinitelCableConnectedAtReserveLineCell(cbUdlinitel1) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez) = GetChannelIdByCellId(cbUdlinitel1.stKonez1.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)) then
                    begin
                      LightCallDiod(cbUdlinitel1);
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez1) = 1 then
                        stCallPassed.TwoChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez1) = 2 then
                        stCallPassed.TwoChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)].State := stPassed;
                      if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 2) then
                        BeepEx(dwFreq, dwLong)
                      else
                        Beep;
                    end;
                  end;
                end;
              end;
              if IsUdlinitelCableKonezConnectedAtDeModulator(cbUdlinitel1, 2) then
              begin
                //Проверим состояние другого конца кабеля
                if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 1) or IsUdlinitelCableConnectedAtReserveLineCell(cbUdlinitel1) then
                begin
                  //Проверим одинаковые ли каналы
                  if GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez) = GetChannelIdByCellId(cbUdlinitel1.stKonez2.stKonez) then
                  begin
                    //Проверим настроен ли канал
                    if Station.IsChannelTuned(GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)) then
                    begin
                      LightCallDiod(cbUdlinitel1);
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez2) = 1 then
                        stCallPassed.TwoChannelMode.ChannelA[GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)].State := stPassed;
                      if GetPolukomplektCodeByCableKonez(cbUdlinitel1.stKonez2) = 2 then
                        stCallPassed.TwoChannelMode.ChannelB[GetChannelIdByCellId(cbUdlinitel2.stKonez2.stKonez)].State := stPassed;
                      if IsUdlinitelCableKonezConnectedAtHighOhmInputCell(cbUdlinitel1, 1) then
                        BeepEx(dwFreq, dwLong)
                      else
                        Beep;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;



  end;
end;

/// <summary>
///   Переводит станцию в 4-х проводный режим (для режима Debug = True)
/// </summary>
procedure T_Pult.Button1Click(Sender: TObject);
begin
  //SetStationTo4ChannelMode;
end;

/// <summary>
///   Переводит станцию в 2-х проводный режим (для режима Debug = True)
/// </summary>
procedure T_Pult.Button2Click(Sender: TObject);
begin
  //SetStationTo2ChannelMode;
end;

procedure T_Pult.Button3Click(Sender: TObject);
begin
  Station.HalfSetA.Rack1200Left.sw1240VTune := Station.HalfSetA.Rack1200Left.sw1240VTunedValue + 6;   //Magic number.
  Station.HalfSetB.Rack1200Left.sw1240VTune := Station.HalfSetB.Rack1200Left.sw1240VTunedValue + 6;
  Station.HalfSetA.Rack1200Left.sw1240V2Tune := Station.HalfSetA.Rack1200Left.sw1240V2TunedValue + 6;
  Station.HalfSetB.Rack1200Left.sw1240V2Tune := Station.HalfSetB.Rack1200Left.sw1240V2TunedValue + 6;
  Station.HalfSetA.Rack1200Right.sw1240V2Tune := Station.HalfSetA.Rack1200Right.sw1240V2TunedValue + 6;
  Station.HalfSetB.Rack1200Right.sw1240V2Tune := Station.HalfSetB.Rack1200Right.sw1240V2TunedValue + 6;
  Station.HalfSetA.Rack1200Right.sw1240V1Tune := Station.HalfSetA.Rack1200Right.sw1240V1TunedValue + 6;
  Station.HalfSetB.Rack1200Right.sw1240V1Tune := Station.HalfSetB.Rack1200Right.sw1240V1TunedValue + 6;
  Station.HalfSetA.Rack1200Right.sw1240V3Tune := Station.HalfSetA.Rack1200Right.sw1240V3TunedValue + 6;
  Station.HalfSetB.Rack1200Right.sw1240V3Tune := Station.HalfSetB.Rack1200Right.sw1240V3TunedValue + 6;
end;

procedure T_Pult.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReturnFromRack;
end;

procedure T_Pult.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CheckFormBeforeClosing(CanClose);
end;

procedure T_Pult.FormCreate(Sender: TObject);
var
  btA: Byte;
begin
  cbUdlinitel1.stKonez1.stKonez := csDisconected;
  cbUdlinitel1.stKonez2.stKonez := csDisconected;

  cbUdlinitel2.stKonez1.stKonez := csDisconected;
  cbUdlinitel2.stKonez2.stKonez := csDisconected;

  SelectedCable := NotSelected;

  ModulatorPlacesA[1] := 15;
  ModulatorPlacesA[2] := 17;
  ModulatorPlacesA[3] := 19;
  ModulatorPlacesA[4] := 21;
  ModulatorPlacesA[5] := 23;
  ModulatorPlacesA[6] := 25;
  ModulatorPlacesA[7] := 27;
  ModulatorPlacesA[8] := 71;
  ModulatorPlacesA[9] := 73;
  ModulatorPlacesA[10] := 75;
  ModulatorPlacesA[11] := 77;
  ModulatorPlacesA[12] := 79;
  ModulatorPlacesA[13] := 81;
  ModulatorPlacesA[14] := 83;
  ModulatorPlacesA[15] := 127;
  ModulatorPlacesA[16] := 129;
  ModulatorPlacesA[17] := 131;
  ModulatorPlacesA[18] := 133;
  ModulatorPlacesA[19] := 135;
  ModulatorPlacesA[20] := 137;
  ModulatorPlacesA[21] := 139;

  ModulatorPlacesB[1] := 183;
  ModulatorPlacesB[2] := 185;
  ModulatorPlacesB[3] := 187;
  ModulatorPlacesB[4] := 189;
  ModulatorPlacesB[5] := 191;
  ModulatorPlacesB[6] := 193;
  ModulatorPlacesB[7] := 195;
  ModulatorPlacesB[8] := 239;
  ModulatorPlacesB[9] := 241;
  ModulatorPlacesB[10] := 243;
  ModulatorPlacesB[11] := 245;
  ModulatorPlacesB[12] := 247;
  ModulatorPlacesB[13] := 249;
  ModulatorPlacesB[14] := 251;
  ModulatorPlacesB[15] := 295;
  ModulatorPlacesB[16] := 297;
  ModulatorPlacesB[17] := 299;
  ModulatorPlacesB[18] := 301;
  ModulatorPlacesB[19] := 303;
  ModulatorPlacesB[20] := 305;
  ModulatorPlacesB[21] := 307;

  DeModulatorPlacesA[1] := 16;
  DeModulatorPlacesA[2] := 18;
  DeModulatorPlacesA[3] := 20;
  DeModulatorPlacesA[4] := 22;
  DeModulatorPlacesA[5] := 24;
  DeModulatorPlacesA[6] := 26;
  DeModulatorPlacesA[7] := 28;
  DeModulatorPlacesA[8] := 72;
  DeModulatorPlacesA[9] := 74;
  DeModulatorPlacesA[10] := 76;
  DeModulatorPlacesA[11] := 78;
  DeModulatorPlacesA[12] := 80;
  DeModulatorPlacesA[13] := 82;
  DeModulatorPlacesA[14] := 84;
  DeModulatorPlacesA[15] := 128;
  DeModulatorPlacesA[16] := 130;
  DeModulatorPlacesA[17] := 132;
  DeModulatorPlacesA[18] := 134;
  DeModulatorPlacesA[19] := 136;
  DeModulatorPlacesA[20] := 138;
  DeModulatorPlacesA[21] := 140;

  DeModulatorPlacesB[1] := 184;
  DeModulatorPlacesB[2] := 186;
  DeModulatorPlacesB[3] := 188;
  DeModulatorPlacesB[4] := 190;
  DeModulatorPlacesB[5] := 192;
  DeModulatorPlacesB[6] := 194;
  DeModulatorPlacesB[7] := 196;
  DeModulatorPlacesB[8] := 240;
  DeModulatorPlacesB[9] := 242;
  DeModulatorPlacesB[10] := 244;
  DeModulatorPlacesB[11] := 246;
  DeModulatorPlacesB[12] := 248;
  DeModulatorPlacesB[13] := 250;
  DeModulatorPlacesB[14] := 252;
  DeModulatorPlacesB[15] := 296;
  DeModulatorPlacesB[16] := 298;
  DeModulatorPlacesB[17] := 300;
  DeModulatorPlacesB[18] := 302;
  DeModulatorPlacesB[19] := 304;
  DeModulatorPlacesB[20] := 306;
  DeModulatorPlacesB[21] := 308;

  imgsLightCallDiods[1] := @imgLightCallDiod1;
  imgsLightCallDiods[2] := @imgLightCallDiod2;
  imgsLightCallDiods[3] := @imgLightCallDiod3;
  imgsLightCallDiods[4] := @imgLightCallDiod4;
  imgsLightCallDiods[5] := @imgLightCallDiod5;
  imgsLightCallDiods[6] := @imgLightCallDiod6;
  imgsLightCallDiods[7] := @imgLightCallDiod7;
  imgsLightCallDiods[8] := @imgLightCallDiod8;
  imgsLightCallDiods[9] := @imgLightCallDiod9;

  imgsLightCallDiodsPressed[1] := @imgbutCallLine1Pressed;
  imgsLightCallDiodsPressed[2] := @imgbutCallLine2Pressed;
  imgsLightCallDiodsPressed[3] := @imgbutCallLine3Pressed;
  imgsLightCallDiodsPressed[4] := @imgbutCallLine4Pressed;
  imgsLightCallDiodsPressed[5] := @imgbutCallLine5Pressed;
  imgsLightCallDiodsPressed[6] := @imgbutCallLine6Pressed;
  imgsLightCallDiodsPressed[7] := @imgbutCallLine7Pressed;
  imgsLightCallDiodsPressed[8] := @imgbutCallLine8Pressed;
  imgsLightCallDiodsPressed[9] := @imgbutCallLine9Pressed;

  MoveFormInScreenCenter(Self);
  Height:= Height - 20;
end;

procedure T_Pult.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure T_Pult.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;

procedure T_Pult.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure T_Pult.FormShow(Sender: TObject);
begin
  Reload;
  Visible := True;
end;

function T_Pult.IsPlaceHolderEmpty(PlaceHolderId: Integer): Boolean;
begin
  Result := True;
  //Последовательная проверка всех кабелей
  if cbUdlinitel1.stKonez1.stKonez = PlaceHolderId then
    Result := False;
  if cbUdlinitel1.stKonez2.stKonez = PlaceHolderId then
    Result := False;
  if cbUdlinitel2.stKonez1.stKonez = PlaceHolderId then
    Result := False;
  if cbUdlinitel2.stKonez2.stKonez = PlaceHolderId then
    Result := False;
  if Station.cbGenerator.stConnectedToPlaceId = PlaceHolderId then
    Result := False;
  if Station.cbInputYY.stConnectedToPlaceId = PlaceHolderId then
    Result := False;
end;

procedure T_Pult.Image143Click(Sender: TObject);
const
  imgTopOffsetA = 144;
  imgLeftOffsetA = 0;
var
  btPlaceHolder: Integer;
  btLeft, btTop, imgTopOffset, imgLeftOffset: Integer;
begin
  btPlaceHolder := 0;
  if (SelectedCable <> stcblInputYY)
      and (SelectedCable <> stcblGenerator) then
  begin
    //Если выбранный кабель - удлинитель
    imgTopOffset := imgTopOffsetA;
    imgLeftOffset := imgLeftOffsetA;
  end
  else
  begin
    imgTopOffset := 30;
    imgLeftOffset := 5;
  end;

  if (Sender is TImage) then
  begin
    btPlaceHolder := (Sender as TImage).Tag;
    btLeft := (Sender as TImage).Left - imgLeftOffset;
    btTop := (Sender as TImage).Top;
    imgTopOffset := imgTopOffset - (Sender as TImage).Height;
  end;

  if SelectedCable <> NotSelected then
  begin
    //Кабель выбран
    if IsPlaceHolderEmpty(btPlaceHolder) then
    begin
      //Если гнездо свободно
      case SelectedCable of
        stcblUdlinitel1ST1:
          begin
            if cbUdlinitel1.stKonez1.stKonez = csDisconected then
            begin
              cbUdlinitel1.stKonez1.stKonez := btPlaceHolder;
              cbUdlinitel1.stKonez1.offsetLeft := btLeft;
              cbUdlinitel1.stKonez1.offsetTop := btTop - imgTopOffset;
            end;
          end;
        stcblUdlinitel1ST2:
          begin
            if cbUdlinitel1.stKonez2.stKonez = csDisconected then
            begin
              cbUdlinitel1.stKonez2.stKonez := btPlaceHolder;
              cbUdlinitel1.stKonez2.offsetLeft := btLeft;
              cbUdlinitel1.stKonez2.offsetTop := btTop - imgTopOffset;
            end;
          end;
        stcblUdlinitel2ST1:
          begin
            if cbUdlinitel2.stKonez1.stKonez = csDisconected then
            begin
              cbUdlinitel2.stKonez1.stKonez := btPlaceHolder;
              cbUdlinitel2.stKonez1.offsetLeft := btLeft;
              cbUdlinitel2.stKonez1.offsetTop := btTop - imgTopOffset;
            end;
          end;
        stcblUdlinitel2ST2:
          begin
            if cbUdlinitel2.stKonez2.stKonez = csDisconected then
            begin
            cbUdlinitel2.stKonez2.stKonez := btPlaceHolder;
            cbUdlinitel2.stKonez2.offsetLeft := btLeft;
            cbUdlinitel2.stKonez2.offsetTop := btTop - imgTopOffset;
            end;
          end;
        stcblInputYY:
          begin
            if Station.cbInputYY.stConnectedToPlaceId = csDisconected then
            begin
              Station.cbInputYY.stConnectedToPlaceId := btPlaceHolder;
              Station.cbInputYY.offsetLeft := btLeft;
              Station.cbInputYY.offsetTop := btTop - imgTopOffset;
              Station.P321C.cblVhYY := csConnected;
            end;
          end;
        stcblGenerator:
          begin
            if Station.cbGenerator.stConnectedToPlaceId = csDisconected then
            begin
              Station.cbGenerator.stConnectedToPlaceId := btPlaceHolder;
              Station.cbGenerator.offsetLeft := btLeft;
              Station.cbGenerator.offsetTop := btTop - imgTopOffset;
              Station.P321C.cblVihGen := csConnected;
            end;
          end;
      end;
    end;
  end;

  Reload;
end;

procedure T_Pult.Image220MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  imgTopOffsetA = 144;
  imgLeftOffsetA = 0;
begin
  btPlaceHolder := 0;
  if (SelectedCable <> stcblInputYY) and (SelectedCable <> stcblGenerator) then
  begin
    //Если выбранный кабель - удлинитель
    imgTopOffset := imgTopOffsetA;
    imgLeftOffset := imgLeftOffsetA;
  end
  else
  begin
    imgTopOffset := 30;
    imgLeftOffset := 5;
  end;

  if (Sender is TImage) then
  begin
    btPlaceHolder := (Sender as TImage).Tag;
    btLeft := (Sender as TImage).Left - imgLeftOffset;
    btTop := (Sender as TImage).Top;
    imgTopOffset := imgTopOffset - (Sender as TImage).Height;
  end;
end;

procedure T_Pult.imgButCall1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Station.RemoteController.butCall1 = butPositionUp then
    Station.RemoteController.butCall1 := butPositionDown
  else
    Station.RemoteController.butCall1 := butPositionUp;
  Reload;
end;

procedure T_Pult.imgButCall2Click(Sender: TObject);
begin
  if Station.RemoteController.butCall2 = butPositionUp then
    Station.RemoteController.butCall2 := butPositionDown
  else
    Station.RemoteController.butCall2 := butPositionUp;
  Reload;
end;

procedure T_Pult.imgButCall3Click(Sender: TObject);
begin
  if Station.RemoteController.butCall3 = butPositionUp then
    Station.RemoteController.butCall3 := butPositionDown
  else
    Station.RemoteController.butCall3 := butPositionUp;
  Reload;
end;

procedure T_Pult.imgButCall4Click(Sender: TObject);
begin
  if Station.RemoteController.butCall4 = butPositionUp then
    Station.RemoteController.butCall4 := butPositionDown
  else
    Station.RemoteController.butCall4 := butPositionUp;
  Reload;
end;

procedure T_Pult.imgButCallLine1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Station.RemoteController.indCallLineVisible[(Sender as TImage).Tag] := False;
  imgsLightCallDiodsPressed[(Sender as TImage).Tag].Visible := True;
  imgsLightCallDiodsPressed[(Sender as TImage).Tag].Invalidate;
  Reload;
end;

procedure T_Pult.imgButCallLine1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgsLightCallDiodsPressed[(Sender as TImage).Tag].Visible := False;
  imgsLightCallDiodsPressed[(Sender as TImage).Tag].Invalidate;
end;

procedure T_Pult.imgButForceMachineClick(Sender: TObject);
begin
  if Station.RemoteController.butForceMachine = butPositionLeft then
    Station.RemoteController.butForceMachine := butPositionRight
  else
    Station.RemoteController.butForceMachine := butPositionLeft;
  Reload;
end;

procedure T_Pult.imgCable1_ST1Click(Sender: TObject);
begin
  imgCable1_ST1.Visible := False;
  cbUdlinitel1.stKonez1.stKonez := csDisconected;
  SelectedCable := stcblUdlinitel1ST1;

  Reload;
end;

procedure T_Pult.imgCable1_ST2Click(Sender: TObject);
begin
  imgCable1_ST2.Visible := False;
  cbUdlinitel1.stKonez2.stKonez := csDisconected;
  SelectedCable := stcblUdlinitel1ST2;

  Reload;
end;

procedure T_Pult.imgCable2_ST1Click(Sender: TObject);
begin
  imgCable2_ST1.Visible := False;
  cbUdlinitel2.stKonez1.stKonez := csDisconected;
  SelectedCable := stcblUdlinitel2ST1;

  Reload;
end;

procedure T_Pult.imgCable2_ST2Click(Sender: TObject);
begin
  imgCable2_ST2.Visible := False;
  cbUdlinitel2.stKonez2.stKonez := csDisconected;
  SelectedCable := stcblUdlinitel2ST2;

  Reload;
end;

procedure T_Pult.imgCableInputYYDisconnectedClick(Sender: TObject);
begin
  SelectedCable := stcblInputYY;
end;


procedure T_Pult.imgCableInputYYDisconnectedSelectedClick(Sender: TObject);
begin
  SelectedCable := stcblInputYY;
end;

procedure T_Pult.imgGeneratorCableDisconnectedClick(Sender: TObject);
begin
  SelectedCable := stcblGenerator;
end;

procedure T_Pult.imgGeneratorCableDisconnectedSelectedClick(Sender: TObject);
begin
  SelectedCable := stcblGenerator;
end;

procedure T_Pult.imgGeneratorConnectedClick(Sender: TObject);
begin
  Station.cbGenerator.stConnectedToPlaceId := csDisconected;
  Station.P321C.cblVihGen := csDisconected;
  SelectedCable := stcblGenerator;//Убирая с экрана вилку, считаем её выделенной

  Reload;
end;

procedure T_Pult.imgInputYYConnectedClick(Sender: TObject);
begin
  Station.cbInputYY.stConnectedToPlaceId := csDisconected;
  Station.P321C.cblVhYY := csDisconected;
  SelectedCable := stcblInputYY; //Убирая с экрана вилку, считаем её выделенной

  Reload;
end;

procedure T_Pult.imgPvuCallMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgbutPvuCallPressed.Visible := True;
  imgbutPvuCallPressed.Invalidate;
  tmrPvuCall.Interval := 1;
  tmrPvuCall.Enabled := True;
end;

procedure T_Pult.imgPvuCallMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  tmrPvuCall.Enabled := False;
  imgbutPvuCallPressed.Visible := False;
  imgbutPvuCallPressed.Invalidate;
end;

procedure T_Pult.MoveImageToPlaceDirectly(var tmpImage: TImage; tmpImageMoveTo: TImage);
begin
  tmpImage.Left := tmpImageMoveTo.Left;
  tmpImage.Top := tmpImageMoveTo.Top - tmpImage.Height + tmpImageMoveTo.Height;
  tmpImage.Invalidate;
end;

procedure T_Pult.N111Click(Sender: TObject);
begin
  SelectedCable := stcblUdlinitel1ST1;
  CablePopUp;
end;

procedure T_Pult.N12001Click(Sender: TObject);
begin
// Этот обработчик стоит нафиг удалить
{
  StationR414Form.SpawnForm(idRack1200A1);
  JmpFormId := idRack1200A1;
  }
end;

procedure T_Pult.N12002Click(Sender: TObject);
begin
// Этот обработчик стоит нафиг удалить
{
  StationR414Form.SpawnForm(idRack1200A2);
  JmpFormId := idRack1200A2;
  }
end;

procedure T_Pult.N12003Click(Sender: TObject);
begin
  //StationR414Form.SpawnForm(idRack1200B1);
  JmpFormId := idRack1200B1;
end;

procedure T_Pult.N1200B1Click(Sender: TObject);
begin
  //StationR414Form.SpawnForm(idRack1200B2);
  JmpFormId := idRack1200B2;
end;

procedure T_Pult.N121Click(Sender: TObject);
begin
  SelectedCable := stcblUdlinitel1ST2;
  CablePopUp;
end;

procedure T_Pult.N1Click(Sender: TObject);
begin
  SelectedCable := stcblGenerator;
  CablePopUp;
end;

procedure T_Pult.N211Click(Sender: TObject);
begin
  SelectedCable := stcblUdlinitel2ST1;
  CablePopUp;
end;

procedure T_Pult.N221Click(Sender: TObject);
begin
  SelectedCable := stcblUdlinitel2ST2;
  CablePopUp;
end;

procedure T_Pult.N2Click(Sender: TObject);
begin
  SelectedCable := stcblInputYY;
  CablePopUp;
end;

procedure T_Pult.imgSpawn1200APrdClick(Sender: TObject);
begin
  //StationR414Form.SpawnForm(idRack1200A2);
  JmpFormId := idRack1200A2;
end;

procedure T_Pult.imgSpawn1200APrmClick(Sender: TObject);
begin
  //StationR414Form.SpawnForm(idRack1200A1);
  JmpFormId := idRack1200A1;
end;

procedure T_Pult.imgSwPVUMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.RemoteController.SwPVU < 4) then
    Inc(Station.RemoteController.SwPVU, 1);
  if (Button = mbRight) and (Station.RemoteController.SwPVU > 1) then
    Dec(Station.RemoteController.SwPVU , 1);

  Reload;
end;

function T_Pult.IsGeneratorCableConnnected: Boolean;
begin
  Result := Boolean((Station.RemoteController.stGeneratorCableConnectedAtPortA <> NotSelected) or
  (Station.RemoteController.stGeneratorCableConnectedAtPortB <> NotSelected));
end;

function T_Pult.IsInputYYCableConnnected: Boolean;
begin
  Result := Boolean((Station.RemoteController.stInputYYCableConnectedAtPortA <> NotSelected) or
  (Station.RemoteController.stInputYYCableConnectedAtPortB <> NotSelected));
end;

procedure T_Pult.OnI1Click(Sender: TObject);
begin
  SelectedCable := stcblUdlinitel1ST1;
end;

procedure T_Pult.OnI2Click(Sender: TObject);
begin
  SelectedCable := stcblUdlinitel1ST2;
end;

procedure T_Pult.OnI3Click(Sender: TObject);
begin
   SelectedCable := stcblUdlinitel2ST1;
end;

procedure T_Pult.OnI4Click(Sender: TObject);
begin
   SelectedCable := stcblUdlinitel2ST2;
end;

procedure T_Pult.pmSpawn1200BPrdClick(Sender: TObject);
begin
  //StationR414Form.SpawnForm(idRack1200B2);
  JmpFormId := idRack1200B2;
end;

procedure T_Pult.pmSpawn1200BPrmClick(Sender: TObject);
begin
  //StationR414Form.SpawnForm(idRack1200B1);
  JmpFormId := idRack1200B1;
end;

procedure T_Pult.CablePopUp;
begin
  if SelectedCable <> NotSelected then
  begin
    //Кабель выбран
    if IsPlaceHolderEmpty(btPlaceHolder) then
    begin
      //Если гнездо свободно
      case SelectedCable of
        stcblUdlinitel1ST1:
          begin
            cbUdlinitel1.stKonez1.stKonez := btPlaceHolder;
            cbUdlinitel1.stKonez1.offsetLeft := btLeft;
            cbUdlinitel1.stKonez1.offsetTop := btTop - imgTopOffset;
          end;
        stcblUdlinitel1ST2:
          begin
            cbUdlinitel1.stKonez2.stKonez := btPlaceHolder;
            cbUdlinitel1.stKonez2.offsetLeft := btLeft;
            cbUdlinitel1.stKonez2.offsetTop := btTop - imgTopOffset;
          end;
        stcblUdlinitel2ST1:
          begin
            cbUdlinitel2.stKonez1.stKonez := btPlaceHolder;
            cbUdlinitel2.stKonez1.offsetLeft := btLeft;
            cbUdlinitel2.stKonez1.offsetTop := btTop - imgTopOffset;
          end;
        stcblUdlinitel2ST2:
          begin
            cbUdlinitel2.stKonez2.stKonez := btPlaceHolder;
            cbUdlinitel2.stKonez2.offsetLeft := btLeft;
            cbUdlinitel2.stKonez2.offsetTop := btTop - imgTopOffset;
          end;
        stcblInputYY:
          begin
            Station.cbInputYY.stConnectedToPlaceId := btPlaceHolder;
            Station.cbInputYY.offsetLeft := btLeft;
            Station.cbInputYY.offsetTop := btTop;// - imgTopOffset;
            Station.P321C.cblVhYY := csConnected;
          end;
        stcblGenerator:
          begin
            Station.cbGenerator.stConnectedToPlaceId := btPlaceHolder;
            Station.cbGenerator.offsetLeft := btLeft;
            Station.cbGenerator.offsetTop := btTop;// - imgTopOffset;
            Station.P321C.cblVihGen := csConnected;
          end;
      end;
    end;
  end;

  Reload;
end;

end.
