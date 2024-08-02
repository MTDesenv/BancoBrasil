unit BancoBrasil;

interface

uses System.SysUtils,
     System.JSON,

     infra.Auth.Types,
     Infra.Auth.Interfaces,
     BancoBrasil.Types,
     BancoBrasil.Cobranca.Interfaces,
     BancoBrasil.PIX.Interfaces,
     BancoBrasil.Interfaces;

type
   TBancoBrasil = class( TInterfacedObject, IBancoBrasil)
   private
      FSeguranca:ICustomAuth;
      FCobranca:ICobrancaServices;
      FPIX:IPIXServices;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IBancoBrasil;

      function Seguranca:ICustomAuth;
      function Cobranca:ICobrancaServices;
      function PIX:IPixServices;
   end;

implementation

{ TBancoBrasil }

uses BancoBrasil.Auth,
     BancoBrasil.Cobranca,
     BancoBrasil.PIX;

function TBancoBrasil.Cobranca: ICobrancaServices;
begin
   Result := FCobranca;
end;

constructor TBancoBrasil.Create;
begin
   FSeguranca  := TBancoBrasilAuth.New;
   FCobranca   := TCobrancaServices.New( FSeguranca);
   //FPIX        := TPIXServices.New;
end;

destructor TBancoBrasil.Destroy;
begin

   inherited;
end;

class function TBancoBrasil.New: IBancoBrasil;
begin
   Result := Self.Create;
end;

function TBancoBrasil.PIX: IPixServices;
begin
   Result := FPIX;
end;

function TBancoBrasil.Seguranca: ICustomAuth;
begin
   Result := FSeguranca;
end;

end.
