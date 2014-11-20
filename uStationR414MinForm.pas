unit uStationR414MinForm;

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
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
  uConstantsDM;

type
  TStationR414MinForm = class(TForm)
    lblGenerator_A: TLabel;
    lblMshu_A: TLabel;
    lblDuplexer_A: TLabel;
    lblRack1500_A: TLabel;
    lblRack1920_A: TLabel;
    lblRack1200_receiver_A: TLabel;
    lblRack1600_A: TLabel;
    lblRack1200_broadcaster_A: TLabel;
    lblWavemeter_A: TLabel;
    lblP321_A: TLabel;
    lblRack1710_A: TLabel;
    lblConsole_A: TLabel;
    lblConsole_B: TLabel;
    lblP321_B: TLabel;
    lblOscillograph: TLabel;
    lblPower_supply_C: TLabel;
    lblRack1400_B: TLabel;
    lblRack1200_receiver_B: TLabel;
    lblRack1200_broadcaster_B: TLabel;
    lblP321_C: TLabel;
    lblWavemeter_B: TLabel;
    lblRack1600_B: TLabel;
    lblRack1920_B: TLabel;
    lblRack1500_B: TLabel;
    lblDuplexer_B: TLabel;
    lblPower_panel: TLabel;
    lblGenerator_B: TLabel;
    lblMshu_B: TLabel;
    imgTemporary: TImage;
    paintBoxBackground: TPaintBox;
    btnDeploy: TImage;
    {$ENDREGION}
    {$REGION 'Обработчики событий компонентов'}
    procedure RackWasClosedHandler(var Msg : TMessage);
        message MM_RACK_WAS_CLOSED; //Обработчик события "Закрытие окна стойки"

    procedure lblGenerator_AClick(Sender: TObject);
    procedure lblMshu_AClick(Sender: TObject);
    procedure lblDuplexer_AClick(Sender: TObject);
    procedure lblGenerator_BClick(Sender: TObject);
    procedure lblMshu_BClick(Sender: TObject);
    procedure lblRack1200_receiver_AClick(Sender: TObject);
    procedure lblRack1200_broadcaster_AClick(Sender: TObject);
    procedure lblP321_AClick(Sender: TObject);
    procedure lblWavemeter_AClick(Sender: TObject);
    procedure lblRack1500_AClick(Sender: TObject);
    procedure lblRack1920_AClick(Sender: TObject);
    procedure lblRack1600_AClick(Sender: TObject);
    procedure lblRack1200_receiver_BClick(Sender: TObject);
    procedure lblRack1200_broadcaster_BClick(Sender: TObject);
    procedure lblRack1600_BClick(Sender: TObject);
    procedure lblRack1920_BClick(Sender: TObject);
    procedure lblRack1500_BClick(Sender: TObject);
    procedure lblWavemeter_BClick(Sender: TObject);
    procedure lblP321_CClick(Sender: TObject);
    procedure lblPower_panelClick(Sender: TObject);
    procedure lblDuplexer_BClick(Sender: TObject);
    procedure lblRack1710_AClick(Sender: TObject);
    procedure lblRack1400_BClick(Sender: TObject);
    procedure lblOscillographClick(Sender: TObject);
    procedure lblP321_BClick(Sender: TObject);
    procedure lblPower_supply_CClick(Sender: TObject);
    procedure lblConsole_AClick(Sender: TObject);
    procedure lblConsole_BClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure btnDeployMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    {$ENDREGION}

  private
    {$REGION 'private elements'}
    //StationR414Form: TStationR414Form;               //Указатель на соответствующую форму StationR414Form
    focusRect: TRect;          //Прямоугольник, содержащий размеры и положение
                               //рамки выделения
    selectedRack: TRacksEnum;  //Выбранная стойка
    isMinimized : Boolean;     //Флаг (true - форма свёрнута)
    executer : TForms_executer;//Класс с дополнительными функциями

    bmpMinimizeBtn: TBitmap;   //Изображение кнопки "свернуть"
    bmpMaximizeBtn: TBitmap;   //Изображение кнопки "развернуть"
    bmpMoveBtn    : TBitmap;   //Изображение кнопки "перемещение"
    bmpDeployBtn  : TBitmap;   //Изображение кнопки "показать крупным планом"
    bmpBackground : TBitmap;   //Фон  - изображение станции

    procedure DrawRectangle(); //Рисует на форме рамку выделения
    procedure SetFocusRect();  //Изменяет координаты и размеры рамки выделения
    procedure ExecR414MethodClick(selectedRack: TRacksEnum);
    procedure MinimizeOrMaximize(); //Минимизирет или максимизирует форму
    procedure DragMove();      //Перемещает изображении формы при перетаскивании
    procedure DeployMainStationR414Form();//Открывает основную (крупную) форму StationR414Form

