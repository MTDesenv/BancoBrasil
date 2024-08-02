unit BancoBrasil.Auth;

interface

uses System.SysUtils,
     System.StrUtils,
     System.DateUtils,
     System.JSON,

     Infra.Auth.Types,
     Infra.Auth.Interfaces,
     Infra.JWT.Types,
     Infra.JWT.Interfaces,
     Infra.HTTP.Types,
     Infra.HTTP.Interfaces,
     Infra.Auth;

const
   URL_HOMOLOGACAO = 'https://oauth.hm.bb.com.br/oauth/token';
   URL_PRODUCAO    = 'https://oauth.bb.com.br/oauth/token';

type
   TBancoBrasilAuth = class sealed( TCustomAuth)
   protected
      procedure DoConfigure;override;
      procedure OnDeserialize( aValue:String);override;
      procedure OnErro( aError:String);override;

   public

   end;

implementation

uses System.NetEncoding;

{ TBancoBrasilAuth }

procedure TBancoBrasilAuth.DoConfigure;
begin
   inherited;
   case Environment of
      aeHomologation:AuthURL( URL_HOMOLOGACAO);
      aeProduction  :AuthURL( URL_PRODUCAO);
   end;

   AuthVerb( vrbPost);
   AuthType( atBasic);
   ContentType( ictAppUrlEncoded);

   Params
      .Clear
      .Add( httpHeader, 'grant_type',     'client_credentials')
      .Add( httpHeader, 'scope',          'cobrancas.boletos-info cobrancas.boletos-requisicao');

end;

procedure TBancoBrasilAuth.OnDeserialize(aValue: String);
Var LJSON:TJSONObject;
    LToken,
    LType:String;
    LExpire:Integer;
begin
   inherited;
   try
      LJSON := TJSONObject.ParseJSONValue( aValue) as TJSONObject;
      LJSON.TryGetValue( 'access_token', LToken);
      LJSON.TryGetValue( 'expires_in',   LExpire);
      LJSON.TryGetValue( 'token_type',   LType);

      AccessToken( LToken);
      TokenExpire( LExpire);
      TokenType( LType);
   finally
      FreeAndNil( LJSON);
   end;
end;

procedure TBancoBrasilAuth.OnErro(aError: String);
begin
  inherited;

end;

end.
