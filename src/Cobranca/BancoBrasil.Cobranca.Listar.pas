unit BancoBrasil.Cobranca.Listar;

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
   TCobRetBoletoBusca = class( TInterfacedObject, ICobRetBoletoBusca)
   private
      FnumeroBoletoBB:String;
      FestadoTituloCobranca:String;
      FdataRegistro:TDateTime;
      FdataVencimento:TDateTime;
      FdataMovimento:TDateTime;
      FvalorOriginal:double;
      FvalorAtual:double;
      FvalorPago:double;
      Fcontrato:Integer;
      FcarteiraConvenio:Integer;
      FvariacaoCarteiraConvenio:Integer;
      FcodigoEstadoTituloCobranca:Integer;
      FdataCredito:TDateTime;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:ICobRetBoletoBusca;

      function numeroBoletoBB( aValue:String):ICobRetBoletoBusca;overload;
      function estadoTituloCobranca( aValue:String):ICobRetBoletoBusca;overload;
      function dataRegistro( aValue:TDateTime):ICobRetBoletoBusca;overload;
      function dataVencimento( aValue:TDateTime):ICobRetBoletoBusca;overload;
      function dataMovimento( aValue:TDateTime):ICobRetBoletoBusca;overload;
      function valorOriginal( aValue:double):ICobRetBoletoBusca;overload;
      function valorAtual( aValue:double):ICobRetBoletoBusca;overload;
      function valorPago( aValue:double):ICobRetBoletoBusca;overload;
      function contrato( aValue:Integer):ICobRetBoletoBusca;overload;
      function carteiraConvenio( aValue:Integer):ICobRetBoletoBusca;overload;
      function variacaoCarteiraConvenio( aValue:Integer):ICobRetBoletoBusca;overload;
      function codigoEstadoTituloCobranca( aValue:Integer):ICobRetBoletoBusca;overload;
      function dataCredito( aValue:TDateTime):ICobRetBoletoBusca;overload;

      function numeroBoletoBB:String;overload;
      function estadoTituloCobranca:String;overload;
      function dataRegistro:TDateTime;overload;
      function dataVencimento:TDateTime;overload;
      function dataMovimento:TDateTime;overload;
      function valorOriginal:double;overload;
      function valorAtual:double;overload;
      function valorPago:double;overload;
      function contrato:Integer;overload;
      function carteiraConvenio:Integer;overload;
      function variacaoCarteiraConvenio:Integer;overload;
      function codigoEstadoTituloCobranca:Integer;overload;
      function dataCredito:TDateTime;overload;

      function FromJSON( aValue:String):ICobRetBoletoBusca;overload;
      function FromJSON( aValue:TJSONObject; aOwnerFree:Boolean = true):ICobRetBoletoBusca;overload;
   end;

   TCobRetBoletoBuscaLst = class( TInterfacedObject, ICobRetBoletoBuscaLst)
   private
      FBoletos:TList<ICobRetBoletoBusca>;
      FContinua:Boolean;
      FTotal:Integer;
      FProximoID:Integer;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:ICobRetBoletoBuscaLst;

      function Continua:Boolean;
      function Total:Integer;
      function ProximoID:Integer;
      function Count:Integer;
      function Itens( aIndex:Integer):ICobRetBoletoBusca;

      function FromJSON( aValue:String):ICobRetBoletoBuscaLst;overload;
      function FromJSON( aValue:TJSONObject):ICobRetBoletoBuscaLst;overload;
   end;

   TListarBoleto = class( TInterfacedObject, IListarBoleto)
   private
      [weak]
      FAuth:ICustomAuth;
      FRequest:IRequest;
      FResponse:IResponse;
      FBoletos:ICobRetBoletoBuscaLst;

      FindicadorSituacao:String;
      FagenciaBeneficiario:String;
      FcontaBeneficiario:String;
      FcarteiraConvenio:String;
      FvariacaoCarteiraConvenio:String;
      FmodalidadeCobranca:String;
      FcnpjPagador:String;
      FdigitoCNPJPagador:String;
      FcpfPagador:String;
      FdigitoCPFPagador:String;
      FdataInicioVencimento:TDateTime;
      FdataFimVencimento:TDateTime;
      FdataInicioRegistro:TDateTime;
      FdataFimRegistro:TDateTime;
      FdataInicioMovimento:TDateTime;
      FdataFimMovimento:TDateTime;
      FcodigoEstadoTituloCobranca:Integer;
      FboletoVencido:Boolean;
      Findice:Integer;

      procedure Validar;
      procedure Preparar;
      procedure Buscar;
      procedure Desserializar;

   public
      constructor Create( aAuth:ICustomAuth);
      destructor Destroy;override;
      class function New( aAuth:ICustomAuth):IListarBoleto;

      function indicadorSituacao( aValue:String):IListarBoleto;
      function agenciaBeneficiario( aValue:String):IListarBoleto;
      function contaBeneficiario( aValue:String):IListarBoleto;

      function carteiraConvenio( aValue:String):IListarBoleto;
      function variacaoCarteiraConvenio( aValue:String):IListarBoleto;
      function modalidadeCobranca( aValue:String):IListarBoleto;

      function cnpjPagador( aValue:String):IListarBoleto;
      function digitoCNPJPagador( aValue:String):IListarBoleto;
      function cpfPagador( aValue:String):IListarBoleto;
      function digitoCPFPagador( aValue:String):IListarBoleto;

      function dataInicioVencimento( aValue:TDateTime):IListarBoleto;
      function dataFimVencimento( aValue:TDateTime):IListarBoleto;
      function dataInicioRegistro( aValue:TDateTime):IListarBoleto;
      function dataFimRegistro( aValue:TDateTime):IListarBoleto;
      function dataInicioMovimento( aValue:TDateTime):IListarBoleto;
      function dataFimMovimento( aValue:TDateTime):IListarBoleto;

      function codigoEstadoTituloCobranca( aValue:Integer):IListarBoleto;
      function boletoVencido( aValue:Boolean):IListarBoleto;
      function indice( aValue:Integer):IListarBoleto;

      function Executar:IListarBoleto;
      function Retorno:ICobRetBoletoBuscaLst;
   end;

