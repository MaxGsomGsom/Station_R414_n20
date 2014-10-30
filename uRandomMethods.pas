unit uRandomMethods;

interface
  function GetRandomSwitcherState: Byte;
  function GetRandomCableState: Byte;
  function GetRandomButtonState: Byte;
  function GetRandomTuneValue: Byte;
  function GetRandomWaveValue: Byte;

implementation

uses
  uConstantsDM,
  uTasksDM;

function GetRandomTuneValue: Byte;
var
  btA: Byte;
begin
  Randomize;
  btA := Random(10);
  Result := btA + 2;
end;

function GetRandomWaveValue: Byte;
var
  btA: Byte;
begin
  Randomize;
  btA := Random(MAX_WAVE_VALUE);
  Result := btA + 1;
end;

function GetRandomCableState: Byte;
var
  btA: Byte;
begin
  Randomize;
  btA := Random(2);
  Result := btA;
end;

function GetRandomSwitcherState: Byte;
var
  btA: Byte;
begin
  Randomize;
  btA := Random(4) + 1;
  Result := btA;
end;

function GetRandomButtonState: Byte;
var
  btA: Byte;
begin
  Randomize;
  btA := Random(2);
  Result := btA;
end;


end.
