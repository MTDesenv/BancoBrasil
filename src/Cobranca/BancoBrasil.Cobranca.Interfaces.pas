unit BancoBrasil.Cobranca.Interfaces;

interface

uses System.SysUtils,
     System.JSON,

     Infra.Auth.Interfaces,
     BancoBrasil.Types;

type
   ICobRegBoleto = interface;
   ICobRegDesconto = interface
      ['{CDB442CB-47F3-4604-8843-403721043CBA}']
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

   ICobRegJuros = interface
      ['{247542A7-66EE-44EC-B1C2-F621D56962C4}']
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

   ICobRegMulta = interface
      ['{344FFA82-8AEA-4C26-9A8D-BC5B85A4676C}']
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

   ICobRegPagador = interface
      ['{AFF77328-3719-4403-AC09-38B7A374A153}']
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

   ICobRegBeneficiarioFinal = interface
      ['{4D83B52C-2BA2-4C01-A2CA-FCF47440E764}']
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

   ICobRegBoleto = interface
      ['{085A29CB-C529-41C2-83A4-1C204AF6214C}']
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

   ICobRetBoletoBusca = interface
      ['{42250FAA-C309-40E5-AA05-D80B7356A9F8}']
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

   ICobRetBoletoBuscaLst = interface
      ['{D86214E1-3EBA-4E88-99CB-1F0EDD9BCBE0}']
      function Continua:Boolean;
      function Total:Integer;
      function ProximoID:Integer;
      function Count:Integer;
      function Itens( aIndex:Integer):ICobRetBoletoBusca;

      function FromJSON( aValue:String):ICobRetBoletoBuscaLst;overload;
      function FromJSON( aValue:TJSONObject):ICobRetBoletoBuscaLst;overload;
   end;

   ICobRetBusca = interface
      ['{42250FAA-C309-40E5-AA05-D80B7356A9F8}']
      function indicadorContinuidade( aValue:string):ICobRetBusca;overload;
      function quantidadeRegistros( aValue:integer):ICobRetBusca;overload;
      function proximoIndice( aValue:integer):ICobRetBusca;overload;

      function indicadorContinuidade:string;overload;
      function quantidadeRegistros:integer;overload;
      function proximoIndice:integer;overload;
      function boletos:ICobRetBoletoBuscaLst;

      function FromJSON( aValue:String):ICobRetBusca;overload;
      function FromJSON( aValue:TJSONObject):ICobRetBusca;overload;
   end;

   ICobRetInfo = interface
      ['{7D752347-A2AF-4CD9-96F5-E3A9C4E1C3E8}']
      function codigoMensagem( aValue:string):ICobRetInfo;overload;
      function versaoMensagem( aValue:string):ICobRetInfo;overload;
      function textoMensagem( aValue:string):ICobRetInfo;overload;
      function codigoRetorno( aValue:string):ICobRetInfo;overload;

      function codigoMensagem:string;overload;
      function versaoMensagem:string;overload;
      function textoMensagem:string;overload;
      function codigoRetorno:string;overload;

      function FromJSON( aValue:String):ICobRetInfo;overload;
      function FromJSON( aValue:TJSONObject):ICobRetInfo;overload;
   end;

   ICobRetInfoLst = interface
      ['{57503DE9-C178-488E-92CB-87F47F8D748B}']
      function Count:Integer;
      function Itens( aIndex:Integer):ICobRetInfo;

      function FromJSON( aValue:String):ICobRetInfoLst;overload;
      function FromJSON( aValue:TJSONArray):ICobRetInfoLst;overload;
   end;

   ICobRetErro = interface
      ['{2D8BEAA6-EC9D-4FCD-A9F7-C84BD80D715C}']
      function statusCode( aValue:integer):ICobRetErro;overload;
      function error( aValue:string):ICobRetErro;overload;
      function message( aValue:string):ICobRetErro;overload;
      function attributes( aValue:string):ICobRetErro;overload;

      function statusCode:integer;overload;
      function error:string;overload;
      function message:string;overload;
      function attributes:string;overload;

      function FromJSON( aValue:String):ICobRetErro;overload;
      function FromJSON( aValue:TJSONObject):ICobRetErro;overload;
   end;

   ICobRetQRCode = interface
      ['{AF3204C0-EFD0-4CCA-B087-71419239EEA6}']
      function url( aValue:string):ICobRetQRCode;overload;
      function txId( aValue:string):ICobRetQRCode;overload;
      function emv( aValue:string):ICobRetQRCode;overload;

      function url:string;overload;
      function txId:string;overload;
      function emv:string;overload;

      function FromJSON( aValue:String):ICobRetQRCode;overload;
      function FromJSON( aValue:TJSONObject):ICobRetQRCode;overload;
   end;

   ICobRetBeneficiario = interface
      ['{31604270-2CFD-4099-B8B9-08CFA0EA885A}']
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

   ICobRetRegistro = interface
      ['{47C6CB82-879D-4F1D-91EE-B6322E686817}']
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

   ICobRetRegistroLst = interface
      ['{81FFBFD3-F390-4090-94CA-2D27A7D8E9CC}']
      function Add( aValue:ICobRetRegistro):ICobRetRegistroLst;
      function Delete( aIndex:Integer):ICobRetRegistroLst;
      function Clear:ICobRetRegistroLst;
      function Items( aIndex:Integer):ICobRetRegistro;
      function Count:Integer;

   end;

   ICobRetBoletoDetalhado = interface
      ['{8FEF4B67-91D5-48AE-9F76-FF8060C7BA6C}']
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

   ICobRetAlteraCobranca = interface
      ['{DBC1E5E4-187F-40AE-A376-E9C1EAA81CB7}']
      function numeroContratoCobranca( aValue:integer):ICobRetAlteraCobranca;overload;
      function dataAtualizacao( aValue:TDate):ICobRetAlteraCobranca;overload;
      function horarioAtualizacao( aValue:TTime):ICobRetAlteraCobranca;overload;

      function numeroContratoCobranca:integer;overload;
      function dataAtualizacao:TDate;overload;
      function horarioAtualizacao:TTime;overload;

      function FromJSON( aValue:String):ICobRetAlteraCobranca;overload;
      function FromJSON( aValue:TJSONObject):ICobRetAlteraCobranca;overload;
   end;

   ICobRetBaixaCobranca = interface
      ['{DBC1E5E4-187F-40AE-A376-E9C1EAA81CB7}']
      function numeroContratoCobranca( aValue:integer):ICobRetBaixaCobranca;overload;
      function dataBaixa( aValue:TDate):ICobRetBaixaCobranca;overload;
      function horarioBaixa( aValue:TTime):ICobRetBaixaCobranca;overload;

      function numeroContratoCobranca:integer;overload;
      function dataBaixa:TDate;overload;
      function horarioBaixa:TTime;overload;

      function FromJSON( aValue:String):ICobRetBaixaCobranca;overload;
      function FromJSON( aValue:TJSONObject):ICobRetBaixaCobranca;overload;
   end;

   {********************************************************************************}
   IRegistrarBoletos = interface
      ['{60CE0EF4-B19A-484F-AEA6-51D4AF527735}']
      function Limpar:IRegistrarBoletos;
      function Adicionar( aValue:ICobRegBoleto):IRegistrarBoletos;
      function NovoBoleto:ICobRegBoleto;
      function Registrar:IRegistrarBoletos;
   end;

   IRegistraBoleto = interface
     ['{1443B233-4E56-482B-AB95-348813CDE07F}']
     function Registrar( aBoleto:ICobRegBoleto):IRegistraBoleto;
     function Retorno:ICobRetRegistro;
   end;

   IListarBoleto = interface
      ['{69096E23-2462-464F-8391-624FA867AFF6}']
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

   IDetalharBoleto = interface
     ['{2BC9F8D7-9B50-42C9-BD89-0D8E4C383D43}']
     function numeroConvenio( aValue:String):IDetalharBoleto;
     function numeroBoleto( aValue:String):IDetalharBoleto;

     function Executar:IDetalharBoleto;
     function Retorno:ICobRetBoletoDetalhado;
   end;

   IBaixarBoleto = interface
     ['{230A8032-5150-4909-BECC-3F1E937F9EBB}']
     function numeroConvenio( aValue:String):IBaixarBoleto;
     function numeroBoleto( aValue:String):IBaixarBoleto;

     function Executar:IBaixarBoleto;
   end;

   IAlterarBoleto = interface;
   IBoletoAtribuirDesconto = interface
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

    IBoletoAlterarDesconto = interface
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

    IBoletoAlterarDataDesconto = interface
       function AlterarDataDesconto:IBoletoAlterarDataDesconto;
       function DataLimitePrimeiroDesconto( aValue:TDateTime):IBoletoAlterarDataDesconto;
       function DataLimiteSegundoDesconto( aValue:TDateTime):IBoletoAlterarDataDesconto;
       function DataLimiteTerceiroDesconto( aValue:TDateTime):IBoletoAlterarDataDesconto;

       function ToJSON( aValue:TJSONObject):IBoletoAlterarDataDesconto;
       function &end:IAlterarBoleto;
    end;

    IBoletoCobrarJuros = interface
       function CobrarJuros:IBoletoCobrarJuros;
       function tipoJuros( aValue:TCobTipoJuros):IBoletoCobrarJuros;
       function valorJuros( aValue:Double):IBoletoCobrarJuros;
       function taxaJuros( aValue:Double):IBoletoCobrarJuros;

       function ToJSON( aValue:TJSONObject):IBoletoCobrarJuros;
       function &end:IAlterarBoleto;
    end;

    IBoletoCobrarMulta = interface
       function CobrarMulta:IBoletoCobrarMulta;
       function tipoMulta( aValue:TCobTipoMulta):IBoletoCobrarMulta;
       function valorMulta( aValue:Double):IBoletoCobrarMulta;
       function dataInicioMulta( aValue:TDateTime):IBoletoCobrarMulta;
       function taxaMulta( aValue:Double):IBoletoCobrarMulta;

       function ToJSON( aValue:TJSONObject):IBoletoCobrarMulta;
       function &end:IAlterarBoleto;
    end;

    IBoletoNegativar = interface
       function Negativar:IBoletoNegativar;
       function quantidadeDiasNegativacao( aValue:Integer):IBoletoNegativar;
       function tipoNegativacao( aValue:TCobTipoNegativacao):IBoletoNegativar;

       function ToJSON( aValue:TJSONObject):IBoletoNegativar;
       function &end:IAlterarBoleto;
    end;

    IBoletoAlterarEnderecoPagador = interface
       function AlterarEnderecoPagador:IBoletoAlterarEnderecoPagador;
       function enderecoPagador( aValue:String):IBoletoAlterarEnderecoPagador;
       function bairroPagador( aValue:String):IBoletoAlterarEnderecoPagador;
       function cidadePagador( aValue:String):IBoletoAlterarEnderecoPagador;
       function UFPagador( aValue:String):IBoletoAlterarEnderecoPagador;
       function CEPPagador( aValue:Integer):IBoletoAlterarEnderecoPagador;

       function ToJSON( aValue:TJSONObject):IBoletoAlterarEnderecoPagador;
       function &end:IAlterarBoleto;
    end;

   IAlterarBoleto = interface
      ['{291FFEEA-283F-41A0-BF10-5F837BDB77FD}']
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

   ICobrancaServices = interface
      ['{F7C28D72-D250-40B4-A326-1FEA51FED091}']
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