implementation

uses Infra.Auth.Types,
     BancoBrasil.Cobranca;

{ TListarBoleto }

function TListarBoleto.agenciaBeneficiario(aValue: String): IListarBoleto;
begin
   Result := Self;
   FagenciaBeneficiario := aValue;
end;

function TListarBoleto.boletoVencido(aValue: Boolean): IListarBoleto;
begin
   Result := Self;
   FboletoVencido := aValue;
end;

procedure TListarBoleto.Buscar;
begin
   case FAuth.Environment of
      aeHomologation:FRequest.BaseURL( 'https://api.hm.bb.com.br/cobrancas/v2');
      aeProduction  :FRequest.BaseURL( 'https://api.bb.com.br/cobrancas/v2');
   end;

   FRequest.Resource( '/boletos');
   FResponse := FRequest.Get;

   if ( FResponse.StatusCode <> 200) and ( FResponse.StatusCode <> 400) then
      raise Exception.Create('Erro ao executar busca dos boletos.');

end;

function TListarBoleto.carteiraConvenio(aValue: String): IListarBoleto;
begin
   Result := Self;
   FcarteiraConvenio := aValue;
end;

function TListarBoleto.cnpjPagador(aValue: String): IListarBoleto;
begin
   Result := Self;
   FcnpjPagador := aValue;
end;

function TListarBoleto.codigoEstadoTituloCobranca( aValue: Integer): IListarBoleto;
begin
   Result := Self;
   FcodigoEstadoTituloCobranca := aValue;
end;

function TListarBoleto.contaBeneficiario(aValue: String): IListarBoleto;
begin
   Result := Self;
   FcontaBeneficiario := aValue;
end;

function TListarBoleto.cpfPagador(aValue: String): IListarBoleto;
begin
   Result := Self;
   FcpfPagador := aValue;
end;

constructor TListarBoleto.Create(aAuth: ICustomAuth);
begin
   FAuth := aAuth;
   FRequest := TRequest.New;
end;

function TListarBoleto.dataFimMovimento(aValue: TDateTime): IListarBoleto;
begin
   Result := Self;
   FdataFimMovimento := aValue;
