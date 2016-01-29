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
begin
  if ((valorRequirido < 4) and (valorRequirido <> 2)) then
  begin
    ShowMessage('Valor inválido');
    Exit;
  end;

  CaixaEletronico := TCaixaEletronico.Create(valorRequirido);
  try
    CaixaEletronico.CalculaNotas;
    ShowMessage(CaixaEletronico.ToString);
    Edit1.SetFocus;
  finally
    CaixaEletronico.Free;
  end;
end;

end.
