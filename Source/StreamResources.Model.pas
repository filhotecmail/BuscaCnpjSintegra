unit StreamResources.Model;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, MSHTML, ActiveX,IdTCPConnection,
  IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL,Wininet,URLMon,Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TStreamResources = class(TForm)
    WebBrowser1: TWebBrowser;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StreamResourcesHtml: TStreamResources;

implementation

{$R *.dfm}



end.