//    procedure Restore(var msg: TWMSysCommand); message WM_SYSCOMMAND;
    {$ENDREGION}

  public
    {$REGION 'public elements'}
                               //Сохраняем ссылку на StationR414Form, чтобы получить
                               //доступ к его методам
    constructor Create(Sender1: TComponent); reintroduce;

    procedure Show(); overload; //Перегружаем метод Show

    procedure SetFormPosition(x, y: Integer);
    procedure SelectRack(selectedR : TracksEnum);
    {$ENDREGION}
  end;


////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
implementation

     uses
     uStationR414Form;
{$R *.dfm}


var
  StationR414Form: TStationR414Form;

{$REGION 'Реализация кнопок управления формой'}
/// <summary>
/// Минимизирует/максимизирует форму
/// </summary>
procedure TStationR414MinForm.MinimizeOrMaximize();
begin
   if (not isMinimized) then
   begin
      //Сворачиваем форму и меняем картинку кнопки минимизации
      //Self.ClientHeight := btnMinimize.Height;
      //Self.ClientWidth  := btnMinimize.Width * 2;
      //btnMinimize.Picture.Bitmap := bmpMinimizeBtn;
   end
   else
   begin
      //Разворачиваем форму и меняем картинку кнопки минимизации
      Self.ClientHeight := R414miniFormHeight;
      Self.ClientWidth  := R414miniFormWidth;
      //btnMinimize.Picture.Bitmap := bmpMaximizeBtn;

      DrawRectangle();                //Используем для отрисовки формы
                                      //после масштабирования
   end;
   isMinimized := not isMinimized;

   Self.Repaint;                      //Перерисовываем форму
end;



/// <summary>
/// Реализует перемещение формы, если тянуть за картинку.
/// Вызывать при событии MouseDown
/// </summary>
procedure TStationR414MinForm.DragMove();
const
  SC_DragMove = $F012;  //A magic number))
begin
  ReleaseCapture;
  self.Perform(WM_SysCommand, SC_DragMove, 0);

  //Восстанавливаем разрушенное при перемещении изображение
  DrawRectangle();
  Self.Repaint();
end;

/// <summary>
/// Показывает общий вид Р414 (крупный)
/// </summary>
procedure TStationR414MinForm.DeployMainStationR414Form();
begin
  paintBoxBackground.OnClick(nil);
  //selectedRack := none;
  SetFocusRect();
  //StationR414Form.Show();
end;

/// <summary>
/// Обработчик события "Закрытие окна стойки"
/// </summary>
/// <param name="msg"></param>
procedure TStationR414MinForm.RackWasClosedHandler(var msg : TMessage);
begin
  case selectedRack of
     Rack_1500_back_A,
     Rack_1500_back_B,
     Rack_1600_back_A,
     Rack_1600_back_B:
     begin
       executer.CloseForm(selectedRack, False);
     end;
  else
     Self.DeployMainStationR414Form();
  end;
end;

/// <summary>
/// Обработчик нажатия на кнопку "Развенуть"
/// </summary>
procedure TStationR414MinForm.btnDeployMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Self.DeployMainStationR414Form;
end;
{$ENDREGION}

constructor TStationR414MinForm.Create(Sender1: TComponent);
begin
  inherited Create(Sender1);
  isMinimized := False;       //Форма при создании развёрнута
  focusRect.Left := 0;
  focusRect.Top := 0;
  focusRect.Right := 0;
  focusRect.Bottom := 0;

  StationR414Form := Sender1 as TStationR414Form;
  //executer.Create();

  SetFormPosition(0,
                  Screen.Height - GetTaskBarHeight() - R414miniFormHeight);
  Self.ClientHeight := R414miniFormHeight;
  Self.ClientWidth  := R414miniFormWidth;

  ////////////////////////////////////////
  ///  Загрузка изображений из файлов  ///
  //  (Возможно стоит переделать в загрузку из ресурсов)
  bmpBackground := Tbitmap.Create();
  bmpBackground.LoadFromFile('images/mainViewMini.bmp');
//  bmpMinimizeBtn := TBitmap.Create();
//  bmpMaximizeBtn := TBitmap.Create();
//  bmpMoveBtn     := TBitmap.Create();
  bmpDeployBtn   := TBitmap.Create();
//  bmpMinimizeBtn.LoadFromFile('images/btnMinimize.bmp');
//  bmpMaximizeBtn.LoadFromFile('images/btnMaximize.bmp');
//  bmpMoveBtn.LoadFromFile('images/btnMove.bmp');
  bmpDeployBtn.LoadFromFile('images/btnDeployText.bmp');


  //Добавляем изображения кнопкам минимизации и перемещения
  //btnMinimize.Picture.Bitmap := bmpMaximizeBtn;
  //btnMove.Picture.Bitmap := bmpMoveBtn;
  btnDeploy.Picture.Bitmap := bmpDeployBtn;
  //Hide;
