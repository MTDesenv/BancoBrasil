unit BancoBrasil.Cobranca.Alterar;

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
   TBoletoAtribuirDesconto = class( TInterfacedObject, IBoletoAtribuirDesconto)
   private
      [weak]
      FOwner:IAlterarBoleto;
      FAtribuirDesconto:Boolean;
      FtipoPrimeiroDesconto:TCobTipoDesconto;
      FvalorPrimeiroDesconto:Double;
      FpercentualPrimeiroDesconto:Double;
      FdataPrimeiroDesconto:TDateTime;
      FtipoSegundoDesconto:TCobTipoDesconto;
      FvalorSegundoDesconto:Double;
      FpercentualSegundoDesconto:Double;
      FdataSegundoDesconto:TDateTime;
      FtipoTerceiroDesconto:TCobTipoDesconto;
      FvalorTerceiroDesconto:Double;
      FpercentualTerceiroDesconto:Double;
      FdataTerceiroDesconto:TDateTime;

   public
      constructor Create( aOwner:IAlterarBoleto);
      destructor Destroy;override;
      class function New( aOwner:IAlterarBoleto):IBoletoAtribuirDesconto;

      function AtribuirDesconto:IBoletoAtribuirDesconto;
      function tipoPrimeiroDesconto( aValue:TCobTipoDesconto):IBoletoAtribuirDesconto;
      function valorPrimeiroDesconto( aValue:Double):IBoletoAtribuirDesconto;
      function percentualPrimeiroDesconto( aValue:Double):IBoletoAtribuirDesconto;
      function dataPrimeiroDesconto( aValue:TDateTime):IBoletoAtribuirDesconto;

      function tipoSegundoDesconto( aValue:TCobTipoDesconto):IBoletoAtribuirDesconto;
      function valorSegundoDesconto( aValue:Double):IBoletoAtribuirDesconto;
      function percentualSegundoDesconto( aValue:Double):IBoletoAtribuirDesconto;
      function dataSegundoDesconto( aValue:TDateTime):IBoletoAtribuirDesconto;

      function tipoTerceiroDesconto( aValue:TCobTipoDesconto):IBoletoAtribuirDesconto;
      function valorTerceiroDesconto( aValue:Double):IBoletoAtribuirDesconto;
      function percentualTerceiroDesconto( aValue:Double):IBoletoAtribuirDesconto;
      function dataTerceiroDesconto( aValue:TDateTime):IBoletoAtribuirDesconto;

      function ToJSON( aValue:TJSONObject):IBoletoAtribuirDesconto;
      function &end:IAlterarBoleto;
   end;

   TBoletoAlterarDesconto = class( TInterfacedObject, IBoletoAlterarDesconto)
   private
      [weak]
      FOwner:IAlterarBoleto;
      FAlterarDesconto:Boolean;
      FtipoPrimeiroDesconto:TCobTipoDesconto;
      FvalorPrimeiroDesconto:Double;
      FpercentualPrimeiroDesconto:Double;
      FdataPrimeiroDesconto:TDateTime;
      FtipoSegundoDesconto:TCobTipoDesconto;
      FvalorSegundoDesconto:Double;
      FpercentualSegundoDesconto:Double;
      FdataSegundoDesconto:TDateTime;
      FtipoTerceiroDesconto:TCobTipoDesconto;
      FvalorTerceiroDesconto:Double;
      FpercentualTerceiroDesconto:Double;
      FdataTerceiroDesconto:TDateTime;

   public
      constructor Create( aOwner:IAlterarBoleto);
      destructor Destroy;override;
      class function New( aOwner:IAlterarBoleto):IBoletoAlterarDesconto;

      function AlterarDesconto:IBoletoAlterarDesconto;
      function tipoPrimeiroDesconto( aValue:TCobTipoDesconto):IBoletoAlterarDesconto;
      function ValorPrimeiroDesconto( aValue:Double):IBoletoAlterarDesconto;
      function PercentualPrimeiroDesconto( aValue:Double):IBoletoAlterarDesconto;
      function DataLimitePrimeiroDesconto( aValue:TDateTime):IBoletoAlterarDesconto;

      function tipoSegundoDesconto( aValue:TCobTipoDesconto):IBoletoAlterarDesconto;
      function ValorSegundoDesconto( aValue:Double):IBoletoAlterarDesconto;
      function PercentualSegundoDesconto( aValue:Double):IBoletoAlterarDesconto;
      function DataLimiteSegundoDesconto( aValue:TDateTime):IBoletoAlterarDesconto;

      function tipoTerceiroDesconto( aValue:TCobTipoDesconto):IBoletoAlterarDesconto;
      function ValorTerceiroDesconto( aValue:Double):IBoletoAlterarDesconto;
      function PercentualTerceiroDesconto( aValue:Double):IBoletoAlterarDesconto;
      function DataLimiteTerceiroDesconto( aValue:TDateTime):IBoletoAlterarDesconto;

      function ToJSON( aValue:TJSONObject):IBoletoAlterarDesconto;
      function &end:IAlterarBoleto;
   end;

   TBoletoAlterarDataDesconto = class( TInterfacedObject, IBoletoAlterarDataDesconto)
   private
      [weak]
      FOwner:IAlterarBoleto;
      FAlterarDataDesconto:Boolean;
      FDataLimitePrimeiroDesconto:TDateTime;
      FDataLimiteSegundoDesconto:TDateTime;
      FDataLimiteTerceiroDesconto:TDateTime;

   public
      constructor Create( aOwner:IAlterarBoleto);
      destructor Destroy;override;
      class function New( aOwner:IAlterarBoleto):IBoletoAlterarDataDesconto;

      function AlterarDataDesconto:IBoletoAlterarDataDesconto;
      function DataLimitePrimeiroDesconto( aValue:TDateTime):IBoletoAlterarDataDesconto;
      function DataLimiteSegundoDesconto( aValue:TDateTime):IBoletoAlterarDataDesconto;
      function DataLimiteTerceiroDesconto( aValue:TDateTime):IBoletoAlterarDataDesconto;

      function ToJSON( aValue:TJSONObject):IBoletoAlterarDataDesconto;
      function &end:IAlterarBoleto;
   end;

   TBoletoCobrarJuros = class( TInterfacedObject, IBoletoCobrarJuros)
   private
      [weak]
      FOwner:IAlterarBoleto;
      FCobrarJuros:Boolean;
      FtipoJuros:TCobTipoJuros;
      FvalorJuros:Double;
      FtaxaJuros:Double;

   public
      constructor Create( aOwner:IAlterarBoleto);
      destructor Destroy;override;
      class function New( aOwner:IAlterarBoleto):IBoletoCobrarJuros;

      function CobrarJuros:IBoletoCobrarJuros;
      function tipoJuros( aValue:TCobTipoJuros):IBoletoCobrarJuros;
      function valorJuros( aValue:Double):IBoletoCobrarJuros;
      function taxaJuros( aValue:Double):IBoletoCobrarJuros;

      function ToJSON( aValue:TJSONObject):IBoletoCobrarJuros;
      function &end:IAlterarBoleto;
   end;

   TBoletoCobrarMulta = class( TInterfacedObject, IBoletoCobrarMulta)
   private
      [weak]
      FOwner:IAlterarBoleto;
      FCobrarMulta:Boolean;
      FtipoMulta:TCobTipoMulta;
      FvalorMulta:Double;
      FdataInicioMulta:TDateTime;
      FtaxaMulta:Double;

   public
      constructor Create( aOwner:IAlterarBoleto);
      destructor Destroy;override;
      class function New( aOwner:IAlterarBoleto):IBoletoCobrarMulta;

      function CobrarMulta:IBoletoCobrarMulta;
      function tipoMulta( aValue:TCobTipoMulta):IBoletoCobrarMulta;
      function valorMulta( aValue:Double):IBoletoCobrarMulta;
      function dataInicioMulta( aValue:TDateTime):IBoletoCobrarMulta;
      function taxaMulta( aValue:Double):IBoletoCobrarMulta;

      function ToJSON( aValue:TJSONObject):IBoletoCobrarMulta;
      function &end:IAlterarBoleto;
   end;

   TBoletoNegativar = class( TInterfacedObject, IBoletoNegativar)
   private
      [weak]
      FOwner:IAlterarBoleto;
      FNegativar:Boolean;
      FquantidadeDiasNegativacao:Integer;
      FtipoNegativacao:TCobTipoNegativacao;

   public
      constructor Create( aOwner:IAlterarBoleto);
      destructor Destroy;override;
      class function New( aOwner:IAlterarBoleto):IBoletoNegativar;

      function Negativar:IBoletoNegativar;
      function quantidadeDiasNegativacao( aValue:Integer):IBoletoNegativar;
      function tipoNegativacao( aValue:TCobTipoNegativacao):IBoletoNegativar;

      function ToJSON( aValue:TJSONObject):IBoletoNegativar;
      function &end:IAlterarBoleto;
   end;

   TBoletoAlterarEnderecoPagador = class( TInterfacedObject, IBoletoAlterarEnderecoPagador)
   private
      [weak]
      FOwner:IAlterarBoleto;
      FAlterarEnderecoPagador:Boolean;
      FenderecoPagador:String;
      FbairroPagador:String;
      FcidadePagador:String;
      FUFPagador:String;
      FCEPPagador:Integer;

   public
      constructor Create( aOwner:IAlterarBoleto);
      destructor Destroy;override;
      class function New( aOwner:IAlterarBoleto):IBoletoAlterarEnderecoPagador;

      function AlterarEnderecoPagador:IBoletoAlterarEnderecoPagador;
      function enderecoPagador( aValue:String):IBoletoAlterarEnderecoPagador;
      function bairroPagador( aValue:String):IBoletoAlterarEnderecoPagador;
      function cidadePagador( aValue:String):IBoletoAlterarEnderecoPagador;
      function UFPagador( aValue:String):IBoletoAlterarEnderecoPagador;
      function CEPPagador( aValue:Integer):IBoletoAlterarEnderecoPagador;

      function ToJSON( aValue:TJSONObject):IBoletoAlterarEnderecoPagador;
      function &end:IAlterarBoleto;
   end;

   TAlterarBoleto = class( TInterfacedObject, IAlterarBoleto)
   private
      [weak]
      FAuth:ICustomAuth;
      FnumeroConvenio:String;
      FnumeroBoleto:String;

      FDataVencimento:TDateTime;
      FAlterarDataVencimento:Boolean;
      FAtribuirDesconto:IBoletoAtribuirDesconto;
      FAlterarDesconto:IBoletoAlterarDesconto;
      FAlterarDataDesconto:IBoletoAlterarDataDesconto;
      FDiasProtesto:Integer;
      FProtestar:Boolean;
      FSustacaoProtesto:Boolean;
      FCancelarProtesto:Boolean;
      FIncluirAbatimento:Boolean;
      FValorAbatimento:Double;
      FAlterarAbatimento:Boolean;
      FNovoValorAbatimento:Double;
      FCobrarJuros:IBoletoCobrarJuros;
      FDispensarJuros:Boolean;
      FCobrarMulta:IBoletoCobrarMulta;
      FDispensarMulta:Boolean;
      FNegativar:IBoletoNegativar;
      FSeuNumero:String;
      FAlterarSeuNumero:Boolean;
      FAlterarEnderecoPagador:IBoletoAlterarEnderecoPagador;
      FPrazoBoletoVencido:Integer;
      FAlterarPrazoBoletoVencido:Boolean;

      FRequest:IRequest;
      FResponse:IResponse;

      procedure Validar;
      procedure Preparar;
      procedure Alterar;
      procedure Desserializar;

   public
      constructor Create( aAuth:ICustomAuth);
      destructor Destroy;override;
      class function New( aAuth:ICustomAuth):IAlterarBoleto;

      function numeroConvenio( aValue:String):IAlterarBoleto;
      function numeroBoleto( aValue:String):IAlterarBoleto;

      function AlterarDataVencimento( aValue:TDateTime):IAlterarBoleto;
      function AtribuirDesconto:IBoletoAtribuirDesconto;
      function AlterarDesconto:IBoletoAlterarDesconto;
      function AlterarDataDesconto:IBoletoAlterarDataDesconto;
      function Protestar( aValue:Integer):IAlterarBoleto;
      function SustacaoProtesto:IAlterarBoleto;
      function CancelarProtesto:IAlterarBoleto;
      function IncluirAbatimento( aValue:Double):IAlterarBoleto;
      function AlterarAbatimento( aValue:Double):IAlterarBoleto;
      function CobrarJuros:IBoletoCobrarJuros;
      function DispensarJuros:IAlterarBoleto;
      function CobrarMulta:IBoletoCobrarMulta;
      function DispensarMulta:IAlterarBoleto;
      function Negativar:IBoletoNegativar;
      function AlterarSeuNumero( aValue:String):IAlterarBoleto;
      function AlterarEnderecoPagador:IBoletoAlterarEnderecoPagador;
      function AlterarPrazoBoletoVencido( aValue:Integer):IAlterarBoleto;

      function Executar:IAlterarBoleto;
   end;

