program Supermarkt;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, usupermarkt, uartikel, umanager;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
	Application.CreateForm(TFSupermarkt, FSupermarkt);
  Application.Run;
end.

