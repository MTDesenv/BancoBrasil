unit BancoBrasil.Cobranca.Registrar;

interface

uses System.SysUtils, System.StrUtils,
     System.Generics.Collections,
     System.JSON,

     RESTRequest4D,

     Infra.Utils,
     Infra.Auth.Interfaces,
     BancoBrasil.Types,
     BancoBrasil.Helpers,
     BancoBrasil.Cobranca.Interfaces;

type
   TCobRegDesconto = class( TInterfacedObject, ICobRegDesconto)
   private
      [weak]
      FOwner:ICobRegBoleto;

      Ftipo:TCobTipoDesconto;
      FdataExpiracao:TDate;
      Fporcentagem:Double;
      Fvalor:Double;

   public
      constructor Create( aOwner:ICobRegBoleto);
      destructor Destroy;override;
      class function New( aOwner:ICobRegBoleto):ICobRegDesconto;

      function tipo( aValue:TCobTipoDesconto):ICobRegDesconto;overload;
      function dataExpiracao( aValue:TDate):ICobRegDesconto;overload;
      function porcentagem( aValue:Double):ICobRegDesconto;overload;
      function valor( aValue:Double):ICobRegDesconto;overload;

      function tipo:TCobTipoDesconto;overload;
      function dataExpiracao:TDate;overload;
      function porcentagem:Double;overload;
      function valor:Double;overload;
      function &end:ICobRegBoleto;

      function ToJSON:TJSONObject;
      function ToJSONStr:String;
      function FromJSONStr( aValue:String):ICobRegDesconto;
      function FromJSON( aValue:TJSONObject):ICobRegDesconto;
   end;

   TCobRegJuros = class( TInterfacedObject, ICobRegJuros)
   private
      [weak]
      FOwner:ICobRegBoleto;

      Ftipo:TCobTipoJuros;
      Fdata:TDate;
      Fporcentagem:Double;
      Fvalor:Double;

   public
      constructor Create( aOwner:ICobRegBoleto);
      destructor Destroy;override;
      class function New( aOwner:ICobRegBoleto):ICobRegJuros;

      function tipo( aValue:TCobTipoJuros):ICobRegJuros;overload;
      function data( aValue:TDate):ICobRegJuros;overload;
      function porcentagem( aValue:Double):ICobRegJuros;overload;
      function valor( aValue:Double):ICobRegJuros;overload;

      function tipo:TCobTipoJuros;overload;
      function data:TDate;overload;
      function porcentagem:Double;overload;
      function valor:Double;overload;
      function &end:ICobRegBoleto;

      function ToJSON:TJSONObject;
      function ToJSONStr:String;
      function FromJSONStr( aValue:String):ICobRegJuros;
      function FromJSON( aValue:TJSONObject):ICobRegJuros;
   end;

   TCobRegMulta = class( TInterfacedObject, ICobRegMulta)
   private
      [weak]
      FOwner:ICobRegBoleto;

      Ftipo:TCobTipoMulta;
      Fdata:TDate;
      Fporcentagem:Double;
      Fvalor:Double;

   public
      constructor Create( aOwner:ICobRegBoleto);
      destructor Destroy;override;
      class function New( aOwner:ICobRegBoleto):ICobRegMulta;

      function tipo( aValue:TCobTipoMulta):ICobRegMulta;overload;
      function data( aValue:TDate):ICobRegMulta;overload;
      function porcentagem( aValue:Double):ICobRegMulta;overload;
      function valor( aValue:Double):ICobRegMulta;overload;

      function tipo:TCobTipoMulta;overload;
      function data:TDate;overload;
      function porcentagem:Double;overload;
      function valor:Double;overload;
      function &end:ICobRegBoleto;

      function ToJSON:TJSONObject;
      function ToJSONStr:String;
      function FromJSONStr( aValue:String):ICobRegMulta;
      function FromJSON( aValue:TJSONObject):ICobRegMulta;
   end;

   TCobRegPagador = class( TInterfacedObject, ICobRegPagador)
   private
      [weak]
      FOwner:ICobRegBoleto;

      FtipoInscricao:TCobTipoInscricao;
      FnumeroInscricao:Int64;
      Fnome:String;
      Fendereco:string;
      Fcep:integer;
      Fcidade:String;
      Fbairro:String;
      Fuf:String;
      Ftelefone:String;

   public
      constructor Create( aOwner:ICobRegBoleto);
      destructor Destroy;override;
      class function New( aOwner:ICobRegBoleto):ICobRegPagador;

      function tipoInscricao( aValue:TCobTipoInscricao):ICobRegPagador;overload;
      function numeroInscricao( aValue:Int64):ICobRegPagador;overload;
      function nome( aValue:String):ICobRegPagador;overload;
      function endereco( aValue:string):ICobRegPagador;overload;
      function cep( aValue:integer):ICobRegPagador;overload;
      function cidade( aValue:String):ICobRegPagador;overload;
      function bairro( aValue:String):ICobRegPagador;overload;
      function uf( aValue:String):ICobRegPagador;overload;
      function telefone( aValue:String):ICobRegPagador;overload;

      function tipoInscricao:TCobTipoInscricao;overload;
      function numeroInscricao:Int64;overload;
      function nome:String;overload;
      function endereco:string;overload;
      function cep:integer;overload;
      function cidade:String;overload;
      function bairro:String;overload;
      function uf:String;overload;
      function telefone:String;overload;
      function &end:ICobRegBoleto;

      function ToJSON:TJSONObject;
      function ToJSONStr:String;
      function FromJSONStr( aValue:String):ICobRegPagador;
      function FromJSON( aValue:TJSONObject):ICobRegPagador;
   end;

   TCobRegBeneficiarioFinal = class( TInterfacedObject, ICobRegBeneficiarioFinal)
   private
      [weak]
      FOwner:ICobRegBoleto;

      FtipoInscricao:TCobTipoInscricao;
      FnumeroInscricao:int64;
      Fnome:string;

   public
      constructor Create( aOwner:ICobRegBoleto);
      destructor Destroy;override;
      class function New( aOwner:ICobRegBoleto):ICobRegBeneficiarioFinal;

      function tipoInscricao( aValue:TCobTipoInscricao):ICobRegBeneficiarioFinal;overload;
      function numeroInscricao( aValue:int64):ICobRegBeneficiarioFinal;overload;
      function nome( aValue:string):ICobRegBeneficiarioFinal;overload;

      function tipoInscricao:TCobTipoInscricao;overload;
      function numeroInscricao:int64;overload;
      function nome:string;overload;
      function &end:ICobRegBoleto;

      function ToJSON:TJSONObject;
      function ToJSONStr:String;
      function FromJSONStr( aValue:String):ICobRegBeneficiarioFinal;
      function FromJSON( aValue:TJSONObject):ICobRegBeneficiarioFinal;
   end;

   TCobRegBoleto = class( TInterfacedObject, ICobRegBoleto)
   private
      FnumeroConvenio:Int64;
      FnumeroCarteira:Integer;
      FnumeroVariacaoCarteira:Integer;
      FcodigoModalidade:TCobCodigoModalidade;
      FdataEmissao:TDate;
      FdataVencimento:TDate;
      FvalorOriginal:Double;
      FvalorAbatimento:Double;
      FquantidadeDiasProtesto:Double;
      FquantidadeDiasNegativacao:Integer;
      ForgaoNegativador:TCobNegativador;
      FindicadorAceiteTituloVencido:string;
      FnumeroDiasLimiteRecebimento:Integer;
      FcodigoAceite:TCobCodigoAceite;
      FcodigoTipoTitulo:TCobTipoTitulo;
      FdescricaoTipoTitulo:String;
      FindicadorPermissaoRecebimentoParcial:boolean;
      FnumeroTituloBeneficiario:String;
      FcampoUtilizacaoBeneficiario:String;
      FnumeroTituloCliente:String;
      FmensagemBloquetoOcorrencia:String;
      Fdesconto:ICobRegDesconto;
      FsegundoDesconto:ICobRegDesconto;
      FterceiroDesconto:ICobRegDesconto;
      FjurosMora:ICobRegJuros;
      Fmulta:ICobRegMulta;
      Fpagador:ICobRegPagador;
      FbeneficiarioFinal:ICobRegBeneficiarioFinal;
      FindicadorPix:TCobIndicadorPix;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:ICobRegBoleto;

      function numeroConvenio( aValue:Int64):ICobRegBoleto;overload;
      function numeroCarteira( aValue:Integer):ICobRegBoleto;overload;
      function numeroVariacaoCarteira( aValue:Integer):ICobRegBoleto;overload;
      function codigoModalidade( aValue:TCobCodigoModalidade):ICobRegBoleto;overload;
      function dataEmissao( aValue:TDate):ICobRegBoleto;overload;
      function dataVencimento( aValue:TDate):ICobRegBoleto;overload;
      function valorOriginal( aValue:Double):ICobRegBoleto;overload;
      function valorAbatimento( aValue:Double):ICobRegBoleto;overload;
      function quantidadeDiasProtesto( aValue:Double):ICobRegBoleto;overload;
      function quantidadeDiasNegativacao( aValue:Integer):ICobRegBoleto;overload;
      function orgaoNegativador( aValue:TCobNegativador):ICobRegBoleto;overload;
      function indicadorAceiteTituloVencido( aValue:string):ICobRegBoleto;overload;
      function numeroDiasLimiteRecebimento( aValue:Integer):ICobRegBoleto;overload;
      function codigoAceite( aValue:TCobCodigoAceite):ICobRegBoleto;overload;
      function codigoTipoTitulo( aValue:TCobTipoTitulo):ICobRegBoleto;overload;
      function descricaoTipoTitulo( aValue:String):ICobRegBoleto;overload;
      function indicadorPermissaoRecebimentoParcial( aValue:boolean):ICobRegBoleto;overload;
      function numeroTituloBeneficiario( aValue:String):ICobRegBoleto;overload;
      function campoUtilizacaoBeneficiario( aValue:String):ICobRegBoleto;overload;
      function numeroTituloCliente( aValue:String):ICobRegBoleto;overload;
      function mensagemBloquetoOcorrencia( aValue:String):ICobRegBoleto;overload;
      function indicadorPix( aValue:TCobIndicadorPix):ICobRegBoleto;overload;

      function numeroConvenio:Int64;overload;
      function numeroCarteira:Integer;overload;
      function numeroVariacaoCarteira:Integer;overload;
      function codigoModalidade:TCobCodigoModalidade;overload;
      function dataEmissao:TDate;overload;
      function dataVencimento:TDate;overload;
      function valorOriginal:Double;overload;
      function valorAbatimento:Double;overload;
      function quantidadeDiasProtesto:Double;overload;
      function quantidadeDiasNegativacao:Integer;overload;
      function orgaoNegativador:TCobNegativador;overload;
      function indicadorAceiteTituloVencido:string;overload;
      function numeroDiasLimiteRecebimento:Integer;overload;
      function codigoAceite:TCobCodigoAceite;overload;
      function codigoTipoTitulo:TCobTipoTitulo;overload;
      function descricaoTipoTitulo:String;overload;
      function indicadorPermissaoRecebimentoParcial:boolean;overload;
      function numeroTituloBeneficiario:String;overload;
      function campoUtilizacaoBeneficiario:String;overload;
      function numeroTituloCliente:String;overload;
      function mensagemBloquetoOcorrencia:String;overload;
      function desconto:ICobRegDesconto;overload;
      function segundoDesconto:ICobRegDesconto;overload;
      function terceiroDesconto:ICobRegDesconto;overload;
      function jurosMora:ICobRegJuros;overload;
      function multa:ICobRegMulta;overload;
      function pagador:ICobRegPagador;overload;
      function beneficiarioFinal:ICobRegBeneficiarioFinal;overload;
      function indicadorPix:TCobIndicadorPix;overload;

      function ToJSON:TJSONObject;
      function ToJSONStr:String;
      function FromJSONStr( aValue:String):ICobRegBoleto;
      function FromJSON( aValue:TJSONObject):ICobRegBoleto;
   end;

   TCobRetBeneficiario = class( TInterfacedObject, ICobRetBeneficiario)
   private
      Fagencia:integer;
      FcontaCorrente:integer;
      FtipoEndereco:integer;
      Flogradouro:string;
      Fbairro:string;
      Fcidade:string;
      FcodigoCidade:integer;
      Fuf:string;
      Fcep:integer;
      FindicadorComprovacao:string;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:ICobRetBeneficiario;

      function agencia( aValue:integer):ICobRetBeneficiario;overload;
      function contaCorrente( aValue:integer):ICobRetBeneficiario;overload;
      function tipoEndereco( aValue:integer):ICobRetBeneficiario;overload;
      function logradouro( aValue:string):ICobRetBeneficiario;overload;
      function bairro( aValue:string):ICobRetBeneficiario;overload;
      function cidade( aValue:string):ICobRetBeneficiario;overload;
      function codigoCidade( aValue:integer):ICobRetBeneficiario;overload;
      function uf( aValue:string):ICobRetBeneficiario;overload;
      function cep( aValue:integer):ICobRetBeneficiario;overload;
      function indicadorComprovacao( aValue:string):ICobRetBeneficiario;overload;

      function agencia:integer;overload;
      function contaCorrente:integer;overload;
      function tipoEndereco:integer;overload;
      function logradouro:string;overload;
      function bairro:string;overload;
      function cidade:string;overload;
      function codigoCidade:integer;overload;
      function uf:string;overload;
      function cep:integer;overload;
      function indicadorComprovacao:string;overload;

      function FromJSON( aValue:String):ICobRetBeneficiario;overload;
      function FromJSON( aValue:TJSONObject):ICobRetBeneficiario;overload;
   end;

   TCobRetQRCode = class( TInterfacedObject, ICobRetQRCode)
   private
      Furl:string;
      FtxId:string;
      Femv:string;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:ICobRetQRCode;

      function url( aValue:string):ICobRetQRCode;overload;
      function txId( aValue:string):ICobRetQRCode;overload;
      function emv( aValue:string):ICobRetQRCode;overload;

      function url:string;overload;
      function txId:string;overload;
      function emv:string;overload;

      function FromJSON( aValue:String):ICobRetQRCode;overload;
      function FromJSON( aValue:TJSONObject):ICobRetQRCode;overload;
   end;

   TCobRetRegistro = class( TInterfacedObject, ICobRetRegistro)
   private
      Fnumero:string;
      FnumeroCarteira:integer;
      FnumeroVariacaoCarteira:integer;
      FcodigoCliente:integer;
      FlinhaDigitavel:string;
      FcodigoBarraNumerico:string;
      FnumeroContratoCobranca:integer;
      Fbeneficiario:ICobRetBeneficiario;
      FqrCode:ICobRetQRCode;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:ICobRetRegistro;

      function numero( aValue:string):ICobRetRegistro;overload;
      function numeroCarteira( aValue:integer):ICobRetRegistro;overload;
      function numeroVariacaoCarteira( aValue:integer):ICobRetRegistro;overload;
      function codigoCliente( aValue:integer):ICobRetRegistro;overload;
      function linhaDigitavel( aValue:string):ICobRetRegistro;overload;
      function codigoBarraNumerico( aValue:string):ICobRetRegistro;overload;
      function numeroContratoCobranca( aValue:integer):ICobRetRegistro;overload;

      function numero:string;overload;
      function numeroCarteira:integer;overload;
      function numeroVariacaoCarteira:integer;overload;
      function codigoCliente:integer;overload;
      function linhaDigitavel:string;overload;
      function codigoBarraNumerico:string;overload;
      function numeroContratoCobranca:integer;overload;
      function beneficiario:ICobRetBeneficiario;
      function qrCode:ICobRetQRCode;

      function FromJSON( aValue:String):ICobRetRegistro;overload;
      function FromJSON( aValue:TJSONObject):ICobRetRegistro;overload;
   end;

   TRegistraBoleto = class( TInterfacedObject, IRegistraBoleto)
   private
      [weak]
      FAuth:ICustomAuth;
      FRequest:IRequest;
      FResponse:IResponse;

      FBoleto:ICobRegBoleto;
      FRetorno:ICobRetRegistro;

      procedure Validar;
      procedure Preparar;
      procedure Enviar;
      procedure Desserializar;

   public
     constructor Create( aAuth:ICustomAuth);
     destructor Destroy;override;
     class function New( aAuth:ICustomAuth):IRegistraBoleto;

     function Registrar( aBoleto:ICobRegBoleto):IRegistraBoleto;
     function Retorno:ICobRetRegistro;
   end;

   TRegistrarBoletos = class( TInterfacedObject, IRegistrarBoletos)
   private
      FBoletos:TList<ICobRegBoleto>;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IRegistrarBoletos;

      function Limpar:IRegistrarBoletos;
      function Adicionar( aValue:ICobRegBoleto):IRegistrarBoletos;
      function NovoBoleto:ICobRegBoleto;
      function Registrar:IRegistrarBoletos;
   end;

