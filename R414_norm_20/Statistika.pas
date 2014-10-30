unit Statistika;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FileCtrl, ComCtrls;

type
  T_Stat = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _Stat: T_Stat;

implementation

uses CreateUsers;

{$R *.dfm}

function load_base(locate_base: AnsiString; cert: AnsiString): bool; cdecl;
external 'druid_db.dll' name '_load_base';
procedure save_base(locate_base: AnsiString; cert: AnsiString); cdecl;
external 'druid_db.dll' name '_save_base';
function create_user(name: AnsiString; info: AnsiString; passw: AnsiString) : bool; cdecl;
external 'druid_db.dll' name '_create_user';
procedure delete_user(name: AnsiString); cdecl;
external 'druid_db.dll' name '_delete_user';
procedure change_user(old_name:AnsiString; new_name:AnsiString;Info: AnsiString;Passw: AnsiString); cdecl;
external 'druid_db.dll' name '_change_user';
procedure add_user_action(name: AnsiString;description: AnsiString); cdecl;
external 'druid_db.dll' name '_add_user_action';
function get_user_pw(name: AnsiString): AnsiString; cdecl;
external 'druid_db.dll' name '_get_user_pw';
function get_user_info(name: AnsiString): AnsiString; cdecl;
external 'druid_db.dll' name '_get_user_info';
procedure get_user_actions(name: AnsiString;list: TStringList); cdecl;
external 'druid_db.dll' name '_get_user_actions';
procedure get_list_users(list: TStringList); cdecl;
external 'druid_db.dll' name '_get_list_users';
procedure clear_user_actions(name: AnsiString); cdecl;
external 'druid_db.dll' name '_clear_user_actions';
function check_user_param(name: AnsiString; cert: AnsiString): bool; cdecl;
external 'druid_db.dll' name '_check_user_param';
function free_name(name: AnsiString): bool; cdecl;
external 'druid_db.dll' name '_free_name';
procedure clear_base; cdecl;
external 'druid_db.dll' name '_clear_base';

Function Before ( Src:string ; Var S:string ) : string ;
Var
  F : Word ;
begin
  F := POS (Src,S) ;
  if F=0 then
    Before := S
  else
    Before := COPY(S,1,F-1) ;
end ;

Function After ( Src:string ; Var S:string ) : string ;
Var
  F : Word ;
begin
  F := POS (Src,S) ;
  if F=0 then
    After := ''
  else
    After := COPY(S,F+length(src),length(s)) ;
end ;





procedure T_Stat.BitBtn1Click(Sender: TObject);
Var I:integer;
    S:string;
    mlist: TStringList;
begin
for I := 0 to ListBox1.Count - 1 do begin
if ListBox1.Selected[I]=true then begin
  S:=ListBox1.Items.Strings[I];
end;
end;
delete_user(S);
save_base('����������','ispu.crt');

mlist := TStringList.Create;
get_list_users(mlist);
_Stat.ListBox1.Items.Text := mlist.Text;
mlist.Free;
end;

procedure T_Stat.BitBtn2Click(Sender: TObject);
begin
CreateUsersForm.Show;
_Stat.Enabled:=false;
end;

procedure T_Stat.FormShow(Sender: TObject);
var
mlist: TStringList;
begin
load_base('����������','ispu.crt');
mlist := TStringList.Create;
get_list_users(mlist);
ListBox1.Items.Text := mlist.Text;
mlist.Free;
end;

procedure T_Stat.ListBox1Click(Sender: TObject);
Var I:integer;
    mlist: TStringList;
    S:string;
    St:string;
    N:integer;
    Tr:string;
begin
ListBox2.Clear;
for I := 0 to ListBox1.Count - 1 do begin
if ListBox1.Selected[I]=true then begin
  S:=ListBox1.Items.Strings[I];
end;

end;
ListBox2.Items.Strings[0]:='�.�.�.: '+S;
ListBox2.Items.Strings[1]:=get_user_info(S);
ListBox2.Items.Strings[1]:='���� / �����: '+ ListBox2.Items.Strings[1][1]+'/'+ListBox2.Items.Strings[1][2];
ListBox2.Items.Strings[2]:='������: '+get_user_pw(S);
ListBox2.Items.Strings[3]:='';
ListBox2.Items.Strings[4]:='���������� �� ���������� �������: ';
ListBox2.Items.Strings[5]:='������� �1, ������: '+'_';
ListBox2.Items.Strings[6]:='������� �2, ������: '+'_';
ListBox2.Items.Strings[7]:='������� �3, ������: '+'_';
ListBox2.Items.Strings[8]:='������� �4, ������: '+'_';
ListBox2.Items.Strings[9]:='������� �5, ������: '+'_';
//=====================================================
mlist := TStringList.Create;
get_user_actions(S,mlist);
for I := 0 to mList.Count - 1 do begin
Tr:=mList.Strings[I];
        for N := 1 to length(Tr) do begin
              if Tr[N]='f' then begin       //������� 1 -������
                  St:=mList.Strings[I];
                  St:=After('f',St) ;
                  ListBox2.Items.Strings[5]:='������� �1, ������: '+St;
  end;
end;
end;
mlist.Free;
//=====================================================
//=====================================================
mlist := TStringList.Create;
get_user_actions(S,mlist);
for I := 0 to mList.Count - 1 do begin
Tr:=mList.Strings[I];
        for N := 1 to length(Tr) do begin
              if Tr[N]='j' then begin       //������� 2 -������
                  St:=mList.Strings[I];
                  St:=After('j',St) ;
                  ListBox2.Items.Strings[6]:='������� �2, ������: '+St;
  end;
