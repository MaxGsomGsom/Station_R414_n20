unit uEducationForm;

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
  StdCtrls,
  ComCtrls,
  uCurrentTaskForm,
  uFilterForm;

type
  TEducationForm = class(TForm)
    cbbTaskType: TComboBox;
    cmbTaskNumber: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    lblLocation: TLabel;
    cbbLocation: TComboBox;
    GroupBox1: TGroupBox;
    lblWaveTransmit: TLabel;
    edtTransmitWaveA: TEdit;
    edtReceiveWaveA: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtTransmitWaveB: TEdit;
    edtReceiveWaveB: TEdit;
    Label6: TLabel;
    edtNick: TEdit;
    procedure cbbTaskTypeClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtTransmitWaveAKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbTaskNumberChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbTaskTypeChange(Sender: TObject);
  private
    { Private declarations }
    procedure SetCurUserAccessLevel;
  public
    { Public declarations }
  end;
const
  count_tasks = 6;
var
  EducationForm: TEducationForm;
  arrTaskNumber: array[1..count_tasks] of string;
  arrTaskType: array [1..3] of string;

implementation

uses
  uMainMenuForm,
  uDefinitionsDM,
  uStationR414Form,
  uBlockPowerPanelForm,
  uBlockWaveMeterForm,
  uRack1200LeftForm,
  uRack1200RightForm,
  uUsersForm,
  uStationR414MinForm,
  uBackgroundForm,
  uConstantsDM,
  uStationStateDM;
{$R *.dfm}

(*
  ��������� ����� ����� � ��������, � ������ �� ��������������
  ������� ��������������� ���������
*)
function WavesAreIncorrect(transmitWave, receiveWave: integer): Boolean;
begin
  Result := False;
  if (transmitWave < 1) or (transmitWave > 46)
    or (receiveWave < 1) or (receiveWave > 46) then
  begin
    ShowMessage('�������� ����� ������ ���������� � ��������� [1..46]!');
    Result := True;
  end;
  if Abs(transmitWave - receiveWave) < 6 then
  begin
    ShowMessage('������� �������� ���� ��� � ��� ������ ���� �� ������ 6!');
    Result := True;
  end;
end;

procedure TEducationForm.btnCancelClick(Sender: TObject);
begin
  EducationForm.Close;
end;

procedure TEducationForm.btnOkClick(Sender: TObject);
var
  WaveTranm, WaveReceiv: Byte;
  Host: AnsiString;
  Port: Integer;
  NetMode: Integer;
  Nick: string;
begin
  if (edtReceiveWaveA.Text = '')
    or (edtTransmitWaveA.Text = '')
    or (edtReceiveWaveB.Text = '')
    or (edtTransmitWaveB.Text = '') then
  begin
    ShowMessage('����������, ������� ��� 4 �������� ����!');
    Exit;
  end;

  try
    //���������� ��������� �������� ������� "�������"
    Nick := edtNick.Text;
    Station.Nick := Nick;

    WaveTranm := StrToInt(edtTransmitWaveA.Text);
    WaveReceiv := StrToInt(edtReceiveWaveA.Text);
    if WavesAreIncorrect(WaveTranm, WaveReceiv) then
      Exit;

    //���������� ����� �����/�������� ������������� �
    Station.WaveTransmitA := WaveTranm;
    Station.WaveReceiveA := WaveReceiv;


    WaveTranm := StrToInt(edtTransmitWaveB.Text);
    WaveReceiv := StrToInt(edtReceiveWaveB.Text);
    if WavesAreIncorrect(WaveTranm, WaveReceiv) then
      Exit;

    //���������� ����� �����/�������� ������������� �
    Station.WaveTransmitB := WaveTranm;
    Station.WaveReceiveB := WaveReceiv;
  except
    Application.MessageBox('� �������� �������� ����� ������ ���� ������� ������������� ����� � ��������� �� 1 �� 46!',
    PChar(PName), MB_OK + MB_ICONWARNING);
    Exit;
  end;

  //������� �������
  //StationR414Form.lvTask.Clear;
  Station.WorkMode := cmbTaskNumber.ItemIndex + 1;
  Station.WorkType := cbbTaskType.ItemIndex + 1;
  CurBlockSelected := 255;
  Initialise;
  //StationR414Form.TuneTaskList;

  {if useBackground then
    BackgroundForm.Show;}
  //StationR414Form.Show;

  //StationR414MinForm.CreateFromStationR414Form(StationR414Form);
  EducationForm.Close;
