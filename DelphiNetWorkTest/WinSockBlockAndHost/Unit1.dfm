object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 403
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object lbl1: TLabel
    Left = 96
    Top = 80
    Width = 75
    Height = 16
    Caption = #20027#26426#21517#31216#65306
  end
  object lbl2: TLabel
    Left = 96
    Top = 120
    Width = 56
    Height = 16
    Caption = 'IP'#22320#22336#65306
  end
  object edt1: TEdit
    Left = 175
    Top = 77
    Width = 522
    Height = 24
    TabOrder = 0
  end
  object btn1: TButton
    Left = 96
    Top = 272
    Width = 137
    Height = 25
    Caption = #21462#24471#26412#22320#20027#26426#21517#31216
    TabOrder = 1
    OnClick = btn1Click
  end
  object edt2: TEdit
    Left = 175
    Top = 117
    Width = 522
    Height = 24
    TabOrder = 2
  end
  object btn2: TButton
    Left = 504
    Top = 272
    Width = 153
    Height = 25
    Caption = #21462#24471#26412#22320#20027#26426#21644'IP'#22320#22336
    TabOrder = 3
    OnClick = btn2Click
  end
end