implementation

uses Infra.Auth.Types,
     BancoBrasil.Cobranca;

{ TBoletoAtribuirDesconto }

function TBoletoAtribuirDesconto.&end: IAlterarBoleto;
begin
   Result := FOwner;
end;

function TBoletoAtribuirDesconto.AtribuirDesconto: IBoletoAtribuirDesconto;
begin
   Result := Self;
   FAtribuirDesconto := True;
end;

constructor TBoletoAtribuirDesconto.Create( aOwner:IAlterarBoleto);
begin
   FOwner := aOwner;
   FAtribuirDesconto := False;
end;

function TBoletoAtribuirDesconto.dataPrimeiroDesconto( aValue: TDateTime): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FdataPrimeiroDesconto := aValue;
end;

function TBoletoAtribuirDesconto.dataSegundoDesconto( aValue: TDateTime): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FdataSegundoDesconto := aValue;
end;

function TBoletoAtribuirDesconto.dataTerceiroDesconto( aValue: TDateTime): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FdataTerceiroDesconto := aValue;
end;

destructor TBoletoAtribuirDesconto.Destroy;
begin

  inherited;
end;

class function TBoletoAtribuirDesconto.New( aOwner:IAlterarBoleto): IBoletoAtribuirDesconto;
begin
   Result := Self.Create( aOwner);
