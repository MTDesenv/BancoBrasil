unit BancoBrasil.Interfaces;

interface

uses System.SysUtils,
     System.JSON,

     infra.Auth.Types,
     Infra.Auth.Interfaces,

     BancoBrasil.Types,
     BancoBrasil.Cobranca.Interfaces,
     BancoBrasil.PIX.Interfaces;

type
   IBancoBrasil = interface
      ['{94D65F27-4C36-4546-81ED-42BD48565146}']
      function Seguranca:ICustomAuth;
      function Cobranca:ICobrancaServices;
      function PIX:IPixServices;
   end;

implementation

end.
