unit BancoBrasil.Pix.Retorno;

interface

uses System.SysUtils,
     System.StrUtils,
     System.DateUtils,
     System.JSON,
     System.Generics.Collections,

     Infra.Utils,
     BancoBrasil.Types,
     BancoBrasil.Helpers,
     BancoBrasil.Pix.Interfaces;

type
   TPixRetPesquisa = class( TInterfacedObject, IPixRetPesquisa)
   private
      Finicio:TDateTime;
      Ffim:TDateTime;
      FpaginaAtual:integer;
      FitensPorPagina:integer;
      FquantidadeDePaginas:integer;
      FquantidadeTotalDeItens:integer;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPixRetPesquisa;

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

   TPixRetDevolucao = class( TInterfacedObject, IPixRetDevolucao)
   private
      Fid:String;
      FrtrId:String;
      Fvalor:Double;
      Fsolicitacao:TDateTime;
      Fliquidacao:TDateTime;
      Fstatus:String;
      Fmotivo:String;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPixRetDevolucao;

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

   TPixRetViolacoes = class( TInterfacedObject, IPixRetViolacoes)
   private
      Frazao:string;
      Fpropriedade:string;
      Fvalor:string;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPixRetViolacoes;

      function razao( aValue:string):IPixRetViolacoes;overload;
      function propriedade( aValue:string):IPixRetViolacoes;overload;
      function valor( aValue:string):IPixRetViolacoes;overload;

      function razao:string;overload;
      function propriedade:string;overload;
      function valor:string;overload;

      function FromJSON( aValue:String):IPixRetViolacoes;overload;
      function FromJSON( aValue:TJSONObject):IPixRetViolacoes;overload;
   end;

   TPixRetInfo = class( TInterfacedObject, IPixRetInfo)
   private
      Ftype:string;
      Ftitle:string;
      Fstatus:integer;
      Fdetail:string;
      FcorrelationId:string;
      Fviolacoes:IPixRetViolacoes;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPixRetInfo;

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

   TPixRetErro = class( TInterfacedObject, IPixRetErro)
   private
      FstatusCode:integer;
      Ferror:string;
      Fmessage:string;
      Fattribute:string;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPixRetErro;

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

implementation

{ TPixRetPesquisa }

constructor TPixRetPesquisa.Create;
begin

end;

destructor TPixRetPesquisa.Destroy;
begin

  inherited;
end;

function TPixRetPesquisa.fim(aValue: TDateTime): IPixRetPesquisa;
begin
   Result := Self;
   Ffim := aValue;
end;

function TPixRetPesquisa.fim: TDateTime;
begin
   Result := Ffim;
end;

function TPixRetPesquisa.FromJSON(aValue: String): IPixRetPesquisa;
Var LJSON:TJSONObject;
begin
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue), 0));
   FromJSON( LJSON);
end;

function TPixRetPesquisa.FromJSON(aValue: TJSONObject): IPixRetPesquisa;
Var LPag:TJSONObject;
begin
   try
      Finicio := TInfraUtils.JSONDateToDateTime( Get( aValue, 'inicio').value);
      Ffim    := TInfraUtils.JSONDateToDateTime( Get( aValue, 'fim').value);
      LPag    := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( 'paginacao'),0));

      FpaginaAtual            := StrToInt( Get( LPag, 'paginaAtual').value);
      FitensPorPagina         := StrToInt( Get( LPag, 'itensPorPagina').value);
      FquantidadeDePaginas    := StrToInt( Get( LPag, 'quantidadeDePaginas').value);
      FquantidadeTotalDeItens := StrToInt( Get( LPag, 'quantidadeTotalDeItens').value);
   finally
      FreeAndNil( aValue);
      FreeAndNil( LPag);
   end;
end;

function TPixRetPesquisa.inicio: TDateTime;
begin
   Result := Finicio;
end;

function TPixRetPesquisa.inicio(aValue: TDateTime): IPixRetPesquisa;
begin
   Result := Self;
   Finicio := aValue;
end;

function TPixRetPesquisa.itensPorPagina(aValue: integer): IPixRetPesquisa;
begin
   Result := Self;
   FitensPorPagina := aValue;
end;

function TPixRetPesquisa.itensPorPagina: integer;
begin
   Result := FitensPorPagina;
end;

class function TPixRetPesquisa.New: IPixRetPesquisa;
begin
   Result := Self.Create;
end;

function TPixRetPesquisa.paginaAtual: integer;
begin
   Result := FpaginaAtual;
end;

function TPixRetPesquisa.paginaAtual(aValue: integer): IPixRetPesquisa;
begin
   Result := Self;
   FpaginaAtual := aValue;
