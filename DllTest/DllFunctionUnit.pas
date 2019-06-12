unit DllFunctionUnit;

interface

uses
  Windows, Forms, Dialogs, SysUtils;

  function ShowMyDialog(aHandle: THandle; nFlag: Integer):Integer;stdcall;
  function ShowDllForm(aHandle: THandle; pTitle: pChar):ShortString;stdcall;
  function ShowDllFormLess(aHandle: THandle; pTitle: pChar):Integer;stdcall;

implementation
uses
  DllFormUnit;

function ShowMyDialog(aHandle: THandle; nFlag: Integer):Integer;stdcall;
begin
  Application.Handle := aHandle;
  if nFlag = 0 then
    Application.MessageBox('0�ŵ���','��ʾ��Ϣ',MB_OK);
  case nFlag of
    1:
      Application.MessageBox('1�ŵ���','��ʾ��Ϣ',MB_OK);
    2:
      Application.MessageBox('2�ŵ���','��ʾ��Ϣ',MB_YESNO + MB_ICONINFORMATION);
    3:
      Application.MessageBox('3�ŵ���','��ʾ��Ϣ',MB_YESNOCANCEL + MB_ICONSTOP);
  end;
end;

function ShowDllForm(aHandle: THandle; pTitle: pChar):ShortString;stdcall;
var
  DllForm: TForm1;
  Msg: ShortString;
begin
  Application.Handle := aHandle; 
  DllForm := TForm1.Create(Application);
  try            
    DllForm.Caption := pTitle;
    DllForm.ShowModal;
    Msg := DllForm.Edit1.Text + '#' + DllForm.ComboBox1.Text + '#' +
      DateTimeToStr(DllForm.DateTimePicker1.DateTime);
    Result := Msg;
  finally
    DllForm.Free;
  end;
end;

function ShowDllFormLess(aHandle: THandle; pTitle: pChar):Integer;stdcall;
begin
  Application.Handle := aHandle;
  if Form1 <> nil then Form1 := nil;
  Form1 := TForm1.Create(Application);
  Form1.Caption := pTitle;
  Form1.Show;
end;

end.