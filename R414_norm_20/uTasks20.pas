unit uTasks20;

interface

uses
  forms,
  Controls,
  Classes,
  StdCtrls,
  ExtCtrls,
   ComCtrls,
  SysUtils,
  Windows,
  uStationStateDM;


 type TSubTask = class
   public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; virtual; abstract;
   constructor Create; virtual;
   var
   EventFormName: String;
   Text: String;
   Name: String;
   Time: String;
   IsComplete: Boolean;

 end;



type TTask = class
      public
      TimeStart: TDateTime;
      TimeEnd: TDateTime;
       Name: String;
  constructor Create; virtual;
  var
    CurrentSubTask: TSubTask;
    SubTasks: array of TSubTask;
    CurrentSubTaskNum: Integer;

end;


 {$REGION '������ �������'}
   //================
  type TTaskNone = class (TTask)
    public
   constructor Create;  override;
  end;


  type TTaskNoneSubTask1 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;
  //=============
 {$ENDREGION}
  {$REGION '��������� �������, ���������'}

    type TTaskPowerOn = class (TTask)
    public
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask1 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask2 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask3 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;


   type TTaskPowerOnSubTask4 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskPowerOnSubTask5 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskPowerOnSubTask6 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask7 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask8 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskPowerOnSubTask9 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskPowerOnSubTask10 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;


     type TTaskPowerOnSubTask11 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

       type TTaskPowerOnSubTask12 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskPowerOnSubTask13 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

  //================
  {$ENDREGION}

   type TTaskConnectToR415 = class (TTask)
    public
   constructor Create;  override;
  end;

    type TTaskConnectToR415SubTask1 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;



implementation

uses

uBlockPowerPanelForm;

 //�������� �������
  constructor TTask.Create;
  begin
       CurrentSubTaskNum:= 0;
        TimeStart:= Time;
  end;

    constructor TSubTask.Create;
  begin

  end;



{$REGION '������ �������'}

  constructor TTaskNone.Create;
  begin
  inherited Create;

  Name:='��������� ������ �������';

  SetLength(SubTasks, 1);

  SubTasks[0]:= TTaskNoneSubTask1.Create;



  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;

   function TTaskNoneSubTask1.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
      var CurForm: TForm;
   begin
   CurForm:= (Sender as TComponent).Owner as TForm;
        result:=true;
   end;

   constructor TTaskNoneSubTask1.Create;
   begin
   inherited Create;

        Name:='��������� ������ �������';
        Text:='';
        EventFormName:='nil';
        Time:= '';
   end;
{$ENDREGION}