end;

function TBoletoAtribuirDesconto.percentualPrimeiroDesconto( aValue: Double): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FpercentualPrimeiroDesconto := aValue;
end;

function TBoletoAtribuirDesconto.percentualSegundoDesconto( aValue: Double): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FpercentualSegundoDesconto := aValue;
end;

function TBoletoAtribuirDesconto.percentualTerceiroDesconto( aValue: Double): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FpercentualTerceiroDesconto := aValue;
end;

function TBoletoAtribuirDesconto.tipoPrimeiroDesconto( aValue: TCobTipoDesconto): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FtipoPrimeiroDesconto := aValue;
end;

function TBoletoAtribuirDesconto.tipoSegundoDesconto( aValue: TCobTipoDesconto): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FtipoSegundoDesconto := aValue;
end;

function TBoletoAtribuirDesconto.tipoTerceiroDesconto( aValue: TCobTipoDesconto): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FtipoTerceiroDesconto := aValue;
end;

function TBoletoAtribuirDesconto.ToJSON( aValue:TJSONObject):IBoletoAtribuirDesconto;
begin
   Result := Self;
   aValue
      .AddPair( 'indicadorAtribuirDesconto', ifthen( FAtribuirDesconto, 'S', 'N'))
      .AddPair( 'desconto', TJSONObject.Create
         .AddPair( 'tipoPrimeiroDesconto', TJSONNumber.Create( Ord( FtipoPrimeiroDesconto)))
         .AddPair( 'valorPrimeiroDesconto', TJSONNumber.Create( FvalorPrimeiroDesconto))
         .AddPair( 'percentualPrimeiroDesconto', TJSONNumber.Create( FpercentualPrimeiroDesconto))
         .AddPair( 'dataPrimeiroDesconto', ifthen( FdataPrimeiroDesconto > 0, FormatDateTime( 'dd.mm.yyyy', FdataPrimeiroDesconto), EmptyStr))
         .AddPair( 'tipoSegundoDesconto', TJSONNumber.Create( Ord( FtipoSegundoDesconto)))
         .AddPair( 'valorSegundoDesconto', TJSONNumber.Create( FvalorSegundoDesconto))
         .AddPair( 'percentualSegundoDesconto', TJSONNumber.Create( FpercentualSegundoDesconto))
         .AddPair( 'dataSegundoDesconto', ifthen( FdataSegundoDesconto > 0, FormatDateTime( 'dd.mm.yyyy', FdataSegundoDesconto), EmptyStr))
         .AddPair( 'tipoTerceiroDesconto', TJSONNumber.Create( Ord( FtipoTerceiroDesconto)))
         .AddPair( 'valorTerceiroDesconto', TJSONNumber.Create( FvalorTerceiroDesconto))
         .AddPair( 'percentualTerceiroDesconto', TJSONNumber.Create( FpercentualTerceiroDesconto))
         .AddPair( 'dataTerceiroDesconto', ifthen( FdataTerceiroDesconto > 0, FormatDateTime( 'dd.mm.yyyy', FdataTerceiroDesconto), EmptyStr)))
