unit UserUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids, DB, ADODB;

type
  TUserForm = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    LoginEdit: TEdit;
    PasswordEdit: TEdit;
    UserQuery: TADOQuery;
    ADOConnection1: TADOConnection;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserForm: TUserForm;
  Login:string;
  Dostup:boolean;
implementation

uses DataModuleUnit, StudentUnit;

{$R *.dfm}

procedure TUserForm.Button2Click(Sender: TObject);
begin
Application.Terminate;

end;

procedure TUserForm.Button1Click(Sender: TObject);
begin
If (LoginEdit.Text<>'') and (PasswordEdit.Text<>'') then //���� �� ������
 begin
 UserQuery.Active:=false;
 UserQuery.Parameters.ParamByName('log').Value:=LoginEdit.Text;
 UserQuery.Active:=true;
   If UserQuery.RecordCount<>0 then
     begin
      If UserQuery.FieldByName('������').AsString=PasswordEdit.Text then begin
         login:=LowerCase(LoginEdit.Text);
         If UserQuery.FieldByName('������').AsString='True' then  Dostup:=true//���� ������
            else Dostup:=false;
             Close;

       end
          else Showmessage('������ ��������!');
     end;
 end
    else ShowMessage('������� ��� ������������ � ������!');//������ ����
end;

procedure TUserForm.Button3Click(Sender: TObject);
begin
Messagedlg('������� ���� ��� ������������ � ������!',mtinformation,[mbOk],0);
end;

end.
