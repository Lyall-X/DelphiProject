unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSock;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function WinSockInit: BOOL; 
    procedure WinSockUnInit;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  WSAData: TWSAData;

const
  Version: Word = $0202;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  WinSockInit;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  WinSockUnInit;
end;

function TForm1.WinSockInit: BOOL;
begin
  if WSAStartup(Version, WSAData) = ERROR_SUCCESS then
  begin
    ShowMessage('WinSock����سɹ���');
    Result := True;
  end
  else
  begin
    ShowMessage('WinSock�����ʧ�ܣ�');
    WSACleanup;
  end;
  
end;

procedure TForm1.WinSockUnInit;
begin
  if WSACleanup = ERROR_SUCCESS then
  begin
    ShowMessage('�ͷ�winsock��ɹ�');
  end
  else
  begin
    ShowMessage('�ͷ�winsock��ʧ��');
    Exit;
  end;
end;

end.
