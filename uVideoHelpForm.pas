unit uVideoHelpForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, ExtCtrls, StdCtrls;

type
  TVideoHelpForm = class(TForm)
    MediaPlayer1: TMediaPlayer;
    btnPlay: TButton;
    btnExit: TButton;
    imgDisplay: TPanel;
    procedure FormResize(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PlayVideo(PathToVideo: string);


var
  VideoHelpForm: TVideoHelpForm;
  Playng: Boolean;
  end;

implementation

uses
  uStationR414Form,
  uDefinitionsDM;

{$R *.dfm}

procedure TVideoHelpForm.btnExitClick(Sender: TObject);
begin
  //StationR414Form.Show;
  VideoHelpForm.Close;
end;

procedure TVideoHelpForm.btnPlayClick(Sender: TObject);
begin
  if Playng then
  begin
    Playng := False;
    MediaPlayer1.Pause;
  end
  else
  begin
    Playng := True;
    MediaPlayer1.Play;
  end;
end;

procedure TVideoHelpForm.FormResize(Sender: TObject);
begin
  Exit;
end;

procedure TVideoHelpForm.PlayVideo(PathToVideo: string);
begin
  //VideoHelpForm.Show;
  CloseStationR414FormFlag := 2;
  //StationR414Form.Close;
  Application.ProcessMessages;
  PathToVideo := ExtractFilePath(Application.ExeName) + 'help\' + PathToVideo;
  if not(FileExists(PathToVideo)) then
  begin
    Application.MessageBox(PChar('Файл видео подсказки не найден!'), PChar(PName),
      MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  imgDisplay.Top := 10;
  imgDisplay.Left := 10;
  imgDisplay.Height := VideoHelpForm.Height - 30 - btnExit.Height;
  imgDisplay.Width := VideoHelpForm.Width - 20;
  btnPlay.Left := 30;
  btnPlay.Top := imgDisplay.Top + imgDisplay.Height + 20;
  btnExit.Left := imgDisplay.Left + imgDisplay.Width - btnExit.Width - 10;
  btnExit.Top := btnPlay.Top;
  MediaPlayer1.Height := VideoHelpForm.Height;
  MediaPlayer1.Width := VideoHelpForm.Width;
  MediaPlayer1.FileName := PathToVideo;
  MediaPlayer1.Open;
  MediaPlayer1.Play;
  //CloseStationR414FormFlag := 0;
end;

end.
