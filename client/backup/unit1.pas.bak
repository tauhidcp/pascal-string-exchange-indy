unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  IdTCPClient;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBoxConnectDisconnet: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    IdTCPClient1: TIdTCPClient;
    Label1: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure CheckBoxConnectDisconnetChange(Sender: TObject);
    procedure IdTCPClient1Connected(Sender: TObject);
    procedure IdTCPClient1Disconnected(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CheckBoxConnectDisconnetChange(Sender: TObject);
begin
    if ( CheckBoxConnectDisconnet.Checked = True ) then
  begin
    IdTCPClient1.Host := Edit2.Text;
    IdTCPClient1.Port := StrToInt(Edit3.Text);
    IdTCPClient1.Connect;
  end
  else
    IdTCPClient1.Disconnect
end;

procedure TForm1.Button1Click(Sender: TObject);
  var
  LLine: String;
begin

  IdTCPClient1.IOHandler.WriteLn(Edit1.Text);
  Edit1.Text := '';
  LLine := IdTCPClient1.IOHandler.ReadLn();
  if ( LLine = 'OK' ) then
      Memo1.Lines.Add('Server says it has received your String');

end;

procedure TForm1.IdTCPClient1Connected(Sender: TObject);
begin
    Memo1.Lines.Add('Client connected with server');
end;

procedure TForm1.IdTCPClient1Disconnected(Sender: TObject);
begin
  Memo1.Lines.Add('Client disconnected from server');
end;

end.