end;

function TListarBoleto.dataFimRegistro(aValue: TDateTime): IListarBoleto;
begin
   Result := Self;
   FdataFimRegistro := aValue;
end;

function TListarBoleto.dataFimVencimento(aValue: TDateTime): IListarBoleto;
begin
   Result := Self;
   FdataFimVencimento := aValue;
end;

function TListarBoleto.dataInicioMovimento(aValue: TDateTime): IListarBoleto;
begin
   Result := Self;
   FdataInicioMovimento := aValue;
end;

function TListarBoleto.dataInicioRegistro(aValue: TDateTime): IListarBoleto;
begin
   Result := Self;
   FdataInicioRegistro := aValue;
end;

function TListarBoleto.dataInicioVencimento(aValue: TDateTime): IListarBoleto;
begin
   Result := Self;
   FdataInicioVencimento := aValue;
end;

procedure TListarBoleto.Desserializar;
begin
   if FResponse.StatusCode = 200 then
   begin
     if not Assigned( FBoletos) then
        FBoletos := TCobRetBoletoBuscaLst.New;

     FBoletos.FromJSON( FResponse.Content);
   end;
end;

destructor TListarBoleto.Destroy;
begin

  inherited;
end;

function TListarBoleto.digitoCNPJPagador(aValue: String): IListarBoleto;
begin
   Result := Self;
   FdigitoCNPJPagador := aValue;
end;

function TListarBoleto.digitoCPFPagador(aValue: String): IListarBoleto;
begin
   Result := Self;
   FdigitoCNPJPagador := aValue;
end;

function TListarBoleto.Executar: IListarBoleto;
begin
   Result := Self;

   Validar;
   Preparar;
   Buscar;
   Desserializar;
end;

function TListarBoleto.indicadorSituacao(aValue: String): IListarBoleto;
begin
   Result := Self;
   FindicadorSituacao := aValue;
end;

function TListarBoleto.indice(aValue: Integer): IListarBoleto;
begin
   Result := Self;
   Findice := aValue;
end;

function TListarBoleto.modalidadeCobranca(aValue: String): IListarBoleto;
begin
   Result := Self;
   FmodalidadeCobranca := aValue;
end;

class function TListarBoleto.New(aAuth: ICustomAuth): IListarBoleto;
begin
   Result := Self.Create( aAuth);
end;

