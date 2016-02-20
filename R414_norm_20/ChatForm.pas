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
    lbl1cross: TLabel;
    rb1r414: TRadioButton;
    rb1cross: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure ChangeChatInputText(SubTask: TSubTask);
    procedure ShowMessage(Sender: TObject; Text:string; Name: string);
    procedure img1OpenChatClick(Sender: TObject);
    procedure btn1SendMessageClick(Sender: TObject);
    procedure LinkedNickSet(Sender: string);
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
     NetWorker.ClientState.OnDisconnect:=LinkedNickSet;

     LinkedNick.Caption:='Связанная станция: '+NetWorker.ClientState.LinkedR414UserName;
     lbl1cross.Caption:='Кросс : '+NetWorker.ClientState.LinkedCrossUserName;
     NetWorker.ClientState.OnMessageEvent:= ShowMessage;
     Self.Visible:= NetWorker.ClientState.LinkedR414Connected ;
     NetWorker:=NetWorker0;
     lblUserName.Caption:= NetWorker.ClientState.UserName+':';
     Self.TaskController:=TaskController;

     if (NetWorker.ClientState.MainStation = True) then
begin
lblRole.Caption := 'Главная';
end
else
begin
lblRole.Caption := 'Подчиненная';
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
if (rb1r414.Checked) then
begin
  if (NetWorker.ClientState.CanSendChatMessages=True) or true then
  begin
    TaskController.NetCheckTask();
    TaskController.CheckTask(nil, TMouseButton.mbLeft, [],0,0);
    NetWorker.SendMessage(edt1MessageInput.Text, NetWorker.ClientState.LinkedR414UserName);
    lst1AllMessages.AddItem(NetWorker.ClientState.UserName+': '+ edt1MessageInput.Text, TObject.Create);
   edt1MessageInput.Text:='';
   lst1AllMessages.ScrollBy(99999, 99999);
  end
  else
  begin
      lst1AllMessages.AddItem('Связь не настроена', TObject.Create);
  end;
end
else
begin
      TaskController.NetCheckTask();
    TaskController.CheckTask(nil, TMouseButton.mbLeft, [],0,0);
    NetWorker.SendMessage(edt1MessageInput.Text, NetWorker.ClientState.LinkedCrossUserName);
    lst1AllMessages.AddItem(NetWorker.ClientState.UserName+': '+ edt1MessageInput.Text, TObject.Create);
   edt1MessageInput.Text:='';
   lst1AllMessages.ScrollBy(99999, 99999);
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

procedure TTChatForm.LinkedNickSet(Sender: string);
var Req: TRequest;
begin
if (Sender = CLIENT_STATION_R414) then
 begin
    Self.Visible:= NetWorker.ClientState.LinkedR414Connected ;
    LinkedNick.Caption:='Связанная станция: '+NetWorker.ClientState.LinkedR414UserName;
    if (NetWorker.ClientState.MainStation = True) then
    begin
    lblRole.Caption := 'Главная';
    end
    else
    begin
    lblRole.Caption := 'Подчиненная';
    end;

 end
 else if (Sender = CLIENT_CROSS) then
      begin
        lbl1cross.Caption:='Кросс : '+NetWorker.ClientState.LinkedCrossUserName;
      end;
end;

procedure TTChatForm.ShowMessage(Sender: TObject; Text:string; Name: string);
begin
//если сообщение прислал кросс или связь с другой 414 налажена, то показываем сообщение
if (NetWorker.ClientState.CanGetChatMessages=True) or (Name = NetWorker.ClientState.LinkedCrossUserName) then
begin
  lst1AllMessages.AddItem(Name+': '+ Text, TObject.Create);
  lst1AllMessages.ScrollBy(99999, 99999);
end
else
begin
  lst1AllMessages.AddItem('<Другая станция пытается с вами связаться>', TObject.Create);
end;

end;

end.