implementation

uses Infra.Auth.Types;

{ TCobRegDesconto }

function TCobRegDesconto.&end: ICobRegBoleto;
begin
   Result := FOwner;
end;

constructor TCobRegDesconto.Create( aOwner:ICobRegBoleto);
begin
   FOwner := aOwner;
end;

function TCobRegDesconto.dataExpiracao: TDate;
begin
   Result := FdataExpiracao;
end;

function TCobRegDesconto.dataExpiracao(aValue: TDate): ICobRegDesconto;
begin
   Result := Self;
   FdataExpiracao := aValue;
end;

destructor TCobRegDesconto.Destroy;
begin

  inherited;
end;

function TCobRegDesconto.FromJSON(aValue: TJSONObject): ICobRegDesconto;
begin
   try
      Result := Self;
      Ftipo          := TCobTipoDesconto( StrToInt( Get( aValue, 'tipo').value));
      FdataExpiracao := StrToDate( Get( aValue, 'dataExpiracao').value.Replace( '.', '/'));
      Fporcentagem   := StrToFloat( Get( aValue, 'porcentagem').value);
      Fvalor         := StrToFloat( Get( aValue, 'valor').value);

   finally
      FreeAndNil( aValue);
   end;
end;

function TCobRegDesconto.FromJSONStr(aValue: String): ICobRegDesconto;
Var LJSON:TJSONObject;
begin
   Result := Self;
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));
   FromJSON( LJSON);