procedure TListarBoleto.Preparar;
begin
   if FAuth.AccessToken.IsEmpty then
      FAuth.Execute;

   FRequest
      .ContentType( 'application/json')
      .TokenBearer( FAuth.AccessToken)
      .AddParam( 'gw-dev-app-key',      FAuth.AppKey,         pkQUERY, [poDoNotEncode])
      .AddParam( 'indicadorSituacao',   FindicadorSituacao,   pkQUERY, [poDoNotEncode])
      .AddParam( 'agenciaBeneficiario', FagenciaBeneficiario, pkQUERY, [poDoNotEncode])
      .AddParam( 'contaBeneficiario',   FcontaBeneficiario,   pkQUERY, [poDoNotEncode]);

   if not FcarteiraConvenio.Trim.IsEmpty then
      FRequest.AddParam( 'carteiraConvenio', FcarteiraConvenio, pkQUERY, [poDoNotEncode]);

   if not FvariacaoCarteiraConvenio.Trim.IsEmpty then
      FRequest.AddParam( 'variacaoCarteiraConvenio', FvariacaoCarteiraConvenio, pkQUERY, [poDoNotEncode]);

   if not FmodalidadeCobranca.Trim.IsEmpty then
      FRequest.AddParam( 'modalidadeCobranca', FmodalidadeCobranca, pkQUERY, [poDoNotEncode]);

   if not FcnpjPagador.Trim.IsEmpty then
      FRequest.AddParam( 'cnpjPagador', FcnpjPagador, pkQUERY, [poDoNotEncode]);

   if not FdigitoCNPJPagador.Trim.IsEmpty then
      FRequest.AddParam( 'digitoCNPJPagador', FdigitoCNPJPagador, pkQUERY, [poDoNotEncode]);

   if not FcpfPagador.Trim.IsEmpty then
      FRequest.AddParam( 'cpfPagador', FcpfPagador, pkQUERY, [poDoNotEncode]);

   if not FdigitoCPFPagador.Trim.IsEmpty then
      FRequest.AddParam( 'digitoCPFPagador', FdigitoCPFPagador, pkQUERY, [poDoNotEncode]);

   if FdataInicioVencimento > 0 then
      FRequest.AddParam( 'dataInicioVencimento', FormatDateTime( 'dd.mm.yyyy', FdataInicioVencimento), pkQUERY, [poDoNotEncode]);

   if FdataFimVencimento > 0 then
      FRequest.AddParam( 'dataFimVencimento', FormatDateTime( 'dd.mm.yyyy', FdataFimVencimento), pkQUERY, [poDoNotEncode]);

   if FdataInicioRegistro > 0 then
      FRequest.AddParam( 'dataInicioRegistro', FormatDateTime( 'dd.mm.yyyy', FdataInicioRegistro), pkQUERY, [poDoNotEncode]);

   if FdataFimRegistro > 0 then
      FRequest.AddParam( 'dataFimRegistro', FormatDateTime( 'dd.mm.yyyy', FdataFimRegistro), pkQUERY, [poDoNotEncode]);

   if FdataInicioMovimento > 0 then
      FRequest.AddParam( 'dataInicioMovimento', FormatDateTime( 'dd.mm.yyyy', FdataInicioMovimento), pkQUERY, [poDoNotEncode]);

   if FdataFimMovimento > 0 then
      FRequest.AddParam( 'dataFimMovimento', FormatDateTime( 'dd.mm.yyyy', FdataFimMovimento), pkQUERY, [poDoNotEncode]);

   if FcodigoEstadoTituloCobranca > 0 then
      FRequest.AddParam( 'codigoEstadoTituloCobranca', FcodigoEstadoTituloCobranca.ToString, pkQUERY, [poDoNotEncode]);

   //FRequest.AddParam( 'boletoVencido', IfThen( FboletoVencido, 'S', 'N'), pkQUERY, [poDoNotEncode]);

   if Findice > 0 then
      FRequest.AddParam( 'indice', Findice.ToString, pkQUERY, [poDoNotEncode]);
end;

function TListarBoleto.Retorno: ICobRetBoletoBuscaLst;
begin
   if not Assigned( FBoletos) then
     FBoletos := TCobRetBoletoBuscaLst.New;

   Result := FBoletos;
end;

procedure TListarBoleto.Validar;
begin
   if FAuth.AppKey.Trim.IsEmpty then
      raise Exception.Create( 'O código da aplicação deve ser informado');

   if FindicadorSituacao.Trim.IsEmpty then
      raise Exception.Create( 'O indicador de tipo de boleto pesquisado deve ser informado.');

   if FagenciaBeneficiario.Trim.IsEmpty then
      raise Exception.Create( 'Número da agência deve ser informado.');

   if FcontaBeneficiario.Trim.IsEmpty then
      raise Exception.Create( 'A conta deve ser informada.');

end;

function TListarBoleto.variacaoCarteiraConvenio(aValue: String): IListarBoleto;
begin
   Result := Self;
   FvariacaoCarteiraConvenio := aValue;
end;

{ TCobRetBoletoBusca }

function TCobRetBoletoBusca.carteiraConvenio: Integer;
begin
   Result := FcarteiraConvenio;
end;

function TCobRetBoletoBusca.carteiraConvenio( aValue: Integer): ICobRetBoletoBusca;
begin
   Result := Self;
   FcarteiraConvenio := aValue;
end;

function TCobRetBoletoBusca.codigoEstadoTituloCobranca: Integer;
begin
   Result := FcodigoEstadoTituloCobranca;
end;

function TCobRetBoletoBusca.codigoEstadoTituloCobranca( aValue: Integer): ICobRetBoletoBusca;
begin
   Result := Self;
   FcodigoEstadoTituloCobranca := aValue;
end;

function TCobRetBoletoBusca.contrato(aValue: Integer): ICobRetBoletoBusca;
begin
   Result := Self;
   Fcontrato := aValue;
