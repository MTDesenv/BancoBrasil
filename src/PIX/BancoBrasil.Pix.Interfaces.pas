unit BancoBrasil.Pix.Interfaces;

interface

uses System.SysUtils,
     System.JSON,

     BancoBrasil.Types;

type
   IPixErro = interface
      ['{47DAB9AD-27BE-4EAE-8AC6-34A9ED0F8B58}']
      function type_( aValue:string):IPixErro;overload;
      function title( aValue:string):IPixErro;overload;
      function status( aValue:integer):IPixErro;overload;
      function detail( aValue:string):IPixErro;overload;

      function type_:string;overload;
      function title:string;overload;
      function status:integer;overload;
      function detail:string;overload;

      function ToJSON:TJSONObject;
      function ToStrJSON:String;
      function FromJSON( aValue:String):IPixErro;
   end;

   IPixErroLst = interface
      ['{821EB7E2-E6C0-4DD4-9701-BE93436B4AC6}']
      function Add( aValue:IPixErro):IPixErroLst;
      function Clear:IPixErroLst;
      function Count:Integer;

      function ToJSON:TJSONArray;
      function ToStrJSON:String;
      function FromJSON( aValue:String):IPixErroLst;
   end;

   IPixPessoa = interface
      ['{B0D7D614-D855-4A6B-909A-B04DA3AE8856}']
      function Tipo( aValue:TPixTipoPessoa):IPixPessoa;overload;
      function Documento( aValue:String):IPixPessoa;overload;
      function Nome( aValue:String):IPixPessoa;overload;

      function Tipo:TPixTipoPessoa;overload;
      function Documento:String;overload;
      function Nome:String;overload;

      function ToJSON:TJSONObject;
      function ToStrJSON:String;
      function FromJSON( aValue:String):IPixPessoa;
   end;

   IPixDevolucao = interface
      ['{6633560B-664F-4835-BCF7-2119326C8480}']
      function id( aValue:string):IPixDevolucao;overload;
      function rtrId( aValue:string):IPixDevolucao;overload;
      function valor( aValue:double):IPixDevolucao;overload;
      function hrsolicitacao( aValue:TDateTime):IPixDevolucao;overload;
      function hrliquidacao( aValue:TDateTime):IPixDevolucao;overload;
      function status( aValue:string):IPixDevolucao;overload;
      function motivo( aValue:string):IPixDevolucao;overload;

      function id:string;overload;
      function rtrId:string;overload;
      function valor:double;overload;
      function hrsolicitacao:TDateTime;overload;
      function hrliquidacao:TDateTime;overload;
      function status:string;overload;
      function motivo:string;overload;

      function ToJSON:TJSONObject;
      function ToStrJSON:String;
      function FromJSON( aValue:String):IPixDevolucao;
   end;

   IPixDevolucaoLst = interface
      ['{0540F5BB-A941-4A94-9BF4-68D4C9E1E38C}']
      function Add( aValue:IPixDevolucao):IPixDevolucaoLst;
      function Clear:IPixDevolucaoLst;
      function Count:Integer;

      function ToJSON:TJSONArray;
      function ToStrJSON:String;
      function FromJSON( aValue:String):IPixDevolucaoLst;
   end;

   IPix = interface
      ['{BD15A676-C0E9-4BAE-994D-B99995339E22}']
      function endToEndId:string;overload;
      function txid:string;overload;
      function valor:double;overload;
      function horario:TDateTime;overload;
      function pagador:IPixPessoa;overload;
      function infoPagador:string;overload;
      function devolucoes:IPixDevolucaoLst;overload;

      function endToEndId( aValue:string):IPix;overload;
      function txid( aValue:string):IPix;overload;
      function valor( aValue:double):IPix;overload;
      function horario( aValue:TDateTime):IPix;overload;
      function infoPagador( aValue:string):IPix;overload;

      function ToJSON:TJSONObject;
      function ToStrJSON:String;
      function FromJSON( aValue:String):IPix;
   end;

   IPixLst = interface
      ['{0540F5BB-A941-4A94-9BF4-68D4C9E1E38C}']
      function Add( aValue:IPix):IPixLst;
      function Clear:IPixLst;
      function Count:Integer;

      function ToJSON:TJSONArray;
      function ToStrJSON:String;
      function FromJSON( aValue:String):IPixLst;
   end;

   IPixRetPesquisa = interface
      ['{1AC542B6-7B29-487A-B755-72843C789561}']
      function inicio( aValue:TDateTime):IPixRetPesquisa;overload;
      function fim( aValue:TDateTime):IPixRetPesquisa;overload;
      function paginaAtual( aValue:integer):IPixRetPesquisa;overload;
      function itensPorPagina( aValue:integer):IPixRetPesquisa;overload;
      function quantidadeDePaginas( aValue:integer):IPixRetPesquisa;overload;
      function quantidadeTotalDeItens( aValue:integer):IPixRetPesquisa;overload;

      function inicio:TDateTime;overload;
      function fim:TDateTime;overload;
      function paginaAtual:integer;overload;
      function itensPorPagina:integer;overload;
      function quantidadeDePaginas:integer;overload;
      function quantidadeTotalDeItens:integer;overload;

      function FromJSON( aValue:String):IPixRetPesquisa;overload;
      function FromJSON( aValue:TJSONObject):IPixRetPesquisa;overload;
   end;

   IPixRetDevolucao = interface
      ['{F97DD3CB-1C84-41C7-9ADE-CD8B33698829}']
      function id( aValue:String):IPixRetDevolucao;overload;
      function rtrId( aValue:String):IPixRetDevolucao;overload;
      function valor( aValue:Double):IPixRetDevolucao;overload;
      function solicitacao( aValue:TDateTime):IPixRetDevolucao;overload;
      function liquidacao( aValue:TDateTime):IPixRetDevolucao;overload;
      function status( aValue:String):IPixRetDevolucao;overload;
      function motivo( aValue:String):IPixRetDevolucao;overload;

      function id:String;overload;
      function rtrId:String;overload;
      function valor:Double;overload;
      function solicitacao:TDateTime;overload;
      function liquidacao:TDateTime;overload;
      function status:String;overload;
      function motivo:String;overload;

      function FromJSON( aValue:String):IPixRetDevolucao;overload;
      function FromJSON( aValue:TJSONObject):IPixRetDevolucao;overload;
   end;

   IPixRetViolacoes = interface
      ['{3B2F4FEA-012F-4029-AA91-6BE194E7D672}']
      function razao( aValue:string):IPixRetViolacoes;overload;
      function propriedade( aValue:string):IPixRetViolacoes;overload;
      function valor( aValue:string):IPixRetViolacoes;overload;

      function razao:string;overload;
      function propriedade:string;overload;
      function valor:string;overload;

      function FromJSON( aValue:String):IPixRetViolacoes;overload;
      function FromJSON( aValue:TJSONObject):IPixRetViolacoes;overload;
   end;

   IPixRetInfo = interface
      ['{F710BB3A-CDEA-4E47-BC31-71971EDD42CA}']
      function _type( aValue:string):IPixRetInfo;overload;
      function title( aValue:string):IPixRetInfo;overload;
      function status( aValue:integer):IPixRetInfo;overload;
      function detail( aValue:string):IPixRetInfo;overload;
      function correlationId( aValue:string):IPixRetInfo;overload;

      function _type:string;overload;
      function title:string;overload;
      function status:integer;overload;
      function detail:string;overload;
      function correlationId:string;overload;
      function violacoes:IPixRetViolacoes;

      function FromJSON( aValue:String):IPixRetInfo;overload;
      function FromJSON( aValue:TJSONObject):IPixRetInfo;overload;
   end;

   IPixRetErro = interface
      ['{66CFBEF4-849F-4AFA-8439-5251B7780F2D}']
      function statusCode( aValue:integer):IPixRetErro;overload;
      function error( aValue:string):IPixRetErro;overload;
      function message( aValue:string):IPixRetErro;overload;
      function attribute( aValue:string):IPixRetErro;overload;

      function statusCode:integer;overload;
      function error:string;overload;
      function message:string;overload;
      function attribute:string;overload;

      function FromJSON( aValue:String):IPixRetErro;overload;
      function FromJSON( aValue:TJSONObject):IPixRetErro;overload;
   end;

   // Cobranca
   IPixInfoAdicional = interface
      ['{185F2A41-0A8A-490A-8138-D7C6B2B2859A}']
      function Nome( aValue:String):IPixInfoAdicional;overload;
      function Valor( aValue:String):IPixInfoAdicional;overload;

      function Nome:String;overload;
      function Valor:String;overload;
   end;

   IPixInfoAdicionalLst = interface
      ['{4F1E10A5-AD1E-4A95-A53A-AA99591B9A36}']
      function Add( aValue:IPixInfoAdicional):IPixInfoAdicionalLst;overload;
      function Add( aNome:String; aValor:String):IPixInfoAdicionalLst;overload;
      function Clear:IPixInfoAdicionalLst;
      function Itens( aIndex:Integer):IPixInfoAdicional;
   end;

   IPixCobranca = interface
      ['{A7C0859B-429D-4258-8F6F-292962A0173E}']
      function Devedor:IPixPessoa;
      function ValorOriginal( aValue:Double):IPixCobranca;
      function Chave( aValue:String):IPixCobranca;
      function SolicitacaoPagador( aValue:String):IPixCobranca;
      function InfoAdicionais:IPixInfoAdicionalLst;
   end;

   IPixServices = interface
      ['{31A07E79-4875-47B3-91E7-D83153F43DC0}']
      function CriarCobranca:IPixServices;
      function RevisarCobranca:IPixServices;
      function ConsultarCobranca:IPixServices;

      function ConsultarRecebimento:IPixServices;
      function Consultar:IPixServices;
      function ConsultarDevolucao:IPixServices;
      function SolicitarDevolucao:IPixServices;
   end;

implementation

end.
