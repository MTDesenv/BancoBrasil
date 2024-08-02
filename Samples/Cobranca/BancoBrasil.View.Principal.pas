unit BancoBrasil.View.Principal;

interface

uses
  System.SysUtils, System.Types,
  System.UITypes, System.Classes,
  System.Variants, System.StrUtils,

  FMX.Types, FMX.Controls,
  FMX.Forms, FMX.Graphics,
  FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Edit, FMX.TabControl,
  FMX.ListBox, FMX.DateTimeCtrls,
  FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.Objects,
  FMX.EditBox, FMX.NumberBox,
  FMX.ComboEdit,

  BancoBrasil.Interfaces;

type
  TForm5 = class(TForm)
    edtClientKey: TEdit;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Label2: TLabel;
    edtAccessToken: TEdit;
    Button1: TButton;
    TabControl2: TTabControl;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    TabItem6: TTabItem;
    Listar: TTabItem;
    cbSituacao: TComboBox;
    Label3: TLabel;
    edtAgencia: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    edtConta: TEdit;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    cbData: TComboBox;
    dtInicio: TDateEdit;
    Label9: TLabel;
    Label10: TLabel;
    dtFim: TDateEdit;
    Label11: TLabel;
    cbEstatoTitulo: TComboBox;
    Button2: TButton;
    Memo1: TMemo;
    Label13: TLabel;
    edtNumeroBoletoDetalha: TEdit;
    Button3: TButton;
    Image1: TImage;
    lbDetalheLinha: TLabel;
    lbDetalheVencimento: TLabel;
    lbDetalheAgencia: TLabel;
    lbDetalheNossoNumero: TLabel;
    lbDetalheValorOriginal: TLabel;
    lbDetlheDesconto: TLabel;
    lbDetalheJuroMulta: TLabel;
    lbDetalheValor: TLabel;
    lbDetalheBeneficiario: TLabel;
    lbDetalheEmissao: TLabel;
    lbDetalheDocumento: TLabel;
    lbDetalheEspecieDoc: TLabel;
    lbDetalheAceite: TLabel;
    lbDetalheProcessamento: TLabel;
    lbDetalheCarteira: TLabel;
    lbDetalheEspecie: TLabel;
    lbDetalheQuantidade: TLabel;
    lbDetalheValorEspecie: TLabel;
    lbDetalheNomePagador: TLabel;
    lbDetalheEndereco: TLabel;
    lbDetalheInfoBeneficiaro: TLabel;
    TabItem2: TTabItem;
    Label19: TLabel;
    Label20: TLabel;
    edtNomeCedente: TEdit;
    edtCNPJCedente: TEdit;
    Label21: TLabel;
    edtEnderecoCendente: TEdit;
    Label22: TLabel;
    edtNumeroCedente: TEdit;
    Label23: TLabel;
    edtComplementoCedente: TEdit;
    Label24: TLabel;
    edtBairroCedente: TEdit;
    Label25: TLabel;
    edtCidadeCedente: TEdit;
    Label26: TLabel;
    edtUFCedente: TEdit;
    Label27: TLabel;
    edtCEPCedente: TEdit;
    Label14: TLabel;
    edtCodigoAgencia: TEdit;
    edtDigitoAgencia: TEdit;
    Label16: TLabel;
    edtCarteira: TEdit;
    Label15: TLabel;
    edtCodigoConta: TEdit;
    edtDigitoConta: TEdit;
    Label17: TLabel;
    edtVariacao: TEdit;
    Label18: TLabel;
    edtNumeroConvenio: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    edtNomeCliente: TEdit;
    edtDocCliente: TEdit;
    Label31: TLabel;
    edtEnderecoCliente: TEdit;
    Label32: TLabel;
    edtNumeroCliente: TEdit;
    Label33: TLabel;
    edtComplementoCliente: TEdit;
    Label34: TLabel;
    edtBairroCliente: TEdit;
    Label35: TLabel;
    edtCidadeCliente: TEdit;
    Label36: TLabel;
    edtEstadoCliente: TEdit;
    Label37: TLabel;
    edtCepCliente: TEdit;
    Label28: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    dtEmissao: TDateEdit;
    dtVencimento: TDateEdit;
    cbTipoJuro: TComboEdit;
    nbMulta: TNumberBox;
    nbJuro: TNumberBox;
    nbValorBoleto: TNumberBox;
    Label45: TLabel;
    cbTipoDocumento: TComboEdit;
    Label46: TLabel;
    cbAceite: TComboEdit;
    Label47: TLabel;
    cbTipoMulta: TComboEdit;
    Label48: TLabel;
    cbReceberVencido: TComboEdit;
    Label49: TLabel;
    cbReceberParcial: TComboEdit;
    Label50: TLabel;
    edtDiasProtesto: TEdit;
    Label51: TLabel;
    edtLimiteVencido: TEdit;
    Label52: TLabel;
    edtSeuNumero: TEdit;
    Label53: TLabel;
    edtNossoNumero: TEdit;
    Label54: TLabel;
    edtDiasNegativar: TEdit;
    Label55: TLabel;
    cbOrgaoNegativador: TComboEdit;
    Label43: TLabel;
    cbModalidade: TComboEdit;
    Label44: TLabel;
    edtTelefoneCliente: TEdit;
    Label56: TLabel;
    dtDataMulta: TDateEdit;
    Button4: TButton;
    Label12: TLabel;
    dtDataJuro: TDateEdit;
    Button5: TButton;
    lbEstadoBoleto: TLabel;
    Button6: TButton;
    Label57: TLabel;
    edtBoletoAlterar: TEdit;
    Label58: TLabel;
    dtAlteraVencimento: TDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure dtVencimentoChange(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FBancoBrasil:IBancoBrasil;
    procedure Configure;

  end;

var
  Form5: TForm5;

implementation

uses Infra.Auth.Types,
     BancoBrasil,
     BancoBrasil.Cobranca.Interfaces,
     BancoBrasil.Cobranca.Registrar,
     BancoBrasil.Types;

{$R *.fmx}

procedure TForm5.Button1Click(Sender: TObject);
begin
   Configure;
   FBancoBrasil.Seguranca.Execute;

   if FBancoBrasil.Seguranca.Accept then
      edtAccessToken.Text := FBancoBrasil.Seguranca.AccessToken
   else raise Exception.Create( 'Erro de autentica��o:');
end;

procedure TForm5.Button2Click(Sender: TObject);
var LBoletos:IListarBoleto;
    I:Integer;
begin
   Memo1.Lines.Clear;
   Configure;
   LBoletos := FBancoBrasil
      .Cobranca
         .ListaBoletos
             .indicadorSituacao( Copy( cbSituacao.Text, 1 , 1))
             .agenciaBeneficiario( edtAgencia.Text)
             .contaBeneficiario( edtConta.Text);

   case cbData.ItemIndex of
      0:LBoletos
           .dataInicioVencimento( dtInicio.Date)
           .dataFimVencimento( dtFim.Date);
      1:LBoletos
           .dataInicioRegistro( dtInicio.Date)
           .dataFimRegistro( dtFim.Date);
      2:LBoletos
           .dataInicioMovimento( dtInicio.Date)
           .dataFimMovimento( dtFim.Date);
   end;

   if cbEstatoTitulo.ItemIndex > 0 then
      LBoletos.codigoEstadoTituloCobranca( StrToInt( Copy( cbEstatoTitulo.Text, 1 , 2)));

   LBoletos.Executar;

   if LBoletos.Retorno.Count > 0 then
      for I := 0 to Pred( LBoletos.Retorno.Count) do
         Memo1.Lines.Add( LBoletos.Retorno.Itens( i).numeroBoletoBB);
end;

procedure TForm5.Button3Click(Sender: TObject);
var LBoleto:IDetalharBoleto;
    I:Integer;
begin
   Memo1.Lines.Clear;
   Configure;
   LBoleto := FBancoBrasil
      .Cobranca
         .DetalhaBoleto
             .numeroConvenio( edtNumeroConvenio.Text)
             .numeroBoleto( edtNumeroBoletoDetalha.Text);

   LBoleto.Executar;
   lbDetalheLinha.Text           := LBoleto.Retorno.codigoLinhaDigitavel;
   lbDetalheVencimento.Text      := DateToStr( LBoleto.Retorno.dataVencimentoTituloCobranca);
   lbDetalheAgencia.Text         := LBoleto.Retorno.numeroInscricaoSacadorAvalista.ToString;
   lbDetalheNossoNumero.Text     := '';
   lbDetalheValorOriginal.Text   := CurrToStr( LBoleto.Retorno.valorOriginalTituloCobranca);
   lbDetlheDesconto.Text         := '';
   lbDetalheJuroMulta.Text       := '';
   lbDetalheValor.Text           := CurrToStr( LBoleto.Retorno.valorOriginalTituloCobranca);
   lbDetalheBeneficiario.Text    := '';
   lbDetalheEmissao.Text         := DateToStr( LBoleto.Retorno.dataEmissaoTituloCobranca);
   lbDetalheDocumento.Text       := '';
   lbDetalheEspecieDoc.Text      := '';
   lbDetalheAceite.Text          := LBoleto.Retorno.codigoAceiteTituloCobranca;
   lbDetalheProcessamento.Text   := '';
   lbDetalheCarteira.Text        := LBoleto.Retorno.numeroCarteiraCobranca.ToString;
   lbDetalheEspecie.Text         := '';
   lbDetalheQuantidade.Text      := '';
   lbDetalheInfoBeneficiaro.Text := LBoleto.Retorno.textoMensagemBloquetoTitulo;
   lbDetalheValorEspecie.Text    := '';
   lbDetalheNomePagador.Text     := LBoleto.Retorno.nomeSacadorAvalistaTitulo;
   lbDetalheEndereco.Text        := LBoleto.Retorno.textoEnderecoSacadoCobranca +' '+
                                    LBoleto.Retorno.nomeBairroSacadoCobranca +' '+
                                    LBoleto.Retorno.nomeMunicipioSacadoCobranca +' - '+
                                    LBoleto.Retorno.siglaUnidadeFederacaoSacadoCobranca +' CEP: '+
                                    LBoleto.Retorno.numeroCepSacadoCobranca.ToString;



   case LBoleto.Retorno.codigoEstadoTituloCobranca of
       1:lbEstadoBoleto.Text := 'NORMAL';
       2:lbEstadoBoleto.Text := 'MOVIMENTO CARTORIO';
       3:lbEstadoBoleto.Text := 'EM CARTORIO';
       4:lbEstadoBoleto.Text := 'TITULO COM OCORRENCIA DE CARTORIO';
       5:lbEstadoBoleto.Text := 'PROTESTADO ELETRONICO';
       6:lbEstadoBoleto.Text := 'LIQUIDADO';
       7:lbEstadoBoleto.Text := 'BAIXADO';
       8:lbEstadoBoleto.Text := 'TITULO COM PENDENCIA DE CARTORIO';
       9:lbEstadoBoleto.Text := 'TITULO PROTESTADO MANUAL';
      10:lbEstadoBoleto.Text := 'TITULO BAIXADO/PAGO EM CARTORIO';
      11:lbEstadoBoleto.Text := 'TITULO LIQUIDADO/PROTESTADO';
      12:lbEstadoBoleto.Text := 'TITULO LIQUID/PGCRTO';
      13:lbEstadoBoleto.Text := 'TITULO PROTESTADO AGUARDANDO BAIXA';
      14:lbEstadoBoleto.Text := 'TITULO EM LIQUIDACAO';
      15:lbEstadoBoleto.Text := 'TITULO AGENDADO BB';
      16:lbEstadoBoleto.Text := 'TITULO CREDITADO';
      17:lbEstadoBoleto.Text := 'PAGO EM CHEQUE - AGUARD.LIQUIDACAO';
      18:lbEstadoBoleto.Text := 'PAGO PARCIALMENTE';
      19:lbEstadoBoleto.Text := 'PAGO PARCIALMENTE CREDITADO';
      21:lbEstadoBoleto.Text := 'TITULO AGENDADO OUTROS BANCOS';
   end;

   {
  "codigoLinhaDigitavel": "string",
  "textoEmailPagador": "string",
  "textoMensagemBloquetoTitulo": "string",
  "codigoTipoMulta": 0,
  "codigoCanalPagamento": 0,
  "numeroContratoCobranca": 0,
  "codigoTipoInscricaoSacado": 0,
  "numeroInscricaoSacadoCobranca": 0,
  "codigoEstadoTituloCobranca": 0,
  "codigoTipoTituloCobranca": 0,
  "codigoModalidadeTitulo": 0,
  "codigoAceiteTituloCobranca": "string",
  "codigoPrefixoDependenciaCobrador": 0,
  "codigoIndicadorEconomico": 0,
  "numeroTituloCedenteCobranca": "string",
  "codigoTipoJuroMora": 0,
  "dataEmissaoTituloCobranca": "string",
  "dataRegistroTituloCobranca": "string",
  "dataVencimentoTituloCobranca": "string",
  "valorOriginalTituloCobranca": 0,
  "valorAtualTituloCobranca": 0,
  "valorPagamentoParcialTitulo": 0,
  "valorAbatimentoTituloCobranca": 0,
  "percentualImpostoSobreOprFinanceirasTituloCobranca": 0,
  "valorImpostoSobreOprFinanceirasTituloCobranca": 0,
  "valorMoedaTituloCobranca": 0,
  "percentualJuroMoraTitulo": 0,
  "valorJuroMoraTitulo": 0,
  "percentualMultaTitulo": 0,
  "valorMultaTituloCobranca": 0,
  "quantidadeParcelaTituloCobranca": 0,
  "dataBaixaAutomaticoTitulo": "string",
  "textoCampoUtilizacaoCedente": "string",
  "indicadorCobrancaPartilhadoTitulo": "string",
  "nomeSacadoCobranca": "string",
  "textoEnderecoSacadoCobranca": "string",
  "nomeBairroSacadoCobranca": "string",
  "nomeMunicipioSacadoCobranca": "string",
  "siglaUnidadeFederacaoSacadoCobranca": "string",
  "numeroCepSacadoCobranca": 0,
  "valorMoedaAbatimentoTitulo": 0,
  "dataProtestoTituloCobranca": "string",
  "codigoTipoInscricaoSacador": 0,
  "numeroInscricaoSacadorAvalista": 0,
  "nomeSacadorAvalistaTitulo": "string",
  "percentualDescontoTitulo": 0,
  "dataDescontoTitulo": "string",
  "valorDescontoTitulo": 0,
  "codigoDescontoTitulo": 0,
  "percentualSegundoDescontoTitulo": 0,
  "dataSegundoDescontoTitulo": "string",
  "valorSegundoDescontoTitulo": 0,
  "codigoSegundoDescontoTitulo": 0,
  "percentualTerceiroDescontoTitulo": 0,
  "dataTerceiroDescontoTitulo": "string",
  "valorTerceiroDescontoTitulo": 0,
  "codigoTerceiroDescontoTitulo": 0,
  "dataMultaTitulo": "string",
  "numeroCarteiraCobranca": 0,
  "numeroVariacaoCarteiraCobranca": 0,
  "quantidadeDiaProtesto": 0,
  "quantidadeDiaPrazoLimiteRecebimento": 0,
  "dataLimiteRecebimentoTitulo": "string",
  "indicadorPermissaoRecebimentoParcial": "string",
  "textoCodigoBarrasTituloCobranca": "string",
  "codigoOcorrenciaCartorio": 0,
  "valorImpostoSobreOprFinanceirasRecebidoTitulo": 0,
  "valorAbatimentoTotal": 0,
  "valorJuroMoraRecebido": 0,
  "valorDescontoUtilizado": 0,
  "valorPagoSacado": 0,
  "valorCreditoCedente": 0,
  "codigoTipoLiquidacao": 0,
  "dataCreditoLiquidacao": "string",
  "dataRecebimentoTitulo": "string",
  "codigoPrefixoDependenciaRecebedor": 0,
  "codigoNaturezaRecebimento": 0,
  "numeroIdentidadeSacadoTituloCobranca": "string",
  "codigoResponsavelAtualizacao": "string",
  "codigoTipoBaixaTitulo": 0,
  "valorMultaRecebido": 0,
  "valorReajuste": 0,
  "valorOutroRecebido": 0,
  "codigoIndicadorEconomicoUtilizadoInadimplencia": 0
}
end;

procedure TForm5.Button4Click(Sender: TObject);
var LRetBoleto:ICobRetRegistro;
    LBoleto:ICobRegBoleto;
    I:Integer;
begin
   Memo1.Lines.Clear;
   Configure;

   LBoleto := TCobRegBoleto.New;
   LBoleto
      .numeroConvenio( StrToIntDef( edtNumeroConvenio.Text, 0))
      .numeroCarteira( StrToIntDef( edtCarteira.Text, 0))
      .numeroVariacaoCarteira( StrToIntDef( edtVariacao.Text, 0))
      .codigoModalidade( TCobCodigoModalidade(  cbModalidade.ItemIndex))
      .dataEmissao( dtEmissao.Date)
      .dataVencimento( dtVencimento.Date)
      .valorOriginal( nbValorBoleto.Value)
      .valorAbatimento( 0)
      .quantidadeDiasProtesto( StrToIntDef( edtDiasProtesto.Text, 0))
      .quantidadeDiasNegativacao( StrToIntDef( edtDiasNegativar.Text, 0))
      .orgaoNegativador( TCobNegativador( cbOrgaoNegativador.ItemIndex))
      .indicadorAceiteTituloVencido( ifthen( cbReceberVencido.ItemIndex = 0, 'S', 'N'))
      .numeroDiasLimiteRecebimento( StrToIntDef( edtLimiteVencido.Text, 0))
      .codigoAceite( TCobCodigoAceite( cbAceite.ItemIndex))
      .codigoTipoTitulo( TCobTipoTitulo( cbTipoDocumento.ItemIndex))
      .descricaoTipoTitulo( cbTipoDocumento.Text)
      .indicadorPermissaoRecebimentoParcial( cbReceberParcial.ItemIndex = 0)
      .numeroTituloBeneficiario( edtSeuNumero.Text)
      .campoUtilizacaoBeneficiario( EmptyStr)
      .numeroTituloCliente( '000'+ edtNumeroConvenio.Text + edtNossoNumero.Text)
      .mensagemBloquetoOcorrencia( EmptyStr)
      .desconto
         .tipo( ctdSemDesconto)
      .&end
      .segundoDesconto
         .tipo( ctdSemDesconto)
      .&end
      .terceiroDesconto
         .tipo( ctdSemDesconto)
      .&end
      .jurosMora
         .tipo( TCobTipoJuros( cbTipoJuro.ItemIndex))
         .data( dtDataJuro.Date)
         .porcentagem( nbJuro.Value)
      .&end
      .multa
         .tipo( TCobTipoMulta( cbTipoMulta.ItemIndex))
         .data( dtDataMulta.Date)
         .porcentagem( nbMulta.Value)
      .&end
      .pagador
         .numeroInscricao( StrToInt64Def(edtDocCliente.Text.Trim, 0))
         .nome( edtNomeCliente.Text)
         .endereco( edtEnderecoCliente.Text +' '+ edtComplementoCliente.Text +' '+ edtNumeroCliente.Text)
         .bairro( edtBairroCliente.Text)
         .cep( StrToIntDef( edtCepCliente.Text, 0))
         .cidade( edtCidadeCliente.Text)
         .uf( edtEstadoCliente.Text)
         .telefone( edtTelefoneCliente.Text)
      .&end
      .beneficiarioFinal
         .numeroInscricao( StrToInt64Def( edtCNPJCedente.Text.Trim, 0))
         .nome( edtNomeCedente.Text)
      .&end
      .indicadorPix( TCobIndicadorPix.cipSemPIX);

   LRetBoleto := FBancoBrasil
                    .Cobranca
                       .RegistraBoleto
                           .Registrar( LBoleto)
                           .Retorno;
end;

procedure TForm5.Button5Click(Sender: TObject);
var LBoleto:IBaixarBoleto;
    I:Integer;
begin
   Memo1.Lines.Clear;
   Configure;
   LBoleto := FBancoBrasil
      .Cobranca
         .BaixaBoleto
             .numeroConvenio( edtNumeroConvenio.Text)
             .numeroBoleto( edtNumeroBoletoDetalha.Text)
         .Executar;
end;

procedure TForm5.Button6Click(Sender: TObject);
var LBoleto:IAlterarBoleto;
    I:Integer;
begin
   Memo1.Lines.Clear;
   Configure;
   LBoleto := FBancoBrasil
      .Cobranca
         .AlterarBoletos
             .numeroConvenio( edtNumeroConvenio.Text)
             .numeroBoleto( edtNumeroBoletoDetalha.Text)
             .AlterarDataVencimento( dtAlteraVencimento.Date)
         .Executar;
end;

procedure TForm5.Configure;
begin
   FBancoBrasil
      .Seguranca
         .Environment( aeHomologation)
         .ClientKey( 'eyJpZCI6ImVlYzk0YmEtZmI4MyIsImNvZGlnb1B1YmxpY2Fkb3IiOjAsImNvZGlnb1NvZnR3YXJlIjo3ODc0OCwic2VxdWVuY2lhbEluc3RhbGFjYW8iOjF9')
         .ClientSecret( 'eyJpZCI6ImE0OGUxMWJjLTUyMWItNGVjNi1iMzM1LTFhZGJiOWY3NWU0YiIsImNvZGlnb1B1YmxpY2Fkb3IiOjAsImNvZGlnb1NvZnR3YXJlIjo3ODc0OCwic2VxdWVuY2lhbEluc3RhbGFjYW8iOjEsInNlcXVlbmNpYWxDcmVkZW5jaWFsIjoxLCJhbWJpZW50ZSI6ImhvbW9sb2dhY2FvIiwiaWF0IjoxNjk5NTM3ODQ3OTgxfQ')
         .BasicKey( 'ZXlKcFpDSTZJaUlzSW1OdlpHbG5iMUIxWW14cFkyRmtiM0lpT2pBc0ltTnZaR2xuYjFOdlpuUjNZWEpsSWpveE1qZzBNQ3dpYzJWeGRXVnVZMmxoYkVsdWMzUmhiR0ZqWVc4aU9qRjk6ZXlKcFpDSTZJakE0TnlJc0ltTnZaR2xuYjFCMVlteHBZMkZrYjNJaU9qQXNJbU52WkdsbmIxTnZablIzWVhKbElqb3hNamcwTUN3aWMyVnhkV1Z1WTJsaGJFbHVjM1JoYkdGallXOGlPakVzSW5ObGNYVmxibU5wWVd4RGNtVmtaVzVqYVdGc0lqb3hMQ0poYldKcFpXNTBaU0k2SW1odmJXOXNiMmRoWTJGdklpd2lhV0YwSWpveE5qRXhOVGsxTWpJNE9UWXlmUQ==')
         .AppKey( 'ad471c0127c392f73e4495ce1bd40522');
end;

procedure TForm5.dtVencimentoChange(Sender: TObject);
begin
   if dtVencimento.Date < dtEmissao.Date then
      raise Exception.Create( 'A data de vencimento do boleto n�o pode ser inferior a sua data de emiss�o');

   dtDataJuro.Data  := dtVencimento.Date + 1;
   dtDataMulta.Data := dtVencimento.Date + 1;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
   FBancoBrasil := TBancoBrasil.New;
   dtEmissao.Date    := Date;
   dtvencimento.Date := Date + 1;
end;

end.


C�digo	Sigla	Descri��o
01	DM	Duplicata Mercantil
02	NP	Nota promiss�ria
03	NS	Nota de seguro
04	DS	Duplicata de Servi�o
05	REC	Recibo
06	LC	Letra de C�mbio *Apenas para a caixa
07	ND	Nota de D�bito
08	BDP	Boleto de Proposta
09	LC	Letra de C�mbio
10	WR	Warrant
11	CH	Cheque
12	CS	Cobran�a Seriada
13	ME	Mensalidade escolar
14	AS	Ap�lice de Seguro
15	DD	Documento de D�vida
16	EC	Encargos Condominiais
17	CPS	Conta de presta��o de servi�o
18	CT	Contrato
19	CS	Cosseguro
20	DR	Duplicata Rural
21	NPR	Nota Promiss�ria Rural
22	--	D�vida Ativa da Uni�o
23	--	D�vida Ativa de Estado
24	--	D�vida Ativa de Munic�pio
25	DMI	Duplicata Mercantil por Indica��o
26	DSI	Duplicata de Servi�o por Indica��o
27	NCC	Nota de Cr�dito Comercial
28	NCE	Nota de Cr�dito para Exporta��o
29	NCI	Nota de Cr�dito Industrial
30	NCR	Nota de Cr�dito Rural
32	TM	Triplicata Mercantil
33	TS	Triplicata de Servi�o
34	FAT	Fatura
35	PC	Parcela de Cons�rcio
36	NF	Nota Fiscal
37	CPR	C�dula de Produto Rural
38	CC	Cart�o de cr�dito
39	AD	T�tulos de Terceiros
40	BDA Boleto de Dep�sito e Aporte
41	CBI C�dula de Cr�dito Banc�rio por Indica��o
42	CC  Contrato de C�mbio
43	CCB C�dula de Cr�dito Banc�rio
44	CD  Confiss�o de D�vida
45	CM  Contrato de M�tuo
46	RA  Recibo de Aluguel (PJ)
47	TA  Termo de acordo
99	DV	Outros
