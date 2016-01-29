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
  public
    procedure AddCedula(ValorCedula: TValorCedula; qtde: Integer = 1);
    function GetValorTotal: Integer;
    function ToString: string;
    constructor Create(ValorDeRetirada: Integer);
  end;


implementation

{ TCaixaEletronico }

procedure TCaixaEletronico.AddCedula(ValorCedula: TValorCedula; qtde: Integer);
var
  I: Integer;
begin
  for I := 1 to qtde do
  begin
    case ValorCedula of
      tvc2:Inc(fQtdCedulas2);
      tvc5: Inc(fQtdCedulas5);
      tvc10: Inc(fQtdCedulas10);
      tvc20: Inc(fQtdCedulas20);
      tvc50: Inc(fQtdCedulas50);
      tvc100: Inc(fQtdCedulas100);
    end;
  end;
end;

constructor TCaixaEletronico.Create(ValorDeRetirada: Integer);
begin
  fQtdCedulas2 := 0;
  fQtdCedulas5 := 0;
  fQtdCedulas10 := 0;
  fQtdCedulas20 := 0;
  fQtdCedulas50 := 0;
  fQtdCedulas100 := 0;
end;

function TCaixaEletronico.GetValorTotal: Integer;
begin
  Result := (2 * fQtdCedulas2) +
            (5 * fQtdCedulas5) +
            (10 * fQtdCedulas10) +
            (20 * fQtdCedulas20) +
            (50 * fQtdCedulas50) +
            (100 * fQtdCedulas100);
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