end;

function TBoletoAtribuirDesconto.valorPrimeiroDesconto( aValue: Double): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FvalorPrimeiroDesconto := aValue;
end;

function TBoletoAtribuirDesconto.valorSegundoDesconto( aValue: Double): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FvalorSegundoDesconto := aValue;
end;

function TBoletoAtribuirDesconto.valorTerceiroDesconto( aValue: Double): IBoletoAtribuirDesconto;
begin
   Result := Self;
   FvalorTerceiroDesconto := aValue;
end;

{ TBoletoAlterarDesconto }

function TBoletoAlterarDesconto.&end: IAlterarBoleto;
begin
   Result := FOwner;
end;

function TBoletoAlterarDesconto.AlterarDesconto: IBoletoAlterarDesconto;
begin
   Result := Self;
   FAlterarDesconto := True;
end;

constructor TBoletoAlterarDesconto.Create( aOwner:IAlterarBoleto);
begin
   FOwner := aOwner;
   FAlterarDesconto := False;
end;

function TBoletoAlterarDesconto.DataLimitePrimeiroDesconto( aValue: TDateTime): IBoletoAlterarDesconto;
begin
   Result := Self;
   FdataPrimeiroDesconto := aValue;
end;

function TBoletoAlterarDesconto.DataLimiteSegundoDesconto( aValue: TDateTime): IBoletoAlterarDesconto;
begin
   Result := Self;
   FdataSegundoDesconto := aValue;
end;

function TBoletoAlterarDesconto.DataLimiteTerceiroDesconto( aValue: TDateTime): IBoletoAlterarDesconto;
begin
   Result := Self;
   FdataTerceiroDesconto := aValue;
end;

destructor TBoletoAlterarDesconto.Destroy;
begin

  inherited;
end;

class function TBoletoAlterarDesconto.New( aOwner:IAlterarBoleto): IBoletoAlterarDesconto;
begin
   Result := Self.Create( aOwner);
end;

function TBoletoAlterarDesconto.PercentualPrimeiroDesconto( aValue: Double): IBoletoAlterarDesconto;
begin
   Result := Self;
   FpercentualPrimeiroDesconto := aValue;
end;

function TBoletoAlterarDesconto.PercentualSegundoDesconto( aValue: Double): IBoletoAlterarDesconto;
begin
   Result := Self;
   FpercentualSegundoDesconto := aValue;
end;

function TBoletoAlterarDesconto.PercentualTerceiroDesconto( aValue: Double): IBoletoAlterarDesconto;
begin
   Result := Self;
   FpercentualTerceiroDesconto := aValue;
end;

function TBoletoAlterarDesconto.tipoPrimeiroDesconto( aValue: TCobTipoDesconto): IBoletoAlterarDesconto;
begin
   Result := Self;
   FtipoPrimeiroDesconto := aValue;
end;

function TBoletoAlterarDesconto.tipoSegundoDesconto( aValue: TCobTipoDesconto): IBoletoAlterarDesconto;
begin
   Result := Self;
   FtipoSegundoDesconto := aValue;
end;

function TBoletoAlterarDesconto.tipoTerceiroDesconto( aValue: TCobTipoDesconto): IBoletoAlterarDesconto;
begin
   Result := Self;
   FtipoTerceiroDesconto := aValue;
end;

function TBoletoAlterarDesconto.ToJSON( aValue:TJSONObject):IBoletoAlterarDesconto;
begin
   Result := Self;
   aValue
      .AddPair( 'indicadorAlterarDesconto', ifthen( FAlterarDesconto, 'S', 'N'))
      .AddPair( 'alteracaoDesconto', TJSONObject.Create
         .AddPair( 'tipoPrimeiroDesconto', TJSONNumber.Create( Ord( FtipoPrimeiroDesconto)))
         .AddPair( 'novoValorPrimeiroDesconto', TJSONNumber.Create( FvalorPrimeiroDesconto))
         .AddPair( 'novoPercentualPrimeiroDesconto', TJSONNumber.Create( FpercentualPrimeiroDesconto))
         .AddPair( 'novaDataPrimeiroDesconto', ifthen( FdataPrimeiroDesconto > 0, FormatDateTime( 'dd.mm.yyyy', FdataPrimeiroDesconto), EmptyStr))
         .AddPair( 'tipoSegundoDesconto', TJSONNumber.Create( Ord( FtipoSegundoDesconto)))
         .AddPair( 'novoValorSegundoDesconto', TJSONNumber.Create( FvalorSegundoDesconto))
         .AddPair( 'novoPercentualSegundoDesconto', TJSONNumber.Create( FpercentualSegundoDesconto))
         .AddPair( 'novaDataSegundoDesconto', ifthen( FdataSegundoDesconto > 0, FormatDateTime( 'dd.mm.yyyy', FdataSegundoDesconto), EmptyStr))
         .AddPair( 'tipoTerceiroDesconto', TJSONNumber.Create( Ord( FtipoTerceiroDesconto)))
         .AddPair( 'novoValorTerceiroDesconto', TJSONNumber.Create( FvalorTerceiroDesconto))
         .AddPair( 'novoPercentualTerceiroDesconto', TJSONNumber.Create( FpercentualTerceiroDesconto))
         .AddPair( 'novaDataTerceiroDesconto', ifthen( FdataTerceiroDesconto > 0, FormatDateTime( 'dd.mm.yyyy', FdataTerceiroDesconto), EmptyStr)))
