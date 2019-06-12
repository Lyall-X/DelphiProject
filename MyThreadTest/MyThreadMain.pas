unit MyThreadMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TNumThreadUnit, ComCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    lst1: TListBox;
    pb1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
         
var
  NumThread: TNumThread;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  if Assigned(NumThread) then
    NumThread.Suspend;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  if Assigned(NumThread) then
    NumThread.Resume;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin    
  if Assigned(NumThread) and (Application.MessageBox('��ȷ��Ҫ�˳��߳���','��ʾ',MB_YESNO + MB_ICONQUESTION) = mrYes)then
  begin
    NumThread.Terminate;
    Label1.Caption := '0';
    lst1.Clear;
    Form1.pb1.Position := 0;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  NumThread := TNumThread.Create(False);
end;

end.