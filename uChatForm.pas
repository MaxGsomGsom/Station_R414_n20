unit uChatForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TChatForm = class(TForm)
    btnChat: TLabel;
    lblChat: TLabel;
    edtSend: TEdit;
    btnSend: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnChatClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChatForm: TChatForm;

implementation

{$R *.dfm}

uses
  uStationR414Form,
  uDefinitionsDM,
  uStationStateDM;

procedure TChatForm.btnChatClick(Sender: TObject);
var
  strToSend: string;
begin
  if btnChat.Caption <> '' then
  begin
    //PushToSocket(chSoprajenieData, btnChat.Caption);
  end;
end;

procedure TChatForm.btnSendClick(Sender: TObject);
begin
  if Trim(edtSend.Text) <> '' then
  begin
    //PushToSocket(chSoprajenieData, edtSend.Text);
  end;
end;

procedure TChatForm.FormShow(Sender: TObject);
begin
  if ChatForm.Tag = stGeneral then
  begin
    //btnChat.Caption := StrangerNick + ', я ' + Station.Nick + '. Как меня слышите?';
    Label1.Caption := 'Выставить "0" ДМЧ и измерить запас уровня СВЧ сигнала';
    //Label2.Caption := StrangerNick + ', я ' + Station.Nick + #13#10'. "0" ДМЧ выставил, запас сигнала ...';
  end;
  if ChatForm.Tag = stPassive then
  begin
    btnChat.Caption := 'Слышу Вас хорошо!';
    lblChat.Caption := lblChat.Caption + #13#10 + Station.Nick +  ': ' + btnChat.Caption;
    Label1.Caption := 'Вас понял. Выполняю.';
    //label2.Caption := StrangerNick + ', я ' + Station.Nick + '"0" ДМЧ вытавил.'#13#10' Запас СВЧ уровня...';
  end;
end;

end.
