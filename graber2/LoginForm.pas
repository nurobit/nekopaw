unit LoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, cxLabel, cxTextEdit;

type
  TLoginCallBack=procedure(Sender: TObject; N: integer; Login,Password: String;
    const Cancel: boolean) of object;

  TfLogin = class(TForm)
    eLogin: TcxTextEdit;
    lLogin: TcxLabel;
    ePassword: TcxTextEdit;
    lPassword: TcxLabel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure bOkClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Execute(N: integer; ACaption,Login,Password: String;
  CallBack: TLoginCallback);
    procedure SetLang;
    { Public declarations }
  end;

var
  fLogin: TfLogin = nil;

implementation

uses LangString;

{$R *.dfm}

var
  FCallBack: TLoginCallback;
  FN: integer;

procedure TfLogin.bCancelClick(Sender: TObject);
begin
  FCallBack(Self,FN,eLogin.Text,ePassword.Text,true);
  Close;
end;

procedure TfLogin.bOkClick(Sender: TObject);
begin
  bOk.Enabled := false;
  FCallBack(Self,FN,eLogin.Text,ePassword.Text,false);
end;

procedure TfLogin.Execute(N: integer; ACaption,Login,Password: String;
  CallBack: TLoginCallback);
begin
  Caption := ACaption;
  eLogin.Text := Login;
  ePassword.Text := Password;
  FN := N;
  FCallBack := CallBack;
  ShowModal;
end;

procedure TfLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fLogin := nil;
end;

procedure TfLogin.FormCreate(Sender: TObject);
begin
  SetLang;
end;

procedure TfLogin.SetLang;
begin
  lLogin.Caption := _LOGIN_;
  lPassword.Caption := _PASSWORD_;
  bOk.Caption := _OK_;
  bCancel.Caption := _CANCEL_;
end;

end.
