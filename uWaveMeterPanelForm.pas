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

{$REGION '������ ����������� ��������� � �������'}
/// <summary>
/// ���������� �������� � ���������������� ��������� ������
/// </summary>
/// <param name="Sender"></param>
procedure TWaveMeterPanelForm.btnConnectToMainChannelClick(Sender: TObject);
begin
case CurFormId of
    idRack1500A:
      begin
        if (Station.HalfSetA.Rack1500.SelectedMd = smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrMain) then
        begin
          WaveMeterPanelForm.Caption := '��������: ' + ' ���. ����� ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetA.Rack1500.CableMdMainState := csConnected;
        Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
        //Rack1500Form.Reload;
      end;
    idRack1500B:
      begin
        if (Station.HalfSetB.Rack1500.SelectedMd = smdMain) and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrMain) then
        begin
          WaveMeterPanelForm.Caption := '��������: ' + ' ���. ����� ' + UnitsNames[CurFormId];
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
          WaveMeterPanelForm.Caption := '��������: ' + '  ���. ����� ' + UnitsNames[CurFormId];
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
          WaveMeterPanelForm.Caption := '��������: ' + '  ���. ����� ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetB.Rack1600.CableMdMainState := csConnected;
        Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
        //Rack1600Form.Reload;
      end;
  else
    begin
      WaveMeterPanelForm.Caption := '��������: ' + '  �� ���������';
      //Rack1600Form.Reload;
    end;
  end;

  //BlockWaveMeterForm.Reload;
end;

/// <summary>
/// ���������� �������� � ���������������� ���������� ������
/// </summary>
/// <param name="Sender"></param>
procedure TWaveMeterPanelForm.btnConnectToReserveChannelClick(Sender: TObject);
begin
case CurFormId of
    idRack1500A:
      begin
        if (Station.HalfSetA.Rack1500.SelectedMd = smdRetr) and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrReserv) then
        begin
          WaveMeterPanelForm.Caption := '��������: ' + ' �����. ����� ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
        Station.HalfSetA.Rack1500.CableMdReservState := csConnected;
        //Rack1500Form.Reload;
      end;
    idRack1500B:
      begin
        if (Station.HalfSetB.Rack1500.SelectedMd = smdRetr) and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrReserv) then
        begin
          WaveMeterPanelForm.Caption := '��������: ' + ' �����. ����� ' + UnitsNames[CurFormId];
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
          WaveMeterPanelForm.Caption := '��������: ' + ' �����. ����� ' + UnitsNames[CurFormId];
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
          WaveMeterPanelForm.Caption := '��������: ' + ' �����. ����� ' + UnitsNames[CurFormId];
        end;
        Station.HalfSetB.Rack1600.CableMdReservState := csConnected;
        Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
        //Rack1600Form.Reload;
      end;
  else
    begin
      WaveMeterPanelForm.Caption := '��������: ' + '  �� ���������';
      //Rack1600Form.Reload;
    end;
  end;

  //BlockWaveMeterForm.Reload;
end;
{$ENDREGION}

/// <summary>
/// �������� ������ ����� ���������
/// </summary>
/// <param name="Sender"></param>
procedure TWaveMeterPanelForm.btnMaximizeClick(Sender: TObject);
begin
  //BlockWaveMeterForm.Reload;
  //BlockWaveMeterForm.Show;
  //ButtonBackForm.Hide;      //����� �� �������� ��� ������ � ����������

  //����������� �������� ���� ���������
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

  //�������� ����� ����� 1500 � 1600
  //Rack1500Form.MoveToRight;
  //Rack1600Form.MoveToRight;
end;
end.
