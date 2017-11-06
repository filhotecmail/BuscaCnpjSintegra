unit ConsultaSintegra;

interface

uses classes, Variants, sysUtils, MSHTML, ActiveX, IdTCPConnection,
  IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, Wininet, Vcl.OleCtrls, SHDocVw, Windows, Forms, Vcl.Graphics,
  Vcl.Controls, Vcl.Dialogs, URLMon, JPeg, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Winapi.Messages;

type TAfterExecute = procedure(sender: tobject) of object;
type TAfterLoadingStream = procedure(sender: tobject) of Object;

const
  URL_Sintegra: array [0 .. 25] of String =
    ('http://sefaznet.ac.gov.br/sefazonline/servlet/sintegraconsulta',
    'http://www.sefaz.al.gov.br/asp/sintegra/sintegra.asp?estado=AL',
    'http://www.sintegra.ap.gov.br/',
    'http://www.sefaz.am.gov.br/sintegra/sintegra0.asp',
    'http://www.sefaz.ba.gov.br/Sintegra/sintegra.asp?estado=BA',
    'http://www.sefaz.ce.gov.br/Sintegra/Sintegra.Asp?estado=CE',
    'http://www.fazenda.df.gov.br/area.cfm?id_area=110',
    'http://www.sintegra.es.gov.br/',
    'http://www.sefaz.go.gov.br/sintegra/sintegra.asp',
    'http://sistemas.sefaz.ma.gov.br/sintegra/jsp/consultaSintegra/consultaSintegraFiltro.jsf',
    'http://www.sefaz.mt.gov.br/sid/consulta/infocadastral/consultar/publica',
    'https://servicos.efazenda.ms.gov.br/consultacci',
    'http://consultasintegra.fazenda.mg.gov.br/sintegra/',
    'https://app.sefa.pa.gov.br/Sintegra/',
    'http://sintegra.receita.pb.gov.br/sintegra/sintegra.asp?estado=pb',
    'http://www.sintegra.fazenda.pr.gov.br/sintegra/',
    'http://www.sintegra.sefaz.pe.gov.br/',
    'http://web.sintegra.sefaz.pi.gov.br/',
    'http://www.fazenda.rj.gov.br/projetoCPS',
    'http://ww3.set.rn.gov.br/sintegra',
    'http://www.sefaz.rs.gov.br/asp/SEF_root/inf/sintegra_entrada.asp',
    'http://www.sefin.ro.gov.br/sint_consul.asp',
    'http://www.sefaz.rr.gov.br/servicos/sintegra/sintegra.asp',
    'http://sistemas.sef.sc.gov.br/sintegra',
    'http://pfeserv1.fazenda.sp.gov.br/sintegrapfe/consultaSintegraServlet',
    'http://www.sefaz.se.gov.br/sintegra');

type
  TUFin = (AC, AL, AP, AM, BA, CE, DF, ES, GO, MA, MT, MS, MG, PA, PB, PR, PE,
    PI, RJ, RN, RS, RO, RR, SC, SP, SE);
//---------------------------------------------------------------------------------------------------------------------
type
  iEstadosWebForm = Interface
    ['{900F068C-2498-40A6-8AEA-A5AFA4FB5BD5}']
    Function VerificaWebFormEstados(aTwebBrowse: TWebBrowser; aUf: TUFin;
      aImage: TImage; aCatpta_Imput, aCnpj_Imput: String): Boolean;
  End;

type
  TEstadosWebForm = Class(TinterfacedObject, iEstadosWebForm)

  Private
    { Protected declaration }
    procedure WebFormSetFieldValue(const document: IHTMLDocument2;
      const formNumber: integer; const fieldName, newValue: string);
    function WebFormNames(const document: IHTMLDocument2): TStringList;
    function VerificaWebFormEstados(aTwebBrowse: TWebBrowser; aUf: TUFin;
      aImage: TImage; aCatpta_Imput, aCnpj_Imput: String): Boolean;
    function WebFormGet(const formNumber: integer;
      const document: IHTMLDocument2): IHTMLFormElement;
    procedure WebFormSubmit(const document: IHTMLDocument2;
      const formNumber: integer);
  end;
//---------------------------------------------------------------------------------------------------------------------

