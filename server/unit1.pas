unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  IdTCPServer, IdCustomTCPServer, IdContext, IdTCPClient;

type

  { TForm1 }

  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
    IdTCPServer1: TIdTCPServer;
    Memo1: TMemo;
    procedure CheckBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdTCPServer1Connect(AContext: TIdContext);
    procedure IdTCPServer1Disconnect(AContext: TIdContext);
    procedure IdTCPServer1Exception(AContext: TIdContext; AException: Exception
      );
    procedure IdTCPServer1Execute(AContext: TIdContext);
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

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
    if ( CheckBox1.Checked = True ) then
    IdTCPServer1.Active := True
  else
    IdTCPServer1.Active := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  IdTCPServer1.Bindings.Add.IP   := '127.0.0.1';
  IdTCPServer1.Bindings.Add.Port := 6000;
end;

procedure TForm1.IdTCPServer1Connect(AContext: TIdContext);
begin
    Memo1.Lines.Add('A client connected');
end;

procedure TForm1.IdTCPServer1Disconnect(AContext: TIdContext);
begin
   Memo1.Lines.Add('A client disconnected');
end;

procedure TForm1.IdTCPServer1Exception(AContext: TIdContext;
  AException: Exception);
begin
  Memo1.Lines.Add('A exception happend !');
end;

procedure TForm1.IdTCPServer1Execute(AContext: TIdContext);
var
  LLine: String;
begin
  LLine := AContext.Connection.IOHandler.ReadLn();
  Memo1.Lines.Add(LLine);
  AContext.Connection.IOHandler.WriteLn('OK');
end;





end.