end;

class function TCobRegDesconto.New( aOwner:ICobRegBoleto): ICobRegDesconto;
begin
   Result := Self.Create( aOwner);
end;

function TCobRegDesconto.porcentagem(aValue: Double): ICobRegDesconto;
begin
   Result := Self;
   Fporcentagem := aValue;
end;

function TCobRegDesconto.porcentagem: Double;
begin
   Result := Fporcentagem;
end;

function TCobRegDesconto.tipo: TCobTipoDesconto;
begin
   Result := Ftipo;
end;

function TCobRegDesconto.tipo(aValue: TCobTipoDesconto): ICobRegDesconto;
begin
   Result := Self;
   Ftipo := aValue;
end;

function TCobRegDesconto.ToJSON: TJSONObject;
Var LJSON:TJSONObject;
begin
   LJSON := TJSONObject.Create;

   case FTipo of
      ctdSemDesconto               :LJSON.AddPair( 'tipo', TJSONNumber.Create( 0));
      ctdVlrFixoAteDataInformada   :LJSON.AddPair( 'tipo', TJSONNumber.Create( 1));
      ctdPercentualAteDataInformada:LJSON.AddPair( 'tipo', TJSONNumber.Create( 2));
      ctdDescontoPorDiaAntecipacao :LJSON.AddPair( 'tipo', TJSONNumber.Create( 3));
   end;

   if FdataExpiracao > 0 then
     LJSON.AddPair( 'dataExpiracao', FormatDateTime( 'dd.mm.yyyy', FdataExpiracao))
   else LJSON.AddPair( 'dataExpiracao', EmptyStr);

   LJSON.AddPair( 'porcentagem',   TJSONNumber.Create( Fporcentagem));
   LJSON.AddPair( 'valor',         TJSONNumber.Create( Fvalor));

   Result := LJSON;
end;

function TCobRegDesconto.ToJSONStr: String;
Var LJSON:TJSONObject;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

function TCobRegDesconto.valor(aValue: Double): ICobRegDesconto;
begin
   Result := Self;
   Fvalor := aValue;
end;

function TCobRegDesconto.valor: Double;
begin
   Result := Fvalor;
end;

{ TCobRegJuros }

function TCobRegJuros.&end: ICobRegBoleto;
begin
   Result := FOwner;
end;

constructor TCobRegJuros.Create( aOwner:ICobRegBoleto);
begin
   FOwner := aOwner;
end;

function TCobRegJuros.data: TDate;
begin
   Result := Fdata;
end;

function TCobRegJuros.data(aValue: TDate): ICobRegJuros;
begin
   Result := Self;
   Fdata := aValue;
end;

destructor TCobRegJuros.Destroy;
begin

  inherited;
end;

function TCobRegJuros.FromJSON(aValue: TJSONObject): ICobRegJuros;
begin
   try
      Result := Self;
      Ftipo        := TCobTipoJuros( StrToInt( Get( aValue, 'tipo').value));
      Fdata        := StrToDate( Get( aValue, 'data').value.Replace( '.', '/'));
      Fporcentagem := StrToFloat( Get( aValue, 'porcentagem').value);
      Fvalor       := StrToFloat( Get( aValue, 'valor').value);

   finally
      FreeAndNil( aValue);
   end;
end;

function TCobRegJuros.FromJSONStr(aValue: String): ICobRegJuros;
Var LJSON:TJSONObject;
begin
   Result := Self;
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));
   FromJSON( LJSON);
end;

class function TCobRegJuros.New( aOwner:ICobRegBoleto): ICobRegJuros;
begin
   Result := Self.Create( aOwner);
end;

function TCobRegJuros.porcentagem(aValue: Double): ICobRegJuros;
begin
   Result := Self;
   Fporcentagem := aValue;
end;

function TCobRegJuros.porcentagem: Double;
begin
   Result := Fporcentagem;
end;

function TCobRegJuros.tipo(aValue: TCobTipoJuros): ICobRegJuros;
begin
   Result := Self;
   Ftipo := aValue;
end;

function TCobRegJuros.tipo: TCobTipoJuros;
begin
   Result := Ftipo;
end;

function TCobRegJuros.ToJSON: TJSONObject;
Var LJSON:TJSONObject;
begin
   LJSON := TJSONObject.Create;

   case FTipo of
      ctjDispensar     :LJSON.AddPair( 'tipo', TJSONNumber.Create( 0));
      ctjValorDiaAtraso:LJSON.AddPair( 'tipo', TJSONNumber.Create( 1));
      ctjTaxaMensal    :LJSON.AddPair( 'tipo', TJSONNumber.Create( 2));
      ctjIsento        :LJSON.AddPair( 'tipo', TJSONNumber.Create( 3));
   end;

   if Fdata > 0 then
     LJSON.AddPair( 'data',      FormatDateTime( 'dd.mm.yyyy', Fdata))
   else LJSON.AddPair( 'data',   EmptyStr);

   LJSON.AddPair( 'porcentagem', TJSONNumber.Create( Fporcentagem));
   LJSON.AddPair( 'valor',       TJSONNumber.Create( Fvalor));

   Result := LJSON;
end;

function TCobRegJuros.ToJSONStr: String;
Var LJSON:TJSONObject;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

function TCobRegJuros.valor: Double;
begin
   Result := Fvalor;
end;

function TCobRegJuros.valor(aValue: Double): ICobRegJuros;
begin
   Result := Self;
   Fvalor := aValue;
end;

{ TCobRegPagador }

function TCobRegPagador.bairro(aValue: String): ICobRegPagador;
begin
   Result := Self;
   Fbairro := aValue;
end;

function TCobRegPagador.&end: ICobRegBoleto;
begin
   Result := FOwner;