type
  iConsultaSintegra = interface
    ['{D16A5317-F616-4963-BB1A-A5D7838C260F}']

    function getcnpjPesquisar: string;
    procedure setcnpjPesquisar(const Value: string);
    function getCaptchaInput: string;
    procedure setCaptchaInput(const Value: string);
    function getTUFin: Integer;
    function getUrlWebServices: String;
    procedure setUrlWebServices(const Value: String);
    procedure setTUfin(const Value: Integer);
    function DownloadFile(Source, Dest: string): Boolean;
    function GetImageCaptcha: string;
    procedure SetImagemCaptcha(const Value: string);

    function getCnpj_Imput: string;
    procedure setCnpj_Imput(const Value: string);

    property ImageCatchaOUtP: string read GetImageCaptcha
      write SetImagemCaptcha;
    property Cnpjinput: string read getcnpjPesquisar write setcnpjPesquisar;
    property Captcha: string read getCaptchaInput write setCaptchaInput;
    property UfinInput: Integer read getTUFin write setTUfin;
    property Url_WebServicesInput: String read getUrlWebServices
      write setUrlWebServices;
    property Cnpj_Imput: string read getCnpj_Imput write setCnpj_Imput;
    procedure Execute;
    function getCnpjRetorno: string;
    procedure setCnpjRetorno(const Value: string);
    property Cnpj: string read getCnpjRetorno write setCnpjRetorno;
    function getRazao: String;
    function getLogadouro: string;
    property RazaoSocial: String read getRazao;
    property Logadouro: string read getLogadouro;
    function getFCaptchaStream: TStream;
    property CaptchaStream: TStream read getFCaptchaStream;
    function getTAfterLoadingStream: TAfterLoadingStream;
    procedure setTAfterLoadingStream(const Value: TAfterLoadingStream);
    property AfterLoadingStream: TAfterLoadingStream read getTAfterLoadingStream
      write setTAfterLoadingStream;
    function getAfterExecute: TAfterExecute;
    procedure setFAfterExecute(const Value: TAfterExecute);
    property AfterExecute: TAfterExecute Read getAfterExecute
      Write setFAfterExecute;
    Function ReadImageCaptcha: TImage;
    function getInscricaoEstadual: string;
    procedure setInscricaoEstadual(const Value: string);
    property InscricaoEstadual: string read getInscricaoEstadual
      write setInscricaoEstadual;
    function getbairro: string;
    function getComplemento: string;
    function getEstado: string;
    function getMunicipio: string;
    function getNumero: String;
    function getCep: string;
    function getUf: string;
    function getFAtividade: string;
    function getFRegime: string;
    function GetFantasia: String;
    procedure SetFantasia(const Value: String);
    property Numero: String read getNumero;
    property Complemento: string read getComplemento;
    property Bairro: string read getbairro;
    property Estado: string read getEstado;
    property Municipio: string read getMunicipio;
    property Cep: string read getCep;
    property Uf: string read getUf;
    property AtividadeEconomica: string read getFAtividade;
    property Regime: string read getFRegime;
    function getFDataCredenciamento: TDate;
    property DataCredenciamento: TDate read getFDataCredenciamento;
    function getIndiceOrigatoriedade: String;
    property Indice: String read getIndiceOrigatoriedade;
    procedure AtualizaCatpcha;
    property NomeFantasia: String read GetFantasia write SetFantasia;
  end;

 	{$IFDEF RTL230_UP}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  {$ENDIF RTL230_UP}