end;

function TBoletoAlterarDesconto.ValorPrimeiroDesconto( aValue: Double): IBoletoAlterarDesconto;
begin
   Result := Self;
   FvalorPrimeiroDesconto := aValue;
end;

function TBoletoAlterarDesconto.ValorSegundoDesconto( aValue: Double): IBoletoAlterarDesconto;
begin
   Result := Self;
   FvalorSegundoDesconto := aValue;
end;

function TBoletoAlterarDesconto.ValorTerceiroDesconto( aValue: Double): IBoletoAlterarDesconto;
begin
   Result := Self;
   FvalorTerceiroDesconto := aValue;
end;

{ TBoletoAlterarDataDesconto }

function TBoletoAlterarDataDesconto.&end: IAlterarBoleto;
begin
   Result := FOwner;
end;

function TBoletoAlterarDataDesconto.AlterarDataDesconto: IBoletoAlterarDataDesconto;
begin
   Result := Self;
   FAlterarDataDesconto := True;
end;

constructor TBoletoAlterarDataDesconto.Create( aOwner:IAlterarBoleto);
begin
   FOwner := aOwner;
   FAlterarDataDesconto := False;
end;

function TBoletoAlterarDataDesconto.DataLimitePrimeiroDesconto( aValue: TDateTime): IBoletoAlterarDataDesconto;
begin
   Result := Self;
   FDataLimitePrimeiroDesconto := aValue;
end;

function TBoletoAlterarDataDesconto.DataLimiteSegundoDesconto( aValue: TDateTime): IBoletoAlterarDataDesconto;
begin
   Result := Self;
   FDataLimiteSegundoDesconto := aValue;
end;

function TBoletoAlterarDataDesconto.DataLimiteTerceiroDesconto( aValue: TDateTime): IBoletoAlterarDataDesconto;
begin
   Result := Self;
   FDataLimiteTerceiroDesconto := aValue;
end;

destructor TBoletoAlterarDataDesconto.Destroy;
begin

  inherited;
end;

class function TBoletoAlterarDataDesconto.New( aOwner:IAlterarBoleto): IBoletoAlterarDataDesconto;
begin
   Result := Self.Create( aOwner);
end;

function TBoletoAlterarDataDesconto.ToJSON( aValue:TJSONObject):IBoletoAlterarDataDesconto;
begin
   Result := Self;
   aValue
      .AddPair( 'indicadorAlterarDatadesconto', ifthen( FAlterarDataDesconto, 'S', 'N'))
      .AddPair( 'alteracaoDataDesconto', TJSONObject.Create
         .AddPair( 'novaDataLimitePrimeiroDesconto', ifthen( FDataLimitePrimeiroDesconto > 0, FormatDateTime( 'dd.mm.yyyy', FDataLimitePrimeiroDesconto), EmptyStr))
         .AddPair( 'novaDataLimiteSegundoDesconto', ifthen( FDataLimiteSegundoDesconto > 0, FormatDateTime( 'dd.mm.yyyy', FDataLimiteSegundoDesconto), EmptyStr))
         .AddPair( 'novaDataLimiteTerceiroDesconto', ifthen( FDataLimiteTerceiroDesconto> 0, FormatDateTime( 'dd.mm.yyyy', FDataLimiteTerceiroDesconto), EmptyStr)))
end;

{ TBoletoCobrarJuros }

function TBoletoCobrarJuros.&end: IAlterarBoleto;
begin
   Result := FOwner;
end;

function TBoletoCobrarJuros.CobrarJuros: IBoletoCobrarJuros;
begin
   Result := Self;
   FCobrarJuros := True;
end;

constructor TBoletoCobrarJuros.Create( aOwner:IAlterarBoleto);
begin
   FOwner := aOwner;
   FCobrarJuros := False;
end;

destructor TBoletoCobrarJuros.Destroy;
begin

  inherited;
end;

class function TBoletoCobrarJuros.New( aOwner:IAlterarBoleto): IBoletoCobrarJuros;
begin
   Result := Self.Create( aOwner);
end;

function TBoletoCobrarJuros.taxaJuros(aValue: Double): IBoletoCobrarJuros;
begin
   Result := Self;
   FtaxaJuros := aValue;
end;

function TBoletoCobrarJuros.tipoJuros( aValue: TCobTipoJuros): IBoletoCobrarJuros;
begin
   Result := Self;
   FtipoJuros := aValue;
end;