end;

function TPixRetPesquisa.quantidadeDePaginas: integer;
begin
   Result := FquantidadeDePaginas;
end;

function TPixRetPesquisa.quantidadeDePaginas(aValue: integer): IPixRetPesquisa;
begin
   Result := Self;
   FquantidadeDePaginas := aValue;
end;

function TPixRetPesquisa.quantidadeTotalDeItens: integer;
begin
   Result := FquantidadeTotalDeItens;
end;

function TPixRetPesquisa.quantidadeTotalDeItens( aValue: integer): IPixRetPesquisa;
begin
   Result := Self;
   FquantidadeTotalDeItens := aValue;
end;

{ TPixRetDevolucao }

constructor TPixRetDevolucao.Create;
begin

end;

destructor TPixRetDevolucao.Destroy;
begin

  inherited;
end;

function TPixRetDevolucao.FromJSON(aValue: String): IPixRetDevolucao;
Var LJSON:TJSONObject;
begin
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue), 0));
   FromJSON( LJSON);
end;

function TPixRetDevolucao.FromJSON(aValue: TJSONObject): IPixRetDevolucao;
Var LHorario:TJSONObject;
begin
   try
      Fid          := Get( aValue, 'id').value;
      FrtrId       := Get( aValue, 'rtrId').value;
      Fvalor       := StrToFloat( Get( aValue, 'valor').value);

      LHorario     := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( 'horario'),0));
      Fsolicitacao := TInfraUtils.JSONDateToDateTime( Get( LHorario, 'solicitacao').value);
      Fliquidacao  := TInfraUtils.JSONDateToDateTime( Get( LHorario, 'liquidacao').value);

      Fstatus      := Get( aValue, 'status').value;
      Fmotivo      := Get( aValue, 'motivo').value;

   finally
      FreeAndNil( aValue);
      FreeAndNil( LHorario);
   end;
end;

function TPixRetDevolucao.id(aValue: String): IPixRetDevolucao;
begin
   Result := Self;
   Fid := aValue;
end;

function TPixRetDevolucao.id: String;
begin
   Result := Fid;
end;

function TPixRetDevolucao.liquidacao: TDateTime;
begin
   Result := Fliquidacao;
end;

function TPixRetDevolucao.liquidacao(aValue: TDateTime): IPixRetDevolucao;
begin
   Result := Self;
   Fliquidacao := aValue;
end;

function TPixRetDevolucao.motivo: String;
begin
   Result := Fmotivo;
end;

function TPixRetDevolucao.motivo(aValue: String): IPixRetDevolucao;
begin
   Result := Self;
   Fmotivo := aValue;
end;

class function TPixRetDevolucao.New: IPixRetDevolucao;
begin
   Result := Self.Create;
end;

function TPixRetDevolucao.rtrId(aValue: String): IPixRetDevolucao;
begin
   Result := Self;
   FrtrId := aValue;
end;

function TPixRetDevolucao.rtrId: String;
begin
   Result := FrtrId;
end;

function TPixRetDevolucao.solicitacao(aValue: TDateTime): IPixRetDevolucao;
begin
   Result := Self;
   Fsolicitacao := aValue;
end;

function TPixRetDevolucao.solicitacao: TDateTime;
begin
   Result := Fsolicitacao;
end;

function TPixRetDevolucao.status(aValue: String): IPixRetDevolucao;
begin
   Result := Self;
   Fstatus := aValue;
end;

function TPixRetDevolucao.status: String;
begin
   Result := Fstatus;
end;

function TPixRetDevolucao.valor: Double;
begin
   Result := Fvalor;
end;

function TPixRetDevolucao.valor(aValue: Double): IPixRetDevolucao;
begin
   Result := Self;
   Fvalor := aValue;
end;

{ TPixRetViolacoes }

constructor TPixRetViolacoes.Create;
begin

end;

destructor TPixRetViolacoes.Destroy;
begin

  inherited;
end;

function TPixRetViolacoes.FromJSON(aValue: TJSONObject): IPixRetViolacoes;
begin
   try
      Frazao       := Get( aValue, 'razao').value;
      Fpropriedade := Get( aValue, 'propriedade').value;
      Fvalor       := Get( aValue, 'valor').value;

   finally
      FreeAndNil( aValue);
   end;
end;

function TPixRetViolacoes.FromJSON(aValue: String): IPixRetViolacoes;
Var LJSON:TJSONObject;
begin
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue), 0));
   FromJSON( LJSON);
end;

class function TPixRetViolacoes.New: IPixRetViolacoes;
begin
   Result := Self.Create;
end;

function TPixRetViolacoes.propriedade(aValue: string): IPixRetViolacoes;
begin
   Result := Self;
   Fpropriedade := aValue;
