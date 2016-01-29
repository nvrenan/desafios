unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure QuantidadeDeNotas(valorRequirido: Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
begin
  QuantidadeDeNotas(StrToInt(Edit1.Text));
end;

procedure TForm1.QuantidadeDeNotas(valorRequirido: Integer);
var
  CaixaEletronico: TCaixaEletronico;
  vlrAux: Integer;
begin
  CaixaEletronico := TCaixaEletronico.Create(valorRequirido);
  try
    if ((valorRequirido < 4) and (valorRequirido <> 2)) then
    begin
      ShowMessage('Valor inválido');
      Exit;
    end;

    if (valorRequirido mod 2) > 0 then
    begin
      CaixaEletronico.AddCedula(tvc5);
      valorRequirido := valorRequirido - 5;
    end;

    vlrAux := Trunc(valorRequirido/100);
    CaixaEletronico.AddCedula(tvc100, vlrAux);
    valorRequirido := valorRequirido - (100 * vlrAux);

    vlrAux := Trunc(valorRequirido/50);
    CaixaEletronico.AddCedula(tvc50);
    valorRequirido := valorRequirido - (50 * vlrAux);

    vlrAux := Trunc(valorRequirido/20);
    CaixaEletronico.AddCedula(tvc20, vlrAux);
    valorRequirido := valorRequirido - (20 * vlrAux);

    vlrAux := Trunc(valorRequirido/10);
    CaixaEletronico.AddCedula(tvc10, vlrAux);
    valorRequirido := valorRequirido - (10 * vlrAux);

    vlrAux := Trunc(valorRequirido/2);
    CaixaEletronico.AddCedula(tvc2, vlrAux);
    valorRequirido := valorRequirido - (2 * vlrAux);

    ShowMessage(CaixaEletronico.ToString);
    Edit1.SetFocus;

  finally
    CaixaEletronico.Free;
  end;
end;

end.