end;

procedure TEducationForm.cbbTaskTypeChange(Sender: TObject);
begin
  Station.WorkType := cbbTaskType.ItemIndex + 1;
  SetCurUserAccessLevel;
end;

procedure TEducationForm.cbbTaskTypeClick(Sender: TObject);
begin
  if cmbTaskNumber.ItemIndex=0 then
  begin
    cmbTaskNumber.Enabled:=true;
  end;
end;

procedure TEducationForm.edtTransmitWaveAKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    '0'..'9', #8:;
  else
    Key := Chr(0);
  end;
end;

procedure TEducationForm.cmbTaskNumberChange(Sender: TObject);
begin
  Station.WorkMode := cmbTaskNumber.ItemIndex + 1;
end;


procedure TEducationForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //if not(StationR414Form.Visible) then
    //ShowMenuForm;
end;

procedure TEducationForm.FormCreate(Sender: TObject);
begin
  cmbTaskNumber.ItemIndex := 0;
  Station.WorkMode := 1;

  arrTaskNumber[1] := '1.���������� �������� �������';
  arrTaskNumber[2] := '2.��������� ������� ���������� � �������� ���������';
  arrTaskNumber[3] := '3.��������� �������';
  arrTaskNumber[4] := '4.��������� �������� � ����������� �������';
  arrTaskNumber[5] := '5.������ � �������������� �������������';
  arrTaskNumber[6] := '6.������� ������� � ��������� ����� ������';

  arrTaskType[1] := '��������';
  arrTaskType[2] := '������';
  arrTaskType[3] := '����� ���������';
end;

procedure TEducationForm.SetCurUserAccessLevel;
//var
  //oldTaskType, oldTaskNumber: Byte;