end;

function TCobRegPagador.bairro: String;
begin
   Result := Fbairro;
end;

function TCobRegPagador.cep: integer;
begin
   Result := Fcep;
end;

function TCobRegPagador.cep(aValue: integer): ICobRegPagador;
begin
   Result := Self;
   Fcep := aValue;
end;

function TCobRegPagador.cidade(aValue: String): ICobRegPagador;
begin
   Result := Self;
   Fcidade := aValue;
end;

function TCobRegPagador.cidade: String;
begin
   Result := Fcidade;
end;

constructor TCobRegPagador.Create( aOwner:ICobRegBoleto);
begin
   FOwner := aOwner;
end;

destructor TCobRegPagador.Destroy;
begin

  inherited;
end;

function TCobRegPagador.endereco(aValue: string): ICobRegPagador;
begin
   Result := Self;
   Fendereco := aValue;
end;

function TCobRegPagador.endereco: string;
begin
   Result := Fendereco;
end;

function TCobRegPagador.FromJSON(aValue: TJSONObject): ICobRegPagador;
begin
   try
      Result := Self;
      FtipoInscricao   := TCobTipoInscricao( StrToInt( Get( aValue, 'tipoInscricao').value));
      FnumeroInscricao := StrToInt( Get( aValue, 'numeroInscricao').value);
      Fnome            := Get( aValue, 'nome').value;
      Fendereco        := Get( aValue, 'endereco').value;
      Fcep             := StrToInt64( Get( aValue, 'cep').value);
      Fcidade          := Get( aValue, 'cidade').value;
      Fbairro          := Get( aValue, 'bairro').value;
      Fuf              := Get( aValue, 'uf').value;
      Ftelefone        := Get( aValue, 'telefone').value;

   finally
      FreeAndNil( aValue);
   end;
end;

function TCobRegPagador.FromJSONStr(aValue: String): ICobRegPagador;
Var LJSON:TJSONObject;
begin
   Result := Self;
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));
   FromJSON( LJSON);
end;

class function TCobRegPagador.New( aOwner:ICobRegBoleto): ICobRegPagador;
begin
   Result := Self.Create( aOwner);
end;

function TCobRegPagador.nome: String;
begin
   Result := Fnome;
end;

function TCobRegPagador.nome(aValue: String): ICobRegPagador;
begin
   Result := Self;
   Fnome := aValue;
end;

function TCobRegPagador.numeroInscricao(aValue: Int64): ICobRegPagador;
begin
   Result := Self;
   FnumeroInscricao := aValue;

   if FnumeroInscricao.ToString.Length = 14 then
      FtipoInscricao   := TCobTipoInscricao.ctiCNPJ
   else FtipoInscricao := TCobTipoInscricao.ctiCPF;
end;

function TCobRegPagador.numeroInscricao: Int64;
begin
   Result := FnumeroInscricao;
end;

function TCobRegPagador.telefone(aValue: String): ICobRegPagador;
begin
   Result := Self;
   Ftelefone := aValue;
end;

function TCobRegPagador.telefone: String;
begin
   Result := Ftelefone;
end;

function TCobRegPagador.tipoInscricao: TCobTipoInscricao;
begin
   Result := FtipoInscricao;
end;

function TCobRegPagador.tipoInscricao(aValue: TCobTipoInscricao): ICobRegPagador;
begin
   Result := Self;
   FtipoInscricao := aValue;
end;

function TCobRegPagador.ToJSON: TJSONObject;
Var LJSON:TJSONObject;
begin
   LJSON := TJSONObject.Create;

   case FtipoInscricao of
      ctiCPF :LJSON.AddPair( 'tipoInscricao', TJSONNumber.Create( 1));
      ctiCNPJ:LJSON.AddPair( 'tipoInscricao', TJSONNumber.Create( 2));
   end;

   LJSON.AddPair( 'numeroInscricao', TJSONNumber.Create( FnumeroInscricao));
   LJSON.AddPair( 'nome',            FNome);
   LJSON.AddPair( 'endereco',        Fendereco);
   LJSON.AddPair( 'cep',             TJSONNumber.Create( Fcep));
   LJSON.AddPair( 'cidade',          Fcidade);
   LJSON.AddPair( 'bairro',          Fbairro);
   LJSON.AddPair( 'uf',              Fuf);
   LJSON.AddPair( 'telefone',        Ftelefone);

   Result := LJSON;
end;

function TCobRegPagador.ToJSONStr: String;
Var LJSON:TJSONObject;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

function TCobRegPagador.uf: String;
begin
   Result := Fuf;
end;

function TCobRegPagador.uf(aValue: String): ICobRegPagador;
begin
   Result := Self;
   Fuf := aValue;
end;

{ TCobRegBeneficiarioFinal }

function TCobRegBeneficiarioFinal.&end: ICobRegBoleto;
begin
   Result := FOwner;
end;

constructor TCobRegBeneficiarioFinal.Create( aOwner:ICobRegBoleto);
begin
   FOwner := aOwner;
end;

destructor TCobRegBeneficiarioFinal.Destroy;
begin

  inherited;
end;

function TCobRegBeneficiarioFinal.FromJSON(aValue: TJSONObject): ICobRegBeneficiarioFinal;
begin
   try
      Result := Self;
      FtipoInscricao   := TCobTipoInscricao( StrToInt( Get( aValue, 'tipoInscricao').value));
      FnumeroInscricao := StrToInt( Get( aValue, 'numeroInscricao').value);
      Fnome            := Get( aValue, 'nome').value;

   finally
      FreeAndNil( aValue);
   end;
end;

function TCobRegBeneficiarioFinal.FromJSONStr(aValue: String): ICobRegBeneficiarioFinal;
Var LJSON:TJSONObject;
begin
   Result := Self;
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));
   FromJSON( LJSON);
end;

class function TCobRegBeneficiarioFinal.New( aOwner:ICobRegBoleto): ICobRegBeneficiarioFinal;
begin
   Result := Self.Create( aOwner);
end;

function TCobRegBeneficiarioFinal.nome: string;
begin
   Result := Fnome;
end;

function TCobRegBeneficiarioFinal.nome(aValue: string): ICobRegBeneficiarioFinal;
begin
   Result := Self;
   Fnome := aValue;
end;

function TCobRegBeneficiarioFinal.numeroInscricao(aValue: int64): ICobRegBeneficiarioFinal;
begin
   Result := Self;
   FnumeroInscricao := aValue;

   if IntToStr( aValue).Length = 14 then
      FtipoInscricao   := TCobTipoInscricao.ctiCNPJ
   else FtipoInscricao := TCobTipoInscricao.ctiCPF
end;

function TCobRegBeneficiarioFinal.numeroInscricao: int64;
begin
   Result := FnumeroInscricao;
end;

function TCobRegBeneficiarioFinal.tipoInscricao: TCobTipoInscricao;
begin
   Result := FtipoInscricao;
end;

function TCobRegBeneficiarioFinal.tipoInscricao( aValue: TCobTipoInscricao): ICobRegBeneficiarioFinal;
begin
   Result := Self;
   FtipoInscricao := aValue;
end;

function TCobRegBeneficiarioFinal.ToJSON: TJSONObject;
Var LJSON:TJSONObject;
begin
   LJSON := TJSONObject.Create;

   case FtipoInscricao of
      ctiCPF :LJSON.AddPair( 'tipoInscricao', TJSONNumber.Create( 1));
      ctiCNPJ:LJSON.AddPair( 'tipoInscricao', TJSONNumber.Create( 2));
   end;

   LJSON.AddPair( 'numeroInscricao', TJSONNumber.Create( FnumeroInscricao));
   LJSON.AddPair( 'nome',            FNome);

   Result := LJSON;
end;

function TCobRegBeneficiarioFinal.ToJSONStr: String;
Var LJSON:TJSONObject;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

{ TCobRegBoleto }

function TCobRegBoleto.beneficiarioFinal: ICobRegBeneficiarioFinal;
begin
   Result := FbeneficiarioFinal;
end;