function TBoletoCobrarJuros.ToJSON( aValue:TJSONObject):IBoletoCobrarJuros;
begin
   Result := Result;
   aValue
      .AddPair( 'indicadorCobrarJuros', ifthen( FCobrarJuros, 'S', 'N'))
      .AddPair( 'juros', TJSONObject.Create
          .AddPair( 'tipoJuros', TJSONNumber.Create( ord( FtipoJuros)))
          .AddPair( 'valorJuros', TJSONNumber.Create( FvalorJuros))
          .AddPair( 'taxaJuros', TJSONNumber.Create( FtaxaJuros)))
end;

function TBoletoCobrarJuros.valorJuros(aValue: Double): IBoletoCobrarJuros;
begin
   Result := Self;
   FvalorJuros := aValue;
end;

{ TBoletoCobrarMulta }

function TBoletoCobrarMulta.&end: IAlterarBoleto;
begin
   Result := FOwner;
end;

function TBoletoCobrarMulta.CobrarMulta: IBoletoCobrarMulta;
begin
   Result := Self;
   FCobrarMulta := True;
end;

constructor TBoletoCobrarMulta.Create( aOwner:IAlterarBoleto);
begin
   FOwner := aOwner;
   FCobrarMulta := False;
end;

function TBoletoCobrarMulta.dataInicioMulta( aValue: TDateTime): IBoletoCobrarMulta;
begin
   Result := Self;
   FdataInicioMulta := aValue;
end;

destructor TBoletoCobrarMulta.Destroy;
begin

  inherited;
end;

class function TBoletoCobrarMulta.New( aOwner:IAlterarBoleto): IBoletoCobrarMulta;
begin
   Result := Self.Create( aOwner);
end;

function TBoletoCobrarMulta.taxaMulta(aValue: Double): IBoletoCobrarMulta;
begin
   Result := Self;
   FtaxaMulta := aValue;
end;

function TBoletoCobrarMulta.tipoMulta( aValue: TCobTipoMulta): IBoletoCobrarMulta;
begin
   Result := Self;
   FtipoMulta := aValue;
end;

function TBoletoCobrarMulta.ToJSON( aValue:TJSONObject):IBoletoCobrarMulta;
begin
   Result := Result;
   aValue
      .AddPair( 'indicadorCobrarMulta', ifthen( FCobrarMulta, 'S', 'N'))
      .AddPair( 'juros', TJSONObject.Create
          .AddPair( 'tipoMulta', TJSONNumber.Create( ord( FtipoMulta)))
          .AddPair( 'valorMulta', TJSONNumber.Create( FvalorMulta))
          .AddPair( 'dataInicioMulta', ifthen( FvalorMulta > 0, FormatDateTime( 'dd.mm.yyyy', FvalorMulta), EmptyStr))
          .AddPair( 'taxaMulta', TJSONNumber.Create( FtaxaMulta)))
end;

function TBoletoCobrarMulta.valorMulta(aValue: Double): IBoletoCobrarMulta;
begin
   Result := Self;
   FvalorMulta := aValue;
end;

{ TBoletoNegativar }

function TBoletoNegativar.&end: IAlterarBoleto;
begin
   Result := FOwner;
end;

constructor TBoletoNegativar.Create( aOwner:IAlterarBoleto);
begin
   FOwner := aOwner;
   FNegativar := False;
end;

destructor TBoletoNegativar.Destroy;
begin

  inherited;
end;

function TBoletoNegativar.Negativar: IBoletoNegativar;
begin
   Result := Self;
   FNegativar := True;
end;

class function TBoletoNegativar.New( aOwner:IAlterarBoleto): IBoletoNegativar;
begin
   Result := Self.Create( aOwner);
end;

function TBoletoNegativar.quantidadeDiasNegativacao( aValue: Integer): IBoletoNegativar;
begin
   Result := Self;
   FquantidadeDiasNegativacao := aValue;
end;

function TBoletoNegativar.tipoNegativacao( aValue: TCobTipoNegativacao): IBoletoNegativar;
begin
   Result := Self;
   FtipoNegativacao := aValue;
end;

function TBoletoNegativar.ToJSON( aValue:TJSONObject):IBoletoNegativar;

   function CodigoTipoNegativacao:Integer;
   begin
      case FtipoNegativacao of
         ctnIncluir     :Result := 1;
         ctnAlterarPrazo:Result := 2;
         ctnCancelar    :Result := 3;
         ctnExcluir     :Result := 4;
      end;
   end;

begin
   Result := Result;
   aValue
      .AddPair( 'indicadorNegativar', ifthen( FNegativar, 'S', 'N'))
      .AddPair( 'negativacao', TJSONObject.Create
          .AddPair( 'quantidadeDiasNegativacao', TJSONNumber.Create( ord( FquantidadeDiasNegativacao)))
          .AddPair( 'tipoNegativacao', TJSONNumber.Create( CodigoTipoNegativacao)))
end;

{ TBoletoAlterarEnderecoPagador }

function TBoletoAlterarEnderecoPagador.&end: IAlterarBoleto;
begin
   Result := FOwner;
end;

function TBoletoAlterarEnderecoPagador.AlterarEnderecoPagador: IBoletoAlterarEnderecoPagador;
begin
   Result := Self;
   FAlterarEnderecoPagador := true;
end;

function TBoletoAlterarEnderecoPagador.bairroPagador( aValue: String): IBoletoAlterarEnderecoPagador;
begin
   Result := Self;
   FbairroPagador := aValue;
end;

function TBoletoAlterarEnderecoPagador.CEPPagador( aValue: Integer): IBoletoAlterarEnderecoPagador;
begin
   Result := Self;
   FCEPPagador := aValue;
end;

function TBoletoAlterarEnderecoPagador.cidadePagador( aValue: String): IBoletoAlterarEnderecoPagador;
begin
   Result := Self;
   FcidadePagador := aValue;
