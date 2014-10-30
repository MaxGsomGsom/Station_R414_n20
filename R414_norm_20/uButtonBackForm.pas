unit uButtonBackForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TButtonBackForm = class(TForm)
    imgButtonBack: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgButtonBackClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    bmpArrowBack : TBitmap;   //���  - ����������� ������
  public
    procedure ShowConsideringOtherForm(rightBoundary: Integer;
      vertScrollBarShowing: Boolean);
  end;

//var
  //ButtonBackForm: TButtonBackForm;

implementation

uses
  uConstantsDM,
  uStationR414Form,
  uStationR414MinForm;

{$R *.dfm}

procedure TButtonBackForm.FormCreate(Sender: TObject);
begin
                                              //���������� �������� ���
                                              //����������� ������
  bmpArrowBack := Tbitmap.Create();
  bmpArrowBack.LoadFromFile('images/BackArrow.bmp');
  imgButtonBack.Picture.Bitmap := bmpArrowBack;

  Self.Height := bmpArrowBack.Height;         //������ ����� �� ��������
  Self.Width := bmpArrowBack.Width;           //��������

  Self.imgButtonBack.Height := Self.Height;   //������ ���������� img
  Self.imgButtonBack.Width := Self.Width;     //�� �������� �����

  Self.Left := Screen.Width - Self.Width;
  Self.Top := 0;

  //if (Owner.Owner is TStationR414Form) then
  //begin
  if (Owner.Owner is TStationR414Form) then (Owner.Owner as TStationR414Form).StationR414MinForm.paintBoxBackground.OnClick:= imgButtonBackClick;
  //end
  //else
  //begin
  if (Owner.Owner.Owner is TStationR414Form) then (Owner.Owner.Owner as TStationR414Form).StationR414MinForm.paintBoxBackground.OnClick:= imgButtonBackClick;
  //  end;
  if (Owner.Owner.Owner.Owner is TStationR414Form) then (Owner.Owner.Owner.Owner as TStationR414Form).StationR414MinForm.paintBoxBackground.OnClick:= imgButtonBackClick;
end;

procedure TButtonBackForm.FormPaint(Sender: TObject);
begin
  Application.RestoreTopMosts;
end;

/// <summary>
/// ���������� ����� � ������ ������ ������� � ������� ������-���� �����-������
/// </summary>
/// <param name="rightBoundary">������ �������</param>
/// <param name="vertScrollBarShowing">������� ������������� ������-����</param>
procedure TButtonBackForm.ShowConsideringOtherForm(rightBoundary: Integer;
      vertScrollBarShowing: Boolean);
begin
{
  if rightBoundary > (Screen.Width - Self.Width) then
    if vertScrollBarShowing then
    begin
      Self.Left := rightBoundary - Self.Width - GetSystemMetrics(SM_CXHSCROLL);
    end
    else
    begin
      Self.Left := rightBoundary - Self.Width;
    end
  else
  }
  if (rightBoundary > (Screen.Width - Self.Width))
    and vertScrollBarShowing then
  begin
    Self.Left := rightBoundary - Self.Width - GetSystemMetrics(SM_CXHSCROLL);
  end
  else
  begin
    Self.Left := Screen.Width - Self.Width;
  end;
  Self.Show;
end;

procedure TButtonBackForm.FormShow(Sender: TObject);
begin
                        //����� ������������ ������ ��������� ����
                        //���� ������ ����������
  SetWindowPos (Self.Handle, HWND_TOPMOST, 0, 0, 0, 0,
    SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
end;

/// <summary>
/// �������� ������� �������� �� ������ � ������ ���� �414
/// ��� ���� ������� ����
/// </summary>
/// <param name="Sender"></param>
procedure TButtonBackForm.imgButtonBackClick(Sender: TObject);
var StationR414FormminiHWND : HWND;
begin
  //��������� ������� "�������� ���� ������"
  //StationR414FormminiHWND := FindWindow(StationR414FormminiClassName,
  //  StationR414FormminiObjectName);
  //PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  ((Owner as TForm).Owner as TForm).Show;
  (Owner as TForm).Close;
  Close;
end;
end.