end;

function TPixRetViolacoes.propriedade: string;
begin
   Result := Fpropriedade;
end;

function TPixRetViolacoes.razao: string;
begin
   Result := Frazao;
end;

function TPixRetViolacoes.razao(aValue: string): IPixRetViolacoes;
begin
   Result := Self;
   Frazao := aValue;
end;

function TPixRetViolacoes.valor(aValue: string): IPixRetViolacoes;
begin
   Result := Self;
   Fvalor := aValue;
end;

function TPixRetViolacoes.valor: string;
begin
   Result := Fvalor;
end;

{ TPixRetInfo }

function TPixRetInfo.correlationId: string;
begin
   Result := FcorrelationId;
end;

function TPixRetInfo.correlationId(aValue: string): IPixRetInfo;
begin
   Result := Self;
   FcorrelationId := aValue;
end;

constructor TPixRetInfo.Create;
begin
   Fviolacoes := TPixRetViolacoes.New;
end;

destructor TPixRetInfo.Destroy;
begin

  inherited;
end;

function TPixRetInfo.detail(aValue: string): IPixRetInfo;
begin
   Result := Self;
   Fdetail := aValue;
end;

function TPixRetInfo.detail: string;
begin
   Result := Fdetail;
end;

function TPixRetInfo.FromJSON(aValue: TJSONObject): IPixRetInfo;
begin
   try
      Ftype          := Get( aValue, 'type').Value;
      Ftitle         := Get( aValue, 'title').Value;
      Fstatus        := StrToInt( Get( aValue, 'statu').Value);
      Fdetail        := Get( aValue, 'detail').Value;
      FcorrelationId := Get( aValue, 'correlationId').Value;

      Fviolacoes.FromJSON(Get( aValue, 'violacoes').Value);
   finally
      FreeAndNil( aValue);
   end;
end;

function TPixRetInfo.FromJSON(aValue: String): IPixRetInfo;
Var LJSON:TJSONObject;
begin
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue), 0));
   FromJSON( LJSON);
end;

class function TPixRetInfo.New: IPixRetInfo;
begin
   Result := Self.Create
end;

function TPixRetInfo.status: integer;
begin
   Result := Fstatus;
end;

function TPixRetInfo.status(aValue: integer): IPixRetInfo;
begin
   Result := Self;
   Fstatus := aValue;
end;

function TPixRetInfo.title(aValue: string): IPixRetInfo;
begin
   Result := Self;
   Ftitle := aValue;
end;

function TPixRetInfo.title: string;
begin
   Result := Ftitle;
end;

function TPixRetInfo.violacoes: IPixRetViolacoes;
begin
   Result := Fviolacoes;
end;

function TPixRetInfo._type: string;
begin
   Result := Ftype;
end;

function TPixRetInfo._type(aValue: string): IPixRetInfo;
begin
   Result := Self;
   Ftype := aValue;
end;

{ TPixRetErro }

function TPixRetErro.attribute: string;
begin
   Result := Fattribute;
end;

function TPixRetErro.attribute(aValue: string): IPixRetErro;
begin
   Result := self;
   Fattribute := aValue;
end;

constructor TPixRetErro.Create;
begin

end;

destructor TPixRetErro.Destroy;
begin

  inherited;
end;

function TPixRetErro.error: string;
begin
   Result := Ferror;
end;

function TPixRetErro.error(aValue: string): IPixRetErro;
begin
   Result := self;
   Ferror := aValue;
end;

function TPixRetErro.FromJSON(aValue: TJSONObject): IPixRetErro;
begin
   try
      FstatusCode := StrToInt( Get( aValue, 'statusCode').Value);
      Ferror      := Get( aValue, 'error').Value;
      Fmessage    := Get( aValue, 'message').Value;
      Fattribute  := Get( aValue, 'attribute').Value;

   finally
      FreeAndNil( aValue);
   end;
end;

function TPixRetErro.FromJSON(aValue: String): IPixRetErro;
Var LJSON:TJSONObject;
begin
   LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue), 0));
   FromJSON( LJSON);
end;

function TPixRetErro.message(aValue: string): IPixRetErro;
begin
   Result := self;
   Fmessage := aValue;
end;

function TPixRetErro.message: string;
begin
   Result := Fmessage;
end;

class function TPixRetErro.New: IPixRetErro;
begin
   Result := Self.Create;
end;

function TPixRetErro.statusCode(aValue: integer): IPixRetErro;
begin
   Result := self;
   FstatusCode := aValue;
end;

function TPixRetErro.statusCode: integer;
begin
   Result := FstatusCode;
end;

end.
