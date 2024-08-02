unit BancoBrasil.Cobranca.Baixar;

interface

uses System.SysUtils, System.StrUtils,
     System.Generics.Collections,
     System.JSON, System.DateUtils,

     RESTRequest4D,

     Infra.Utils,
     Infra.Auth.Interfaces,
     BancoBrasil.Types,
     BancoBrasil.Helpers,
     BancoBrasil.Cobranca.Interfaces;

type
   TBaixarBoleto = class( TInterfacedObject, IBaixarBoleto)
   private
      [weak]
      FAuth:ICustomAuth;
      FnumeroConvenio:String;
      FnumeroBoleto:String;
      FRequest:IRequest;
      FResponse:IResponse;
      FBoleto:ICobRetBoletoDetalhado;

      procedure Validar;
      procedure Preparar;
      procedure Buscar;
      procedure Desserializar;

   public
     constructor Create( aAuth:ICustomAuth);
     destructor Destroy;overload;
     class function New( aAuth:ICustomAuth):IBaixarBoleto;

     function numeroConvenio( aValue:String):IBaixarBoleto;
     function numeroBoleto( aValue:String):IBaixarBoleto;

     function Executar:IBaixarBoleto;
   end;

implementation

uses Infra.Auth.Types,
     BancoBrasil.Cobranca;

{ TBaixarBoleto }

procedure TBaixarBoleto.Buscar;
begin
   case FAuth.Environment of
      aeHomologation:FRequest.BaseURL( 'https://api.hm.bb.com.br/cobrancas/v2');
      aeProduction  :FRequest.BaseURL( 'https://api.bb.com.br/cobrancas/v2');
   end;

   FRequest.Resource( '/boletos/'+ FnumeroBoleto +'/baixar');
   FResponse := FRequest.Post;

   if ( FResponse.StatusCode <> 200) and ( FResponse.StatusCode <> 400) then
      raise Exception.Create('Não foi possível realizar o cancelamento do boleto. Tente mais tarde');
end;

constructor TBaixarBoleto.Create(aAuth: ICustomAuth);
begin
   FAuth := aAuth;
   FRequest := TRequest.New;
end;

procedure TBaixarBoleto.Desserializar;
begin
   
end;

destructor TBaixarBoleto.Destroy;
begin

end;

function TBaixarBoleto.Executar: IBaixarBoleto;
begin
   Result := Self;

   Validar;
   Preparar;
   Buscar;
   Desserializar;
end;

class function TBaixarBoleto.New(aAuth: ICustomAuth): IBaixarBoleto;
begin
   Result := Self.Create( aAuth);
end;

function TBaixarBoleto.numeroBoleto(aValue: String): IBaixarBoleto;
begin
   Result := Self;
   FnumeroBoleto := aValue;
end;

function TBaixarBoleto.numeroConvenio(aValue: String): IBaixarBoleto;
begin
   Result := Self;
   FnumeroConvenio := aValue;
end;

procedure TBaixarBoleto.Preparar;
begin
   if FAuth.AccessToken.IsEmpty then
      FAuth.Execute;

   FRequest
      .ContentType( 'application/json')
      .TokenBearer( FAuth.AccessToken)
      .AddParam( 'gw-dev-app-key',      FAuth.AppKey,         pkQUERY, [poDoNotEncode])
      .AddBody( TJSONObject.Create.AddPair( 'numeroConvenio',      FnumeroConvenio));
end;

procedure TBaixarBoleto.Validar;
begin
   if FAuth.AppKey.Trim.IsEmpty then
      raise Exception.Create( 'O código da aplicação deve ser informado');

   if FnumeroConvenio.Trim.IsEmpty then
      raise Exception.Create( 'O número do convênio de emissão do boleto pesquisado deve ser informado.');

   if FnumeroBoleto.Trim.IsEmpty then
      raise Exception.Create( 'O número do boleto pesquisado deve ser informado.');
end;

end.
