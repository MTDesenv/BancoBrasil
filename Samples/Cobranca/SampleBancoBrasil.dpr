program SampleBancoBrasil;

uses
  System.StartUpCopy,
  FMX.Forms,
  BancoBrasil.View.Principal in 'BancoBrasil.View.Principal.pas' {Form5},
  BancoBrasil.Helpers in '..\..\src\BancoBrasil.Helpers.pas',
  BancoBrasil.Interfaces in '..\..\src\BancoBrasil.Interfaces.pas',
  BancoBrasil in '..\..\src\BancoBrasil.pas',
  BancoBrasil.Types in '..\..\src\BancoBrasil.Types.pas',
  BancoBrasil.Cobranca.Alterar in '..\..\src\Cobranca\BancoBrasil.Cobranca.Alterar.pas',
  BancoBrasil.Cobranca.Baixar in '..\..\src\Cobranca\BancoBrasil.Cobranca.Baixar.pas',
  BancoBrasil.Cobranca.Detalhar in '..\..\src\Cobranca\BancoBrasil.Cobranca.Detalhar.pas',
  BancoBrasil.Cobranca.Interfaces in '..\..\src\Cobranca\BancoBrasil.Cobranca.Interfaces.pas',
  BancoBrasil.Cobranca.Listar in '..\..\src\Cobranca\BancoBrasil.Cobranca.Listar.pas',
  BancoBrasil.Cobranca in '..\..\src\Cobranca\BancoBrasil.Cobranca.pas',
  BancoBrasil.Cobranca.Registrar in '..\..\src\Cobranca\BancoBrasil.Cobranca.Registrar.pas',
  BancoBrasil.Auth in '..\..\src\BancoBrasil.Auth.pas',
  BancoBrasil.Pix.Interfaces in '..\..\src\PIX\BancoBrasil.Pix.Interfaces.pas',
  BancoBrasil.Pix in '..\..\src\PIX\BancoBrasil.Pix.pas',
  BancoBrasil.Pix.Retorno in '..\..\src\PIX\BancoBrasil.Pix.Retorno.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