{$REGION '��������� �������'}

  constructor TTaskPowerOn.Create;
  begin
  inherited Create;

  Name:='��������� �������';

  SetLength(SubTasks, 13);

  SubTasks[0]:= TTaskPowerOnSubTask1.Create;
  SubTasks[1]:= TTaskPowerOnSubTask2.Create;
  SubTasks[2]:= TTaskPowerOnSubTask3.Create;
  SubTasks[3]:= TTaskPowerOnSubTask4.Create;
  SubTasks[4]:= TTaskPowerOnSubTask5.Create;
  SubTasks[5]:= TTaskPowerOnSubTask6.Create;
  SubTasks[6]:= TTaskPowerOnSubTask7.Create;
  SubTasks[7]:= TTaskPowerOnSubTask8.Create;
  SubTasks[8]:= TTaskPowerOnSubTask9.Create;
  SubTasks[9]:= TTaskPowerOnSubTask10.Create;
  SubTasks[10]:= TTaskPowerOnSubTask11.Create;
  SubTasks[11]:= TTaskPowerOnSubTask12.Create;
  SubTasks[12]:= TTaskPowerOnSubTask13.Create;

  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;

   //===
   function TTaskPowerOnSubTask1.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin

         if (Station.PowerPanel.swNet=1) and (Station.PowerPanel.swPhase=4) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask1.Create;
   begin
   inherited Create;

        Name:='�� ���� ������� ������ ������ ����';
        Text:='�� ���� ������� 1820 ������ ������ ����. ���������� ���������� ����� ����. ����������������� � ������� ������������� �������� ���������� ������� � �������� ���������� �� ����� 1-2, 2-3, 3-1';
        EventFormName:='��� �������';
        Time:= '';
   end;

  //  ===

   function TTaskPowerOnSubTask2.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.PowerPanel.sw1700Power=1) and (Station.PowerPanel.sw1900Power=1) and (Station.PowerPanel.sw1900Power_2=1)
         and  (Station.PowerPanel.sw1200Power_2=1) and (Station.PowerPanel.sw1200Power=1) and (Station.PowerPanel.sw1400=1) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask2.Create;
   begin
   inherited Create;

        Name:='�� ���� ������� �������� 1900�, 1900�, 1200�, 1200�, 1700';
        Text:='�� ���� ������� 1820 ����������� 1900�, 1900�, 1200�, 1200�, 1700, 1400, ���������� � ��������� ���. ��� ���� ���������� ���������� ����� ��� �������������';
        EventFormName:='��� �������';
        Time:= '';
   end;
         //==

   function TTaskPowerOnSubTask3.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.HalfSetA.LittleNoisyAmplifier.butNet2=0)  and
         (Station.HalfSetA.LittleNoisyAmplifier.butNet=0) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask3.Create;
   begin
   inherited Create;

        Name:='��� �������� �� ��� 1830�';
        Text:='�������� �� ����� ��� 1830� ���������� � ��������� ���. ��� ���� ���������� ���������� ����� ��� �������������';
        EventFormName:='��� �';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask4.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.HalfSetB.LittleNoisyAmplifier.butNet2=0)  and
         (Station.HalfSetB.LittleNoisyAmplifier.butNet=0) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask4.Create;
   begin
   inherited Create;

        Name:='��� �������� �� ��� 1830�';
        Text:='�������� �� ����� ��� 1830� ���������� � ��������� ���. ��� ���� ���������� ���������� ����� ��� �������������';
        EventFormName:='��� �';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask5.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.HalfSetA.Rack1920.but1910=butPositionUp) and
         (Station.HalfSetA.Rack1920.but1910A=butPositionUp) and
         (Station.HalfSetA.Rack1920.butPower=butPositionUp) and
         (Station.HalfSetA.Rack1920.butPower2=butPositionUp) and
         (Station.HalfSetA.Rack1920.but1930=butPositionUp) and
         (Station.HalfSetA.Rack1920.but1960_1=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask5.Create;
   begin
   inherited Create;

        Name:='��� �������� �� ������ 1920�';
        Text:='�� ������ 1920�: �������� �� ������ 1920 ���������� � ��������� ���. �������� �� ������ 1910 ���������� � ��������� ���. ������� �� ����� 1930 ���������� � ��������� ���. ������� �� ����� 1360 ���������� � ��������� ���.';
        EventFormName:='1920 �';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask6.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.HalfSetB.Rack1920.but1910=butPositionUp) and
         (Station.HalfSetB.Rack1920.but1910A=butPositionUp) and
         (Station.HalfSetB.Rack1920.butPower=butPositionUp) and
         (Station.HalfSetB.Rack1920.butPower2=butPositionUp) and
         (Station.HalfSetB.Rack1920.but1930=butPositionUp) and
         (Station.HalfSetB.Rack1920.but1960_1=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask6.Create;
   begin
   inherited Create;

        Name:='��� �������� �� ������ 1920�';
        Text:='�� ������ 1920�: �������� �� ������ 1920 ���������� � ��������� ���. �������� �� ������ 1910 ���������� � ��������� ���. ������� �� ����� 1930 ���������� � ��������� ���. ������� �� ����� 1360 ���������� � ��������� ���.';
        EventFormName:='1920 �';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask7.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.HalfSetA.Rack1200Left.but1240K=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask7.Create;
   begin
   inherited Create;

        Name:='�������� ���� �� ������ 1200 ��� �';
        Text:='�� ������ 1200 ��� � ������� ���� �� ����� 1240� ���������� � ��������� ���. ���������� ���������� ����� ��� ���������';
        EventFormName:='1200 ��� �';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask8.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.HalfSetB.Rack1200Left.but1240K=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask8.Create;
   begin
   inherited Create;

        Name:='�������� ���� �� ������ 1200 ��� �';
        Text:='�� ������ 1200 ��� � ������� ���� �� ����� 1240� ���������� � ��������� ���. ���������� ���������� ����� ��� ���������';
        EventFormName:='1200 ��� �';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask9.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.Rack1710.butPower=butPositionRight) and (Station.Rack1710.butSpeaker=butPositionRight) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask9.Create;
   begin
   inherited Create;

        Name:='�� ������ 1710 ��� ���. �� ����� 470';
        Text:='�� ������ 1710 �� ����� 470 �������� ���. � ���������������� ��������� � ��������� ���.';
        EventFormName:='1710';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask10.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.Rack1400.butPower = butPositionRight) and (Station.Rack1400.butSpeaker = butPositionRight) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask10.Create;
   begin
   inherited Create;

        Name:='�� ������ 1400 ��� ���. �� ����� 470';
        Text:='�� ������ 1400 �� ����� 470 �������� ���. � ���������������� ��������� � ��������� ���.';
        EventFormName:='1400';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask11.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.P321C.butPower=butPositionUp) and (Station.P321C.butMeasure=butPositionUp) and (Station.P321C.but600Ohm=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask11.Create;
   begin
   inherited Create;

        Name:='�������� ������� �-321 �';
        Text:='�� ������� �-321 � ���������� �������� �� �������: ������� ���., �����., 600 ��';
        EventFormName:='�-321 �';
        Time:= '';
   end;

     //==

   function TTaskPowerOnSubTask12.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.PowerSupply.butPower=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask12.Create;
   begin
   inherited Create;

        Name:='�������� ������� �-323��';
        Text:='�� ������� �-323 �� ���������� ������� ������� �� ������� ���.';
        EventFormName:='�-323 ��';
        Time:= '';
   end;


     //==

   function TTaskPowerOnSubTask13.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (true) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask13.Create;
   begin
   inherited Create;

        Name:='�������� ������� ������������';
        Text:='�� ������������ ���������� ������� ������� �� ������� ���.';
        EventFormName:='�����������';
        Time:= '';
   end;

{$ENDREGION}

  constructor TTaskConnectToR415.Create;
  begin
  inherited Create;

  Name:='��������� �������';

  SetLength(SubTasks, 1);

  SubTasks[0]:= TTaskConnectToR415SubTask1.Create;


  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;

   //===
   function TTaskConnectToR415SubTask1.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin

         if (true) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskConnectToR415SubTask1.Create;
   begin
   inherited Create;

        Name:='���?';
        Text:='���-���?';
        EventFormName:='���-��';
        Time:= '';
   end;

end.

