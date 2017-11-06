unit StreamFunctions.Model;

interface

uses sysUtils;

 type iStreamFunction = interface
   ['{1A47450D-B157-466A-BB05-2D8D9461EB54}']

   procedure LocaizaNextTagfromHtmlString(const AString: String;
  const PosIni: Integer; var ATag: String; var PosTag: Integer);
   Function SubtraiTagsonHtml(const AHTMLString: String): String;

 end;

 type TstreamFunction = Class( TinterfacedObject, iStreamFunction )

   private
   {Private declaration}
   protected
   {Protected declaration}
   public
   {Public declaration declaration}
   function PosEx(const SubStr, S: string; Offset: Integer): Integer;
   procedure LocaizaNextTagfromHtmlString(const AString: String;
  const PosIni: Integer; var ATag: String; var PosTag: Integer);
   Function SubtraiTagsonHtml(const AHTMLString: String): String;
     constructor Create; (*Metodos do Constructor*)
     destructor Destroy; override;

   published
   {Protected declaration}
   end;


implementation

{ TstreamFunction }

constructor TstreamFunction.Create;
begin

end;

destructor TstreamFunction.Destroy;
begin

  inherited;
end;

procedure TstreamFunction.LocaizaNextTagfromHtmlString(const AString: String;
  const PosIni: Integer; var ATag: String; var PosTag: Integer);
var
   PosTagAux, FimTag, LenTag : Integer ;
begin
  ATag   := '';
  PosTag := PosEx( '<', AString, PosIni);
  if PosTag > 0 then
  begin
    PosTagAux := PosEx( '<', AString, PosTag + 1);  // Verificando se Tag é inválida
    FimTag    := PosEx( '>', AString, PosTag + 1);
    if FimTag = 0 then                             // Tag não fechada ?
    begin
      PosTag := 0;
      exit ;
    end ;

    while (PosTagAux > 0) and (PosTagAux < FimTag) do  // Achou duas aberturas Ex: <<e>
    begin
      PosTag    := PosTagAux;
      PosTagAux := PosEx( '<', AString, PosTag + 1);
    end ;

    LenTag := FimTag - PosTag + 1 ;
    ATag   := LowerCase( copy( AString, PosTag, LenTag ) );
  end ;

end;

function TstreamFunction.PosEx(const SubStr, S: string; Offset: Integer): Integer;
begin
 Result := System.Pos(SubStr, S, Offset);
end;

function TstreamFunction.SubtraiTagsonHtml(const AHTMLString: String): String;
var
  ATag, VHTMLString: String;
  PosTag, LenTag: Integer;
begin
  VHTMLString := AHTMLString;
  ATag   := '';
  PosTag := 0;

  LocaizaNextTagfromHtmlString( VHTMLString, 1, ATag, PosTag);
  while ATag <> '' do
  begin
    LenTag := Length( ATag );
    Delete(VHTMLString, PosTag, LenTag);

    ATag := '';
    LocaizaNextTagfromHtmlString( VHTMLString, PosTag, ATag, PosTag );
  end ;
  Result := VHTMLString;

end;

end.
