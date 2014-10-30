unit uWaveMeterPanelForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, Menus, uAdditionalFormMethods, uStationStateDM;

type
  TWaveMeterPanelForm = class(TForm)
    Image1: TImage;
    btnMaximize: TButton;
    btnConnectToMainChannel: TButton;
    btnConnectToReserveChannel: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnConnectToMainChannelClick(Sender: TObject);
    procedure btnConnectToReserveChannelClick(Sender: TObject);
    procedure btnMaximizeClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  WaveMeterPanelForm: TWaveMeterPanelForm;
  Station: TStation;

implementation

uses
  uRack1500Form,
  uRack1500MinForm,
  uBlockWaveMeterForm,
  uRack1600Form,
  uRack1500bForm,
  uConstantsDM,
  uDefinitionsDM,
  uTasksDM,
  uButtonBackForm;

{$R *.dfm}

{$REGION 'Кнопки подключения волномера к каналам'}
/// <summary>
/// Подключает волномер к соответствующему основному каналу
/// </summary>
/// <param name="Sender"></param>
procedure TWaveMeterPanelForm.btnConnectToMainChannelClick(Sender: TObject);
begin
case CurFormId of
    idRack1500A:
      begin
        if (Station.HalfSetA.Rack1500.SelectedMd = smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrMain) then
        begin
          WaveMeterPanelForm.Caption := 'Волномер: ' + ' ОСН. канал ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetA.Rack1500.CableMdMainState := csConnected;
        Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
        //Rack1500Form.Reload;
      end;
    idRack1500B:
      begin
        if (Station.HalfSetB.Rack1500.SelectedMd = smdMain) and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrMain) then
        begin
          WaveMeterPanelForm.Caption := 'Волномер: ' + ' ОСН. канал ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetB.Rack1500.CableMdMainState := csConnected;
        Station.HalfSetB.Rack1500.CableMdReservState := csDisconected;
        //Rack1500Form.Reload;
      end;
    idRack1600A:
      begin
        if (Station.HalfSetA.Rack1600.SelectedMd = smdMain) and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchMain) and
        (Station.HalfSetA.Rack1600.SelectedDmch = sDmchMain) then
        begin
          WaveMeterPanelForm.Caption := 'Волномер: ' + '  ОСН. канал ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetA.Rack1600.CableMdMainState := csConnected;
        Station.HalfSetA.Rack1600.CableMdReservState := csDisconected;
        //Rack1600Form.Reload;
      end;
    idRack1600B:
      begin
        if (Station.HalfSetB.Rack1600.SelectedMd = smdMain) and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchMain) and
        (Station.HalfSetB.Rack1600.SelectedDmch = sDmchMain) then
        begin
          WaveMeterPanelForm.Caption := 'Волномер: ' + '  ОСН. канал ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetB.Rack1600.CableMdMainState := csConnected;
        Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
        //Rack1600Form.Reload;
      end;
  else
    begin
      WaveMeterPanelForm.Caption := 'Волномер: ' + '  не подключен';
      //Rack1600Form.Reload;
    end;
  end;

  //BlockWaveMeterForm.Reload;
end;

/// <summary>
/// Подключает волномер к соответствующему резервному каналу
/// </summary>
/// <param name="Sender"></param>
procedure TWaveMeterPanelForm.btnConnectToReserveChannelClick(Sender: TObject);
begin
case CurFormId of
    idRack1500A:
      begin
        if (Station.HalfSetA.Rack1500.SelectedMd = smdRetr) and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrReserv) then
        begin
          WaveMeterPanelForm.Caption := 'Волномер: ' + ' Резер. канал ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
        Station.HalfSetA.Rack1500.CableMdReservState := csConnected;
        //Rack1500Form.Reload;
      end;
    idRack1500B:
      begin
        if (Station.HalfSetB.Rack1500.SelectedMd = smdRetr) and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrReserv) then
        begin
          WaveMeterPanelForm.Caption := 'Волномер: ' + ' Резер. канал ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetB.Rack1500.CableMdMainState := csDisconected;
        Station.HalfSetB.Rack1500.CableMdReservState := csConnected;
        //Rack1500Form.Reload;
      end;
    idRack1600A:
      begin
        if (Station.HalfSetA.Rack1600.SelectedMd = smdRetr) and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchReserve) and
        (Station.HalfSetA.Rack1600.SelectedDmch = sDmchReserve) then
        begin
          WaveMeterPanelForm.Caption := 'Волномер: ' + ' Резер. канал ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetA.Rack1600.CableMdReservState := csConnected;
        Station.HalfSetA.Rack1600.CableMdMainState := csDisconected;
        //Rack1600Form.Reload;
      end;
    idRack1600B:
      begin
        if (Station.HalfSetB.Rack1600.SelectedMd = smdRetr) and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchReserve) and
        (Station.HalfSetB.Rack1600.SelectedDmch = sDmchReserve) then
        begin
          WaveMeterPanelForm.Caption := 'Волномер: ' + ' Резер. канал ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetB.Rack1600.CableMdReservState := csConnected;
        Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
        //Rack1600Form.Reload;
      end;
  else
    begin
      WaveMeterPanelForm.Caption := 'Волномер: ' + '  не подключен';
      //Rack1600Form.Reload;
    end;
  end;

  //BlockWaveMeterForm.Reload;
end;
{$ENDREGION}

/// <summary>
/// Показать полную форму волномера
/// </summary>
/// <param name="Sender"></param>
procedure TWaveMeterPanelForm.btnMaximizeClick(Sender: TObject);
begin
  //BlockWaveMeterForm.Reload;
  //BlockWaveMeterForm.Show;
  //ButtonBackForm.Hide;      //Чтобы не мешалась при работе с волномером

  //Сворачивает открытое окно волномера
  //  if BlockWaveMeterForm.Showing then
  //    BlockWaveMeterForm.Close;
end;

procedure TWaveMeterPanelForm.FormHide(Sender: TObject);
begin
  //MoveFormInScreenCenter(Rack1500Form);
end;

procedure TWaveMeterPanelForm.FormShow(Sender: TObject);
begin
  Self.Left := 0;
  Self.Top := 0;

  //Сдвинуть формы стоек 1500 и 1600
  //Rack1500Form.MoveToRight;
  //Rack1600Form.MoveToRight;
end;
end.