end;

constructor TBoletoAlterarEnderecoPagador.Create( aOwner:IAlterarBoleto);
begin
   FOwner := aOwner;
   FAlterarEnderecoPagador := False;
end;

destructor TBoletoAlterarEnderecoPagador.Destroy;
begin

  inherited;
end;

function TBoletoAlterarEnderecoPagador.enderecoPagador( aValue: String): IBoletoAlterarEnderecoPagador;
begin
   Result := Self;
   FenderecoPagador := aValue;
end;

class function TBoletoAlterarEnderecoPagador.New( aOwner:IAlterarBoleto): IBoletoAlterarEnderecoPagador;
begin
   Result := Self.Create( aOwner);
end;

function TBoletoAlterarEnderecoPagador.ToJSON( aValue:TJSONObject):IBoletoAlterarEnderecoPagador;
begin
   Result := Result;
   aValue
      .AddPair( 'indicadorAlterarEnderecoPagador', ifthen( FAlterarEnderecoPagador, 'S', 'N'))
      .AddPair( 'alteracaoEndereco', TJSONObject.Create
         .AddPair( 'enderecoPagador', FenderecoPagador)
         .AddPair( 'bairroPagador', FbairroPagador)
         .AddPair( 'cidadePagador', FcidadePagador)
         .AddPair( 'UFPagador', FUFPagador)
         .AddPair( 'CEPPagador', TJSONNumber.Create( FCEPPagador)));
end;

function TBoletoAlterarEnderecoPagador.UFPagador( aValue: String): IBoletoAlterarEnderecoPagador;
begin
   Result := Self;
   FUFPagador := aValue;
end;

{ TAlterarBoleto }

procedure TAlterarBoleto.Alterar;
begin
   case FAuth.Environment of
      aeHomologation:FRequest.BaseURL( 'https://api.hm.bb.com.br/cobrancas/v2');
      aeProduction  :FRequest.BaseURL( 'https://api.bb.com.br/cobrancas/v2');
   end;

   FRequest.Resource( '/boletos/'+ FnumeroBoleto);
   FResponse := FRequest.Patch;

   if ( FResponse.StatusCode <> 200) and ( FResponse.StatusCode <> 400) then
      raise Exception.Create('Não foi possível realizar o cancelamento do boleto. Tente mais tarde');
end;

function TAlterarBoleto.AlterarAbatimento(aValue: Double): IAlterarBoleto;
begin
   Result := Self;
   FNovoValorAbatimento := aValue;
   FAlterarAbatimento := True;
end;

function TAlterarBoleto.AlterarDataDesconto: IBoletoAlterarDataDesconto;
begin
   Result := FAlterarDataDesconto;
end;

function TAlterarBoleto.AlterarDataVencimento( aValue: TDateTime): IAlterarBoleto;
begin
   Result := Self;
   FDataVencimento := aValue;
   FAlterarDataVencimento := True;
end;

function TAlterarBoleto.AlterarDesconto: IBoletoAlterarDesconto;
begin
   Result := FAlterarDesconto;
end;

function TAlterarBoleto.AlterarEnderecoPagador: IBoletoAlterarEnderecoPagador;
begin
   Result := FAlterarEnderecoPagador;
end;

function TAlterarBoleto.AlterarPrazoBoletoVencido( aValue: Integer): IAlterarBoleto;
begin
   Result := Self;
end;

function TAlterarBoleto.AlterarSeuNumero(aValue: String): IAlterarBoleto;
begin
   Result := Self;
   FSeuNumero := aValue;
   FAlterarSeuNumero := true;
end;

function TAlterarBoleto.AtribuirDesconto: IBoletoAtribuirDesconto;
begin
   Result := FAtribuirDesconto;
end;

function TAlterarBoleto.CancelarProtesto: IAlterarBoleto;
begin
   Result := Self;
   FCancelarProtesto := true;
end;

function TAlterarBoleto.CobrarJuros: IBoletoCobrarJuros;
begin
   Result := FCobrarJuros;
end;

function TAlterarBoleto.CobrarMulta: IBoletoCobrarMulta;
begin
   Result := FCobrarMulta;
end;

constructor TAlterarBoleto.Create(aAuth: ICustomAuth);
begin
   FAuth := aAuth;
   FRequest := TRequest.New;

   FDataVencimento            := 0;
   FAlterarDataVencimento     := False;
   FAtribuirDesconto          := TBoletoAtribuirDesconto.New( Self);
   FAlterarDesconto           := TBoletoAlterarDesconto.New( Self);
   FAlterarDataDesconto       := TBoletoAlterarDataDesconto.New( Self);
   FDiasProtesto              := 0;
   FProtestar                 := False;
   FSustacaoProtesto          := False;
   FCancelarProtesto          := False;
   FIncluirAbatimento         := False;
   FValorAbatimento           := 0;
   FNovoValorAbatimento       := 0;
   FAlterarAbatimento         := False;
   FCobrarJuros               := TBoletoCobrarJuros.New( Self);
   FDispensarJuros            := False;
   FCobrarMulta               := TBoletoCobrarMulta.New( Self);
   FDispensarMulta            := False;
   FNegativar                 := TBoletoNegativar.New( Self);
   FSeuNumero                 := EmptyStr;
   FAlterarSeuNumero          := False;
   FAlterarEnderecoPagador    := TBoletoAlterarEnderecoPagador.New( Self);
   FPrazoBoletoVencido        := 0;
   FAlterarPrazoBoletoVencido := False;
end;