function TCobRegBoleto.campoUtilizacaoBeneficiario: String;
begin
   Result := FcampoUtilizacaoBeneficiario;
end;

function TCobRegBoleto.campoUtilizacaoBeneficiario(aValue: String): ICobRegBoleto;
begin
   Result := Self;
   FcampoUtilizacaoBeneficiario := aValue;
end;

function TCobRegBoleto.codigoAceite: TCobCodigoAceite;
begin
   Result := FcodigoAceite;
end;

function TCobRegBoleto.codigoAceite(aValue: TCobCodigoAceite): ICobRegBoleto;
begin
   Result := Self;
   FcodigoAceite := aValue;
end;

function TCobRegBoleto.codigoModalidade: TCobCodigoModalidade;
begin
   Result := FcodigoModalidade;
end;

function TCobRegBoleto.codigoModalidade(aValue: TCobCodigoModalidade): ICobRegBoleto;
begin
   Result := Self;
   FcodigoModalidade := aValue;
end;

function TCobRegBoleto.codigoTipoTitulo(aValue: TCobTipoTitulo): ICobRegBoleto;
begin
   Result := Self;
   FcodigoTipoTitulo := aValue;
end;

function TCobRegBoleto.codigoTipoTitulo: TCobTipoTitulo;
begin
   Result := FcodigoTipoTitulo;
end;

constructor TCobRegBoleto.Create;
begin
   Fdesconto          := TCobRegDesconto.New( Self);
   FsegundoDesconto   := TCobRegDesconto.New( Self);
   FterceiroDesconto  := TCobRegDesconto.New( Self);
   FjurosMora         := TCobRegJuros.New( Self);
   Fmulta             := TCobRegMulta.New( Self);
   Fpagador           := TCobRegPagador.New( Self);
   FbeneficiarioFinal := TCobRegBeneficiarioFinal.New( Self);
end;

function TCobRegBoleto.dataEmissao(aValue: TDate): ICobRegBoleto;
begin
   Result := Self;
   FdataEmissao := aValue;
end;

function TCobRegBoleto.dataEmissao: TDate;
begin
   Result := FdataEmissao;
end;

function TCobRegBoleto.dataVencimento(aValue: TDate): ICobRegBoleto;
begin
   Result := Self;
   FdataVencimento := aValue;
end;

function TCobRegBoleto.dataVencimento: TDate;
begin
   Result := FdataVencimento;
end;

function TCobRegBoleto.desconto: ICobRegDesconto;
begin
   Result := Fdesconto;
end;

function TCobRegBoleto.descricaoTipoTitulo(aValue: String): ICobRegBoleto;
begin
   Result := Self;
   FdescricaoTipoTitulo := aValue;
end;

function TCobRegBoleto.descricaoTipoTitulo: String;
begin
   Result := FdescricaoTipoTitulo;
end;

destructor TCobRegBoleto.Destroy;
begin

  inherited;
end;

function TCobRegBoleto.FromJSON(aValue: TJSONObject): ICobRegBoleto;
begin
   try
      Result := Self;
      FnumeroConvenio                       := StrToInt64( Get( aValue, 'numeroConvenio').Value);
      FnumeroCarteira                       := StrToInt( Get( aValue, 'numeroCarteira').Value);
      FnumeroVariacaoCarteira               := StrToInt( Get( aValue, 'numeroVariacaoCarteira').Value);
      FcodigoModalidade                     := TCobCodigoModalidade( StrToInt( Get( aValue, 'codigoModalidade').Value));
      FdataEmissao                          := StrToDate( Get( aValue, 'dataEmissao').Value.Replace( '.', '/'));
      FdataVencimento                       := StrToDate( Get( aValue, 'dataVencimento').Value.Replace( '.', '/'));
      FvalorOriginal                        := StrToFloat( Get( aValue, 'valorOriginal').Value);
      FvalorAbatimento                      := StrToFloat( Get( aValue, 'valorAbatimento').Value);
      FquantidadeDiasProtesto               := StrToFloat( Get( aValue, 'quantidadeDiasProtesto').Value);
      FquantidadeDiasNegativacao            := StrToInt( Get( aValue, 'quantidadeDiasNegativacao').Value);
      ForgaoNegativador                     := TCobNegativador( StrToInt( Get( aValue, 'orgaoNegativador').Value));
      FindicadorAceiteTituloVencido         := Get( aValue, 'indicadorAceiteTituloVencido').Value;
      FnumeroDiasLimiteRecebimento          := StrToInt( Get( aValue, 'numeroDiasLimiteRecebimento').Value);
      FcodigoAceite                         := TCobCodigoAceite( StrToInt( Get( aValue, 'codigoAceite').Value));
      FcodigoTipoTitulo                     := TCobTipoTitulo( StrToInt( Get( aValue, 'codigoTipoTitulo').Value));
      FdescricaoTipoTitulo                  := Get( aValue, 'descricaoTipoTitulo').Value;
      FindicadorPermissaoRecebimentoParcial := Get( aValue, 'indicadorPermissaoRecebimentoParcial').Value = 'S';
      FnumeroTituloBeneficiario             := Get( aValue, 'numeroTituloBeneficiario').Value;
      FcampoUtilizacaoBeneficiario          := Get( aValue, 'campoUtilizacaoBeneficiario').Value;
      FnumeroTituloCliente                  := Get( aValue, 'numeroTituloCliente').Value;
      FmensagemBloquetoOcorrencia           := Get( aValue, 'mensagemBloquetoOcorrencia').Value;

      Fdesconto.FromJSONStr( Get( aValue, 'desconto').Value);
      FsegundoDesconto.FromJSONStr( Get( aValue, 'segundoDesconto').Value);
      FterceiroDesconto.FromJSONStr( Get( aValue, 'terceiroDesconto').Value);
      FjurosMora.FromJSONStr( Get( aValue, 'jurosMora').Value);
      Fmulta.FromJSONStr( Get( aValue, 'multa').Value);
      Fpagador.FromJSONStr( Get( aValue, 'pagador').Value);
      FbeneficiarioFinal.FromJSONStr( Get( aValue, 'beneficiarioFinal').Value);

      FindicadorPix                         := TCobIndicadorPix( StrToInt( Get( aValue, 'indicadorPix').Value));
   finally
      FreeAndNil( aValue);
   end;
end;

function TCobRegBoleto.FromJSONStr(aValue: String): ICobRegBoleto;
Var LJSON:TJSONObject;
begin
   Result := Self;
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));
   FromJSON( LJSON);
end;

function TCobRegBoleto.indicadorAceiteTituloVencido: string;
begin
   Result := FindicadorAceiteTituloVencido;
end;

function TCobRegBoleto.indicadorAceiteTituloVencido(aValue: string): ICobRegBoleto;
begin
   Result := Self;
   FindicadorAceiteTituloVencido := aValue;
end;

function TCobRegBoleto.indicadorPermissaoRecebimentoParcial( aValue: boolean): ICobRegBoleto;
begin
   Result := Self;
   FindicadorpermissaoRecebimentoParcial := aValue;
end;

function TCobRegBoleto.indicadorPermissaoRecebimentoParcial: boolean;
begin
   Result := FindicadorPermissaoRecebimentoParcial;
end;

function TCobRegBoleto.indicadorPix(aValue: TCobIndicadorPix): ICobRegBoleto;
begin
   Result := Self;
   FindicadorPix := aValue;
end;

function TCobRegBoleto.indicadorPix: TCobIndicadorPix;
begin
   Result := FindicadorPix;
end;

function TCobRegBoleto.jurosMora: ICobRegJuros;
begin
   Result := FjurosMora;
end;

function TCobRegBoleto.mensagemBloquetoOcorrencia: String;
begin
   Result := FmensagemBloquetoOcorrencia;
end;

function TCobRegBoleto.mensagemBloquetoOcorrencia(aValue: String): ICobRegBoleto;
begin
   Result := Self;
   FmensagemBloquetoOcorrencia := aValue;
end;

function TCobRegBoleto.multa: ICobRegMulta;
begin
   Result := Fmulta;
end;

class function TCobRegBoleto.New: ICobRegBoleto;
begin
   Result := Self.Create;