end.


{
  "numeroConvenio": 0,
  "numeroCarteira": 0,
  "numeroVariacaoCarteira": 0,
  "codigoModalidade": 0,
  "dataEmissao": "string",
  "dataVencimento": "string",
  "valorOriginal": 0,
  "valorAbatimento": 0,
  "quantidadeDiasProtesto": 0,
  "quantidadeDiasNegativacao": 0,
  "orgaoNegativador": 0,
  "indicadorAceiteTituloVencido": "string",
  "numeroDiasLimiteRecebimento": 0,
  "codigoAceite": "string",
  "codigoTipoTitulo": 0,
  "descricaoTipoTitulo": "string",
  "indicadorPermissaoRecebimentoParcial": "string",
  "numeroTituloBeneficiario": "string",
  "campoUtilizacaoBeneficiario": "string",
  "numeroTituloCliente": "string",
  "mensagemBloquetoOcorrencia": "string",
  "desconto": {
    "tipo": 0,
    "dataExpiracao": "string",
    "porcentagem": 0,
    "valor": 0
  },
  "segundoDesconto": {
    "dataExpiracao": "string",
    "porcentagem": 0,
    "valor": 0
  },
  "terceiroDesconto": {
    "dataExpiracao": "string",
    "porcentagem": 0,
    "valor": 0
  },
  "jurosMora": {
    "tipo": 0,
    "porcentagem": 0,
    "valor": 0
  },
  "multa": {
    "tipo": 0,
    "data": "string",
    "porcentagem": 0,
    "valor": 0
  },
  "pagador": {
    "tipoInscricao": 0,
    "numeroInscricao": 0,
    "nome": "string",
    "endereco": "string",
    "cep": 0,
    "cidade": "string",
    "bairro": "string",
    "uf": "string",
    "telefone": "string"
  },
  "beneficiarioFinal": {
    "tipoInscricao": 0,
    "numeroInscricao": 0,
    "nome": "string"
  },
  "indicadorPix": "string"
}


