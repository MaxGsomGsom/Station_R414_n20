unit ChatForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls,IdTCPClient, IdTCPConnection, uNetWorkerDM, IdIOHandler, uRequestDM, uClientStateDM;

type
  TTChatForm = class(TForm)
    btn1SendMessage: TButton;
    edt1MessageInput: TEdit;
    lst1AllMessages: TListBox;
    img1OpenChat: TImage;
    LinkedNick: TLabel;
    lblUserName: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ShowMessage(Sender: TObject);
    procedure img1OpenChatClick(Sender: TObject);
    procedure btn1SendMessageClick(Sender: TObject);
    procedure LinkedNickSet(Sender: TObject);
    constructor Create(AOwner:TComponent; ClientState0: TClientState; NetWorker0: TClientNetWorker); reintroduce;
  private
    { Private declarations }
  public
    { Public declarations }
    NetWorker: TClientNetWorker;
    ClientState: TClientState;
  end;


implementation

{$R *.dfm}

constructor TTChatForm.Create(AOwner: TComponent; ClientState0: TClientState; NetWorker0: TClientNetWorker);
begin
   inherited Create(AOwner);
     ClientState:=ClientState0;
     ClientState.OnConnectedEvent:= LinkedNickSet;
     LinkedNick.Caption:='Связанная станция: '+ClientState.LinkedR414UserName;
     ClientState.OnMessageEvent:= ShowMessage;
     Self.Visible:= ClientState.LinkedR414Connected ;
     NetWorker:=NetWorker0;
     lblUserName.Caption:= ClientState.UserName+':';
  end;



procedure TTChatForm.btn1SendMessageClick(Sender: TObject);
var Req: TRequest;
begin
NetWorker.SendMessage(edt1MessageInput.Text);
lst1AllMessages.AddItem(ClientState.UserName+': '+ edt1MessageInput.Text, TObject.Create);
 edt1MessageInput.Text:='';
end;

procedure TTChatForm.FormShow(Sender: TObject);
begin
SetWindowPos (Self.Handle, HWND_TOPMOST, 0, 0, 0, 0,
    SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
end;

procedure TTChatForm.img1OpenChatClick(Sender: TObject);
begin
if (Self.Width=500) then begin self.Width:=75;  end
else Self.Width:=500;

end;

procedure TTChatForm.LinkedNickSet(Sender: TObject);
var Req: TRequest;
begin
Self.Visible:= ClientState.LinkedR414Connected ;
LinkedNick.Caption:='Связанная станция: '+ClientState.LinkedR414UserName;
end;

procedure TTChatForm.ShowMessage(Sender: TObject);
begin
lst1AllMessages.AddItem(ClientState.LinkedR414UserName+': '+ ClientState.LastMessage, TObject.Create);
end;

end.