end;

function TCobRegBoleto.numeroCarteira(aValue: Integer): ICobRegBoleto;
begin
   Result := Self;
   FnumeroCarteira := aValue;
end;

function TCobRegBoleto.numeroCarteira: Integer;
begin
   Result := FnumeroCarteira;
end;

function TCobRegBoleto.numeroConvenio(aValue: Int64): ICobRegBoleto;
begin
   Result := Self;
   FnumeroConvenio := aValue;
end;

function TCobRegBoleto.numeroConvenio: Int64;
begin
   Result := FnumeroConvenio;
end;

function TCobRegBoleto.numeroDiasLimiteRecebimento(aValue: Integer): ICobRegBoleto;
begin
   Result := Self;
   FnumerodiasLimiteRecebimento := aValue;
end;

function TCobRegBoleto.numeroDiasLimiteRecebimento: Integer;
begin
   Result := FnumeroDiaslimiteRecebimento;
end;

function TCobRegBoleto.numeroTituloBeneficiario(aValue: String): ICobRegBoleto;
begin
   Result := Self;
   FnumeroTituloBeneficiario := aValue;
end;

function TCobRegBoleto.numeroTituloBeneficiario: String;
begin
   Result := FnumeroTituloBeneficiario;
end;

function TCobRegBoleto.numeroTituloCliente(aValue: String): ICobRegBoleto;
begin
   Result := Self;
   FnumeroTituloCliente := aValue;
end;

function TCobRegBoleto.numeroTituloCliente: String;
begin
   Result := FnumeroTituloCliente;
end;

function TCobRegBoleto.numeroVariacaoCarteira: Integer;
begin
   Result := FnumeroVariacaoCarteira;
end;

function TCobRegBoleto.numeroVariacaoCarteira(aValue: Integer): ICobRegBoleto;
begin
   Result := Self;
   FnumeroVariacaoCarteira := aValue;
end;

function TCobRegBoleto.orgaoNegativador: TCobNegativador;
begin
   Result := ForgaoNegativador;
end;

function TCobRegBoleto.orgaoNegativador(aValue: TCobNegativador): ICobRegBoleto;
begin
   Result := Self;
   Forgaonegativador := aValue;
end;

function TCobRegBoleto.pagador: ICobRegPagador;
begin
   Result := Fpagador;
end;

function TCobRegBoleto.quantidadeDiasNegativacao(aValue: Integer): ICobRegBoleto;
begin
   Result := Self;
   FquantidadeDiasNegativacao := aValue;
end;

function TCobRegBoleto.quantidadeDiasNegativacao: Integer;
begin
   Result := FquantidadeDiasNegativacao;
end;

function TCobRegBoleto.quantidadeDiasProtesto: Double;
begin
   Result := FquantidadeDiasProtesto;
end;

function TCobRegBoleto.quantidadeDiasProtesto(aValue: Double): ICobRegBoleto;
begin
   Result := Self;
   FquantidadeDiasProtesto := aValue;
end;

function TCobRegBoleto.segundoDesconto: ICobRegDesconto;
begin
   Result := FsegundoDesconto;
end;

function TCobRegBoleto.terceiroDesconto: ICobRegDesconto;
begin
   Result := FterceiroDesconto;
end;

function TCobRegBoleto.ToJSON: TJSONObject;
Var LJSON:TJSONObject;
begin
   LJSON := TJSONObject.Create;

   LJSON.AddPair( 'numeroConvenio',                       TJSONNumber.Create( FnumeroConvenio));
   LJSON.AddPair( 'numeroCarteira',                       TJSONNumber.Create( FnumeroCarteira));
   LJSON.AddPair( 'numeroVariacaoCarteira',               TJSONNumber.Create( FnumeroVariacaoCarteira));
   LJSON.AddPair( 'codigoModalidade',                     TJSONNumber.Create( Ord( FcodigoModalidade)));
   LJSON.AddPair( 'dataEmissao',                          TJSONString.Create( FormatDateTime( 'dd.mm.yyyy', FdataEmissao)));
   LJSON.AddPair( 'dataVencimento',                       TJSONString.Create( FormatDateTime( 'dd.mm.yyyy', FdataVencimento)));
   LJSON.AddPair( 'valorOriginal',                        TJSONNumber.Create( FvalorOriginal));
   LJSON.AddPair( 'valorAbatimento',                      TJSONNumber.Create( FvalorAbatimento));
   LJSON.AddPair( 'quantidadeDiasProtesto',               TJSONNumber.Create( FquantidadeDiasProtesto));
   LJSON.AddPair( 'quantidadeDiasNegativacao',            TJSONNumber.Create( FquantidadeDiasNegativacao));
   LJSON.AddPair( 'orgaoNegativador',                     TJSONNumber.Create( Ord( ForgaoNegativador)));
   LJSON.AddPair( 'indicadorAceiteTituloVencido',         TJSONString.Create( FindicadorAceiteTituloVencido));
   LJSON.AddPair( 'numeroDiasLimiteRecebimento',          TJSONNumber.Create( FnumeroDiasLimiteRecebimento));
   LJSON.AddPair( 'codigoAceite',                         TJSONNumber.Create( Ord( FcodigoAceite)));
   LJSON.AddPair( 'codigoTipoTitulo',                     TJSONNumber.Create( Ord( FcodigoTipoTitulo)));
   LJSON.AddPair( 'descricaoTipoTitulo',                  TJSONString.Create( FdescricaoTipoTitulo));
   LJSON.AddPair( 'indicadorPermissaoRecebimentoParcial', TJSONString.Create( IfThen( FindicadorPermissaoRecebimentoParcial, 'S', 'N')));
   LJSON.AddPair( 'numeroTituloBeneficiario',             TJSONString.Create( FnumeroTituloBeneficiario));
   LJSON.AddPair( 'campoUtilizacaoBeneficiario',          TJSONString.Create( FcampoUtilizacaoBeneficiario));
   LJSON.AddPair( 'numeroTituloCliente',                  TJSONString.Create( FnumeroTituloCliente));
   LJSON.AddPair( 'mensagemBloquetoOcorrencia',           TJSONString.Create( FmensagemBloquetoOcorrencia));

   LJSON.AddPair( 'desconto',                             Fdesconto.ToJSON);
   LJSON.AddPair( 'segundoDesconto',                      FsegundoDesconto.ToJSON);
   LJSON.AddPair( 'terceiroDesconto',                     FterceiroDesconto.ToJSON);
   LJSON.AddPair( 'jurosMora',                            FjurosMora.ToJSON);
   LJSON.AddPair( 'multa',                                Fmulta.ToJSON);
   LJSON.AddPair( 'pagador',                              Fpagador.ToJSON);
   LJSON.AddPair( 'beneficiarioFinal',                    FbeneficiarioFinal.ToJSON);

   LJSON.AddPair( 'indicadorPix',                         TJSONNumber.Create( Ord( FindicadorPix)));
   Result := LJSON;
end;

function TCobRegBoleto.ToJSONStr: String;
Var LJSON:TJSONObject;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

function TCobRegBoleto.valorAbatimento(aValue: Double): ICobRegBoleto;
begin
   Result := Self;
   FvalorAbatimento := aValue;
end;

function TCobRegBoleto.valorAbatimento: Double;
begin
   Result := FvalorAbatimento;
end;

function TCobRegBoleto.valorOriginal(aValue: Double): ICobRegBoleto;
begin
   Result := Self;
   FvalorOriginal := aValue;
end;

function TCobRegBoleto.valorOriginal: Double;
begin
   Result := FvalorOriginal;
end;

{ TRegistrarBoletos }

function TRegistrarBoletos.Adicionar(aValue: ICobRegBoleto): IRegistrarBoletos;
begin
   Result := Self;
   FBoletos.Add( aValue);
end;

constructor TRegistrarBoletos.Create;
begin
   FBoletos := TList<ICobRegBoleto>.Create;

end;

destructor TRegistrarBoletos.Destroy;
begin
   FreeAndNil( FBoletos);
   inherited;
end;

