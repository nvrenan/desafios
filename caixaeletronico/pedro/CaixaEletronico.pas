unit CaixaEletronico;

interface

uses
  SysUtils;

type
  EOperacaoInvalida =  class(Exception);

  TCaixaEletronico = class
  private
    function RetirarValorAproximado(Valor: Integer): Integer;
    function SepararNotas(Valor: Integer): string;
  public
    function Sacar(Valor: Integer): string;
  end;

implementation

{ TCaixaEletronico }

function TCaixaEletronico.RetirarValorAproximado(Valor: Integer): Integer;
const
  Notas: array[0..5] of Integer = (100, 50, 20, 10, 5, 2);
var
  Nota: Integer;
begin
  Result := 2;
  for Nota in Notas do
  begin
    if (Valor >= Nota) and (not Odd(Valor mod Nota)) then
    begin
      Result := Nota;
      Break;
    end;
  end;
end;

function TCaixaEletronico.SepararNotas(Valor: Integer): string;
var
  ValorRetirado: Integer;
begin
  ValorRetirado := RetirarValorAproximado(Valor);
  if Valor = ValorRetirado then
    Result := IntToStr(ValorRetirado)
  else
    Result := IntToStr(ValorRetirado) +', '+ SepararNotas(Valor - ValorRetirado);
end;

function TCaixaEletronico.Sacar(Valor: Integer): string;
begin
  if (Valor < 2) or (Valor = 3) then
    raise EOperacaoInvalida.Create('Valor inválido para saque.');

  Result := SepararNotas(Valor);
end;

end.
