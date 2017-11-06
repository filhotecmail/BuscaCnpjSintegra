unit ConsultaTesteFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw, ACBrBase,
  ACBrSocket, ACBrConsultaCNPJ, ConsultaSintegra;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Edit1: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    EdRazao: TEdit;
    Label3: TLabel;
    EdtCnpj: TEdit;
    Label4: TLabel;
    EdEndereco: TEdit;
    Label5: TLabel;
    EdNumero: TEdit;
    EdComplemento: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EdMunicipio: TEdit;
    Label8: TLabel;
    EdCep: TEdit;
    Label9: TLabel;
    EdEstado: TEdit;
    Label10: TLabel;
    EdtIE: TEdit;
    Label11: TLabel;
    EdtBairro: TEdit;
    Label12: TLabel;
    EdtUf: TEdit;
    Label13: TLabel;
    EdtAtividade: TEdit;
    Label14: TLabel;
    EdtRegime: TEdit;
    Label15: TLabel;
    EdtDataObrigatoriedade: TEdit;
    Label16: TLabel;
    EdtIndice: TEdit;
    Label17: TLabel;
    Button3: TButton;
    ComboBox1: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Consulta: TConsultaSintegra;
   procedure AfterExecute( Sender: Tobject );
   procedure AfterLoadingStream( sender: TObject );

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.AfterExecute(Sender: Tobject);
begin
 EdRazao.Text    := Consulta.RazaoSocial;
 EdEndereco.Text := Consulta.Logadouro;
 EdtIE.Text      := Consulta.InscricaoEstadual;
 EdtCnpj.Text    := Consulta.Cnpj;
 EdNumero.Text   := Consulta.Numero;
 EdComplemento.Text := Consulta.complemento;
 EdMunicipio.Text   := Consulta.Municipio;
 EdCep.Text            := Consulta.Cep;
 EdEstado.Text         := Consulta.estado;
 Self.EdtUf.Text       := Consulta.Uf;
 EdtBairro.Text        := Consulta.Bairro;
 Self.EdtAtividade.Text:= Consulta.AtividadeEconomica;
 Self.EdtRegime.Text   := Consulta.Regime;
 Self.EdtDataObrigatoriedade.Text := Datetostr(Consulta.DataCredenciamento);
 Self.EdtIndice.Text := Consulta.Indice;
end;

procedure TForm1.AfterLoadingStream(sender: TObject);
begin
 Image1.Picture.Assign( Consulta.ReadImageCaptcha.Picture );

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   Consulta.Captcha:= Edit1.Text;
   Consulta.Cnpj_Imput:= Edit2.Text;
   Consulta.Execute;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 Consulta.AtualizaCatpcha;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
    Consulta:= TConsultaSintegra.Create(nil);
    Consulta.AfterExecute:= AfterExecute;
    Consulta.AfterLoadingStream:= AfterLoadingStream;
    Consulta.Ufin:= ComboBox1.ItemIndex;
end;

end.
