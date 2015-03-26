program StationR414;



uses
  Forms,
  uStationR414Form in 'uStationR414Form.pas' {StationR414Form},
  uRack1500bForm in 'uRack1500bForm.pas' {Rack1500bForm},
  uBlockPowerSupplyForm in 'uBlockPowerSupplyForm.pas' {BlockPowerSupplyForm},
  uBlockRemoteControllerForm in 'uBlockRemoteControllerForm.pas' {_Pult},
  uBlockOscillographForm in 'uBlockOscillographForm.pas' {BlockOscillographForm},
  uBlockPowerPanelForm in 'uBlockPowerPanelForm.pas' {BlockPowerPanelForm},
  uRack1500Form in 'uRack1500Form.pas' {Rack1500Form},
  uRack1600Form in 'uRack1600Form.pas' {Rack1600Form},
  uRack1600BForm in 'uRack1600BForm.pas' {Rack1600BForm},
  uRack1920Form in 'uRack1920Form.pas' {Rack1920Form},
  uBlockWaveMeterForm in 'uBlockWaveMeterForm.pas' {BlockWaveMeterForm},
  uRackP321Form in 'uRackP321Form.pas' {RackP321Form},
  uBlockGeneratorForm in 'uBlockGeneratorForm.pas' {BlockGeneratorForm},
  uBlockLittleNoisyAmplifierForm in 'uBlockLittleNoisyAmplifierForm.pas' {_MSHUpod},
  uRack1710Form in 'uRack1710Form.pas' {Rack1710Form},
  uRack1400Form in 'uRack1400Form.pas' {Rack1400Form},
  uReportForm in 'uReportForm.pas' {ReportForm},
  uRack1200LeftForm in 'uRack1200LeftForm.pas' {Rack1200LeftForm},
  uRack1200RightForm in 'uRack1200RightForm.pas' {Rack1200RightForm},
  uWaveMeterPanelForm in 'uWaveMeterPanelForm.pas' {WaveMeterPanelForm},
  uRack1500MinForm in 'uRack1500MinForm.pas' {Rack1500MinForm},
  uHandsetForm in 'uHandsetForm.pas' {HandsetForm},
  uDefinitionsDM in 'uDefinitionsDM.pas',
  uSettingsForm in 'uSettingsForm.pas' {SettingsForm},
  uAboutProgramForm in 'uAboutProgramForm.pas' {AboutProgramForm},
  uBlockDuplexerForm in 'uBlockDuplexerForm.pas' {BlockDuplexerForm},
  uRackP321MinForm in 'uRackP321MinForm.pas' {RackP321MinForm},
  uBlockOscillographMinForm in 'uBlockOscillographMinForm.pas' {BlockOscillographMinForm},
  uP321DisplayForm in 'uP321DisplayForm.pas' {P321DisplayForm},
  uVideoHelpForm in 'uVideoHelpForm.pas' {VideoHelpForm},
  uFilterForm in 'uFilterForm.pas' {FilterForm},
  uStationR414MinForm in 'uStationR414MinForm.pas' {StationR414MinForm},
  uAdditionalFormMethods in 'uAdditionalFormMethods.pas',
  uCurrentTaskForm in 'uCurrentTaskForm.pas' {CurrentTaskForm},
  uBackgroundForm in 'uBackgroundForm.pas' {BackgroundForm},
  uConstantsDM in 'uConstantsDM.pas',
  uButtonBackForm in 'uButtonBackForm.pas' {ButtonBackForm},
  uTasksDM in 'uTasksDM.pas',
  uStationStateDM in 'uStationStateDM.pas',
  uImageRotator in 'uImageRotator.pas',
  uMainMenuModernForm in 'uMainMenuModernForm.pas' {MainMenuModernForm},
  uNetWorkerDM in 'uNetWorkerDM.pas',
  uPreparationToWorkForm in 'uPreparationToWorkForm.pas' {PreparationToWorkForm},
  uClientStateDM in 'uClientStateDM.pas',
  uConnectToServerForm in 'uConnectToServerForm.pas' {ConnectToServerForm},
  uKeyValueDM in 'uKeyValueDM.pas',
  uRequestDM in 'uRequestDM.pas',
  uResponseListenerDM in 'uResponseListenerDM.pas',
  uSettingsDM in 'uSettingsDM.pas',
  uNetworkSenderDM in 'uNetworkSenderDM.pas',
  uRandomMethods in 'uRandomMethods.pas',
  uTaskControllerDM in 'uTaskControllerDM.pas',
  uStationInitializer in 'uStationInitializer.pas',
  uTasks20 in 'uTasks20.pas',
  uErrorKeeper in 'uErrorKeeper.pas',
  ChatForm in 'ChatForm.pas' {TChatForm};

{$R *.res}

begin
  Application.Initialize;

  //-----------------GLOBAL DEFINITINOS BEGAN HERE-------------------------

  //Host := '127.0.0.1';
  //Port := 16552;


  //-----------------------------------------------------------------------

  Application.CreateForm(TMainMenuModernForm, MainMenuModernForm);
  //  Application.CreateForm(TBlockGeneratorForm, BlockGeneratorForm);
