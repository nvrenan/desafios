program ComumTests;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  CaixaEletronicoTestes in 'CaixaEletronicoTestes.pas',
  CaixaEletronico in 'CaixaEletronico.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  DUnitTestRunner.RunRegisteredTests;
end.