end;

procedure TStationR414MinForm.Show();
begin
  Visible := true;
  DrawRectangle();
  Self.Repaint();
end;

/// <summary>
/// Устанавливает положение формы
/// </summary>
/// <param name="x">координата по горизонтали</param>
/// <param name="y">координата по вертикали</param>
procedure TStationR414MinForm.SetFormPosition(x, y: Integer);
begin
  Self.Top := y;
  Self.Left := x;
end;

/// <summary>
/// Выделить блок (стойку)
/// </summary>
/// <param name="selectedR">Выделенный блок (стойка)</param>
procedure TStationR414MinForm.SelectRack(selectedR : TRacksEnum);
begin
  selectedRack := selectedR;
  SetFocusRect();
  Self.Repaint;
end;

/// <summary>
/// Устанавливает размеры и положение рамки выделения
/// в зависимости от текущего выбранного блока
/// </summary>
procedure TStationR414MinForm.SetFocusRect();
var lblRack: tlabel;
begin
  if (selectedRack = none) then
  begin
      focusRect.Left := 0;
      focusRect.Right := 0;
      focusRect.Bottom := 0;
      focusRect.Top := 0;
  end
  else begin
    case selectedRack of
      Generator_A:      lblRack := lblGenerator_A;
      Mshu_A:           lblRack := lblMshu_A;
      Duplexer_A:       lblRack := lblDuplexer_A;
      Rack_1500_A:      lblRack := lblRack1500_A;
      Rack_1500_back_A: lblRack := lblRack1500_A;
      Rack_1920_A:      lblRack := lblRack1920_A;
      Rack_1600_A:      lblRack := lblRack1600_A;
      Rack_1600_back_A: lblRack := lblRack1600_A;
      Rack_1200_reciever_A:
                        lblRack := lblRack1200_receiver_A;
      Rack_1200_broadcaster_A:
                        lblRack := lblRack1200_broadcaster_A;
      Wavemeter_A:      lblRack := lblWavemeter_A;
      P321_A:           lblRack := lblP321_A;
      Generator_B:      lblRack := lblGenerator_B;
      Mshu_B:           lblRack := lblMshu_B;
      Duplexer_B:       lblRack := lblDuplexer_B;
      Rack_1500_B:      lblRack := lblRack1500_B;
      Rack_1500_back_B: lblRack := lblRack1500_B;
      Rack_1920_B:      lblRack := lblRack1920_B;
      Rack_1600_B:      lblRack := lblRack1600_B;
      Rack_1600_back_B: lblRack := lblRack1600_B;
      Rack_1200_reciever_B:
                        lblRack := lblRack1200_receiver_B;
      Rack_1200_broadcaster_B:
                        lblRack := lblRack1200_broadcaster_B;
      Wavemeter_B:      lblRack := lblWavemeter_B;
      P321_B:           lblRack := lblP321_B;
      Rack_1710:        lblRack := lblRack1710_A;
      Rack_1400:        lblRack := lblRack1400_B;
      Oscillograph_rack:lblRack := lblOscillograph;
      P321_C:           lblRack := lblP321_C;
      Console_A:        lblRack := lblConsole_A;
      Console_B:        lblRack := lblConsole_B;
      Power_panel:      lblRack := lblPower_panel;
      power_supply:     lblRack := lblPower_supply_C;
    end;
    focusRect.Left   := lblRack.Left;
    focusRect.Top    := lblRack.Top;
    focusRect.Right  := lblRack.Left + lblRack.Width;
    focusRect.Bottom := lblRack.Top + lblRack.Height;
  end;
end;

/// <summary>
/// Рисует рамку выделения
/// </summary>
procedure TStationR414MinForm.DrawRectangle();
begin
  paintBoxBackground.Canvas.Pen.Color := clRed;
  paintBoxBackground.Canvas.Pen.Width := 2;
  paintBoxBackground.Canvas.Brush.Style := bsClear;
  paintBoxBackground.Canvas.StretchDraw(GetClientRect(), bmpBackground);
  paintBoxBackground.Canvas.Rectangle(focusRect);
  //Self.Repaint;
end;