begin
  //oldTaskType := cbbTaskType.ItemIndex;
  //oldTaskNumber := cmbTaskNumber.ItemIndex;

  cmbTaskNumber.Clear;
  if cbbTaskType.ItemIndex = -1 then
  begin
    case CurUser.AccessLevelStudy of
      1:
        begin
          cmbTaskNumber.Items.Add(arrTaskNumber[1]);
        end;
      2:
        begin
          cmbTaskNumber.Items.Add(arrTaskNumber[1]);
          cmbTaskNumber.Items.Add(arrTaskNumber[2]);
        end;
      3:
        begin
          cmbTaskNumber.Items.Add(arrTaskNumber[1]);
          cmbTaskNumber.Items.Add(arrTaskNumber[2]);
          cmbTaskNumber.Items.Add(arrTaskNumber[3]);
        end;
      4:
        begin
          cmbTaskNumber.Items.Add(arrTaskNumber[1]);
          cmbTaskNumber.Items.Add(arrTaskNumber[2]);
          cmbTaskNumber.Items.Add(arrTaskNumber[3]);
          cmbTaskNumber.Items.Add(arrTaskNumber[4]);
        end;
      5:
        begin
          cmbTaskNumber.Items.Add(arrTaskNumber[1]);
          cmbTaskNumber.Items.Add(arrTaskNumber[2]);
          cmbTaskNumber.Items.Add(arrTaskNumber[3]);
          cmbTaskNumber.Items.Add(arrTaskNumber[4]);
          cmbTaskNumber.Items.Add(arrTaskNumber[5]);
        end;
    end;

    case CurUser.AccessLevelTrening of
      1:
        begin
          cbbTaskType.Items.Add(arrTaskType[2]);
          cmbTaskNumber.Items.Add(arrTaskNumber[1]);
        end;
      2:
        begin
          cbbTaskType.Items.Add(arrTaskType[2]);
          cmbTaskNumber.Items.Add(arrTaskNumber[1]);
          cmbTaskNumber.Items.Add(arrTaskNumber[2]);
        end;
      3:
        begin
          cbbTaskType.Items.Add(arrTaskType[2]);
          cmbTaskNumber.Items.Add(arrTaskNumber[1]);
          cmbTaskNumber.Items.Add(arrTaskNumber[2]);
          cmbTaskNumber.Items.Add(arrTaskNumber[3]);
        end;
      4:
        begin
          cbbTaskType.Items.Add(arrTaskType[2]);
          cmbTaskNumber.Items.Add(arrTaskNumber[1]);
          cmbTaskNumber.Items.Add(arrTaskNumber[2]);
          cmbTaskNumber.Items.Add(arrTaskNumber[3]);
          cmbTaskNumber.Items.Add(arrTaskNumber[4]);
        end;
      5:
        begin
          cbbTaskType.Items.Add(arrTaskType[2]);
          cmbTaskNumber.Items.Add(arrTaskNumber[1]);
          cmbTaskNumber.Items.Add(arrTaskNumber[2]);
          cmbTaskNumber.Items.Add(arrTaskNumber[3]);
          cmbTaskNumber.Items.Add(arrTaskNumber[4]);
          cmbTaskNumber.Items.Add(arrTaskNumber[5]);
        end;
    else
    end;
  end
  else
  begin
    case cbbTaskType.ItemIndex of
      0:
        begin
          if CurUser.AccessLevelStudy > 0 then
          begin
            cmbTaskNumber.Items.Add(arrTaskNumber[1]);
          end;
          if CurUser.AccessLevelStudy > 1 then
          begin
            cmbTaskNumber.Items.Add(arrTaskNumber[2]);
          end;
          if CurUser.AccessLevelStudy > 2 then
          begin
            cmbTaskNumber.Items.Add(arrTaskNumber[3]);
          end;
          if CurUser.AccessLevelStudy > 3 then
          begin
            cmbTaskNumber.Items.Add(arrTaskNumber[4]);
          end;
          if CurUser.AccessLevelStudy > 4 then
          begin
            cmbTaskNumber.Items.Add(arrTaskNumber[5]);
          end;
        end;
      1:
        begin
          if CurUser.AccessLevelTrening > 0 then
          begin
            cmbTaskNumber.Items.Add(arrTaskNumber[1]);
          end;
          if CurUser.AccessLevelTrening > 1 then
          begin
            cmbTaskNumber.Items.Add(arrTaskNumber[2]);
          end;
          if CurUser.AccessLevelTrening > 2 then
          begin
            cmbTaskNumber.Items.Add(arrTaskNumber[3]);
          end;
          if CurUser.AccessLevelTrening > 3 then
          begin
            cmbTaskNumber.Items.Add(arrTaskNumber[4]);
          end;
          if CurUser.AccessLevelTrening > 4 then
          begin
            cmbTaskNumber.Items.Add(arrTaskNumber[5]);
          end;
        end;
      3:
        begin
          if (CurUser.AccessLevelTrening > 4) and (CurUser.AccessLevelStudy > 4) then
          begin
            cmbTaskNumber.Items.Add('����� ���������');
          end;
        end;
    end;
  end;

  if (cmbTaskNumber.Items.Count <> 0) and (cmbTaskNumber.ItemIndex = - 1) then
  begin
    cmbTaskNumber.ItemIndex := 0;
  end;
  if (cbbTaskType.Items.Count > 0) and (cbbTaskType.ItemIndex = - 1) then
  begin
    cmbTaskNumber.ItemIndex := 0;
  end;
end;

procedure TEducationForm.FormShow(Sender: TObject);
begin
  //CurrentTaskForm.Hide;                        //������ ���. �� �� ���� ������
  //FilterForm.Hide;

  cbbTaskType.Clear;
  if CurUser.AccessLevelStudy > 0 then
    cbbTaskType.Items.Add(arrTaskType[1]);

  if CurUser.AccessLevelTrening > 0 then
    cbbTaskType.Items.Add(arrTaskType[2]);

  if (CurUser.AccessLevelTrening > 4) and (CurUser.AccessLevelStudy > 4) then
    cbbTaskType.Items.Add(arrTaskType[3]);

  if cbbTaskType.ItemIndex = -1 then
    cbbTaskType.ItemIndex := 0;

  SetCurUserAccessLevel;
end;

end.
