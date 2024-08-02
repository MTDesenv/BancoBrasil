unit BancoBrasil.Helpers;

interface

uses System.SysUtils,
     System.JSON,

     BancoBrasil.Types;

  function Get( const JSON:TJSONObject; const PairName: UnicodeString): TJSONPair; overload;
  function TipoDescontoToStr( aValue:TPixTipoPessoa):String;

implementation

function Get( const JSON:TJSONObject; const PairName: UnicodeString): TJSONPair; overload;
var Candidate: TJSONPair;
    I: Integer;
begin
  for i := 0 to JSON.Size - 1 do
  begin
     Candidate := JSON.Get(i);

     if ( Candidate.JsonString.Value = PairName) then
        Exit( Candidate);
  end;

  Result := TJSONPair.Create( PairName, TJSONNull.Create);
end;

function TipoDescontoToStr( aValue:TPixTipoPessoa):String;
begin

end;

end.
