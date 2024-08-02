unit BancoBrasil.Cobranca;

interface

uses System.SysUtils,
     System.StrUtils,
     System.JSON,

     Infra.Utils,
     Infra.Auth.Interfaces,
     BancoBrasil.Types,
     BancoBrasil.Helpers,
     BancoBrasil.Cobranca.Interfaces;

type
   TCobrancaServices = class( TInterfacedObject, ICobrancaServices)
   private
      [weak]
      FAuth:ICustomAuth;

   public
      constructor Create( aAuth:ICustomAuth);
      destructor Destroy;override;
      class function New( aAuth:ICustomAuth):ICobrancaServices;

      function RegistraBoleto:IRegistraBoleto;
      function RegistroBoletos:IRegistrarBoletos;
      function ListaBoletos:IListarBoleto;
      function DetalhaBoleto:IDetalharBoleto;
      function BaixaBoleto:IBaixarBoleto;
      function AlterarBoletos:IAlterarBoleto;
      {function ConsultarPixBoletos
      function GerarPixBoletos
      function CancelarPixBoletos}
   end;

implementation

uses BancoBrasil.Cobranca.Registrar,
     BancoBrasil.Cobranca.Listar,
     BancoBrasil.Cobranca.Detalhar,
     BancoBrasil.Cobranca.Baixar,
     BancoBrasil.Cobranca.Alterar;

{ TCobrancaServices }

function TCobrancaServices.AlterarBoletos: IAlterarBoleto;
begin
   Result := TAlterarBoleto.New( FAuth);
end;

function TCobrancaServices.BaixaBoleto: IBaixarBoleto;
begin
   Result := TBaixarBoleto.New( FAuth);
end;

constructor TCobrancaServices.Create( aAuth:ICustomAuth);
begin
   FAuth := aAuth;

end;

destructor TCobrancaServices.Destroy;
begin

  inherited;
end;

function TCobrancaServices.DetalhaBoleto: IDetalharBoleto;
begin
   Result := TDetalharBoleto.New( FAuth);
end;

function TCobrancaServices.ListaBoletos: IListarBoleto;
begin
   Result := TListarBoleto.New( FAuth);
end;

class function TCobrancaServices.New( aAuth:ICustomAuth): ICobrancaServices;
begin
   Result := Self.Create( aAuth);
end;

function TCobrancaServices.RegistraBoleto: IRegistraBoleto;
begin
   Result := TRegistraBoleto.New( FAuth);
end;

function TCobrancaServices.RegistroBoletos: IRegistrarBoletos;
begin

end;

end.