type
  TConsultaSintegra = class(TComponent, iConsultaSintegra)
  private
    FUrlWebServices: String;
    FTUFin: Integer;
    FCaptchaInput: string;
    FcnpjPesquisarinput: string;
    FImageCaptcha: string;
    FCnpj_Imput: string;
    Fnpj_out: string;
    FIe_Out: string;
    FFantasia: String;
    FNome: String;
    FEndereco: String;
    FNumero: string;
    FComp: String;
    FBairro: String;
    FCidade: String;
    FCep: string;
    FReaderTagsNow: Boolean;
    FAfterExecute: TAfterExecute;
    FCaptchaStream: TStream;
    FAfterLoadingStream: TAfterLoadingStream;
    FImageConvCapctha: TImage;
    FAtividade: string;
    Fuf: string;
    FEstado: String;
    FRegime: string;
    FDataCredenciamento: TDate;
    FIndice: string;
    FEstadosWebForm: iEstadosWebForm;
    function getcnpjPesquisar: string;
    procedure setcnpjPesquisar(const Value: string);
    function getCaptchaInput: string;
    procedure setCaptchaInput(const Value: string);
    function getTUFin: Integer;
    function getUrlWebServices: String;
    procedure setUrlWebServices(const Value: String);
    procedure setTUfin(const Value: Integer);
    function GetImageCaptcha: string;
    procedure SetImagemCaptcha(const Value: string);
    function getCnpj_Imput: string;
    procedure setCnpj_Imput(const Value: string);
    function getCnpjRetorno: string;
    procedure setCnpjRetorno(const Value: string);
    procedure setFAfterExecute(const Value: TAfterExecute);
    function getAfterExecute: TAfterExecute;
    function getRazao: String;
    procedure SetRazao(const Value: String);
    function getLogadouro: string;
    procedure setLogadouro(const Value: string);
    function getFCaptchaStream: TStream;
    procedure setFCaptchaStream(const Value: TStream);
    function getTAfterLoadingStream: TAfterLoadingStream;
    procedure setTAfterLoadingStream(const Value: TAfterLoadingStream);

    function getInscricaoEstadual: string;
    procedure setInscricaoEstadual(const Value: string);
    function getbairro: string;
    function getComplemento: string;
    function getEstado: string;
    function getMunicipio: string;
    function getNumero: String;
    function getCep: string;
    procedure setNumero(const Value: String);
    function getFAtividade: string;
    function getUf: string;
    function getFRegime: string;
    function getFDataCredenciamento: TDate;
    function getIndiceOrigatoriedade: String;
    Function RetornaEstadobyUf(aUf: String): String;
    procedure CarregaDocumentHtml;
    function GetFantasia: String;
    procedure SetFantasia(const Value: String);
   property Url_WebServices: String read getUrlWebServices write setUrlWebServices;

   procedure ReaderonTagsFromWebDocument;
   procedure ReaderTagsFromHtmlDcument;
   property CaptchaStream: TStream read getFCaptchaStream write setFCaptchaStream;
  published

    property Cnpjinput: string read getcnpjPesquisar write setcnpjPesquisar;
    property Ufin: Integer read getTUFin write setTUfin;
    property ImageCatchaOUtP: string read GetImageCaptcha write SetImagemCaptcha;
    procedure DonwLoadCompleted(sender: tobject);
    function DownloadFile(Source, Dest: string): Boolean;
    property Cnpj_Imput: string read getCnpj_Imput write setCnpj_Imput;
    property Cnpj: string read getCnpjRetorno write setCnpjRetorno;

    procedure DocumentComplete(ASender: tobject; const pDisp: IDispatch; const URL: OleVariant);
    procedure onAfterLoadingStream(sender: tobject); Overload;
    property AfterLoadingStream: TAfterLoadingStream read getTAfterLoadingStream write setTAfterLoadingStream;
    procedure OnAfterExecute(sender: tobject); Overload;
    property AfterExecute: TAfterExecute Read getAfterExecute Write setFAfterExecute;
    property RazaoSocial: String read getRazao write SetRazao;
    property Logadouro: string read getLogadouro write setLogadouro;
    property InscricaoEstadual: string read getInscricaoEstadual write setInscricaoEstadual;
    property Numero: String read getNumero write setNumero;
    property Complemento: string read getComplemento;
    property Bairro: string read getbairro;
    property Estado: string read getEstado;
    property Municipio: string read getMunicipio;
    property Cep: string read getCep;
    property AtividadeEconomica: string read getFAtividade;
    property Uf: string read getUf;
    property Regime: string read getFRegime;
    property DataCredenciamento: TDate read getFDataCredenciamento;
    property Indice: String read getIndiceOrigatoriedade;
    property Captcha: string read getCaptchaInput write setCaptchaInput;

    property NomeFantasia: String read GetFantasia write SetFantasia;
    procedure AtualizaCatpcha;
    function ReadImageCaptcha: TImage;
    procedure Execute;
  public
    constructor Create(AOwner: TComponent); override;
  end;
  // ---------------------------------------------------------------------------------------------------------------------

implementation

{ TConsultaSintegra }

uses StreamResources.Model;

procedure Register;
begin

  RegisterComponents('Samples', [TConsultaSintegra]);

end;