end;

function TCobRetBoletoBusca.contrato: Integer;
begin
   Result := Fcontrato;
end;

constructor TCobRetBoletoBusca.Create;
begin

end;

function TCobRetBoletoBusca.dataCredito: TDateTime;
begin
   Result := FdataCredito;
end;

function TCobRetBoletoBusca.dataCredito(aValue: TDateTime): ICobRetBoletoBusca;
begin
   Result := Self;
   FdataCredito := aValue;
end;

function TCobRetBoletoBusca.dataMovimento( aValue: TDateTime): ICobRetBoletoBusca;
begin
   Result := Self;
   FdataMovimento := aValue;
end;

function TCobRetBoletoBusca.dataMovimento: TDateTime;
begin
   Result := FdataMovimento;
end;

function TCobRetBoletoBusca.dataRegistro: TDateTime;
begin
   Result := FdataRegistro;
end;

function TCobRetBoletoBusca.dataRegistro(aValue: TDateTime): ICobRetBoletoBusca;
begin
   Result := Self;
   FdataRegistro := aValue;
end;

function TCobRetBoletoBusca.dataVencimento: TDateTime;
begin
   Result := FdataVencimento;
end;

function TCobRetBoletoBusca.dataVencimento( aValue: TDateTime): ICobRetBoletoBusca;
begin
   Result := Self;
   FdataVencimento := aValue;
end;

destructor TCobRetBoletoBusca.Destroy;
begin

  inherited;
end;

function TCobRetBoletoBusca.estadoTituloCobranca: String;
begin
   Result := FestadoTituloCobranca;
end;

function TCobRetBoletoBusca.estadoTituloCobranca( aValue: String): ICobRetBoletoBusca;
begin
   Result := Self;
   FestadoTituloCobranca := aValue;
end;

function TCobRetBoletoBusca.FromJSON(aValue: String): ICobRetBoletoBusca;
var LBoleto:TJSONObject;
begin
   Result := Self;
   LBoleto := TJSONObject.ParseJSONValue( TEncoding.UTF8.GetBytes( aValue), 0) as TJSONObject;
   FromJSON( LBoleto);
end;

function TCobRetBoletoBusca.FromJSON(aValue: TJSONObject; aOwnerFree:Boolean = true): ICobRetBoletoBusca;
var LAux:String;

   function ParseDate( aStrDate:String):TDateTime;
   begin
      Result := 0;

      if not LAux.IsEmpty then
      begin
         aStrDate := ReplaceStr( aStrDate, '.', '/');
         Result := StrToDate( aStrDate);
      end;
   end;

begin
   try
      Result := Self;
      aValue.TryGetValue<String>(  'numeroBoletoBB',             FnumeroBoletoBB);
      aValue.TryGetValue<String>(  'estadoTituloCobranca',       FestadoTituloCobranca);
      aValue.TryGetValue<String>(  'dataRegistro',               LAux);
      FdataRegistro := ParseDate( LAux);

      aValue.TryGetValue<String>(  'dataVencimento',             LAux);
      FdataVencimento := ParseDate( LAux);

      aValue.TryGetValue<String>(  'dataMovimento',              LAux);
      FdataMovimento := ParseDate( LAux);

      aValue.TryGetValue<double>(  'valorOriginal',              FvalorOriginal);
      aValue.TryGetValue<double>(  'valorAtual',                 FvalorAtual);
      aValue.TryGetValue<double>(  'valorPago',                  FvalorPago);
      aValue.TryGetValue<Integer>( 'contrato',                   Fcontrato);
      aValue.TryGetValue<Integer>( 'carteiraConvenio',           FcarteiraConvenio);
      aValue.TryGetValue<Integer>( 'variacaoCarteiraConvenio',   FvariacaoCarteiraConvenio);
      aValue.TryGetValue<Integer>( 'codigoEstadoTituloCobranca', FcodigoEstadoTituloCobranca);
      aValue.TryGetValue<String>(  'dataCredito',                LAux);
      FdataCredito := ParseDate( LAux);

   finally
      if not aOwnerFree then
         FreeAndNil( aValue);
   end;
end;

