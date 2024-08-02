unit BancoBrasil.Pix;

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
   TPixErro = class( TInterfacedObject, IPixErro)
   private
      Ftype:string;
      Ftitle:string;
      Fstatus:integer;
      Fdetail:string;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPixErro;

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

   TPixErroLst = class( TInterfacedObject, IPixErroLst)
   private
      FItens:TList<IPixErro>;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPixErroLst;

      function Add( aValue:IPixErro):IPixErroLst;
      function Clear:IPixErroLst;
      function Count:Integer;

      function ToJSON:TJSONArray;
      function ToStrJSON:String;
      function FromJSON( aValue:String):IPixErroLst;
   end;

   TPixPessoa = class( TInterfacedObject, IPixPessoa)
   private
      FTipo:TPixTipoPessoa;
      FDocumento:String;
      FNome:String;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPixPessoa;

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

   TPixDevolucao = class( TInterfacedObject, IPixDevolucao)
   private
      Fid:string;
      FrtrId:string;
      Fvalor:double;
      Fhrsolicitacao:TDateTime;
      Fhrliquidacao:TDateTime;
      Fstatus:string;
      Fmotivo:string;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPixDevolucao;

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

   TPixDevolucaoLst = class( TInterfacedObject, IPixDevolucaoLst)
   private
      FItens:TList<IPixDevolucao>;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPixDevolucaoLst;

      function Add( aValue:IPixDevolucao):IPixDevolucaoLst;
      function Clear:IPixDevolucaoLst;
      function Count:Integer;

      function ToJSON:TJSONArray;
      function ToStrJSON:String;
      function FromJSON( aValue:String):IPixDevolucaoLst;
   end;

   TPix = class( TInterfacedObject, IPix)
   private
      FendToEndId:string;
      Ftxid:string;
      Fvalor:double;
      Fhorario:TDateTime;
      Fpagador:IPixPessoa;
      FinfoPagador:string;
      Fdevolucoes:IPixDevolucaoLst;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPix;

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

   TPixLst = class( TInterfacedObject, IPixLst)
   private
      FItens:TList<IPix>;

   public
      constructor Create;
      destructor Destroy;override;
      class function New:IPixLst;

      function Add( aValue:IPix):IPixLst;
      function Clear:IPixLst;
      function Count:Integer;

      function ToJSON:TJSONArray;
      function ToStrJSON:String;
      function FromJSON( aValue:String):IPixLst;
   end;

implementation

{ TPixPessoa }

constructor TPixPessoa.Create;
begin

end;

destructor TPixPessoa.Destroy;
begin

  inherited;
end;

function TPixPessoa.Documento(aValue: String): IPixPessoa;
begin
   Result := Self;
   FDocumento := aValue;
end;

function TPixPessoa.Documento: String;
begin
   Result := FDocumento;
end;

function TPixPessoa.FromJSON(aValue: String): IPixPessoa;
Var LJSON:TJSONObject;
begin
   try
      Result := Self;
      LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));

      case FTipo of
         tpFisica  :FDocumento := Get( LJSON, 'cpf').value;
         tpJuridica:FDocumento := Get( LJSON, 'cnpj').value;
      end;

      FNome      := Get( LJSON, 'nome').value;
   finally
      FreeAndNil( LJSON);
   end;
end;

class function TPixPessoa.New: IPixPessoa;
begin
   Result := Self.Create;
end;

function TPixPessoa.Nome(aValue: String): IPixPessoa;
begin
   Result := Self;
   FNome := aValue;
end;

function TPixPessoa.Nome: String;
begin
   Result := FNome;
end;

function TPixPessoa.Tipo(aValue: TPixTipoPessoa): IPixPessoa;
begin
   Result := Self;
   FTipo := aValue;
end;

function TPixPessoa.Tipo: TPixTipoPessoa;
begin
   Result := FTipo;
end;

function TPixPessoa.ToJSON:TJSONObject;
Var LJSON:TJSONObject;
begin
   LJSON := TJSONObject.Create;

   case FTipo of
      tpFisica  :LJSON.AddPair( 'cpf',  TJSONString.Create( FDocumento));
      tpJuridica:LJSON.AddPair( 'cnpj', TJSONString.Create( FDocumento));
   end;

   LJSON.AddPair( 'nome', TJSONString.Create( FNome));
   Result := LJSON;
end;

function TPixPessoa.ToStrJSON: String;
Var LJSON:TJSONObject;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

{ TPixDevolucao }

constructor TPixDevolucao.Create;
begin

end;

destructor TPixDevolucao.Destroy;
begin

  inherited;
end;

function TPixDevolucao.FromJSON(aValue: String): IPixDevolucao;
Var LJSON:TJSONObject;
    LHorario:TJSONObject;