procedure TAlterarBoleto.Desserializar;
begin

end;

destructor TAlterarBoleto.Destroy;
begin

  inherited;
end;

function TAlterarBoleto.DispensarJuros: IAlterarBoleto;
begin
   Result := Self;
   FDispensarJuros := True;
end;

function TAlterarBoleto.DispensarMulta: IAlterarBoleto;
begin
   Result := Self;
   FDispensarMulta := True;
end;

function TAlterarBoleto.Executar: IAlterarBoleto;
begin
   Result := Self;

   Validar;
   Preparar;
   Alterar;
   Desserializar;
end;

function TAlterarBoleto.IncluirAbatimento(aValue: Double): IAlterarBoleto;
begin
   Result := Self;
   FValorAbatimento := aValue;
   FIncluirAbatimento := True;
end;

function TAlterarBoleto.Negativar: IBoletoNegativar;
begin
   Result := FNegativar;
end;

class function TAlterarBoleto.New(aAuth: ICustomAuth): IAlterarBoleto;
begin
   Result := Self.Create( aAuth);
end;

function TAlterarBoleto.numeroBoleto(aValue: String): IAlterarBoleto;
begin
   Result := Self;
   FnumeroBoleto := aValue;
end;

function TAlterarBoleto.numeroConvenio(aValue: String): IAlterarBoleto;
begin
   Result := Self;
   FnumeroConvenio := aValue;
end;

procedure TAlterarBoleto.Preparar;
var LJSON:TJSONObject;
begin
   if FAuth.AccessToken.IsEmpty then
      FAuth.Execute;

   FRequest
      .ContentType( 'application/json')
      .TokenBearer( FAuth.AccessToken)
      .AddParam( 'gw-dev-app-key',      FAuth.AppKey,         pkQUERY, [poDoNotEncode]);

   LJSON := TJSONObject.Create
      .AddPair( 'numeroConvenio', FnumeroConvenio)
      .AddPair( 'indicadorNovaDataVencimento', ifthen( FAlterarDataVencimento, 'S', 'N'))
      .AddPair( 'alteracaoData', TJSONObject.Create
          .AddPair( 'novaDataVencimento', ifthen( FDataVencimento > 0, FormatDateTime( 'dd.mm.yyyy', FDataVencimento), EmptyStr)));

   FAtribuirDesconto.ToJSON( LJSON);
   FAlterarDesconto.ToJSON( LJSON);
   FAlterarDataDesconto.ToJSON( LJSON);

   LJSON
      .AddPair( 'indicadorProtestar', ifthen( FProtestar, 'S', 'N'))
      .AddPair( 'protesto', TJSONObject.Create
         .AddPair( 'quantidadeDiasProtesto', TJSONNumber.Create( FDiasProtesto)))
      .AddPair( 'indicadorSustacaoProtesto', ifthen( FSustacaoProtesto, 'S', 'N'))
      .AddPair( 'indicadorCancelarProtesto', ifthen( FCancelarProtesto, 'S', 'N'))
      .AddPair( 'indicadorIncluirAbatimento', ifthen( FIncluirAbatimento, 'S', 'N'))
      .AddPair( 'abatimento', TJSONObject.Create
          .AddPair( 'valorAbatimento', TJSONNumber.Create( FValorAbatimento)))
      .AddPair( 'indicadorAlterarAbatimento', ifthen( FAlterarAbatimento, 'S', 'N'))
      .AddPair( 'alteracaoAbatimento', TJSONObject.Create
         .AddPair( 'novoValorAbatimento', TJSONNumber.Create( FNovoValorAbatimento)));

   FCobrarJuros.ToJSON( LJSON);

   LJSON.AddPair( 'indicadorDispensarJuros', ifthen( FDispensarJuros, 'S', 'N'));

   FCobrarMulta.ToJSON( LJSON);

   LJSON.AddPair( 'indicadorDispensarMulta', ifthen( FDispensarMulta, 'S', 'N'));

   FNegativar.ToJSON( LJSON);

   LJSON
      .AddPair( 'indicadorAlterarSeuNumero', ifthen( FAlterarSeuNumero, 'S', 'N'))
      .AddPair( 'alteracaoSeuNumero', TJSONObject.Create
         .AddPair( 'codigoSeuNumero', FSeuNumero));

   FAlterarEnderecoPagador.ToJSON( LJSON);

   LJSON
      .AddPair( 'indicadorAlterarPrazoBoletoVencido', ifthen( FAlterarPrazoBoletoVencido, 'S', 'N'))
      .AddPair( 'alteracaoPrazo', TJSONObject.Create
         .AddPair( 'quantidadeDiasAceite', TJSONNumber.Create( FPrazoBoletoVencido)));

   FRequest.AddBody( LJSON);
end;

function TAlterarBoleto.Protestar(aValue: Integer): IAlterarBoleto;
begin
   Result := Self;
   FDiasProtesto := aValue;
   FProtestar := True;
end;

function TAlterarBoleto.SustacaoProtesto: IAlterarBoleto;
begin
   Result := Self;
   FSustacaoProtesto := true;
end;

procedure TAlterarBoleto.Validar;
begin
   if FAuth.AppKey.Trim.IsEmpty then
      raise Exception.Create( 'O código da aplicação deve ser informado');

   if FnumeroConvenio.Trim.IsEmpty then
      raise Exception.Create( 'O número do convênio de emissão do boleto pesquisado deve ser informado.');

   if FnumeroBoleto.Trim.IsEmpty then
      raise Exception.Create( 'O número do boleto pesquisado deve ser informado.');
end;

end.
