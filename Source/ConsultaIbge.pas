unit ConsultaIbge;

interface

 uses  Classes, SysUtils, contnrs, HTTPApp, IdHTTP, XMLDoc, XMLIntf, ActiveX,StreamFunctions.Model;

 type IConsultaIbge= interface

   procedure setMunicipioConsulta(aMunicipio,aUf: string);
   function getfArea: Double;
   function getfCodMunicio: Integer;
   function getfCodUF: Integer;
   function getfMunicipio: String;
   property Municipio  : String  read getfMunicipio ;
   property CodMunicio : Integer read getfCodMunicio;
   property CodUF      : Integer read getfCodUF ;
   property Area       : Double  read getfArea  ;

 end;

 type TConsultaIbge= Class( TInterfacedObject, IConsultaIbge )

   private
   {Private declaration}
    FLink: String;
    fCodUF: Integer;
    fUF: String;
    fCodMunicio: Integer;
    fMunicipio: String;
    fArea: Double;
    fOnBuscaCaregada: TNotifyEvent;
    FStreamFunctions: iStreamFunction;
    function getfArea: Double;
    function getfCodMunicio: Integer;
    function getfCodUF: Integer;
    function getfMunicipio: String;

   protected
   {Protected declaration}
   public
   {Public declaration declaration}
   procedure setMunicipioConsulta(aMunicipio,aUf: string);
   procedure ExecutaPesquisa;
     constructor Create; (*Metodos do Constructor*)
     destructor Destroy; override;

   published
   {Protected declaration}
      property Municipio  : String  read getfMunicipio ;
      property CodMunicio : Integer read getfCodMunicio;

      property CodUF      : Integer read getfCodUF ;
      property Area       : Double  read getfArea  ;
      property OnBuscaCaregada : TNotifyEvent read fOnBuscaCaregada write fOnBuscaCaregada ;
   end;

implementation

{ TConsultaIbge }



constructor TConsultaIbge.Create;
begin

  fArea       := 0 ;
  fMunicipio  := '';
  fCodMunicio := 0 ;
  fUF         := '';
  fCodUF      := 0 ;
  FStreamFunctions:= TStreamFunction.Create;
end;

destructor TConsultaIbge.Destroy;
begin
  inherited;

end;

procedure TConsultaIbge.ExecutaPesquisa;
begin

end;

function TConsultaIbge.getfArea: Double;
begin
 Result:= fArea;
end;

function TConsultaIbge.getfCodMunicio: Integer;
begin
 Result:= self.fCodMunicio;
end;

function TConsultaIbge.getfCodUF: Integer;
begin
 Result:= CodUF;
end;


function TConsultaIbge.getfMunicipio: String;
begin
 Result:= fMunicipio;
end;

procedure TConsultaIbge.setMunicipioConsulta(aMunicipio,aUf: string);
 var Fbuffer: TstringList; Process: TIDHttp;
begin
 Process := TIdHTTP.Create;
 Process.Request.Accept := 'text/html, */*';
 Process.Request.UserAgent := 'Mozilla/3.0 (compatible; IndyLibrary)';
// Process.Request.ContentType := 'application/x-www-form-urlencoded';
 Process.HandleRedirects := True;

 Fbuffer := TstringList.Create;
 Flink:= 'view-source:https://ww2.ibge.gov.br/home/geociencias/areaterritorial/area.php?nome='
                 +aMunicipio+'&codigo=&submit.x=0&submit.y=0';

 Fbuffer.Text:= Process.Get(Flink);



end;

end.
