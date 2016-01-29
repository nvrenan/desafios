unit Unit2;

interface

uses
 System.SysUtils;

type
  TValorCedula = (tvc100 = 100, tvc50 = 50, tvc20 = 20, tvc10 = 10, tvc5 = 5, tvc2 = 2);

  TCaixaEletronico = class
  private
    fQtdCedulas2: Integer;
    fQtdCedulas5: Integer;
    fQtdCedulas10: Integer;
    fQtdCedulas20: Integer;
    fQtdCedulas50: Integer;
    fQtdCedulas100: Integer;
    fValorFaltanteParaRetirada: Integer;
    procedure AddCedula(ValorCedula: TValorCedula; qtde: Integer = 1);
    procedure TentaCedula(ValorCedula: TValorCedula);
  public
    procedure CalculaNotas;
    function ToString: string; override;
    constructor Create(ValorDeRetirada: Integer);
  end;


implementation

{ TCaixaEletronico }

procedure TCaixaEletronico.AddCedula(ValorCedula: TValorCedula; qtde: Integer);
begin
  case ValorCedula of
    tvc2: fQtdCedulas2 := fQtdCedulas2 + qtde;
    tvc5: fQtdCedulas5 := fQtdCedulas5 + qtde;
    tvc10: fQtdCedulas10 := fQtdCedulas10 + qtde;
    tvc20: fQtdCedulas20 := fQtdCedulas20 + qtde;
    tvc50: fQtdCedulas50 := fQtdCedulas50 + qtde;
    tvc100: fQtdCedulas100 := fQtdCedulas100 + qtde;
  end;
end;

procedure TCaixaEletronico.CalculaNotas;
begin
  Self.TentaCedula(tvc5);
  Self.TentaCedula(tvc100);
  Self.TentaCedula(tvc50);
  Self.TentaCedula(tvc20);
  Self.TentaCedula(tvc10);
  Self.TentaCedula(tvc2);
end;

constructor TCaixaEletronico.Create(ValorDeRetirada: Integer);
begin
  fQtdCedulas2 := 0;
  fQtdCedulas5 := 0;
  fQtdCedulas10 := 0;
  fQtdCedulas20 := 0;
  fQtdCedulas50 := 0;
  fQtdCedulas100 := 0;
  fValorFaltanteParaRetirada := ValorDeRetirada;
end;

procedure TCaixaEletronico.TentaCedula(ValorCedula: TValorCedula);
var
  vlrAux: Integer;
begin
  vlrAux := 0;
  if (ValorCedula = tvc5) then
  begin
    if ((fValorFaltanteParaRetirada mod 2) > 0) then
    begin
      Self.AddCedula(tvc5);
      vlrAux := 1;
    end;
  end
  else
  begin
    vlrAux := Trunc(fValorFaltanteParaRetirada/Ord(ValorCedula));
    Self.AddCedula(ValorCedula, vlrAux);
  end;
  fValorFaltanteParaRetirada := fValorFaltanteParaRetirada - (Ord(ValorCedula) * vlrAux);
end;

function TCaixaEletronico.ToString: string;
begin
  if fQtdCedulas2 > 0 then
    Result := Result + IntToStr(fQtdCedulas2) + ' Nota(s) de 2.' + #13#10;
  if fQtdCedulas5 > 0 then
    Result := Result + IntToStr(fQtdCedulas5) + ' Nota de 5.' + #13#10;
  if fQtdCedulas10 > 0 then
    Result := Result + IntToStr(fQtdCedulas10) + ' Nota de 10.' + #13#10;
  if fQtdCedulas20 > 0 then
    Result := Result + IntToStr(fQtdCedulas20) + ' Nota(s) de 20.' + #13#10;
  if fQtdCedulas50 > 0 then
    Result := Result + IntToStr(fQtdCedulas50) + ' Nota de 50.' + #13#10;
  if fQtdCedulas100 > 0 then
    Result := Result + IntToStr(fQtdCedulas100) + ' Nota(s) de 100.' + #13#10;
end;

end.