{
  "numeroConvenio": 0,

  "indicadorNovaDataVencimento": "string",
  "alteracaoData": {
    "novaDataVencimento": "string"
  },

  "indicadorAtribuirDesconto": "string",
  "desconto": {
    "tipoPrimeiroDesconto": 0,
    "valorPrimeiroDesconto": 0,
    "percentualPrimeiroDesconto": 0,
    "dataPrimeiroDesconto": "string",
    "tipoSegundoDesconto": 0,
    "valorSegundoDesconto": 0,
    "percentualSegundoDesconto": 0,
    "dataSegundoDesconto": "string",
    "tipoTerceiroDesconto": 0,
    "valorTerceiroDesconto": 0,
    "percentualTerceiroDesconto": 0,
    "dataTerceiroDesconto": "string"
  },

  "indicadorAlterarDesconto": "string",
  "alteracaoDesconto": {
    "tipoPrimeiroDesconto": 0,
    "novoValorPrimeiroDesconto": 0,
    "novoPercentualPrimeiroDesconto": 0,
    "novaDataLimitePrimeiroDesconto": "string",
    "tipoSegundoDesconto": 0,
    "novoValorSegundoDesconto": 0,
    "novoPercentualSegundoDesconto": 0,
    "novaDataLimiteSegundoDesconto": "string",
    "tipoTerceiroDesconto": 0,
    "novoValorTerceiroDesconto": 0,
    "novoPercentualTerceiroDesconto": 0,
    "novaDataLimiteTerceiroDesconto": "string"
  },

  "indicadorAlterarDataDesconto": "string",
  "alteracaoDataDesconto": {
    "novaDataLimitePrimeiroDesconto": "string",
    "novaDataLimiteSegundoDesconto": "string",
    "novaDataLimiteTerceiroDesconto": "string"
  },

  "indicadorProtestar": "string",
  "protesto": {
    "quantidadeDiasProtesto": 0
  },
  "indicadorSustacaoProtesto": "string",

  "indicadorCancelarProtesto": "string",

  "indicadorIncluirAbatimento": "string",
  "abatimento": {
    "valorAbatimento": 0
  },

  "indicadorAlterarAbatimento": "string",
  "alteracaoAbatimento": {
    "novoValorAbatimento": 0
  },

  "indicadorCobrarJuros": "string",
  "juros": {
    "tipoJuros": 0,
    "valorJuros": 0,
    "taxaJuros": 0
  },

  "indicadorDispensarJuros": "string",
  "indicadorCobrarMulta": "string",
  "multa": {
    "tipoMulta": 0,
    "valorMulta": 0,
    "dataInicioMulta": "string",
    "taxaMulta": 0
  },

  "indicadorDispensarMulta": "string",
  "indicadorNegativar": "string",
  "negativacao": {
    "quantidadeDiasNegativacao": 0,
    "tipoNegativacao": 0
  },

  "indicadorAlterarSeuNumero": "string",
  "alteracaoSeuNumero": {
    "codigoSeuNumero": "string"
  },

  "indicadorAlterarEnderecoPagador": "string",
  "alteracaoEndereco": {
    "enderecoPagador": "string",
    "bairroPagador": "string",
    "cidadePagador": "string",
    "UFPagador": "string",
    "CEPPagador": 0
  },

  "indicadorAlterarPrazoBoletoVencido": "string",
  "alteracaoPrazo": {
    "quantidadeDiasAceite": 0
  }
}