begin
   try
      Result := Self;
      LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));

      Fid            := Get( LJSON, 'id').Value;
      FrtrId         := Get( LJSON, 'rtrId').Value;
      Fvalor         := StrToFloat( Get( LJSON, 'valor').Value);

      LHorario       := TJSONObject( Get( LJSON, 'horario'));
      Fhrsolicitacao := TInfraUtils.JSONDateToDateTime( Get( LHorario, 'hrsolicitacao').Value);
      Fhrliquidacao  := TInfraUtils.JSONDateToDateTime( Get( LHorario, 'hrliquidacao').Value);

      Fstatus        := Get( LJSON, 'status').Value;
      Fmotivo        := Get( LJSON, 'motivo').Value;
   finally
      FreeAndNil( LJSON);
      FreeAndNil( LHorario);
   end;
end;

function TPixDevolucao.hrliquidacao: TDateTime;
begin
   Result := Fhrliquidacao;
end;

function TPixDevolucao.hrliquidacao(aValue: TDateTime): IPixDevolucao;
begin
   Result := Self;
   Fhrliquidacao := aValue;
end;

function TPixDevolucao.hrsolicitacao(aValue: TDateTime): IPixDevolucao;
begin
   Result := Self;
   Fhrsolicitacao := aValue;
end;

function TPixDevolucao.hrsolicitacao: TDateTime;
begin
   Result := Fhrsolicitacao;
end;

function TPixDevolucao.id(aValue: string): IPixDevolucao;
begin
   Result := Self;
   Fid := aValue;
end;

function TPixDevolucao.id: string;
begin
   Result := Fid;
end;

function TPixDevolucao.motivo: string;
begin
   Result := Fmotivo;
end;

function TPixDevolucao.motivo(aValue: string): IPixDevolucao;
begin
   Result := Self;
   Fmotivo := aValue;
end;

class function TPixDevolucao.New: IPixDevolucao;
begin
   Result := Self.Create;
end;

function TPixDevolucao.rtrId: string;
begin
   Result := FrtrId;
end;

function TPixDevolucao.rtrId(aValue: string): IPixDevolucao;
begin
   Result := Self;
   FrtrId := aValue;
end;

function TPixDevolucao.status(aValue: string): IPixDevolucao;
begin
   Result := Self;
   Fstatus := aValue;
end;

function TPixDevolucao.status: string;
begin
   Result := Fstatus;
end;

function TPixDevolucao.ToJSON: TJSONObject;
Var LJSON:TJSONObject;
    LHorario:TJSONObject;
begin
   LJSON  := TJSONObject.Create;
   LJSON.AddPair( 'id',             TJSONString.Create( Fid));
   LJSON.AddPair( 'rtrId',          TJSONString.Create( FrtrId));
   LJSON.AddPair( 'valor',          TJSONNumber.Create( Fvalor));

   LHorario := TJSONObject.Create;
   LHorario.AddPair( 'solicitacao', TJSONString.Create( TInfraUtils.DateTimeToJSONDate( Fhrsolicitacao)));
   LHorario.AddPair( 'liquidacao',  TJSONString.Create( TInfraUtils.DateTimeToJSONDate( Fhrliquidacao)));

   LJSON.AddPair( 'horario',        LHorario);
   LJSON.AddPair( 'status',         TJSONString.Create( Fstatus));
   LJSON.AddPair( 'motivo',         TJSONString.Create( Fmotivo));

   Result := LJSON;
end;

function TPixDevolucao.ToStrJSON: String;
Var LJSON:TJSONObject;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

function TPixDevolucao.valor: double;
begin
   Result := Fvalor;
end;

function TPixDevolucao.valor(aValue: double): IPixDevolucao;
begin
   Result := Self;
   Fvalor := aValue;
end;

{ TPixDevolucaoLst }

function TPixDevolucaoLst.Add(aValue: IPixDevolucao): IPixDevolucaoLst;
begin
   Result := Self;
   FItens.Add( aValue);
end;

function TPixDevolucaoLst.Clear: IPixDevolucaoLst;
begin
   Result := Self;
   FItens.Clear;
end;

function TPixDevolucaoLst.Count: Integer;
begin
   Result := FItens.Count;
end;

constructor TPixDevolucaoLst.Create;
begin
   FItens := TList<IPixDevolucao>.Create;

end;

destructor TPixDevolucaoLst.Destroy;
begin
   FreeAndNil( FItens);
   inherited;
end;

function TPixDevolucaoLst.FromJSON(aValue: String): IPixDevolucaoLst;
Var I:Integer;
    LJSON:TJSONArray;
    LItem:IPixDevolucao;
