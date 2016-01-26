unit ChatForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls,IdTCPClient, IdTCPConnection, uNetWorkerDM, IdIOHandler, uRequestDM, uClientStateDM, uTaskControllerDM, KeyboardTypes, Keyboard, uTasks20;

type
  TTChatForm = class(TForm)
    btn1SendMessage: TButton;
    edt1MessageInput: TEdit;
    lst1AllMessages: TListBox;
    img1OpenChat: TImage;
    LinkedNick: TLabel;
    lblUserName: TLabel;
    lblRole: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ChangeChatInputText(SubTask: TSubTask);
    procedure ShowMessage(Sender: TObject);
    procedure img1OpenChatClick(Sender: TObject);
    procedure btn1SendMessageClick(Sender: TObject);
    procedure LinkedNickSet(Sender: TObject);
    constructor Create(AOwner:TComponent;  NetWorker0: TClientNetWorker; TaskController: TTaskController); reintroduce;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    TaskController: TTaskController;
  public
    { Public declarations }
    NetWorker: TClientNetWorker;
  end;


implementation

{$R *.dfm}

constructor TTChatForm.Create(AOwner: TComponent;  NetWorker0: TClientNetWorker; TaskController: TTaskController);
begin
   inherited Create(AOwner);
   NetWorker:=NetWorker0;
     NetWorker.ClientState.OnConnectedEvent:= LinkedNickSet;
     LinkedNick.Caption:='��������� �������: '+NetWorker.ClientState.LinkedR414UserName;
     NetWorker.ClientState.OnMessageEvent:= ShowMessage;
     Self.Visible:= NetWorker.ClientState.LinkedR414Connected ;
     NetWorker:=NetWorker0;
     lblUserName.Caption:= NetWorker.ClientState.UserName+':';
     Self.TaskController:=TaskController;

     if (NetWorker.ClientState.MainStation = True) then
begin
lblRole.Caption := '�������';
end
else
begin
lblRole.Caption := '�����������';
end;

  end;



procedure TTChatForm.ChangeChatInputText(SubTask: TSubTask);
begin


  if (NetWorker.ClientState.MainStation = True) then
  begin
      if (SubTask.MainTaskText <> '') then edt1MessageInput.Text:= SubTask.MainTaskText;
  end
  else
  begin
      if (SubTask.SubTaskText <> '') then edt1MessageInput.Text:= SubTask.SubTaskText;
  end;


end;





procedure TTChatForm.btn1SendMessageClick(Sender: TObject);
var Req: TRequest;
begin
if (NetWorker.ClientState.CanSendChatMessages=True) then
begin
  TaskController.NetCheckTask();
  TaskController.CheckTask(nil, TMouseButton.mbLeft, [],0,0);
  NetWorker.SendMessage(edt1MessageInput.Text);
lst1AllMessages.AddItem(NetWorker.ClientState.UserName+': '+ edt1MessageInput.Text, TObject.Create);
 edt1MessageInput.Text:='';
 lst1AllMessages.ScrollBy(99999, 99999);
end
else
begin
    lst1AllMessages.AddItem('����� �� ���������', TObject.Create);
end;


end;

procedure TTChatForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (Ord(Key) = VK_RETURN) then
begin
  self.btn1SendMessageClick(Self);
end;

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
Self.Visible:= NetWorker.ClientState.LinkedR414Connected ;
LinkedNick.Caption:='��������� �������: '+NetWorker.ClientState.LinkedR414UserName;
if (NetWorker.ClientState.MainStation = True) then
begin
lblRole.Caption := '�������';
end
else
begin
lblRole.Caption := '�����������';
end;

end;

procedure TTChatForm.ShowMessage(Sender: TObject);
begin
if (NetWorker.ClientState.CanGetChatMessages=True) then
begin
  lst1AllMessages.AddItem(NetWorker.ClientState.LinkedR414UserName+': '+ NetWorker.ClientState.LastMessage, TObject.Create);
  lst1AllMessages.ScrollBy(99999, 99999);
end
else
begin
  lst1AllMessages.AddItem('<������ ������� �������� � ���� ���������>', TObject.Create);
end;

end;

end.