//  Application.CreateForm(TBlockLittleNoisyAmplifierForm, BlockLittleNoisyAmplifierForm);
//  Application.CreateForm(TRack1710Form, Rack1710Form);
//  Application.CreateForm(TRack1400Form, Rack1400Form);
//  Application.CreateForm(TReportForm, ReportForm);
//  Application.CreateForm(TRack1200LeftForm, Rack1200LeftForm);
//  Application.CreateForm(TBlockDuplexerForm, BlockDuplexerForm);
//  Application.CreateForm(TRack1200RightForm, Rack1200RightForm);
//  Application.CreateForm(TWaveMeterPanelForm, WaveMeterPanelForm);
//  Application.CreateForm(TRack1500MinForm, Rack1500MinForm);
//  Application.CreateForm(THandsetForm, HandsetForm);
//  Application.CreateForm(TAboutProgramForm, AboutProgramForm);
//  Application.CreateForm(TPassWordForm, PassWordForm);
//  Application.CreateForm(TBlockDuplexerForm, BlockDuplexerForm);
//  Application.CreateForm(TBlockOscillographMinForm, BlockOscillographMinForm);
//  Application.CreateForm(TP321DisplayForm, P321DisplayForm);
//  Application.CreateForm(TVideoHelpForm, VideoHelpForm);
//  Application.CreateForm(TFilterForm, FilterForm);
//  Application.CreateForm(TStationR414MinForm, StationR414MinForm);
//  Application.CreateForm(TCurrentTaskForm, CurrentTaskForm);
//  Application.CreateForm(TBackgroundForm, BackgroundForm);
//  Application.CreateForm(TbuttonBackForm, buttonBackForm);
//  Application.CreateForm(TRegistrationForm, RegistrationForm);
//  Application.CreateForm(TUsersForm, UsersForm);
//  Application.ProcessMessages;
//  Application.CreateForm(TStationR414Form, StationR414Form);
//  //_loader.ProgressBar1.Position:=25;
//  Application.CreateForm(TBlockPowerSupplyForm, BlockPowerSupplyForm);
//  Application.CreateForm(T_Pult, _Pult);
//  Application.CreateForm(TBlockOscillographForm, BlockOscillographForm);
//  Application.CreateForm(TBlockPowerPanelForm, BlockPowerPanelForm);
//  Application.CreateForm(TRack1500Form, Rack1500Form);
//  //_loader.ProgressBar1.Position:=50;
//  Application.CreateForm(TRack1500bForm, Rack1500bForm);
//  Application.CreateForm(TRack1600Form, Rack1600Form);
//  Application.CreateForm(TRack1600BForm, Rack1600BForm);
//  Application.CreateForm(TRack1920Form, Rack1920Form);
//  Application.CreateForm(TBlockWaveMeterForm, BlockWaveMeterForm);
//  //_loader.ProgressBar1.Position:=75;
//  Application.CreateForm(TRackP321Form, RackP321Form);
//  Application.CreateForm(TRack1200LeftForm, Rack1200LeftForm);
//  Application.CreateForm(TRack1200RightForm, Rack1200RightForm);
//  //_loader.ProgressBar1.Position:=100;
//
//  Application.CreateForm(TBlockLittleNoisyAmplifierForm, BlockLittleNoisyAmplifierForm);
  //_loader.Visible := False;
  //_loader.Hide;


    //???????? ????????? ?? ?????
//  FormsArr[idShield] := BlockPowerPanelForm;
//  FormsArr[idMshuB] := BlockLittleNoisyAmplifierForm;
//  FormsArr[idGeneratorB] := BlockGeneratorForm;
//  FormsArr[idDuplexerB] := BlockDuplexerForm;
//  FormsArr[idRack1500B] := Rack1500Form;
//  FormsArr[idRack1920B] := Rack1920Form;
//  FormsArr[idRack1600B] := Rack1600Form;
//  FormsArr[idWaveMeterB] := BlockWaveMeterForm;
//  FormsArr[idRack1200B2] := Rack1200RightForm;
//  FormsArr[idRack1200A2] := Rack1200RightForm;
//  FormsArr[idP321B] := RackP321Form;
//  FormsArr[idRack1400B] := Rack1400Form;
//  FormsArr[idOscillographC] := BlockOscillographForm;
//  FormsArr[idP321C] := RackP321Form;
//  FormsArr[idPultB] := _Pult;
//  FormsArr[idPowerC] := BlockPowerSupplyForm;
//  FormsArr[idPultA] := _Pult;
//  FormsArr[idRack1710A] := Rack1710Form;
//  FormsArr[idRack1200B1] := Rack1200LeftForm;
//  FormsArr[idRack1200A1] := Rack1200LeftForm;
//  FormsArr[idP321A] := RackP321Form;
//  FormsArr[idRack1600A] := Rack1600Form;
//  FormsArr[idWaveMeterA] := BlockWaveMeterForm;
//  FormsArr[idRack1920A] := Rack1920Form;
//  FormsArr[idRack1500A] := Rack1500Form;
//  FormsArr[idDuplexerA] := BlockDuplexerForm;
//  FormsArr[idMshuA] := BlockLittleNoisyAmplifierForm;
//  FormsArr[idGeneratorA] := BlockGeneratorForm;
////  FormsArr[idRack1600Aback] := Rack1600BForm;
////  FormsArr[idRack1600Bback] := Rack1600BForm;
//
//    //-----additional forms---------
//  FormsArr[idRack1500Aback] := Rack1500bForm;
//  FormsArr[idRack1500Bback] := Rack1500bForm;
//  FormsArr[idRack1600Aback] := Rack1600BForm;
//  FormsArr[idRack1600Bback] := Rack1600BForm;

  uSettingsDM.Settings := TSettings.Create;    // Хранилище настроек приложения
                                               // Подобие статического класса
  Application.Run;

  uSettingsDM.Settings.Free;
end.
