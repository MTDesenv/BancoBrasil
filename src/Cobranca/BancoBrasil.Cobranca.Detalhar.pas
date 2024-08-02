unit BancoBrasil.Cobranca.Detalhar;

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
   TCobRetBoletoDetalhado = class( TInterfacedObject, ICobRetBoletoDetalhado)
   private
      FcodigoLinhaDigitavel:string;
      FtextoEmailPagador:string;
      FtextoMensagemBloquetoTitulo:string;
      FcodigoTipoMulta:integer;
      FcodigoCanalPagamento:integer;
      FnumeroContratoCobranca:integer;
      FcodigoTipoInscricaoSacado:integer;
      FnumeroInscricaoSacadoCobranca:integer;
      FcodigoEstadoTituloCobranca:integer;
      FcodigoTipoTituloCobranca:integer;
      FcodigoModalidadeTitulo:integer;
      FcodigoAceiteTituloCobranca:string;
      FcodigoPrefixoDependenciaCobrador:integer;
      FcodigoIndicadorEconomico:integer;
      FnumeroTituloCedenteCobranca:string;
      FcodigoTipoJuroMora:integer;
      FdataEmissaoTituloCobranca:TDateTime;
      FdataRegistroTituloCobranca:TDateTime;
      FdataVencimentoTituloCobranca:TDateTime;
      FvalorOriginalTituloCobranca:Double;
      FvalorAtualTituloCobranca:Double;
      FvalorPagamentoParcialTitulo:Double;
      FvalorAbatimentoTituloCobranca:Double;
      FpercentualImpostoSobreOprFinanceirasTituloCobranca:Double;
      FvalorImpostoSobreOprFinanceirasTituloCobranca:Double;
      FvalorMoedaTituloCobranca:Double;
      FpercentualJuroMoraTitulo:Double;
      FvalorJuroMoraTitulo:Double;
      FpercentualMultaTitulo:Double;
      FvalorMultaTituloCobranca:Double;
      FquantidadeParcelaTituloCobranca:integer;
      FdataBaixaAutomaticoTitulo:TDateTime;
      FtextoCampoUtilizacaoCedente:string;
      FindicadorCobrancaPartilhadoTitulo:string;
      FnomeSacadoCobranca:string;
      FtextoEnderecoSacadoCobranca:string;
      FnomeBairroSacadoCobranca:string;
      FnomeMunicipioSacadoCobranca:string;
      FsiglaUnidadeFederacaoSacadoCobranca:string;
      FnumeroCepSacadoCobranca:integer;
      FvalorMoedaAbatimentoTitulo:Double;
      FdataProtestoTituloCobranca:TDateTime;
      FcodigoTipoInscricaoSacador:integer;
      FnumeroInscricaoSacadorAvalista:integer;
      FnomeSacadorAvalistaTitulo:string;
      FpercentualDescontoTitulo:Double;
      FdataDescontoTitulo:TDateTime;
      FvalorDescontoTitulo:Double;
      FcodigoDescontoTitulo:integer;
      FpercentualSegundoDescontoTitulo:Double;
      FdataSegundoDescontoTitulo:TDateTime;
      FvalorSegundoDescontoTitulo:Double;
      FcodigoSegundoDescontoTitulo:integer;
      FpercentualTerceiroDescontoTitulo:Double;
      FdataTerceiroDescontoTitulo:TDateTime;
      FvalorTerceiroDescontoTitulo:Double;
      FcodigoTerceiroDescontoTitulo:integer;
      FdataMultaTitulo:TDateTime;
      FnumeroCarteiraCobranca:integer;
      FnumeroVariacaoCarteiraCobranca:integer;
      FquantidadeDiaProtesto:integer;
      FquantidadeDiaPrazoLimiteRecebimento:integer;
      FdataLimiteRecebimentoTitulo:TDateTime;
      FindicadorPermissaoRecebimentoParcial:string;
      FtextoCodigoBarrasTituloCobranca:string;
      FcodigoOcorrenciaCartorio:integer;
      FvalorImpostoSobreOprFinanceirasRecebidoTitulo:Double;
      FvalorAbatimentoTotal:Double;
      FvalorJuroMoraRecebido:Double;
      FvalorDescontoUtilizado:Double;
      FvalorPagoSacado:Double;
      FvalorCreditoCedente:Double;
      FcodigoTipoLiquidacao:integer;
      FdataCreditoLiquidacao:TDateTime;
      FdataRecebimentoTitulo:TDateTime;
      FcodigoPrefixoDependenciaRecebedor:integer;
      FcodigoNaturezaRecebimento:integer;
      FnumeroIdentidadeSacadoTituloCobranca:string;
      FcodigoResponsavelAtualizacao:string;
      FcodigoTipoBaixaTitulo:integer;
      FvalorMultaRecebido:Double;
      FvalorReajuste:Double;
      FvalorOutroRecebido:Double;
      FcodigoIndicadorEconomicoUtilizadoInadimplencia:integer;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:ICobRetBoletoDetalhado;

      function codigoLinhaDigitavel( aValue:string):ICobRetBoletoDetalhado;overload;
      function textoEmailPagador( aValue:string):ICobRetBoletoDetalhado;overload;
      function textoMensagemBloquetoTitulo( aValue:string):ICobRetBoletoDetalhado;overload;
      function codigoTipoMulta( aValue:integer):ICobRetBoletoDetalhado;overload;
      function codigoCanalPagamento( aValue:integer):ICobRetBoletoDetalhado;overload;
      function numeroContratoCobranca( aValue:integer):ICobRetBoletoDetalhado;overload;
      function codigoTipoInscricaoSacado( aValue:integer):ICobRetBoletoDetalhado;overload;
      function numeroInscricaoSacadoCobranca( aValue:integer):ICobRetBoletoDetalhado;overload;
      function codigoEstadoTituloCobranca( aValue:integer):ICobRetBoletoDetalhado;overload;
      function codigoTipoTituloCobranca( aValue:integer):ICobRetBoletoDetalhado;overload;
      function codigoModalidadeTitulo( aValue:integer):ICobRetBoletoDetalhado;overload;
      function codigoAceiteTituloCobranca( aValue:string):ICobRetBoletoDetalhado;overload;
      function codigoPrefixoDependenciaCobrador( aValue:integer):ICobRetBoletoDetalhado;overload;
      function codigoIndicadorEconomico( aValue:integer):ICobRetBoletoDetalhado;overload;
      function numeroTituloCedenteCobranca( aValue:string):ICobRetBoletoDetalhado;overload;
      function codigoTipoJuroMora( aValue:integer):ICobRetBoletoDetalhado;overload;
      function dataEmissaoTituloCobranca( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function dataRegistroTituloCobranca( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function dataVencimentoTituloCobranca( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function valorOriginalTituloCobranca( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorAtualTituloCobranca( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorPagamentoParcialTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorAbatimentoTituloCobranca( aValue:Double):ICobRetBoletoDetalhado;overload;
      function percentualImpostoSobreOprFinanceirasTituloCobranca( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorImpostoSobreOprFinanceirasTituloCobranca( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorMoedaTituloCobranca( aValue:Double):ICobRetBoletoDetalhado;overload;
      function percentualJuroMoraTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorJuroMoraTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function percentualMultaTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorMultaTituloCobranca( aValue:Double):ICobRetBoletoDetalhado;overload;
      function quantidadeParcelaTituloCobranca( aValue:integer):ICobRetBoletoDetalhado;overload;
      function dataBaixaAutomaticoTitulo( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function textoCampoUtilizacaoCedente( aValue:string):ICobRetBoletoDetalhado;overload;
      function indicadorCobrancaPartilhadoTitulo( aValue:string):ICobRetBoletoDetalhado;overload;
      function nomeSacadoCobranca( aValue:string):ICobRetBoletoDetalhado;overload;
      function textoEnderecoSacadoCobranca( aValue:string):ICobRetBoletoDetalhado;overload;
      function nomeBairroSacadoCobranca( aValue:string):ICobRetBoletoDetalhado;overload;
      function nomeMunicipioSacadoCobranca( aValue:string):ICobRetBoletoDetalhado;overload;
      function siglaUnidadeFederacaoSacadoCobranca( aValue:string):ICobRetBoletoDetalhado;overload;
      function numeroCepSacadoCobranca( aValue:integer):ICobRetBoletoDetalhado;overload;
      function valorMoedaAbatimentoTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function dataProtestoTituloCobranca( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function codigoTipoInscricaoSacador( aValue:integer):ICobRetBoletoDetalhado;overload;
      function numeroInscricaoSacadorAvalista( aValue:integer):ICobRetBoletoDetalhado;overload;
      function nomeSacadorAvalistaTitulo( aValue:string):ICobRetBoletoDetalhado;overload;
      function percentualDescontoTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function dataDescontoTitulo( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function valorDescontoTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function codigoDescontoTitulo( aValue:integer):ICobRetBoletoDetalhado;overload;
      function percentualSegundoDescontoTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function dataSegundoDescontoTitulo( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function valorSegundoDescontoTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function codigoSegundoDescontoTitulo( aValue:integer):ICobRetBoletoDetalhado;overload;
      function percentualTerceiroDescontoTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function dataTerceiroDescontoTitulo( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function valorTerceiroDescontoTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function codigoTerceiroDescontoTitulo( aValue:integer):ICobRetBoletoDetalhado;overload;
      function dataMultaTitulo( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function numeroCarteiraCobranca( aValue:integer):ICobRetBoletoDetalhado;overload;
      function numeroVariacaoCarteiraCobranca( aValue:integer):ICobRetBoletoDetalhado;overload;
      function quantidadeDiaProtesto( aValue:integer):ICobRetBoletoDetalhado;overload;
      function quantidadeDiaPrazoLimiteRecebimento( aValue:integer):ICobRetBoletoDetalhado;overload;
      function dataLimiteRecebimentoTitulo( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function indicadorPermissaoRecebimentoParcial( aValue:string):ICobRetBoletoDetalhado;overload;
      function textoCodigoBarrasTituloCobranca( aValue:string):ICobRetBoletoDetalhado;overload;
      function codigoOcorrenciaCartorio( aValue:integer):ICobRetBoletoDetalhado;overload;
      function valorImpostoSobreOprFinanceirasRecebidoTitulo( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorAbatimentoTotal( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorJuroMoraRecebido( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorDescontoUtilizado( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorPagoSacado( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorCreditoCedente( aValue:Double):ICobRetBoletoDetalhado;overload;
      function codigoTipoLiquidacao( aValue:integer):ICobRetBoletoDetalhado;overload;
      function dataCreditoLiquidacao( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function dataRecebimentoTitulo( aValue:TDateTime):ICobRetBoletoDetalhado;overload;
      function codigoPrefixoDependenciaRecebedor( aValue:integer):ICobRetBoletoDetalhado;overload;
      function codigoNaturezaRecebimento( aValue:integer):ICobRetBoletoDetalhado;overload;
      function numeroIdentidadeSacadoTituloCobranca( aValue:string):ICobRetBoletoDetalhado;overload;
      function codigoResponsavelAtualizacao( aValue:string):ICobRetBoletoDetalhado;overload;
      function codigoTipoBaixaTitulo( aValue:integer):ICobRetBoletoDetalhado;overload;
      function valorMultaRecebido( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorReajuste( aValue:Double):ICobRetBoletoDetalhado;overload;
      function valorOutroRecebido( aValue:Double):ICobRetBoletoDetalhado;overload;
      function codigoIndicadorEconomicoUtilizadoInadimplencia( aValue:integer):ICobRetBoletoDetalhado;overload;

      function codigoLinhaDigitavel:string;overload;
      function textoEmailPagador:string;overload;
      function textoMensagemBloquetoTitulo:string;overload;
      function codigoTipoMulta:integer;overload;
      function codigoCanalPagamento:integer;overload;
      function numeroContratoCobranca:integer;overload;
      function codigoTipoInscricaoSacado:integer;overload;
      function numeroInscricaoSacadoCobranca:integer;overload;
      function codigoEstadoTituloCobranca:integer;overload;
      function codigoTipoTituloCobranca:integer;overload;
      function codigoModalidadeTitulo:integer;overload;
      function codigoAceiteTituloCobranca:string;overload;
      function codigoPrefixoDependenciaCobrador:integer;overload;
      function codigoIndicadorEconomico:integer;overload;
      function numeroTituloCedenteCobranca:string;overload;
      function codigoTipoJuroMora:integer;overload;
      function dataEmissaoTituloCobranca:TDateTime;overload;
      function dataRegistroTituloCobranca:TDateTime;overload;
      function dataVencimentoTituloCobranca:TDateTime;overload;
      function valorOriginalTituloCobranca:Double;overload;
      function valorAtualTituloCobranca:Double;overload;
      function valorPagamentoParcialTitulo:Double;overload;
      function valorAbatimentoTituloCobranca:Double;overload;
      function percentualImpostoSobreOprFinanceirasTituloCobranca:Double;overload;
      function valorImpostoSobreOprFinanceirasTituloCobranca:Double;overload;
      function valorMoedaTituloCobranca:Double;overload;
      function percentualJuroMoraTitulo:Double;overload;
      function valorJuroMoraTitulo:Double;overload;
      function percentualMultaTitulo:Double;overload;
      function valorMultaTituloCobranca:Double;overload;
      function quantidadeParcelaTituloCobranca:integer;overload;
      function dataBaixaAutomaticoTitulo:TDateTime;overload;
      function textoCampoUtilizacaoCedente:string;overload;
      function indicadorCobrancaPartilhadoTitulo:string;overload;
      function nomeSacadoCobranca:string;overload;
      function textoEnderecoSacadoCobranca:string;overload;
      function nomeBairroSacadoCobranca:string;overload;
      function nomeMunicipioSacadoCobranca:string;overload;
      function siglaUnidadeFederacaoSacadoCobranca:string;overload;
      function numeroCepSacadoCobranca:integer;overload;
      function valorMoedaAbatimentoTitulo:Double;overload;
      function dataProtestoTituloCobranca:TDateTime;overload;
      function codigoTipoInscricaoSacador:integer;overload;
      function numeroInscricaoSacadorAvalista:integer;overload;
      function nomeSacadorAvalistaTitulo:string;overload;
      function percentualDescontoTitulo:Double;overload;
      function dataDescontoTitulo:TDateTime;overload;
      function valorDescontoTitulo:Double;overload;
      function codigoDescontoTitulo:integer;overload;
      function percentualSegundoDescontoTitulo:Double;overload;
      function dataSegundoDescontoTitulo:TDateTime;overload;
      function valorSegundoDescontoTitulo:Double;overload;
      function codigoSegundoDescontoTitulo:integer;overload;
      function percentualTerceiroDescontoTitulo:Double;overload;
      function dataTerceiroDescontoTitulo:TDateTime;overload;
      function valorTerceiroDescontoTitulo:Double;overload;
      function codigoTerceiroDescontoTitulo:integer;overload;
      function dataMultaTitulo:TDateTime;overload;
      function numeroCarteiraCobranca:integer;overload;
      function numeroVariacaoCarteiraCobranca:integer;overload;
      function quantidadeDiaProtesto:integer;overload;
      function quantidadeDiaPrazoLimiteRecebimento:integer;overload;
      function dataLimiteRecebimentoTitulo:TDateTime;overload;
      function indicadorPermissaoRecebimentoParcial:string;overload;
      function textoCodigoBarrasTituloCobranca:string;overload;
      function codigoOcorrenciaCartorio:integer;overload;
      function valorImpostoSobreOprFinanceirasRecebidoTitulo:Double;overload;
      function valorAbatimentoTotal:Double;overload;
      function valorJuroMoraRecebido:Double;overload;
      function valorDescontoUtilizado:Double;overload;
      function valorPagoSacado:Double;overload;
      function valorCreditoCedente:Double;overload;
      function codigoTipoLiquidacao:integer;overload;
      function dataCreditoLiquidacao:TDateTime;overload;
      function dataRecebimentoTitulo:TDateTime;overload;
      function codigoPrefixoDependenciaRecebedor:integer;overload;
      function codigoNaturezaRecebimento:integer;overload;
      function numeroIdentidadeSacadoTituloCobranca:string;overload;
      function codigoResponsavelAtualizacao:string;overload;
      function codigoTipoBaixaTitulo:integer;overload;
      function valorMultaRecebido:Double;overload;
      function valorReajuste:Double;overload;
      function valorOutroRecebido:Double;overload;
      function codigoIndicadorEconomicoUtilizadoInadimplencia:integer;overload;

      function FromJSON( aValue:String):ICobRetBoletoDetalhado;overload;
      function FromJSON( aValue:TJSONObject; aOwnerFree:Boolean = true):ICobRetBoletoDetalhado;overload;
   end;

   TDetalharBoleto = class( TInterfacedObject, IDetalharBoleto)
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
     class function New( aAuth:ICustomAuth):IDetalharBoleto;

     function numeroConvenio( aValue:String):IDetalharBoleto;
     function numeroBoleto( aValue:String):IDetalharBoleto;

     function Executar:IDetalharBoleto;
     function Retorno:ICobRetBoletoDetalhado;
   end;

implementation

uses Infra.Auth.Types,
     BancoBrasil.Cobranca;

{ TCobRetBoletoDetalhado }

function TCobRetBoletoDetalhado.codigoAceiteTituloCobranca( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoAceiteTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.codigoAceiteTituloCobranca: string;
begin
   Result := FcodigoAceiteTituloCobranca;
end;

function TCobRetBoletoDetalhado.codigoCanalPagamento( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoCanalPagamento := aValue;
end;

function TCobRetBoletoDetalhado.codigoCanalPagamento: integer;
begin
   Result := FcodigoCanalPagamento;
end;

function TCobRetBoletoDetalhado.codigoDescontoTitulo: integer;
begin
   Result := FcodigoDescontoTitulo;
end;

function TCobRetBoletoDetalhado.codigoDescontoTitulo( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoDescontoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.codigoEstadoTituloCobranca( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoEstadoTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.codigoEstadoTituloCobranca: integer;
begin
   Result := FcodigoEstadoTituloCobranca;
end;

function TCobRetBoletoDetalhado.codigoIndicadorEconomico: integer;
begin
   Result := FcodigoIndicadorEconomico;
end;

function TCobRetBoletoDetalhado.codigoIndicadorEconomico( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoIndicadorEconomico := aValue;
end;

function TCobRetBoletoDetalhado.codigoIndicadorEconomicoUtilizadoInadimplencia( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoIndicadorEconomicoUtilizadoInadimplencia := aValue;
end;

function TCobRetBoletoDetalhado.codigoIndicadorEconomicoUtilizadoInadimplencia: integer;
begin
   Result := FcodigoIndicadorEconomicoUtilizadoInadimplencia;
end;

function TCobRetBoletoDetalhado.codigoLinhaDigitavel: string;
begin
   Result := FcodigoLinhaDigitavel;
end;

function TCobRetBoletoDetalhado.codigoLinhaDigitavel( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoLinhaDigitavel := aValue;
end;

function TCobRetBoletoDetalhado.codigoModalidadeTitulo( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoModalidadeTitulo := aValue;
end;

function TCobRetBoletoDetalhado.codigoModalidadeTitulo: integer;
begin
   Result := FcodigoModalidadeTitulo;
end;

function TCobRetBoletoDetalhado.codigoNaturezaRecebimento( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoNaturezaRecebimento := aValue;
end;

function TCobRetBoletoDetalhado.codigoNaturezaRecebimento: integer;
begin
   Result := FcodigoNaturezaRecebimento;
end;

function TCobRetBoletoDetalhado.codigoOcorrenciaCartorio: integer;
begin
   Result := FcodigoOcorrenciaCartorio;
end;

function TCobRetBoletoDetalhado.codigoOcorrenciaCartorio( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoOcorrenciaCartorio := aValue;
end;

function TCobRetBoletoDetalhado.codigoPrefixoDependenciaCobrador: integer;
begin
   Result := FcodigoPrefixoDependenciaCobrador;
end;

function TCobRetBoletoDetalhado.codigoPrefixoDependenciaCobrador( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoPrefixoDependenciaCobrador := aValue;
end;

function TCobRetBoletoDetalhado.codigoPrefixoDependenciaRecebedor( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoPrefixoDependenciaRecebedor := aValue;
end;

function TCobRetBoletoDetalhado.codigoPrefixoDependenciaRecebedor: integer;
begin
   Result := FcodigoPrefixoDependenciaRecebedor;
end;

function TCobRetBoletoDetalhado.codigoResponsavelAtualizacao( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoResponsavelAtualizacao := aValue;
end;

function TCobRetBoletoDetalhado.codigoResponsavelAtualizacao: string;
begin
   Result := FcodigoResponsavelAtualizacao;
end;

function TCobRetBoletoDetalhado.codigoSegundoDescontoTitulo: integer;
begin
   Result := FcodigoSegundoDescontoTitulo;
end;

function TCobRetBoletoDetalhado.codigoSegundoDescontoTitulo( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoSegundoDescontoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.codigoTerceiroDescontoTitulo( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoTerceiroDescontoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.codigoTerceiroDescontoTitulo: integer;
begin
   Result := FcodigoTerceiroDescontoTitulo;
end;

function TCobRetBoletoDetalhado.codigoTipoBaixaTitulo: integer;
begin
   Result := FcodigoTipoBaixaTitulo;
end;

function TCobRetBoletoDetalhado.codigoTipoBaixaTitulo( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoTipoBaixaTitulo := aValue;
end;

function TCobRetBoletoDetalhado.codigoTipoInscricaoSacado( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoTipoInscricaoSacado := aValue;
end;

function TCobRetBoletoDetalhado.codigoTipoInscricaoSacado: integer;
begin
   Result := FcodigoTipoInscricaoSacado;
end;

function TCobRetBoletoDetalhado.codigoTipoInscricaoSacador: integer;
begin
   Result := FcodigoTipoInscricaoSacador;
end;

function TCobRetBoletoDetalhado.codigoTipoInscricaoSacador( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoTipoInscricaoSacado := aValue;
end;

function TCobRetBoletoDetalhado.codigoTipoJuroMora( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoTipoJuroMora := aValue;
end;

function TCobRetBoletoDetalhado.codigoTipoJuroMora: integer;
begin
   Result := FcodigoTipoJuroMora;
end;

function TCobRetBoletoDetalhado.codigoTipoLiquidacao: integer;
begin
   Result := FcodigoTipoLiquidacao;
end;

function TCobRetBoletoDetalhado.codigoTipoLiquidacao( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoTipoLiquidacao := aValue;
end;

function TCobRetBoletoDetalhado.codigoTipoMulta: integer;
begin
   Result := FcodigoTipoMulta;
end;

function TCobRetBoletoDetalhado.codigoTipoMulta( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoTipoMulta := aValue;
end;

function TCobRetBoletoDetalhado.codigoTipoTituloCobranca: integer;
begin
   Result := FcodigoTipoTituloCobranca;
end;

function TCobRetBoletoDetalhado.codigoTipoTituloCobranca( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FcodigoTipoTituloCobranca := aValue;
end;

constructor TCobRetBoletoDetalhado.Create;
begin

end;

function TCobRetBoletoDetalhado.dataBaixaAutomaticoTitulo( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataBaixaAutomaticoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.dataBaixaAutomaticoTitulo: TDateTime;
begin
   Result := FdataBaixaAutomaticoTitulo;
end;

function TCobRetBoletoDetalhado.dataCreditoLiquidacao: TDateTime;
begin
   Result := FdataCreditoLiquidacao;
end;

function TCobRetBoletoDetalhado.dataCreditoLiquidacao( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataCreditoLiquidacao := aValue;
end;

function TCobRetBoletoDetalhado.dataDescontoTitulo( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataDescontoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.dataDescontoTitulo: TDateTime;
begin
   Result := FdataDescontoTitulo;
end;

function TCobRetBoletoDetalhado.dataEmissaoTituloCobranca( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataEmissaoTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.dataEmissaoTituloCobranca: TDateTime;
begin
   Result := FdataEmissaoTituloCobranca;
end;

function TCobRetBoletoDetalhado.dataLimiteRecebimentoTitulo( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataLimiteRecebimentoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.dataLimiteRecebimentoTitulo: TDateTime;
begin
   Result := FdataLimiteRecebimentoTitulo;
end;

function TCobRetBoletoDetalhado.dataMultaTitulo( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataMultaTitulo := aValue;
end;

function TCobRetBoletoDetalhado.dataMultaTitulo: TDateTime;
begin
   Result := FdataMultaTitulo;
end;

function TCobRetBoletoDetalhado.dataProtestoTituloCobranca( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataProtestoTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.dataProtestoTituloCobranca: TDateTime;
begin
   Result := FdataProtestoTituloCobranca;
end;

function TCobRetBoletoDetalhado.dataRecebimentoTitulo: TDateTime;
begin
   Result := FdataRecebimentoTitulo;
end;

function TCobRetBoletoDetalhado.dataRecebimentoTitulo( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataRecebimentoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.dataRegistroTituloCobranca: TDateTime;
begin
   Result := FdataRegistroTituloCobranca;
end;

function TCobRetBoletoDetalhado.dataRegistroTituloCobranca( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataRegistroTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.dataSegundoDescontoTitulo: TDateTime;
begin
   Result := FdataSegundoDescontoTitulo;
end;

function TCobRetBoletoDetalhado.dataSegundoDescontoTitulo( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataSegundoDescontoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.dataTerceiroDescontoTitulo( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataTerceiroDescontoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.dataTerceiroDescontoTitulo: TDateTime;
begin
   Result := FdataTerceiroDescontoTitulo;
end;

function TCobRetBoletoDetalhado.dataVencimentoTituloCobranca( aValue: TDateTime): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FdataVencimentoTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.dataVencimentoTituloCobranca: TDateTime;
begin
   Result := FdataVencimentoTituloCobranca;
end;

destructor TCobRetBoletoDetalhado.Destroy;
begin

  inherited;
end;

function TCobRetBoletoDetalhado.FromJSON( aValue: String): ICobRetBoletoDetalhado;
var LBoleto:TJSONObject;
begin
   Result := Self;
   LBoleto := TJSONObject.ParseJSONValue( TEncoding.UTF8.GetBytes( aValue), 0) as TJSONObject;
   FromJSON( LBoleto);
end;

function TCobRetBoletoDetalhado.FromJSON( aValue: TJSONObject; aOwnerFree:Boolean = true): ICobRetBoletoDetalhado;
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

      aValue.TryGetValue<string>(  'codigoLinhaDigitavel', FcodigoLinhaDigitavel);
      aValue.TryGetValue<string>(  'textoEmailPagador', FtextoEmailPagador);
      aValue.TryGetValue<string>(  'textoMensagemBloquetoTitulo', FtextoMensagemBloquetoTitulo);
      aValue.TryGetValue<integer>( 'codigoTipoMulta', FcodigoTipoMulta);
      aValue.TryGetValue<integer>( 'codigoCanalPagamento', FcodigoCanalPagamento);
      aValue.TryGetValue<integer>( 'numeroContratoCobranca', FnumeroContratoCobranca);
      aValue.TryGetValue<integer>( 'codigoTipoInscricaoSacado', FcodigoTipoInscricaoSacado);
      aValue.TryGetValue<integer>( 'numeroInscricaoSacadoCobranca', FnumeroInscricaoSacadoCobranca);
      aValue.TryGetValue<integer>( 'codigoEstadoTituloCobranca', FcodigoEstadoTituloCobranca);
      aValue.TryGetValue<integer>( 'codigoTipoTituloCobranca', FcodigoTipoTituloCobranca);
      aValue.TryGetValue<integer>( 'codigoModalidadeTitulo', FcodigoModalidadeTitulo);
      aValue.TryGetValue<string>(  'codigoAceiteTituloCobranca', FcodigoAceiteTituloCobranca);
      aValue.TryGetValue<integer>( 'codigoPrefixoDependenciaCobrador', FcodigoPrefixoDependenciaCobrador);
      aValue.TryGetValue<integer>( 'codigoIndicadorEconomico', FcodigoIndicadorEconomico);
      aValue.TryGetValue<string>(  'numeroTituloCedenteCobranca', FnumeroTituloCedenteCobranca);
      aValue.TryGetValue<integer>( 'codigoTipoJuroMora', FcodigoTipoJuroMora);
      aValue.TryGetValue<String>(  'dataEmissaoTituloCobranca', LAux);
      FdataEmissaoTituloCobranca := ParseDate( LAux);
      aValue.TryGetValue<String>(  'dataRegistroTituloCobranca', LAux);
      FdataRegistroTituloCobranca := ParseDate( LAux);
      aValue.TryGetValue<String>(  'dataVencimentoTituloCobranca', LAux);
      FdataVencimentoTituloCobranca := ParseDate( LAux);
      aValue.TryGetValue<Double>(  'valorOriginalTituloCobranca', FvalorOriginalTituloCobranca);
      aValue.TryGetValue<Double>(  'valorAtualTituloCobranca', FvalorAtualTituloCobranca);
      aValue.TryGetValue<Double>(  'valorPagamentoParcialTitulo', FvalorPagamentoParcialTitulo);
      aValue.TryGetValue<Double>(  'valorAbatimentoTituloCobranca', FvalorAbatimentoTituloCobranca);
      aValue.TryGetValue<Double>(  'percentualImpostoSobreOprFinanceirasTituloCobranca', FpercentualImpostoSobreOprFinanceirasTituloCobranca);
      aValue.TryGetValue<Double>(  'valorImpostoSobreOprFinanceirasTituloCobranca', FvalorImpostoSobreOprFinanceirasTituloCobranca);
      aValue.TryGetValue<Double>(  'valorMoedaTituloCobranca', FvalorMoedaTituloCobranca);
      aValue.TryGetValue<Double>(  'percentualJuroMoraTitulo', FpercentualJuroMoraTitulo);
      aValue.TryGetValue<Double>(  'valorJuroMoraTitulo', FvalorJuroMoraTitulo);
      aValue.TryGetValue<Double>(  'percentualMultaTitulo', FpercentualMultaTitulo);
      aValue.TryGetValue<Double>(  'valorMultaTituloCobranca', FvalorMultaTituloCobranca);
      aValue.TryGetValue<integer>( 'quantidadeParcelaTituloCobranca', FquantidadeParcelaTituloCobranca);
      aValue.TryGetValue<String>(  'dataBaixaAutomaticoTitulo', LAux);
      FdataBaixaAutomaticoTitulo := ParseDate( LAux);
      aValue.TryGetValue<string>(  'textoCampoUtilizacaoCedente', FtextoCampoUtilizacaoCedente);
      aValue.TryGetValue<string>(  'indicadorCobrancaPartilhadoTitulo', FindicadorCobrancaPartilhadoTitulo);
      aValue.TryGetValue<string>(  'nomeSacadoCobranca', FnomeSacadoCobranca);
      aValue.TryGetValue<string>(  'textoEnderecoSacadoCobranca', FtextoEnderecoSacadoCobranca);
      aValue.TryGetValue<string>(  'nomeBairroSacadoCobranca', FnomeBairroSacadoCobranca);
      aValue.TryGetValue<string>(  'nomeMunicipioSacadoCobranca', FnomeMunicipioSacadoCobranca);
      aValue.TryGetValue<string>(  'siglaUnidadeFederacaoSacadoCobranca', FsiglaUnidadeFederacaoSacadoCobranca);
      aValue.TryGetValue<integer>( 'numeroCepSacadoCobranca', FnumeroCepSacadoCobranca);
      aValue.TryGetValue<Double>(  'valorMoedaAbatimentoTitulo', FvalorMoedaAbatimentoTitulo);
      aValue.TryGetValue<String>(  'dataProtestoTituloCobranca', LAux);
      FdataProtestoTituloCobranca := ParseDate( LAux);
      aValue.TryGetValue<integer>( 'codigoTipoInscricaoSacador', FcodigoTipoInscricaoSacador);
      aValue.TryGetValue<integer>( 'numeroInscricaoSacadorAvalista', FnumeroInscricaoSacadorAvalista);
      aValue.TryGetValue<string>(  'nomeSacadorAvalistaTitulo', FnomeSacadorAvalistaTitulo);
      aValue.TryGetValue<Double>(  'percentualDescontoTitulo ', FpercentualDescontoTitulo);
      aValue.TryGetValue<String>(  'dataDescontoTitulo', LAux);
      FdataDescontoTitulo := ParseDate( LAux);
      aValue.TryGetValue<Double>(  'valorDescontoTitulo', FvalorDescontoTitulo);
      aValue.TryGetValue<integer>( 'codigoDescontoTitulo', FcodigoDescontoTitulo);
      aValue.TryGetValue<Double>(  'percentualSegundoDescontoTitulo', FpercentualSegundoDescontoTitulo);
      aValue.TryGetValue<String>(  'dataSegundoDescontoTitulo', LAux);
      FdataSegundoDescontoTitulo := ParseDate( LAux);
      aValue.TryGetValue<Double>(  'valorSegundoDescontoTitulo', FvalorSegundoDescontoTitulo);
      aValue.TryGetValue<integer>( 'codigoSegundoDescontoTitulo', FcodigoSegundoDescontoTitulo);
      aValue.TryGetValue<Double>(  'percentualTerceiroDescontoTitulo', FpercentualTerceiroDescontoTitulo);
      aValue.TryGetValue<String>(  'dataTerceiroDescontoTitulo', LAux);
      FdataTerceiroDescontoTitulo := ParseDate( LAux);
      aValue.TryGetValue<Double>(  'valorTerceiroDescontoTitulo', FvalorTerceiroDescontoTitulo);
      aValue.TryGetValue<integer>( 'codigoTerceiroDescontoTitulo', FcodigoTerceiroDescontoTitulo);
      aValue.TryGetValue<String>(  'dataMultaTitulo', LAux);
      FdataMultaTitulo := ParseDate( LAux);
      aValue.TryGetValue<integer>( 'numeroCarteiraCobranca', FnumeroCarteiraCobranca);
      aValue.TryGetValue<integer>( 'numeroVariacaoCarteiraCobranca', FnumeroVariacaoCarteiraCobranca);
      aValue.TryGetValue<integer>( 'quantidadeDiaProtesto', FquantidadeDiaProtesto);
      aValue.TryGetValue<integer>( 'quantidadeDiaPrazoLimiteRecebimento', FquantidadeDiaPrazoLimiteRecebimento);
      aValue.TryGetValue<String>(  'dataLimiteRecebimentoTitulo', LAux);
      FdataLimiteRecebimentoTitulo := ParseDate( LAux);
      aValue.TryGetValue<string>(  'indicadorPermissaoRecebimentoParcial', FindicadorPermissaoRecebimentoParcial);
      aValue.TryGetValue<string>(  'textoCodigoBarrasTituloCobranca', FtextoCodigoBarrasTituloCobranca);
      aValue.TryGetValue<integer>( 'codigoOcorrenciaCartorio', FcodigoOcorrenciaCartorio);
      aValue.TryGetValue<Double>(  'valorImpostoSobreOprFinanceirasRecebidoTitulo', FvalorImpostoSobreOprFinanceirasRecebidoTitulo);
      aValue.TryGetValue<Double>(  'valorAbatimentoTotal', FvalorAbatimentoTotal);
      aValue.TryGetValue<Double>(  'valorJuroMoraRecebido', FvalorJuroMoraRecebido);
      aValue.TryGetValue<Double>(  'valorDescontoUtilizado', FvalorDescontoUtilizado);
      aValue.TryGetValue<Double>(  'valorPagoSacado', FvalorPagoSacado);
      aValue.TryGetValue<Double>(  'valorCreditoCedente', FvalorCreditoCedente);
      aValue.TryGetValue<integer>( 'codigoTipoLiquidacao', FcodigoTipoLiquidacao);
      aValue.TryGetValue<String>(  'dataCreditoLiquidacao', LAux);
      FdataCreditoLiquidacao := ParseDate( LAux);
      aValue.TryGetValue<String>(  'dataRecebimentoTitulo', LAux);
      FdataRecebimentoTitulo := ParseDate( LAux);
      aValue.TryGetValue<integer>( 'codigoPrefixoDependenciaRecebedor', FcodigoPrefixoDependenciaRecebedor);
      aValue.TryGetValue<integer>( 'codigoNaturezaRecebimento', FcodigoNaturezaRecebimento);
      aValue.TryGetValue<string>(  'numeroIdentidadeSacadoTituloCobranca', FnumeroIdentidadeSacadoTituloCobranca);
      aValue.TryGetValue<string>(  'codigoResponsavelAtualizacao', FcodigoResponsavelAtualizacao);
      aValue.TryGetValue<integer>( 'codigoTipoBaixaTitulo', FcodigoTipoBaixaTitulo);
      aValue.TryGetValue<Double>(  'valorMultaRecebido', FvalorMultaRecebido);
      aValue.TryGetValue<Double>(  'valorReajuste', FvalorReajuste);
      aValue.TryGetValue<Double>(  'valorOutroRecebido', FvalorOutroRecebido);
      aValue.TryGetValue<integer>( 'codigoIndicadorEconomicoUtilizadoInadimplencia', FcodigoIndicadorEconomicoUtilizadoInadimplencia);
   finally
      if not aOwnerFree then
         FreeAndNil( aValue);
   end;
end;

function TCobRetBoletoDetalhado.indicadorCobrancaPartilhadoTitulo: string;
begin
   Result := FindicadorCobrancaPartilhadoTitulo;
end;

function TCobRetBoletoDetalhado.indicadorCobrancaPartilhadoTitulo( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FindicadorCobrancaPartilhadoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.indicadorPermissaoRecebimentoParcial: string;
begin
   Result := FindicadorPermissaoRecebimentoParcial;
end;

function TCobRetBoletoDetalhado.indicadorPermissaoRecebimentoParcial( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FindicadorPermissaoRecebimentoParcial := aValue;
end;

class function TCobRetBoletoDetalhado.New: ICobRetBoletoDetalhado;
begin
   Result := Self.Create;
end;

function TCobRetBoletoDetalhado.nomeBairroSacadoCobranca: string;
begin
   Result := FnomeBairroSacadoCobranca;
end;

function TCobRetBoletoDetalhado.nomeBairroSacadoCobranca( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnomeBairroSacadoCobranca := aValue;
end;

function TCobRetBoletoDetalhado.nomeMunicipioSacadoCobranca( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnomeMunicipioSacadoCobranca := aValue;
end;

function TCobRetBoletoDetalhado.nomeMunicipioSacadoCobranca: string;
begin
   Result := FnomeMunicipioSacadoCobranca;
end;

function TCobRetBoletoDetalhado.nomeSacadoCobranca: string;
begin
   Result := FnomeSacadoCobranca;
end;

function TCobRetBoletoDetalhado.nomeSacadoCobranca( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnomeSacadoCobranca := aValue;
end;

function TCobRetBoletoDetalhado.nomeSacadorAvalistaTitulo( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnomeSacadorAvalistaTitulo := aValue;
end;

function TCobRetBoletoDetalhado.nomeSacadorAvalistaTitulo: string;
begin
   Result := FnomeSacadorAvalistaTitulo;
end;

function TCobRetBoletoDetalhado.numeroCarteiraCobranca( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnumeroCarteiraCobranca := aValue;
end;

function TCobRetBoletoDetalhado.numeroCarteiraCobranca: integer;
begin
   Result := FnumeroCarteiraCobranca;
end;

function TCobRetBoletoDetalhado.numeroCepSacadoCobranca( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnumeroCepSacadoCobranca := aValue;
end;

function TCobRetBoletoDetalhado.numeroCepSacadoCobranca: integer;
begin
   Result := FnumeroCepSacadoCobranca;
end;

function TCobRetBoletoDetalhado.numeroContratoCobranca: integer;
begin
   Result := FnumeroContratoCobranca;
end;

function TCobRetBoletoDetalhado.numeroContratoCobranca( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnumeroContratoCobranca := aValue;
end;

function TCobRetBoletoDetalhado.numeroIdentidadeSacadoTituloCobranca: string;
begin
   Result := FnumeroIdentidadeSacadoTituloCobranca;
end;

function TCobRetBoletoDetalhado.numeroIdentidadeSacadoTituloCobranca( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnumeroIdentidadeSacadoTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.numeroInscricaoSacadoCobranca: integer;
begin
   Result := FnumeroInscricaoSacadoCobranca;
end;

function TCobRetBoletoDetalhado.numeroInscricaoSacadoCobranca( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnumeroInscricaoSacadoCobranca := aValue;
end;

function TCobRetBoletoDetalhado.numeroInscricaoSacadorAvalista: integer;
begin
   Result := FnumeroInscricaoSacadorAvalista;
end;

function TCobRetBoletoDetalhado.numeroInscricaoSacadorAvalista( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnumeroInscricaoSacadorAvalista := aValue;
end;

function TCobRetBoletoDetalhado.numeroTituloCedenteCobranca: string;
begin
   Result := FnumeroTituloCedenteCobranca;
end;

function TCobRetBoletoDetalhado.numeroTituloCedenteCobranca( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnumeroTituloCedenteCobranca := aValue;
end;

function TCobRetBoletoDetalhado.numeroVariacaoCarteiraCobranca( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FnumeroVariacaoCarteiraCobranca := aValue;
end;

function TCobRetBoletoDetalhado.numeroVariacaoCarteiraCobranca: integer;
begin
   Result := FnumeroVariacaoCarteiraCobranca;
end;

function TCobRetBoletoDetalhado.percentualDescontoTitulo: Double;
begin
   Result := FpercentualDescontoTitulo;
end;

function TCobRetBoletoDetalhado.percentualDescontoTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FpercentualDescontoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.percentualImpostoSobreOprFinanceirasTituloCobranca( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FpercentualImpostoSobreOprFinanceirasTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.percentualImpostoSobreOprFinanceirasTituloCobranca: Double;
begin
   Result := FpercentualImpostoSobreOprFinanceirasTituloCobranca;
end;

function TCobRetBoletoDetalhado.percentualJuroMoraTitulo: Double;
begin
   Result := FpercentualJuroMoraTitulo;
end;

function TCobRetBoletoDetalhado.percentualJuroMoraTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FpercentualJuroMoraTitulo := aValue;
end;

function TCobRetBoletoDetalhado.percentualMultaTitulo: Double;
begin
   Result := FpercentualMultaTitulo;
end;

function TCobRetBoletoDetalhado.percentualMultaTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FpercentualMultaTitulo := aValue;
end;

function TCobRetBoletoDetalhado.percentualSegundoDescontoTitulo: Double;
begin
   Result := FpercentualSegundoDescontoTitulo;
end;

function TCobRetBoletoDetalhado.percentualSegundoDescontoTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FpercentualSegundoDescontoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.percentualTerceiroDescontoTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FpercentualTerceiroDescontoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.percentualTerceiroDescontoTitulo: Double;
begin
   Result := FpercentualTerceiroDescontoTitulo;
end;

function TCobRetBoletoDetalhado.quantidadeDiaPrazoLimiteRecebimento: integer;
begin
   Result := FquantidadeDiaPrazoLimiteRecebimento;
end;

function TCobRetBoletoDetalhado.quantidadeDiaPrazoLimiteRecebimento( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FquantidadeDiaPrazoLimiteRecebimento := aValue;
end;

function TCobRetBoletoDetalhado.quantidadeDiaProtesto: integer;
begin
   Result := FquantidadeDiaProtesto;
end;

function TCobRetBoletoDetalhado.quantidadeDiaProtesto( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FquantidadeDiaProtesto := aValue;
end;

function TCobRetBoletoDetalhado.quantidadeParcelaTituloCobranca: integer;
begin
   Result := FquantidadeParcelaTituloCobranca;
end;

function TCobRetBoletoDetalhado.quantidadeParcelaTituloCobranca( aValue: integer): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FquantidadeParcelaTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.siglaUnidadeFederacaoSacadoCobranca( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FsiglaUnidadeFederacaoSacadoCobranca := aValue;
end;

function TCobRetBoletoDetalhado.siglaUnidadeFederacaoSacadoCobranca: string;
begin
   Result := FsiglaUnidadeFederacaoSacadoCobranca;
end;

function TCobRetBoletoDetalhado.textoCampoUtilizacaoCedente( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FtextoCampoUtilizacaoCedente := aValue;
end;

function TCobRetBoletoDetalhado.textoCampoUtilizacaoCedente: string;
begin
   Result := FtextoCampoUtilizacaoCedente;
end;

function TCobRetBoletoDetalhado.textoCodigoBarrasTituloCobranca: string;
begin
   Result := FtextoCodigoBarrasTituloCobranca;
end;

function TCobRetBoletoDetalhado.textoCodigoBarrasTituloCobranca( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FtextoCodigoBarrasTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.textoEmailPagador( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FtextoEmailPagador := aValue;
end;

function TCobRetBoletoDetalhado.textoEmailPagador: string;
begin
   Result := FtextoEmailPagador;
end;

function TCobRetBoletoDetalhado.textoEnderecoSacadoCobranca( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FtextoEnderecoSacadoCobranca := aValue;
end;

function TCobRetBoletoDetalhado.textoEnderecoSacadoCobranca: string;
begin
   Result := FtextoEnderecoSacadoCobranca;
end;

function TCobRetBoletoDetalhado.textoMensagemBloquetoTitulo( aValue: string): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FtextoMensagemBloquetoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.textoMensagemBloquetoTitulo: string;
begin
   Result := FtextoMensagemBloquetoTitulo;
end;

function TCobRetBoletoDetalhado.valorAbatimentoTituloCobranca( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorAbatimentoTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.valorAbatimentoTituloCobranca: Double;
begin
   Result := FvalorAbatimentoTituloCobranca;
end;

function TCobRetBoletoDetalhado.valorAbatimentoTotal( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorAbatimentoTotal := aValue;
end;

function TCobRetBoletoDetalhado.valorAbatimentoTotal: Double;
begin
   Result := FvalorAbatimentoTotal;
end;

function TCobRetBoletoDetalhado.valorAtualTituloCobranca: Double;
begin
   Result := FvalorAtualTituloCobranca;
end;

function TCobRetBoletoDetalhado.valorAtualTituloCobranca( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorAtualTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.valorCreditoCedente: Double;
begin
   Result := FvalorCreditoCedente;
end;

function TCobRetBoletoDetalhado.valorCreditoCedente( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorCreditoCedente := aValue;
end;

function TCobRetBoletoDetalhado.valorDescontoTitulo: Double;
begin
   Result := FvalorDescontoTitulo;
end;

function TCobRetBoletoDetalhado.valorDescontoTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorDescontoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.valorDescontoUtilizado: Double;
begin
   Result := FvalorDescontoUtilizado;
end;

function TCobRetBoletoDetalhado.valorDescontoUtilizado( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorDescontoUtilizado := aValue;
end;

function TCobRetBoletoDetalhado.valorImpostoSobreOprFinanceirasRecebidoTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorImpostoSobreOprFinanceirasRecebidoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.valorImpostoSobreOprFinanceirasRecebidoTitulo: Double;
begin
   Result := FvalorImpostoSobreOprFinanceirasRecebidoTitulo;
end;

function TCobRetBoletoDetalhado.valorImpostoSobreOprFinanceirasTituloCobranca( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorImpostoSobreOprFinanceirasTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.valorImpostoSobreOprFinanceirasTituloCobranca: Double;
begin
   Result := FvalorImpostoSobreOprFinanceirasTituloCobranca;
end;

function TCobRetBoletoDetalhado.valorJuroMoraRecebido( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorJuroMoraRecebido := aValue;
end;

function TCobRetBoletoDetalhado.valorJuroMoraRecebido: Double;
begin
   Result := FvalorJuroMoraRecebido;
end;

function TCobRetBoletoDetalhado.valorJuroMoraTitulo: Double;
begin
   Result := FvalorJuroMoraTitulo;
end;

function TCobRetBoletoDetalhado.valorJuroMoraTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorJuroMoraTitulo := aValue;
end;

function TCobRetBoletoDetalhado.valorMoedaAbatimentoTitulo: Double;
begin
   Result := FvalorMoedaAbatimentoTitulo;
end;

function TCobRetBoletoDetalhado.valorMoedaAbatimentoTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorMoedaAbatimentoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.valorMoedaTituloCobranca( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorMoedaTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.valorMoedaTituloCobranca: Double;
begin
   Result := FvalorMoedaTituloCobranca;
end;

function TCobRetBoletoDetalhado.valorMultaRecebido( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorMultaRecebido := aValue;
end;

function TCobRetBoletoDetalhado.valorMultaRecebido: Double;
begin
   Result := FvalorMultaRecebido;
end;

function TCobRetBoletoDetalhado.valorMultaTituloCobranca: Double;
begin
   Result := FvalorMultaTituloCobranca;
end;

function TCobRetBoletoDetalhado.valorMultaTituloCobranca( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorMultaTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.valorOriginalTituloCobranca: Double;
begin
   Result := FvalorOriginalTituloCobranca;
end;

function TCobRetBoletoDetalhado.valorOriginalTituloCobranca( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorOriginalTituloCobranca := aValue;
end;

function TCobRetBoletoDetalhado.valorOutroRecebido: Double;
begin
   Result := FvalorOutroRecebido;
end;

function TCobRetBoletoDetalhado.valorOutroRecebido( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorOutroRecebido := aValue;
end;

function TCobRetBoletoDetalhado.valorPagamentoParcialTitulo: Double;
begin
   Result := FvalorPagamentoParcialTitulo;
end;

function TCobRetBoletoDetalhado.valorPagamentoParcialTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorPagamentoParcialTitulo := aValue;
end;

function TCobRetBoletoDetalhado.valorPagoSacado( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorPagoSacado := aValue;
end;

function TCobRetBoletoDetalhado.valorPagoSacado: Double;
begin
   Result := FvalorPagoSacado;
end;

function TCobRetBoletoDetalhado.valorReajuste( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorReajuste := aValue;
end;

function TCobRetBoletoDetalhado.valorReajuste: Double;
begin
   Result := FvalorReajuste;
end;

function TCobRetBoletoDetalhado.valorSegundoDescontoTitulo: Double;
begin
   Result := FvalorSegundoDescontoTitulo;
end;

function TCobRetBoletoDetalhado.valorSegundoDescontoTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorSegundoDescontoTitulo := aValue;
end;

function TCobRetBoletoDetalhado.valorTerceiroDescontoTitulo: Double;
begin
   Result := FvalorTerceiroDescontoTitulo;
end;

function TCobRetBoletoDetalhado.valorTerceiroDescontoTitulo( aValue: Double): ICobRetBoletoDetalhado;
begin
   Result := Self;
   FvalorTerceiroDescontoTitulo := aValue;
end;

{ TDetalharBoleto }

procedure TDetalharBoleto.Buscar;
begin
   case FAuth.Environment of
      aeHomologation:FRequest.BaseURL( 'https://api.hm.bb.com.br/cobrancas/v2');
      aeProduction  :FRequest.BaseURL( 'https://api.bb.com.br/cobrancas/v2');
   end;

   FRequest.Resource( '/boletos/'+ FnumeroBoleto);
   FResponse := FRequest.Get;

   if ( FResponse.StatusCode <> 200) and ( FResponse.StatusCode <> 400) then
      raise Exception.Create('Erro ao executar busca do boleto.');
end;

constructor TDetalharBoleto.Create(aAuth: ICustomAuth);
begin
   FAuth := aAuth;
   FRequest := TRequest.New;
end;

procedure TDetalharBoleto.Desserializar;
begin
   if FResponse.StatusCode = 200 then
   begin
     if not Assigned( FBoleto) then
        FBoleto := TCobRetBoletoDetalhado.New;

     FBoleto.FromJSON( FResponse.Content);
   end;
end;

destructor TDetalharBoleto.Destroy;
begin

end;

function TDetalharBoleto.Executar: IDetalharBoleto;
begin
   Result := Self;

   Validar;
   Preparar;
   Buscar;
   Desserializar;
end;

class function TDetalharBoleto.New(aAuth: ICustomAuth): IDetalharBoleto;
begin
   Result := Self.Create( aAuth);
end;

function TDetalharBoleto.numeroBoleto(aValue: String): IDetalharBoleto;
begin
   Result := Self;
   FnumeroBoleto := aValue;
end;

function TDetalharBoleto.numeroConvenio(aValue: String): IDetalharBoleto;
begin
   Result := Self;
   FnumeroConvenio := aValue;
end;

procedure TDetalharBoleto.Preparar;
begin
   if FAuth.AccessToken.IsEmpty then
      FAuth.Execute;

   FRequest
      .ContentType( 'application/json')
      .TokenBearer( FAuth.AccessToken)
      .AddParam( 'gw-dev-app-key',      FAuth.AppKey,         pkQUERY, [poDoNotEncode])
      .AddParam( 'numeroConvenio',      FnumeroConvenio,      pkQUERY, [poDoNotEncode]);

end;

function TDetalharBoleto.Retorno: ICobRetBoletoDetalhado;
begin
   if not Assigned( FBoleto) then
     FBoleto := TCobRetBoletoDetalhado.New;

   Result := FBoleto;
end;

procedure TDetalharBoleto.Validar;
begin
   if FAuth.AppKey.Trim.IsEmpty then
      raise Exception.Create( 'O código da aplicação deve ser informado');

   if FnumeroConvenio.Trim.IsEmpty then
      raise Exception.Create( 'O número do convênio de emissão do boleto pesquisado deve ser informado.');

   if FnumeroBoleto.Trim.IsEmpty then
      raise Exception.Create( 'O número do boleto pesquisado deve ser informado.');
end;

end.