function TRegistrarBoletos.Limpar: IRegistrarBoletos;
begin
   Result := Self;
   FBoletos.Clear;
   FBoletos.TrimExcess;
end;

class function TRegistrarBoletos.New: IRegistrarBoletos;
begin
   Result := Self.Create;
end;

function TRegistrarBoletos.NovoBoleto: ICobRegBoleto;
var LBoleto:ICobRegBoleto;
begin
   LBoleto := TCobRegBoleto.New;
   FBoletos.Add( LBoleto);
   Result := LBoleto;
end;

function TRegistrarBoletos.Registrar: IRegistrarBoletos;
var I:Integer;
begin
   for I := 0 to Pred( FBoletos.Count) do
   begin

   end;
end;

{ TRegistraBoleto }

constructor TRegistraBoleto.Create( aAuth:ICustomAuth);
begin
   FAuth := aAuth;
   FRequest := TRequest.New;
end;

procedure TRegistraBoleto.Desserializar;
begin
   if FResponse.StatusCode = 200 then
   begin
     if not Assigned( FRetorno) then
        FRetorno := TCobRetRegistro.New;

     FRetorno.FromJSON( FResponse.Content);
   end;


   (*
   '{"beneficiario":
      {"agencia":452,
       "contaCorrente":123873,
       "tipoEndereco":1,
       "logradouro":"ST AUXILIAR DE GARAGENS RUA 9 LOTE 10",
       "bairro":"TAGUATINGA NORTE",
       "cidade":"BRASILIA",
       "codigoCidade":2000,
       "uf":"DF",
       "cep":72145760,
       "indicadorComprovacao":"0"},

    "qrCode":{"url":"",
              "txId":"",
              "emv":""},

    "numero":"00031285570724000001",
    "numeroCarteira":17,
    "numeroVariacaoCarteira":35,
    "codigoCliente":704950857,
    "linhaDigitavel":"00190000090312855707524000001172997930000076000",
    "codigoBarraNumerico":"00199979300000760000000003128557072400000117",
    "numeroContratoCobranca":19581316,
    "observacao":""
    }'
   *)
end;

destructor TRegistraBoleto.Destroy;
begin

  inherited;
end;

procedure TRegistraBoleto.Enviar;
begin
   case FAuth.Environment of
      aeHomologation:FRequest.BaseURL( 'https://api.hm.bb.com.br/cobrancas/v2');
      aeProduction  :FRequest.BaseURL( 'https://api.bb.com.br/cobrancas/v2');
   end;

   FRequest.Resource( '/boletos');
   FResponse := FRequest.Post;

   if ( FResponse.StatusCode <> 201) and ( FResponse.StatusCode <> 400) then
      raise Exception.Create( 'Erro ao emitir o boleto');
end;

class function TRegistraBoleto.New( aAuth:ICustomAuth): IRegistraBoleto;
begin
   Result := Self.Create( aAuth);
end;

procedure TRegistraBoleto.Preparar;
begin
   if FAuth.AccessToken.IsEmpty then
      FAuth.Execute;

   FRequest
      .ContentType( 'application/json')
      .TokenBearer( FAuth.AccessToken)
      .AddParam( 'gw-dev-app-key',      FAuth.AppKey,         pkQUERY, [poDoNotEncode]);

   FRequest.AddBody( FBoleto.ToJSONStr);
end;

function TRegistraBoleto.Registrar(aBoleto: ICobRegBoleto): IRegistraBoleto;
begin
   Result  := Self;
   FBoleto := aBoleto;

   Validar;
   Preparar;
   Enviar;
   Desserializar;
end;

function TRegistraBoleto.Retorno: ICobRetRegistro;
begin
   Result := FRetorno;
end;

procedure TRegistraBoleto.Validar;
begin

end;

{ TCobRetRegistro }

function TCobRetRegistro.beneficiario: ICobRetBeneficiario;
begin
   Result := Fbeneficiario;
end;

function TCobRetRegistro.codigoBarraNumerico(aValue: string): ICobRetRegistro;
begin
   Result := Self;
   FcodigoBarraNumerico := aValue;
end;

function TCobRetRegistro.codigoBarraNumerico: string;
begin
   Result := FcodigoBarraNumerico;
end;

function TCobRetRegistro.codigoCliente: integer;
begin
   Result := FcodigoCliente;
end;

function TCobRetRegistro.codigoCliente(aValue: integer): ICobRetRegistro;
begin
   Result := Self;
   FcodigoCliente := aValue;
end;

constructor TCobRetRegistro.Create;
begin
   Fbeneficiario := TCobRetBeneficiario.New;
   FqrCode       := TCobRetQRCode.New;
end;

destructor TCobRetRegistro.Destroy;
begin

  inherited;
end;

function TCobRetRegistro.FromJSON(aValue: TJSONObject): ICobRetRegistro;
begin
   try
      Fnumero                 := aValue.Get( 'numero').Value;
      FnumeroCarteira         := StrToInt( aValue.Get( 'numeroCarteira').Value);
      FnumeroVariacaoCarteira := StrToInt( aValue.Get( 'numeroVariacaoCarteira').Value);
      FcodigoCliente          := StrToInt( aValue.Get( 'codigoCliente').Value);
      FlinhaDigitavel         := aValue.Get( 'linhaDigitavel').Value;
      FcodigoBarraNumerico    := aValue.Get( 'codigoBarraNumerico').Value;
      FnumeroContratoCobranca := StrToInt( aValue.Get( 'numeroContratoCobranca').Value);

      Fbeneficiario.FromJSON( aValue.Get( 'beneficiario').Value);
      FqrCode.FromJSON( aValue.Get( 'qrCode').Value);
   finally
      FreeAndNil( aValue);
   end;
end;

function TCobRetRegistro.FromJSON(aValue: String): ICobRetRegistro;
Var LJSON:TJSONObject;
begin
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));
   FromJSON( LJSON);
end;

function TCobRetRegistro.linhaDigitavel: string;
begin
   Result := FlinhaDigitavel;
end;

function TCobRetRegistro.linhaDigitavel(aValue: string): ICobRetRegistro;
begin
   Result := Self;
   FlinhaDigitavel := aValue;
end;

class function TCobRetRegistro.New: ICobRetRegistro;
begin
   Result := Self.Create;
end;

function TCobRetRegistro.numero: string;
begin
   Result := Fnumero;
end;

function TCobRetRegistro.numero(aValue: string): ICobRetRegistro;
begin
   Result := Self;
   Fnumero := aValue;
end;

function TCobRetRegistro.numeroCarteira(aValue: integer): ICobRetRegistro;
begin
   Result := Self;
   FnumeroCarteira := aValue;
end;

function TCobRetRegistro.numeroCarteira: integer;
begin
   Result := FnumeroCarteira;
end;

function TCobRetRegistro.numeroContratoCobranca: integer;
begin
   Result := FnumeroContratoCobranca;
end;

function TCobRetRegistro.numeroContratoCobranca( aValue: integer): ICobRetRegistro;
begin
   Result := Self;
   FnumeroContratoCobranca := aValue;
end;

function TCobRetRegistro.numeroVariacaoCarteira: integer;
begin
   Result := FnumeroVariacaoCarteira;
end;

function TCobRetRegistro.numeroVariacaoCarteira( aValue: integer): ICobRetRegistro;
begin
   Result := Self;
   FnumeroVariacaoCarteira := aValue;
end;

function TCobRetRegistro.qrCode: ICobRetQRCode;
begin
   Result := FqrCode;
end;

{ TCobRetQRCode }

constructor TCobRetQRCode.Create;
begin

end;

destructor TCobRetQRCode.Destroy;
begin

  inherited;
end;

function TCobRetQRCode.emv(aValue: string): ICobRetQRCode;
begin
   Result := Self;
   Femv := aValue;
end;

function TCobRetQRCode.emv: string;
begin
   Result := Femv;
end;

function TCobRetQRCode.FromJSON(aValue: TJSONObject): ICobRetQRCode;
begin
   try
      Furl  := aValue.Get( 'url').Value;
      FtxId := aValue.Get( 'txId').Value;
      Femv  := aValue.Get( 'emv').Value;
   finally
      FreeAndNil( aValue);
   end;