/// <summary>
/// Вызывает метод нажатия на соответсквующий блок в главном окне станции
/// </summary>
/// <param name="selectedRack">Выбранный блок на миниизображении станции</param>
procedure TStationR414MinForm.ExecR414MethodClick(selectedRack: TRacksEnum);
begin
  case selectedRack of
    Generator_A:  StationR414Form.imgGenerAClick(StationR414Form.imgGenerA);
    Mshu_A:       StationR414Form.imgMshuAClick(StationR414Form.imgMshuA);
    Duplexer_A:   StationR414Form.imgDuplexerAClick(StationR414Form.imgDuplexerA);
    Rack_1500_A:  StationR414Form.imgRack1500AClick(StationR414Form.imgRack1500A);
    Rack_1920_A:  StationR414Form.imgRack1920AClick(StationR414Form.imgRack1920A);
    Rack_1600_A:  StationR414Form.imgRack1600AClick(StationR414Form.imgRack1600A);
    Rack_1200_reciever_A: StationR414Form.img27Click(StationR414Form.img27);
    Rack_1200_broadcaster_A: StationR414Form.img4Click(StationR414Form.img4);
    Wavemeter_A:  StationR414Form.imgVolnomerAClick(StationR414Form.imgVolnomerA);
    P321_A:       StationR414Form.imgP321AClick(StationR414Form.imgP321A);
    Generator_B:  StationR414Form.imgGenerBClick(StationR414Form.imgGenerB);
    Mshu_B:       StationR414Form.imgMshuBClick(StationR414Form.imgMshuB);
    Duplexer_B:   StationR414Form.imgDuplexerBClick(StationR414Form.imgDuplexerB);
    Rack_1500_B:  StationR414Form.imgRack1500BClick(StationR414Form.imgRack1500B);
    Rack_1920_B:  StationR414Form.imgRack1920BClick(StationR414Form.imgRack1920B);
    Rack_1600_B:  StationR414Form.imgRack1600BClick(StationR414Form.imgRack1600B);
    Rack_1200_reciever_B: StationR414Form.img14Click(StationR414Form.img14);
    Rack_1200_broadcaster_B: StationR414Form.img20Click(StationR414Form.img20);
    Wavemeter_B:  StationR414Form.imgVolnomerBClick(StationR414Form.imgVolnomerB);
    P321_B:       StationR414Form.imgP321BClick(StationR414Form.imgP321B);
    Rack_1710:    StationR414Form.img25Click(StationR414Form.img25);
    Rack_1400:    StationR414Form.imgRack1400Click(StationR414Form.imgRack1400);
    Oscillograph_rack: StationR414Form.imgOscillographClick(StationR414Form.imgOscillograph);
    P321_C:       StationR414Form.imgP321CClick(StationR414Form.imgP321C);
    Console_A:    StationR414Form.imgPultAClick(StationR414Form.imgPultA);
    Console_B:    StationR414Form.imgPultBClick(StationR414Form.imgPultB);
    Power_panel:  StationR414Form.imgShitClick(StationR414Form.imgShit);
    power_supply: StationR414Form.imgPowerClick(StationR414Form.imgPower);
  end;

end;


procedure TStationR414MinForm.FormCreate(Sender: TObject);
begin
  paintBoxBackground.SendToBack;
  imgTemporary.SendToBack;
end;

procedure TStationR414MinForm.FormPaint(Sender: TObject);
begin
   DrawRectangle();
end;

////////////////////////////////////////////////////////////////////////
///////         Обработчики нажатий на блоки    //////////////////////
{$REGION 'Обработчики нажатий на блоки'}
procedure TStationR414MinForm.lblConsole_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Console_A;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblConsole_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Console_B;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblDuplexer_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Duplexer_A;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblDuplexer_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Duplexer_B;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblGenerator_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Generator_A;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblGenerator_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Generator_B;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblMshu_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Mshu_A;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblMshu_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Mshu_B;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblOscillographClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Oscillograph_rack;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblP321_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := P321_A;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblP321_CClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := P321_C;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblP321_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := P321_B;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblPower_panelClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Power_panel;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblPower_supply_CClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := power_supply;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1200_broadcaster_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Rack_1200_broadcaster_A;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1200_broadcaster_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Rack_1200_broadcaster_B;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1200_receiver_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Rack_1200_reciever_A;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1200_receiver_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Rack_1200_reciever_B;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1400_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Rack_1400;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1500_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Rack_1500_A;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1500_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Rack_1500_B;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1600_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);

  //paintBoxBackgroundClick(null);

  selectedRack := Rack_1600_A;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1600_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Rack_1600_B;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1710_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  //paintBoxBackgroundClick(self);
     //paintBoxBackground.OnClick(nil);

  selectedRack := Rack_1710;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1920_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Rack_1920_A;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblRack1920_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Rack_1920_B;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblWavemeter_AClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Wavemeter_A;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;

procedure TStationR414MinForm.lblWavemeter_BClick(Sender: TObject);
begin
  paintBoxBackground.OnClick(nil);
  selectedRack := Wavemeter_B;
  SetFocusRect();
  ExecR414MethodClick(selectedRack);
end;
{$ENDREGION}

end.