procedure TConsultaSintegra.AtualizaCatpcha;
var
  doc: IHTMLDocument2;
  img: OleVariant;
  images: IEnumVARIANT;
  Fetched: Cardinal;
  loStr: string;
  Lista: TStringList;
  Source, Dest: string;
  i: integer;
  achei: Boolean;

  function DownloadFile(SourceFile, DestFile: string): Boolean;
  const
    BufferSize = 1024;
  var
    hSession, hURL: HInternet;
    Buffer: array [1 .. BufferSize] of Byte;
    BufferLen: DWORD;
    f: File;
    sAppName: string;
  begin
    sAppName := ExtractFileName(Application.ExeName);
    hSession := InternetOpen(PChar(sAppName), INTERNET_OPEN_TYPE_PRECONFIG,
      nil, nil, 0);
    try
      hURL := InternetOpenURL(hSession, PChar(SourceFile), nil, 0, 0, 0);
      try
        AssignFile(f, DestFile);
        Rewrite(f, 1);
        repeat
          InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
          BlockWrite(f, Buffer, BufferLen)
        until BufferLen = 0;
        CloseFile(f);
        Result := True;
      finally
        InternetCloseHandle(hURL)
      end
    finally
      InternetCloseHandle(hSession)
    end;
  end;

begin

  FImageConvCapctha := TImage.Create(Nil);
  begin
    for i := 0 to StreamResourcesHtml.WebBrowser1.OleObject.document.images.
      Length - 1 do
    begin
      Source := StreamResourcesHtml.WebBrowser1.OleObject.document.images.
        Item(i).Src;
      if (Pos('key', Source) > 0) OR (Pos('captcha', Source) > 0) then
      begin
        Dest := ExtractFilePath(ParamStr(0)) + 'captcha.jpg';
        DownloadFile(Source, Dest);
        FImageConvCapctha.Picture.LoadFromFile(Dest);
        onAfterLoadingStream( nil );
        // imgJpg.Free;

        achei := True;
      end;
    end;
  end;
  StreamResourcesHtml.FreeOnRelease;
  FImageConvCapctha.FreeOnRelease;

end;

procedure TConsultaSintegra.CarregaDocumentHtml;
begin
  // FDoc.NavigatorDocument.OnDownloadComplete := DonwLoadCompleted;
  if not assigned(StreamResourcesHtml) then
  begin

    StreamResourcesHtml := TStreamResources.Create(Application);

    FReaderTagsNow := False;
    StreamResourcesHtml.Show;
    try
      StreamResourcesHtml.WebBrowser1.OnDocumentComplete := DocumentComplete;
      StreamResourcesHtml.WebBrowser1.OnDownloadComplete := DonwLoadCompleted;
      StreamResourcesHtml.WebBrowser1.Navigate2(self.FUrlWebServices);
    finally
      StreamResourcesHtml.Close;
    end;
    // FrmConsulta.CaptchaStream.Picture.Bitmap.SaveToStream(FImageCaptcha) ;
  end;
  self.FImageCaptcha := ExtractFilePath(ParamStr(0)) + 'captcha.jpg';
end;