begin
   Result := Self;
   try
      Clear;
      LJSON := TJSONArray( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));

      for I := 0 to Pred( LJSON.Size) do
         LItem := TPixDevolucao.New
                    .FromJSON( LJSON.Get( I).ToString);
   finally
      FreeAndNil( LJSON);
   end;
end;

class function TPixDevolucaoLst.New: IPixDevolucaoLst;
begin
   Result := Self.Create;
end;

function TPixDevolucaoLst.ToJSON: TJSONArray;
Var LJSON:TJSONArray;
    I:Integer;
begin
   LJSON := TJSONArray.Create;

   for I := 0 to Pred( FItens.Count) do
      LJSON.AddElement( FItens.Items[ I].ToJSON);

   Result := LJSON;
end;

function TPixDevolucaoLst.ToStrJSON: String;
Var LJSON:TJSONArray;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

{ TPix }

constructor TPix.Create;
begin
   Fpagador    := TPixPessoa.New;
   Fdevolucoes := TPixDevolucaoLst.New;
end;

destructor TPix.Destroy;
begin

  inherited;
end;

function TPix.devolucoes: IPixDevolucaoLst;
begin
   Result := Fdevolucoes;
end;

function TPix.endToEndId(aValue: string): IPix;
begin
   Result := Self;
   FendToEndId := aValue;
end;

function TPix.endToEndId: string;
begin
   Result := FendToEndId;
end;

function TPix.FromJSON(aValue: String): IPix;
Var LJSON:TJSONObject;
begin
   try
      LJSON := TJSONObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));

      FendToEndId  := Get( LJSON, 'endToEndId').Value;
      Ftxid        := Get( LJSON, 'txId').Value;
      Fvalor       := StrToFloat( Get( LJSON, 'valor').Value);
      Fhorario     := TInfraUtils.JSONDateToDateTime( Get( LJSON, 'endToEndId').Value);
      Fpagador.FromJSON( Get( LJSON, 'pagador').ToString);
      FinfoPagador := Get( LJSON, 'infoPagador').Value;
      Fdevolucoes.FromJSON( Get( LJSON, 'devolucoes').ToString);

   finally
      FreeAndNil( LJSON);
   end;
end;

function TPix.horario: TDateTime;
begin
   Result := Fhorario;
end;

function TPix.horario(aValue: TDateTime): IPix;
begin
   Result := Result;
   Fhorario := aValue;
end;

function TPix.infoPagador(aValue: string): IPix;
begin
   Result := Result;
   FinfoPagador := aValue;
end;

function TPix.infoPagador: string;
begin
   Result := Finfopagador;
end;

class function TPix.New: IPix;
begin
   Result := Self.Create;
end;

function TPix.pagador: IPixPessoa;
begin
   Result := Fpagador;
end;

function TPix.ToJSON: TJSONObject;
Var LJSON:TJSONObject;
begin
   LJSON := TJSONObject.Create;
   LJSON.AddPair( 'endtoEndId',  TJSONString.Create( FendToEndId));
   LJSON.AddPair( 'txId',        TJSONString.Create( Ftxid));
   LJSON.AddPair( 'valor',       TJSONNumber.Create( Fvalor));
   LJSON.AddPair( 'horario',     TJSONString.Create( TInfraUtils.DateTimeToJSONDate( Fhorario)));
   LJSON.AddPair( 'pagador',     Fpagador.ToJSON);
   LJSON.AddPair( 'infoPagador', TJSONString.Create( FinfoPagador));
   LJSON.AddPair( 'devolucoes',  Fdevolucoes.ToJSON);

   Result := LJSON;
end;

function TPix.ToStrJSON: String;
Var LJSON:TJSONObject;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

function TPix.txid: string;
begin
   Result := Ftxid;
end;

function TPix.txid(aValue: string): IPix;
begin
   Result := Result;
   Ftxid := aValue;
end;

function TPix.valor: double;
begin
   Result := Fvalor;
end;

function TPix.valor(aValue: double): IPix;
begin
   Result := Result;
   Fvalor := aValue;
end;

{ TPixLst }

function TPixLst.Add(aValue: IPix): IPixLst;
begin
   Result := Self;
   FItens.Add( aValue);
end;

function TPixLst.Clear: IPixLst;
begin
   FItens.Clear;
   FItens.TrimExcess;
end;

function TPixLst.Count: Integer;
begin
   Result := FItens.Count;
end;

constructor TPixLst.Create;
begin
   FItens := TList<IPix>.Create;

end;

destructor TPixLst.Destroy;
begin
   FreeAndNil( FItens);
   inherited;
end;

function TPixLst.FromJSON(aValue: String): IPixLst;
Var I:Integer;
    LJSON:TJSONArray;
    LItem:IPix;
