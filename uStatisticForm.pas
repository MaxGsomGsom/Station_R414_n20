unit uStatisticForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TStatisticForm = class(TForm)
    lvStat: TListView;
    btnÎ÷èñòèòü: TButton;
    btnClose: TButton;
    cbb1: TComboBox;
    procedure btnÎ÷èñòèòüClick(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatisticForm: TStatisticForm;

implementation

{$R *.dfm}

uses
  uMainMenuForm,
  uDefinitionsDM;

procedure TStatisticForm.btnCloseClick(Sender: TObject);
begin
  MainMenuForm.Show;
  StatisticForm.Close;
end;

procedure TStatisticForm.btnÎ÷èñòèòüClick(Sender: TObject);
begin
  ClearLog;
end;

procedure TStatisticForm.cbb1Change(Sender: TObject);
var
  VALUE, DATA: TStringList;
  LI : TListItem;
begin
  VALUE := TStringList.Create;
  DATA := TStringList.Create;
  lvStat.Clear;
  GetUserLog(1, VALUE, DATA);
  LI := TListItem.Create(lvStat.Items);
  LI := lvStat.Items.Add;
  LI.Caption := VALUE[0];
  LI.SubItems.Add(DATA[0]);
end;

end.