end;

function TCobRetQRCode.FromJSON(aValue: String): ICobRetQRCode;
begin

end;

class function TCobRetQRCode.New: ICobRetQRCode;
begin
   Result := Self.Create;
end;

function TCobRetQRCode.txId: string;
begin
   Result := FtxId;
end;

function TCobRetQRCode.txId(aValue: string): ICobRetQRCode;
begin
   Result := Self;
   Ftxid := aValue;
end;

function TCobRetQRCode.url(aValue: string): ICobRetQRCode;
begin
   Result := Self;
   Furl := aValue;
end;

function TCobRetQRCode.url: string;
begin
   Result := Furl;
end;

{ TCobRetBeneficiario }

function TCobRetBeneficiario.agencia: integer;
begin
   Result := Fagencia;
end;

function TCobRetBeneficiario.agencia(aValue: integer): ICobRetBeneficiario;
begin
   Result := Self;
   Fagencia := aValue;
end;

function TCobRetBeneficiario.bairro(aValue: string): ICobRetBeneficiario;
begin
   Result := Self;
   Fbairro := aValue;
end;

function TCobRetBeneficiario.bairro: string;
begin
   Result := Fbairro;
end;

function TCobRetBeneficiario.cep(aValue: integer): ICobRetBeneficiario;
begin
   Result := Self;
   Fcep := aValue;
end;

function TCobRetBeneficiario.cep: integer;
begin
   Result := Fcep;
end;

function TCobRetBeneficiario.cidade: string;
begin
   Result := Fcidade;
end;

function TCobRetBeneficiario.cidade(aValue: string): ICobRetBeneficiario;
begin
   Result := Self;
   Fcidade := aValue;
end;

function TCobRetBeneficiario.codigoCidade: integer;
begin
   Result := FcodigoCidade;
end;

function TCobRetBeneficiario.codigoCidade(aValue: integer): ICobRetBeneficiario;
begin
   Result := Self;
   FcodigoCidade := aValue;
end;

function TCobRetBeneficiario.contaCorrente( aValue: integer): ICobRetBeneficiario;
begin
   Result := Self;
   FcontaCorrente := aValue;
end;

function TCobRetBeneficiario.contaCorrente: integer;
begin
   Result := FcontaCorrente;
end;

constructor TCobRetBeneficiario.Create;
begin

end;

destructor TCobRetBeneficiario.Destroy;
begin

  inherited;
end;

function TCobRetBeneficiario.FromJSON(aValue: TJSONObject): ICobRetBeneficiario;
begin
   try
      Fagencia              := StrToInt( aValue.Get( 'agencia').Value);
      FcontaCorrente        := StrToInt( aValue.Get( 'contaCorrente').Value);
      FtipoEndereco         := StrToInt( aValue.Get( 'tipoEndereco').Value);
      Flogradouro           := aValue.Get( 'logradouro').Value;
      Fbairro               := aValue.Get( 'bairro').Value;
      Fcidade               := aValue.Get( 'cidade').Value;
      FcodigoCidade         := StrToInt( aValue.Get( 'codigoCidade').Value);
      Fuf                   := aValue.Get( 'uf').Value;
      Fcep                  := StrToInt( aValue.Get( 'cep').Value);
      FindicadorComprovacao := aValue.Get( 'indicadorComprovacao').Value;

   finally
      FreeAndNil( aValue);
   end;
end;

function TCobRetBeneficiario.FromJSON(aValue: String): ICobRetBeneficiario;
Var LJSON:TJSONObject;
begin
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));
   FromJSON( LJSON);
end;

function TCobRetBeneficiario.indicadorComprovacao( aValue: string): ICobRetBeneficiario;
begin
   Result := Self;
   FindicadorComprovacao := aValue;
end;

function TCobRetBeneficiario.indicadorComprovacao: string;
begin
   Result := FindicadorComprovacao;
end;

function TCobRetBeneficiario.logradouro(aValue: string): ICobRetBeneficiario;
begin
   Result := Self;
   Flogradouro := aValue;
end;

function TCobRetBeneficiario.logradouro: string;
begin
   Result := Flogradouro;
end;

class function TCobRetBeneficiario.New: ICobRetBeneficiario;
begin
   Result := Self.Create;
end;

function TCobRetBeneficiario.tipoEndereco: integer;
begin
   Result := FtipoEndereco;
end;

function TCobRetBeneficiario.tipoEndereco(aValue: integer): ICobRetBeneficiario;
begin
   Result := Self;
   FtipoEndereco := aValue;
end;

function TCobRetBeneficiario.uf: string;
begin
   Result := Fuf;
end;

function TCobRetBeneficiario.uf(aValue: string): ICobRetBeneficiario;
begin
   Result := Self;
   Fuf := aValue;
end;

{ TCobRegMulta }

constructor TCobRegMulta.Create(aOwner: ICobRegBoleto);
begin
   FOwner := aOwner;
end;

function TCobRegMulta.data: TDate;
begin
   Result := Fdata;
end;

function TCobRegMulta.data(aValue: TDate): ICobRegMulta;
begin
   Result := Self;
   Fdata := aValue;
end;

destructor TCobRegMulta.Destroy;
begin

  inherited;
end;

function TCobRegMulta.&end: ICobRegBoleto;
begin
   Result := FOwner;
end;

function TCobRegMulta.FromJSON(aValue: TJSONObject): ICobRegMulta;
begin
   try
      Result := Self;
      Ftipo        := TCobTipoMulta( StrToInt( Get( aValue, 'tipo').value));
      Fdata        := StrToDate( Get( aValue, 'data').value.Replace( '.', '/'));
      Fporcentagem := StrToFloat( Get( aValue, 'porcentagem').value);
      Fvalor       := StrToFloat( Get( aValue, 'valor').value);

   finally
      FreeAndNil( aValue);
   end;
end;

function TCobRegMulta.FromJSONStr(aValue: String): ICobRegMulta;
Var LJSON:TJSONObject;
begin
   Result := Self;
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));
   FromJSON( LJSON);
end;

class function TCobRegMulta.New(aOwner: ICobRegBoleto): ICobRegMulta;
begin
   Result := Self.Create( aOwner);
end;

function TCobRegMulta.porcentagem: Double;
begin
   Result := Fporcentagem;
end;

function TCobRegMulta.porcentagem(aValue: Double): ICobRegMulta;
begin
   Result := Self;
   Fporcentagem := aValue;
end;

function TCobRegMulta.tipo(aValue: TCobTipoMulta): ICobRegMulta;
begin
   Result := Self;
   Ftipo := aValue;
end;

function TCobRegMulta.tipo: TCobTipoMulta;
begin
   Result := Ftipo;
end;

function TCobRegMulta.ToJSON: TJSONObject;
Var LJSON:TJSONObject;
begin
   LJSON := TJSONObject.Create;

   case FTipo of
      ctmDispensar     :LJSON.AddPair( 'tipo', TJSONNumber.Create( 0));
      ctmValorDiaAtraso:LJSON.AddPair( 'tipo', TJSONNumber.Create( 1));
      ctmTaxaMensal    :LJSON.AddPair( 'tipo', TJSONNumber.Create( 2));
      ctmIsento        :LJSON.AddPair( 'tipo', TJSONNumber.Create( 3));
   end;

   if Fdata > 0 then
     LJSON.AddPair( 'data',      FormatDateTime( 'dd.mm.yyyy', Fdata))
   else LJSON.AddPair( 'data',   EmptyStr);

   LJSON.AddPair( 'porcentagem', TJSONNumber.Create( Fporcentagem));
   LJSON.AddPair( 'valor',       TJSONNumber.Create( Fvalor));

   Result := LJSON;
end;

function TCobRegMulta.ToJSONStr: String;
Var LJSON:TJSONObject;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

function TCobRegMulta.valor: Double;
begin
   Result := Fvalor;
end;

function TCobRegMulta.valor(aValue: Double): ICobRegMulta;
begin
   Result := Self;
   Fvalor := aValue;
end;

end.