class function TCobRetBoletoBusca.New: ICobRetBoletoBusca;
begin
   Result := Self.Create;
end;

function TCobRetBoletoBusca.numeroBoletoBB: String;
begin
   Result := FnumeroBoletoBB;
end;

function TCobRetBoletoBusca.numeroBoletoBB(aValue: String): ICobRetBoletoBusca;
begin
   Result := Self;
   FnumeroBoletoBB := aValue;
end;

function TCobRetBoletoBusca.valorAtual(aValue: double): ICobRetBoletoBusca;
begin
   Result := Self;
   FvalorAtual := aValue;
end;

function TCobRetBoletoBusca.valorAtual: double;
begin
   Result := FvalorAtual;
end;

function TCobRetBoletoBusca.valorOriginal(aValue: double): ICobRetBoletoBusca;
begin
   Result := Self;
   FvalorOriginal := aValue;
end;

function TCobRetBoletoBusca.valorOriginal: double;
begin
   Result := FvalorOriginal;
end;

function TCobRetBoletoBusca.valorPago: double;
begin
   Result := FvalorPago;
end;

function TCobRetBoletoBusca.valorPago(aValue: double): ICobRetBoletoBusca;
begin
   Result := Self;
   FvalorPago := aValue;
end;

function TCobRetBoletoBusca.variacaoCarteiraConvenio( aValue: Integer): ICobRetBoletoBusca;
begin
   Result := Self;
   FvariacaoCarteiraConvenio := aValue;
end;

function TCobRetBoletoBusca.variacaoCarteiraConvenio: Integer;
begin
   Result := FvariacaoCarteiraConvenio;
end;

{ TCobRetBoletoBuscaLst }

function TCobRetBoletoBuscaLst.Continua: Boolean;
begin
   Result := FContinua;
end;

function TCobRetBoletoBuscaLst.Count: Integer;
begin
   Result := FBoletos.Count;
end;

constructor TCobRetBoletoBuscaLst.Create;
begin
   FBoletos := TList<ICobRetBoletoBusca>.Create;
   FContinua  := False;
   FTotal     := 0;
   FProximoID := 0;
end;

destructor TCobRetBoletoBuscaLst.Destroy;
begin
   FreeAndNil( FBoletos);
   inherited;
end;

function TCobRetBoletoBuscaLst.FromJSON(aValue: String): ICobRetBoletoBuscaLst;
var LBoleto:TJSONObject;
begin
   Result := Self;
   LBoleto := TJSONObject.ParseJSONValue( TEncoding.UTF8.GetBytes( aValue), 0) as TJSONObject;
   FromJSON( LBoleto);
end;

function TCobRetBoletoBuscaLst.FromJSON( aValue: TJSONObject): ICobRetBoletoBuscaLst;
var LBoletos:TJSONArray;
    LBoleto:ICobRetBoletoBusca;
    LAux:String;
    I:Integer;
begin
   Result := Self;
   try
      aValue.TryGetValue<String>( 'indicadorContinuidade', LAux);
      FContinua := LAux = 'S';
      aValue.TryGetValue<TJSONArray>( 'boletos', LBoletos);
      aValue.TryGetValue<Integer>( 'quantidadeRegistros', FTotal);
      aValue.TryGetValue<Integer>( 'proximoIndice', FProximoID);

      FBoletos.Clear;
      for I := 0 to Pred( LBoletos.Count) do
      begin
         LBoleto := TCobRetBoletoBusca.New
                       .FromJSON( LBoletos.Items[ i].AsType<TJSONObject>);
         FBoletos.Add( LBoleto);
      end;
   finally
      FreeAndNil( aValue);
   end;
end;

function TCobRetBoletoBuscaLst.Itens(aIndex: Integer): ICobRetBoletoBusca;
begin
   Result := FBoletos.Items[ aIndex];
end;

class function TCobRetBoletoBuscaLst.New: ICobRetBoletoBuscaLst;
begin
   Result := Self.Create;
end;

function TCobRetBoletoBuscaLst.ProximoID: Integer;
begin
   Result := FProximoID;
end;

function TCobRetBoletoBuscaLst.Total: Integer;
begin
   Result := FTotal;
end;

end.
