unit BancoBrasil.Types;

interface

type
   TPixTipoPessoa = ( tpFisica, tpJuridica);
   TCobTipoDesconto = ( ctdSemDesconto, ctdVlrFixoAteDataInformada,
                        ctdPercentualAteDataInformada, ctdDescontoPorDiaAntecipacao);
   TCobTipoJuros = ( ctjDispensar, ctjValorDiaAtraso, ctjTaxaMensal, ctjIsento);
   TCobTipoMulta = ( ctmDispensar, ctmValorDiaAtraso, ctmTaxaMensal, ctmIsento);
   TCobTipoInscricao = ( ctiCPF, ctiCNPJ);
   TCobCodigoModalidade = ( ccmSimples, ccmVinculada);
   TCobNegativador = ( cnSerasa);
   TCobCodigoAceite = ( ccaAceite, ccaNaoAceite);
   TCobTipoTitulo = ( cttCheque, cttDuplicataMercantil, cttDuplicataMtilPorIndicacao, cttDuplicataServico,
                      cttDuplicataSrvcPorIndicacao, cttDuplicataRural, cttLetraCambio, cttNotaCreditoComercial,
                      cttNotaCreditoAExportacao, cttNotaCreditoIndultrial, cttNotaCreditoRural, cttNotaPromissoria,
                      cttNotaPromissoriaRural, cttTriplicataMercantil, cttTriplicataServico, cttNotaSeguro,
                      cttRecibo, cttFatura, cttNotaDeDebito, cttApliceDeSeguro, cttMensalidadeEscolar, cttParcelaConsorcio,
                      cttDividaAtivaDaUniao, cttDividaAtivaDeEstado, cttDividaAtivaDeMunicipio, cttCartaoDeCredito,
                      cttBoletoProposta, cttBoletoAporte, cttOutros);
   TCobTipoNegativacao = ( ctnIncluir, ctnAlterarPrazo, ctnCancelar, ctnExcluir);
   TCobIndicadorPix = ( cipQRCodeDinamico, cipSemPIX, cipOutro);

implementation

end.