begin
   Result := Self;
   try
      Clear;
      LJSON := TJSONArray( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));

      for I := 0 to Pred( LJSON.Size) do
         LItem := TPix.New
                    .FromJSON( LJSON.Get( I).ToString);
   finally
      FreeAndNil( LJSON);
   end;
end;

class function TPixLst.New: IPixLst;
begin
   Result := Self.Create;
end;

function TPixLst.ToJSON: TJSONArray;
Var LJSON:TJSONArray;
    I:Integer;
begin
   LJSON := TJSONArray.Create;

   for I := 0 to Pred( FItens.Count) do
      LJSON.AddElement( FItens.Items[ I].ToJSON);

   Result := LJSON;
end;

function TPixLst.ToStrJSON: String;
Var LJSON:TJSONArray;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

{ TPixErro }

constructor TPixErro.Create;
begin

end;

destructor TPixErro.Destroy;
begin

  inherited;
end;

function TPixErro.detail: string;
begin
   Result := Fdetail;
end;

function TPixErro.detail(aValue: string): IPixErro;
begin
   Result := Self;
   Fdetail := aValue;
end;

function TPixErro.FromJSON(aValue: String): IPixErro;
Var LJSON:TJSONObject;
begin
   try
      Result := Self;
      LJSON  := TJsonObject( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));

      Ftype   := Get( LJSON, 'type').value;
      Ftitle  := Get( LJSON, 'title').value;
      Fstatus := StrToInt( Get( LJSON, 'status').Value);
      Fdetail := Get( LJSON, 'details').value;
   finally
      FreeAndNil( LJSON);
   end;
end;

class function TPixErro.New: IPixErro;
begin
   Result := Self.Create;
end;

function TPixErro.status: integer;
begin
   Result := Fstatus;
end;

function TPixErro.status(aValue: integer): IPixErro;
begin
   Result := Self;
   Fstatus := aValue;
end;

function TPixErro.title(aValue: string): IPixErro;
begin
   Result := Self;
   Ftitle := aValue;
end;

function TPixErro.title: string;
begin
   Result := Ftitle;
end;

function TPixErro.ToJSON: TJSONObject;
Var LJSON:TJSONObject;
begin
   LJSON := TJSONObject.Create;
   LJSON.AddPair( 'type',   TJSONString.Create( Ftype));
   LJSON.AddPair( 'title',  TJSONString.Create( Ftitle));
   LJSON.AddPair( 'status', TJSONNumber.Create( Fstatus));
   LJSON.AddPair( 'detail', TJSONString.Create( Fdetail));

   Result := LJSON;
end;

function TPixErro.ToStrJSON: String;
Var LJSON:TJSONObject;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

function TPixErro.type_: string;
begin
   Result := Ftype;
end;

function TPixErro.type_(aValue: string): IPixErro;
begin
   Result := Self;
   Ftype := aValue;
end;

{ TPixErroLst }

function TPixErroLst.Add(aValue: IPixErro): IPixErroLst;
begin
   Result := Self;
   FItens.Add( aValue);
end;

function TPixErroLst.Clear: IPixErroLst;
begin
   Fitens.Clear;
   FItens.TrimExcess;
end;

function TPixErroLst.Count: Integer;
begin
   Result := Fitens.Count;
end;

constructor TPixErroLst.Create;
begin
   FItens := TList<IPixErro>.Create;

end;

destructor TPixErroLst.Destroy;
begin
   FreeAndNil( FItens);
   inherited;
end;

function TPixErroLst.FromJSON(aValue: String): IPixErroLst;
Var I:Integer;
    LJSON:TJSONArray;
    LItem:IPix;
begin
   Result := Self;
   try
      Clear;
      LJSON := TJSONArray( TJSONObject.ParseJSONValue( TEncoding.ASCII.GetBytes( aValue),0));

      for I := 0 to Pred( LJSON.Size) do
         LItem := TPix.New
                    .FromJSON( LJSON.Get( I).ToString);
   finally
      FreeAndNil( LJSON);
   end;
end;

class function TPixErroLst.New: IPixErroLst;
begin
   Result := Self.Create;
end;

function TPixErroLst.ToJSON: TJSONArray;
Var LJSON:TJSONArray;
    I:Integer;
begin
   LJSON := TJSONArray.Create;

   for I := 0 to Pred( FItens.Count) do
      LJSON.AddElement( FItens.Items[ I].ToJSON);

   Result := LJSON;
end;

function TPixErroLst.ToStrJSON: String;
Var LJSON:TJSONArray;
begin
   try
      LJSON := ToJSON;
      Result := LJSON.ToString;

   finally
      FreeAndNil( LJSON);
   end;
end;

end.
