unit CaixaEletronicoTestes;

interface

uses
  TestFramework, SysUtils, CaixaEletronico;

type
  TCaixaEletronicoTestes = class(TTestCase)
  private
    FCaixaEletronico: TCaixaEletronico;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure SacarValor1;
    procedure SacarValor2;
    procedure SacarValor3;
    procedure SacarValor8;
    procedure SacarValor14;
    procedure SacarValor21;
    procedure SacarValor23;
    procedure SacarValor30;
    procedure SacarValor31;
    procedure SacarValor33;
    procedure SacarValor35;
    procedure SacarValor37;
    procedure SacarValor40;
    procedure SacarValor41;
    procedure SacarValor43;
    procedure SacarValor57;
    procedure SacarValor58;
    procedure SacarValor59;
    procedure SacarValor351;
    procedure SacarValor353;
  end;

implementation

{ TCaixaEletronicoTestes }

procedure TCaixaEletronicoTestes.SetUp;
begin
  inherited;
  FCaixaEletronico := TCaixaEletronico.Create;
end;

procedure TCaixaEletronicoTestes.TearDown;
begin
  inherited;
  FCaixaEletronico.Free;
end;

procedure TCaixaEletronicoTestes.SacarValor1;
begin
  try
    FCaixaEletronico.Sacar(1);
  except
    on E:Exception do
      CheckEquals(E.Message, 'Valor inválido para saque.');
  end;
end;

procedure TCaixaEletronicoTestes.SacarValor2;
begin
  CheckEquals('2', FCaixaEletronico.Sacar(2));
end;

procedure TCaixaEletronicoTestes.SacarValor3;
begin
  try
    FCaixaEletronico.Sacar(3);
  except
    on E:Exception do
      CheckEquals(E.Message, 'Valor inválido para saque.');
  end;
end;

procedure TCaixaEletronicoTestes.SacarValor8;
begin
  CheckEquals('2, 2, 2, 2', FCaixaEletronico.Sacar(8));
end;

procedure TCaixaEletronicoTestes.SacarValor14;
begin
  CheckEquals('10, 2, 2', FCaixaEletronico.Sacar(14));
end;

procedure TCaixaEletronicoTestes.SacarValor21;
begin
  CheckEquals('2, 5, 10, 2, 2', FCaixaEletronico.Sacar(21));
end;

procedure TCaixaEletronicoTestes.SacarValor23;
begin
  CheckEquals('2, 2, 5, 10, 2, 2', FCaixaEletronico.Sacar(23));
end;

procedure TCaixaEletronicoTestes.SacarValor30;
begin
  CheckEquals('20, 10', FCaixaEletronico.Sacar(30));
end;

procedure TCaixaEletronicoTestes.SacarValor31;
begin
  CheckEquals('2, 5, 20, 2, 2', FCaixaEletronico.Sacar(31));
end;

procedure TCaixaEletronicoTestes.SacarValor33;
begin
  CheckEquals('2, 2, 5, 20, 2, 2', FCaixaEletronico.Sacar(33));
end;

procedure TCaixaEletronicoTestes.SacarValor35;
begin
  CheckEquals('5, 20, 10', FCaixaEletronico.Sacar(35));
end;

procedure TCaixaEletronicoTestes.SacarValor37;
begin
  CheckEquals('5, 20, 10, 2', FCaixaEletronico.Sacar(37));
end;

procedure TCaixaEletronicoTestes.SacarValor40;
begin
  CheckEquals('20, 20', FCaixaEletronico.Sacar(40));
end;

procedure TCaixaEletronicoTestes.SacarValor41;
begin
  CheckEquals('2, 5, 20, 10, 2, 2', FCaixaEletronico.Sacar(41));
end;

procedure TCaixaEletronicoTestes.SacarValor43;
begin
  CheckEquals('2, 2, 5, 20, 10, 2, 2', FCaixaEletronico.Sacar(43));
end;

procedure TCaixaEletronicoTestes.SacarValor57;
begin
  CheckEquals('5, 50, 2', FCaixaEletronico.Sacar(57));
end;

procedure TCaixaEletronicoTestes.SacarValor58;
begin
  CheckEquals('50, 2, 2, 2, 2', FCaixaEletronico.Sacar(58));
end;

procedure TCaixaEletronicoTestes.SacarValor59;
begin
  CheckEquals('5, 50, 2, 2', FCaixaEletronico.Sacar(59));
end;

procedure TCaixaEletronicoTestes.SacarValor351;
begin
  CheckEquals('2, 5, 100, 100, 100, 20, 20, 2, 2', FCaixaEletronico.Sacar(351));
end;

procedure TCaixaEletronicoTestes.SacarValor353;
begin
  CheckEquals('2, 2, 5, 100, 100, 100, 20, 20, 2, 2', FCaixaEletronico.Sacar(353));
end;

initialization
  TestFramework.RegisterTest(TCaixaEletronicoTestes.Suite);

end.