end;
end;
mlist.Free;
//=====================================================
//=====================================================
mlist := TStringList.Create;
get_user_actions(S,mlist);
for I := 0 to mList.Count - 1 do begin
Tr:=mList.Strings[I];
        for N := 1 to length(Tr) do begin
              if Tr[N]='b' then begin       //������� 3 -������
                  St:=mList.Strings[I];
                  St:=After('b',St) ;
                  ListBox2.Items.Strings[7]:='������� �3, ������: '+St;
  end;
end;
end;
mlist.Free;
//=====================================================
//=====================================================
mlist := TStringList.Create;
get_user_actions(S,mlist);
for I := 0 to mList.Count - 1 do begin
Tr:=mList.Strings[I];
        for N := 1 to length(Tr) do begin
              if Tr[N]='h' then begin       //������� 4 -������
                  St:=mList.Strings[I];
                  St:=After('h',St) ;
                  ListBox2.Items.Strings[8]:='������� �4, ������: '+St;
  end;
end;
end;
mlist.Free;
//=====================================================
//=====================================================
mlist := TStringList.Create;
get_user_actions(S,mlist);
for I := 0 to mList.Count - 1 do begin
Tr:=mList.Strings[I];
        for N := 1 to length(Tr) do begin
              if Tr[N]='m' then begin       //������� 5 -������
                  St:=mList.Strings[I];
                  St:=After('m',St) ;
                  ListBox2.Items.Strings[9]:='������� �5, ������: '+St;
  end;
end;
end;
mlist.Free;
//=====================================================
//ListBox2.Items.Strings[9]:='������ � ������� ������� �-414:';
//ListBox2.Items.Strings[10]:=' ';
//mlist := TStringList.Create;
//get_user_actions(S,mlist);
//for I := 0 to mList.Count - 1 do begin
//Tr:=mList.Strings[I];
//        for N := 1 to length(Tr) do begin
//              if Tr[N]='u' then begin     //���� � ��������
//                  St:=mList.Strings[I];
//                  St:=Before('@',St) ;
//                  ListBox2.Items.Add('������ ��������: '+St);
//end;
//                                    end;
//                                end;
//mlist.Free;
//====================================================
//mlist := TStringList.Create;
//get_user_actions(S,mlist);
//for I := 0 to mList.Count - 1 do begin
//Tr:=mList.Strings[I];
//        for N := 1 to length(Tr) do begin
//              if Tr[N]='c' then begin       //����� �� ���������
//                  St:=mList.Strings[I];
//                  St:=Before('@',St) ;
//                  ListBox2.Items.Add('����� �� ���������: '+St);
//  end;
//end;
//end;
//mlist.Free;
//=====================================================
mlist := TStringList.Create;
get_user_actions(S,mlist);
for I := 0 to mList.Count - 1 do begin
Tr:=mList.Strings[I];
        for N := 1 to length(Tr) do begin
              if Tr[N]='z' then begin       //������� 1
                  St:=mList.Strings[I];
                  St:=Before('@',St) ;
                  ListBox2.Items.Add('������ ������� �1: '+St);
  end;
end;
end;
mlist.Free;
//=====================================================
mlist := TStringList.Create;
get_user_actions(S,mlist);
for I := 0 to mList.Count - 1 do begin
Tr:=mList.Strings[I];
        for N := 1 to length(Tr) do begin
              if Tr[N]='q' then begin       //������� 2
                  St:=mList.Strings[I];
                  St:=Before('@',St) ;
                  ListBox2.Items.Add('������ ������� �2: '+St);
  end;
end;
end;
mlist.Free;
//=====================================================
mlist := TStringList.Create;
get_user_actions(S,mlist);
for I := 0 to mList.Count - 1 do begin
Tr:=mList.Strings[I];
        for N := 1 to length(Tr) do begin
              if Tr[N]='t' then begin       //������� 3
                  St:=mList.Strings[I];
                  St:=Before('@',St) ;
                  ListBox2.Items.Add('������ ������� �3: '+St);
  end;
end;
end;
mlist.Free;
//=====================================================
mlist := TStringList.Create;
get_user_actions(S,mlist);
for I := 0 to mList.Count - 1 do begin
Tr:=mList.Strings[I];
        for N := 1 to length(Tr) do begin
              if Tr[N]='s' then begin       //������� 4
                  St:=mList.Strings[I];
                  St:=Before('@',St) ;
                  ListBox2.Items.Add('������ ������� �4: '+St);
  end;
end;
end;
mlist.Free;
//=====================================================
mlist := TStringList.Create;
get_user_actions(S,mlist);
for I := 0 to mList.Count - 1 do begin
Tr:=mList.Strings[I];
        for N := 1 to length(Tr) do begin
              if Tr[N]='l' then begin       //������� 5
                  St:=mList.Strings[I];
                  St:=Before('@',St) ;
                  ListBox2.Items.Add('������ ������� �5: '+St);
  end;
end;
end;
mlist.Free;
//=====================================================
end;

procedure T_Stat.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  myColor: TColor;
  myBrush: TBrush;
begin
//  myBrush := TBrush.Create;
//  with (Control as TListBox).Canvas do
//  begin
//    if not Odd(Index) then
//      myColor := clRed
//    else
//      myColor := clBlue;
//
//    myBrush.Style := bsSolid;
//    myBrush.Color := myColor;
//    Windows.FillRect(handle, Rect, myBrush.Handle);
//    Brush.Style := bsClear;
//    TextOut(Rect.Left, Rect.Top,
//      (Control as TListBox).Items[Index]);
//    MyBrush.Free;
//  end;

end;

end.