constructor TConsultaSintegra.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TConsultaSintegra.DocumentComplete(ASender: tobject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  ReaderTagsFromHtmlDcument;
end;

procedure TConsultaSintegra.DonwLoadCompleted(sender: tobject);
begin
 AtualizaCatpcha;
end;

function TConsultaSintegra.DownloadFile(Source, Dest: string): Boolean;
begin
  try
    Result := UrlDownloadToFile(nil, PChar(Source), PChar(Dest), 0, nil) = 0;
  except
    Result := False;
  end;
end;

procedure TConsultaSintegra.Execute;
begin

  if trim(self.FCnpj_Imput) <> '' then
  begin

   if not assigned(FEstadosWebForm) then
   begin
       FEstadosWebForm := TEstadosWebForm.Create;
   end;

   try
   FEstadosWebForm.VerificaWebFormEstados(StreamResourcesHtml.WebBrowser1,TUFin(FTUFin),
      FImageConvCapctha,FCaptchaInput,FCnpj_Imput);
   finally
    ReaderonTagsFromWebDocument;
   end;
  end else
  raise exception.Create('Campo Cnpj não pode ser vazio');


end;

function TConsultaSintegra.getAfterExecute: TAfterExecute;
begin
  Result := self.FAfterExecute;
end;

function TConsultaSintegra.getbairro: string;
begin
  Result := FBairro;
end;

function TConsultaSintegra.getCaptchaInput: string;
begin
  Result := FCaptchaInput;
end;

function TConsultaSintegra.getCep: string;
begin
  Result := FCep;
end;

function TConsultaSintegra.getcnpjPesquisar: string;
begin
  Result := FcnpjPesquisarinput;
end;

function TConsultaSintegra.getCnpjRetorno: string;
begin
  Result := self.Fnpj_out;
end;

function TConsultaSintegra.getCnpj_Imput: string;
begin
  Result := FCnpj_Imput;
end;

function TConsultaSintegra.getComplemento: string;
begin
  Result := FComp;
end;

function TConsultaSintegra.getEstado: string;
begin
  Result := self.FEstado;
end;

function TConsultaSintegra.GetFantasia: String;
begin
 Result:= FFantasia;
end;

function TConsultaSintegra.getFAtividade: string;
begin
  Result := FAtividade;
end;

function TConsultaSintegra.getFCaptchaStream: TStream;
begin
  Result := FCaptchaStream;
end;

function TConsultaSintegra.getFDataCredenciamento: TDate;
begin
  Result := self.FDataCredenciamento;
end;

function TConsultaSintegra.getFRegime: string;
begin
  Result := self.FRegime;
end;

function TConsultaSintegra.GetImageCaptcha: String;
begin
  Result := self.FImageCaptcha;
end;

function TConsultaSintegra.getIndiceOrigatoriedade: String;
begin
  Result := self.FIndice;
end;

function TConsultaSintegra.getInscricaoEstadual: string;
begin
  Result := FIe_Out;
end;

function TConsultaSintegra.getLogadouro: string;
begin
  Result := FEndereco;
end;

function TConsultaSintegra.getMunicipio: string;
begin
  Result := FCidade;
end;

function TConsultaSintegra.getNumero: String;
begin
  Result := FNumero;
end;

function TConsultaSintegra.getRazao: String;
begin
  Result := FNome;
end;

function TConsultaSintegra.getTAfterLoadingStream: TAfterLoadingStream;
begin
  Result := FAfterLoadingStream;
end;

function TConsultaSintegra.getTUFin: Integer;
begin
  Result := integer(FTUFin);

end;

function TConsultaSintegra.getUf: string;
begin
  Result := Fuf;
end;

function TConsultaSintegra.getUrlWebServices: String;
begin
  Result := FUrlWebServices;
end;

procedure TConsultaSintegra.OnAfterExecute(sender: tobject);
begin
  if assigned(FAfterExecute) then
    FAfterExecute(sender);
end;

procedure TConsultaSintegra.onAfterLoadingStream(sender: tobject);
begin
  if assigned(FAfterLoadingStream) then
    FAfterLoadingStream(sender);
end;

procedure TConsultaSintegra.ReaderonTagsFromWebDocument;
begin
  FReaderTagsNow := True;

end;

procedure TConsultaSintegra.ReaderTagsFromHtmlDcument;
var
  ListInfo: TStringList;
  pagina: IHTMLElement;
  i, x: integer;
begin
  if FReaderTagsNow then
  begin
    if assigned(StreamResourcesHtml.WebBrowser1.document) then
    begin
      pagina := (StreamResourcesHtml.WebBrowser1.document as
        IHTMLDocument2).Body;
      while pagina.ParentElement <> nil do
        pagina := pagina.ParentElement;

      ListInfo := TStringList.Create;
      ListInfo.Text := pagina.get_outertext;
      ListInfo.SaveToFile(ExtractFilePath(ParamStr(0)) + 'pagina.txt');

      for x := 0 to ListInfo.Count - 1 do
      begin
        if Pos('CNPJ:', Trim(ListInfo[x])) > 0 then
        begin // -9 (pos('Inscrição', Trim(ListInfo[x])) )
          Fnpj_out :=
            Trim(copy(Trim(ListInfo[x]), Pos('CNPJ:', Trim(ListInfo[x])) +
            5, 20)); //
          FIe_Out := Trim(copy(Trim(ListInfo[x]), Pos('Inscrição',
            Trim(ListInfo[x])) + 19, Length(Trim(ListInfo[x]))));

          Fnpj_out := StringReplace(Fnpj_out, '.', '', [rfReplaceAll]);
          Fnpj_out := StringReplace(Fnpj_out, '-', '', [rfReplaceAll]);
          Fnpj_out := StringReplace(Fnpj_out, '/', '', [rfReplaceAll]);

          FIe_Out := StringReplace(FIe_Out, '/', '', [rfReplaceAll]);
          FIe_Out := StringReplace(FIe_Out, '.', '', [rfReplaceAll]);
          FIe_Out := StringReplace(FIe_Out, '-', '', [rfReplaceAll]);

          Break;
        end
        else if Pos('encontrado', Trim(ListInfo[x])) > 0 then
        begin
          Break;
          ShowMessage('Não encontrado! tente novamente.');
          // cbxUFSelect(nil);
          Exit;
        end;
      end;

      for x := 0 to ListInfo.Count - 1 do
        if Pos('Social:', Trim(ListInfo[x])) > 0 then
        begin
          FNome := Trim(copy(Trim(ListInfo[x]), Pos('Social:', Trim(ListInfo[x])
            ) + 7, Length(Trim(ListInfo[x]))));
          Break;
        end;

     for x := 0 to ListInfo.Count - 1 do
        if Pos('Nome Fantasia:', Trim(ListInfo[x])) > 0 then
        begin
          FFantasia := Trim(copy(Trim(ListInfo[x]), Pos('Nome Fantasia:', Trim(ListInfo[x])
            ) + 14, Length(Trim(ListInfo[x]))));
            showmessage( FFantasia );
          Break;
        end;

      for x := 0 to ListInfo.Count - 1 do
        if Pos('Logradouro:', Trim(ListInfo[x])) > 0 then
        begin
          FEndereco :=
            Trim(copy(Trim(ListInfo[x]), Pos('Logradouro:', Trim(ListInfo[x])) +
            11, Length(Trim(ListInfo[x]))));
          Break;
        end;

      for x := 0 to ListInfo.Count - 1 do
        if Pos('Número:', Trim(ListInfo[x])) > 0 then
        begin
          FNumero := Trim(copy(Trim(ListInfo[x]),
            Pos('Número:', Trim(ListInfo[x])) + 7, Pos('Complemento:',
            Trim(ListInfo[x])) - 8));
          FComp := Trim(copy(Trim(ListInfo[x]), Pos('Complemento:',
            Trim(ListInfo[x])) + 12, Length(Trim(ListInfo[x]))));

          Break;
        end;
      for x := 0 to ListInfo.Count - 1 do
        if Pos('Bairro:', Trim(ListInfo[x])) > 0 then
        begin
          FBairro := Trim(copy(Trim(ListInfo[x]),
            Pos('Bairro:', Trim(ListInfo[x])) + 7, Length(Trim(ListInfo[x]))));
          Break;
        end;
      for x := 0 to ListInfo.Count - 1 do
        if Pos('Município:', Trim(ListInfo[x])) > 0 then
        begin
          FCidade := Trim(copy(Trim(ListInfo[x]), Pos('Município:',
            Trim(ListInfo[x])) + 10, (Pos('UF:', Trim(ListInfo[x])) - 11)));
          Break;
        end;
      for x := 0 to ListInfo.Count - 1 do
        if Pos('CEP:', Trim(ListInfo[x])) > 0 then
        begin
          FCep := Trim(copy(Trim(ListInfo[x]), Pos('CEP:', Trim(ListInfo[x])) +
            4, Length(Trim(ListInfo[x]))));

          FCep := StringReplace(FCep, '.', '', [rfReplaceAll]);
          FCep := StringReplace(FCep, '-', '', [rfReplaceAll]);
          Break;
        end;
      for x := 0 to ListInfo.Count - 1 do
        if Pos('UF:', Trim(ListInfo[x])) > 0 then
        begin
          Fuf := Trim(copy(Trim(ListInfo[x]), Pos('UF:', Trim(ListInfo[x])) + 3,
            Length(Trim(ListInfo[x]))));
          FEstado := RetornaEstadobyUf(Fuf);
          Break;
        end;
      for x := 0 to ListInfo.Count - 1 do
        if Pos('Atividade Econômica:', Trim(ListInfo[x])) > 0 then
        begin
          self.FAtividade :=
            Trim(copy(Trim(ListInfo[x]), Pos('Atividade Econômica:',
            Trim(ListInfo[x])) + 21, Length(Trim(ListInfo[x]))));
          Break;
        end;
      for x := 0 to ListInfo.Count - 1 do
        if Pos('Regime de Apuração:', Trim(ListInfo[x])) > 0 then
        begin
          self.FRegime :=
            Trim(copy(Trim(ListInfo[x]), Pos('Regime de Apuração:',
            Trim(ListInfo[x])) + 20, Length(Trim(ListInfo[x]))));
          Break;
        end;
      for x := 0 to ListInfo.Count - 1 do
        if Pos('Data de Credenciamento como emissor de NF-e:',
          Trim(ListInfo[x])) > 0 then
        begin
          self.FDataCredenciamento :=
            strtodate(Trim(copy(Trim(ListInfo[x]),
            Pos('Data de Credenciamento como emissor de NF-e:',
            Trim(ListInfo[x])) + 44, Length(Trim(ListInfo[x])))));
          Break;
        end;
      for x := 0 to ListInfo.Count - 1 do
        if Pos('Indicador de Obrigatoriedade de NF-e:', Trim(ListInfo[x])) > 0
        then
        begin
          self.FIndice :=
            Trim(copy(Trim(ListInfo[x]),
            Pos('Indicador de Obrigatoriedade de NF-e:', Trim(ListInfo[x])) +
            37, Length(Trim(ListInfo[x]))));
          Break;
        end;
      OnAfterExecute(self);
      FreeAndNil(ListInfo);

    end;
    FReaderTagsNow := False;

  end;
   StreamResourcesHtml.FreeOnRelease;
end;

function TConsultaSintegra.ReadImageCaptcha: TImage;
begin
  Result := self.FImageConvCapctha;
end;

function TConsultaSintegra.RetornaEstadobyUf(aUf: String): String;
var
  UftoEstado: String;
begin
  if Uf = 'SP' then
    UftoEstado := 'SÃO PAULO'
  else if Uf = 'RO' then
    UftoEstado := 'Rondônia'
  else if Uf = 'AC' then
    UftoEstado := 'ACRE'
  else if Uf = 'AM' then
    UftoEstado := 'Amazonas'
  else if Uf = 'RR' then
    UftoEstado := 'Roraima'
  else if Uf = 'PA' then
    UftoEstado := 'Pará'
  else if Uf = 'AP' then
    UftoEstado := 'Amapá'
  else if Uf = 'TO' then
    UftoEstado := 'Tocantins'
  else if Uf = 'MA' then
    UftoEstado := 'Maranhão'
  else if Uf = 'PI' then
    UftoEstado := 'Piauí'
  else if Uf = 'CE' then
    UftoEstado := 'Ceará'
  else if Uf = 'RN' then
    UftoEstado := 'Rio Grande do Norte'
  else if Uf = 'PB' then
    UftoEstado := 'Paraíba'
  else if Uf = 'PE' then
    UftoEstado := 'Pernambuco'
  else if Uf = 'AL' then
    UftoEstado := 'Alagoas'
  else if Uf = 'SE' then
    UftoEstado := 'Sergipe'
  else if Uf = 'BA' then
    UftoEstado := 'Bahia'
  else if Uf = 'MG' then
    UftoEstado := 'Minas Gerais'
  else if Uf = 'ES' then
    UftoEstado := 'Espírito Santo'
  else if Uf = 'RJ' then
    UftoEstado := 'Rio de Janeiro'
  else if Uf = 'PR' then
    UftoEstado := 'Paraná'
  else if Uf = 'SC' then
    UftoEstado := 'Santa Catarina'
  else if Uf = 'RS' then
    UftoEstado := 'Rio Grande do Sul'
  else if Uf = 'MS' then
    UftoEstado := 'Mato Grosso do Sul'
  else if Uf = 'MT' then
    UftoEstado := 'Mato Grosso'
  else if Uf = 'GO' then
    UftoEstado := 'Goiás'
  else if Uf = 'DF' then
  begin
    UftoEstado := 'Distrito Federal'
  end;
  Result := UftoEstado;

end;

procedure TConsultaSintegra.setCaptchaInput(const Value: string);
begin
  FCaptchaInput := Value;
end;

procedure TConsultaSintegra.setcnpjPesquisar(const Value: string);
begin
  FcnpjPesquisarinput := Value;
end;

procedure TConsultaSintegra.setCnpjRetorno(const Value: string);
begin
  Fnpj_out := Value;
end;

procedure TConsultaSintegra.setCnpj_Imput(const Value: string);
begin
  FCnpj_Imput := Value;
end;

procedure TConsultaSintegra.setFAfterExecute(const Value: TAfterExecute);
begin
  FAfterExecute := Value;
end;

procedure TConsultaSintegra.SetFantasia(const Value: String);
begin
 FFantasia:= Value;
end;

procedure TConsultaSintegra.setFCaptchaStream(const Value: TStream);
begin
  FCaptchaStream := Value;
end;

procedure TConsultaSintegra.SetImagemCaptcha(const Value: string);
begin
  self.FImageCaptcha := Value;
end;

procedure TConsultaSintegra.setInscricaoEstadual(const Value: string);
begin
  FIe_Out := Value;
end;

procedure TConsultaSintegra.setLogadouro(const Value: string);
begin
  self.FEndereco := Value;
end;

procedure TConsultaSintegra.setNumero(const Value: String);
begin
  self.FNumero := Value;
end;

procedure TConsultaSintegra.SetRazao(const Value: String);
begin
  self.FNome := Value;
end;

procedure TConsultaSintegra.setTAfterLoadingStream
  (const Value: TAfterLoadingStream);
begin
  FAfterLoadingStream := Value;
end;

procedure TConsultaSintegra.setTUfin(const Value: Integer);
begin

   if Value = 24 then
   begin
    FTUFin := Value;

    self.FUrlWebServices := WideString(URL_Sintegra[Value]);
    try
      CarregaDocumentHtml;
    except
      on E: Exception do
      begin
        raise Exception.Create
          ('Não foi possível consluir a requisição com o servidor verifique sua conexão');
      end;
    end;
   end else
   raise Exception.Create('Consulta disponível somente para estado de são paulo - SP');

end;

procedure TConsultaSintegra.setUrlWebServices(const Value: String);
begin
  FUrlWebServices := Value;
end;

{ TEstadosWebForm }

function TEstadosWebForm.VerificaWebFormEstados(aTwebBrowse: TWebBrowser;
  aUf: TUFin; aImage: TImage; aCatpta_Imput, aCnpj_Imput: String): Boolean;
var
  x: string;
  Elements: TStringList;
begin

  if aCatpta_Imput <> '' then
  begin

    Elements := WebFormNames(aTwebBrowse.document AS IHTMLDocument2);
    case aUf of
      AC:
        begin
          WebFormSetFieldValue((aTwebBrowse.document AS IHTMLDocument2), 0,
            'cfield', aCatpta_Imput);
          WebFormSetFieldValue((aTwebBrowse.document AS IHTMLDocument2), 0,
            'vNUMDOC', aCnpj_Imput);
        end;
      AL:
        ;
      AP:
        ;
      AM:
        ;
      BA:
        ;
      CE:
        ;
      DF:
        ;
      ES:
        ;
      GO:
        ;
      MA:
        ;
      MT:
        ;
      MS:
        ;
      MG:
        ;
      PA:
        ;
      PB:
        ;
      PR:
        ;
      PE:
        ;
      PI:
        ;
      RJ:
        ;
      RN:
        ;
      RS:
        ;
      RO:
        ;
      RR:
        ;
      SC:
        ;
      SP:
        begin

          WebFormSetFieldValue
            ((StreamResourcesHtml.WebBrowser1.document AS IHTMLDocument2), 0,
            'servico', 'cnpj'); //
          WebFormSetFieldValue
            ((StreamResourcesHtml.WebBrowser1.document AS IHTMLDocument2), 0,
            'Key', aCatpta_Imput); //
          WebFormSetFieldValue
            ((StreamResourcesHtml.WebBrowser1.document AS IHTMLDocument2), 0,
            'cnpj', aCnpj_Imput); //
        end;
      SE:
        ;
    end;
    WebFormSubmit
      ((StreamResourcesHtml.WebBrowser1.document AS IHTMLDocument2), 0);
  end
  else
    raise Exception.Create('Informe o Captcha');

end;

function TEstadosWebForm.WebFormGet(const formNumber: integer;
  const document: IHTMLDocument2): IHTMLFormElement;
var
  Forms: IHTMLElementCollection;
begin
  Forms := document.Forms as IHTMLElementCollection;
  Result := Forms.Item(formNumber, '') as IHTMLFormElement;
end;

function TEstadosWebForm.WebFormNames(const document: IHTMLDocument2)
  : TStringList;
var
  Forms: IHTMLElementCollection;
  form: IHTMLFormElement;
  idx: integer;
begin
  Forms := document.Forms as IHTMLElementCollection;
  Result := TStringList.Create;
  for idx := 0 to -1 + Forms.Length do
  begin
    form := Forms.Item(idx, 0) as IHTMLFormElement;
    Result.Add(form.name);
  end;

end;

procedure TEstadosWebForm.WebFormSetFieldValue(const document: IHTMLDocument2;
  const formNumber: integer; const fieldName, newValue: string);
var
  form: IHTMLFormElement;
  field: IHTMLElement;
begin
  form := WebFormGet(formNumber,
    StreamResourcesHtml.WebBrowser1.document AS IHTMLDocument2);
  field := form.Item(fieldName, '') as IHTMLElement;
  if field = nil then
    Exit;
  if field.tagName = 'INPUT' then
    (field as IHTMLInputElement).Value := newValue;

end;

procedure TEstadosWebForm.WebFormSubmit(const document: IHTMLDocument2;
  const formNumber: integer);
var
  form: IHTMLFormElement;
  field: IHTMLElement;
begin
  form := WebFormGet(formNumber,
    StreamResourcesHtml.WebBrowser1.document AS IHTMLDocument2);
  form.submit;

end;

initialization

finalization

end.
