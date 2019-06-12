unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    lst1: TListBox;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    procedure ThreadsDone(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

  TFooThread = class(TThread)
    protected
      procedure Execute; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TFooThread }
const
  MaxSize = 128;

var
  NumID : Integer = 0;
  GlobalArray : array[1..MaxSize] of Integer;
  hMutex: THandle;

procedure TFooThread.Execute;
var
  i, index: Integer;
begin
  Inc(NumID);
  index := NumID;
  OnTerminate := Form1.ThreadsDone;
  if (WaitForSingleObject(hMutex, INFINITE)) = WAIT_OBJECT_0 then
  begin
    for I := 1 to MaxSize do
    begin
      GlobalArray[i] := i;
      Form1.lst1.Items.Add(IntToStr(i) + '        ' + IntToStr(index) + '���߳�����ִ�в���');
    end;
  end;
  ReleaseMutex(hMutex);
  if (index = 2) then
    CloseHandle(hMutex);
  
end;

{ TForm1 }

procedure TForm1.btn1Click(Sender: TObject);
begin
  hMutex := CreateMutex(nil, False, nil);
  TFooThread.Create(False); 
  TFooThread.Create(False);
end;

procedure TForm1.ThreadsDone(Sender: TObject);
begin
  lst1.Items.Add('--------------------');
end;

end.