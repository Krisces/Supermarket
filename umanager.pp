unit umanager;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uartikel;

type

	{ TManager }

  TManager = class(TObject)
  private
    eiLaenge,
    eiLetzter,
    eiAktueller : Int64;
    aoArtikel : array of TArtikel;


  public
    constructor Create;
    destructor Destroy; reintroduce;
    procedure NeuerDatensatz;
    function eiGibLaenge : Int64;
    function oGibArtikel : TArtikel;
    procedure SetzeAnzeige;
    procedure SetzePreis;
    procedure SetzeAendern;
    procedure SetzeDatensatz;

	end;

implementation

{ TManager }

constructor TManager.Create;
begin
  inherited Create;
  eiLetzter := -1;
  eiAktueller := -1;
end;

destructor TManager.Destroy;
begin
  eiLaenge := Length(aoArtikel);
  while eiLaenge > 0 do
  begin
    aoArtikel[eiLaenge - 1] := nil;
    aoArtikel[eiLaenge - 1].Free;
    SetLength(aoArtikel, eiLaenge - 1);
    Dec(eiLaenge);
	end;
	inherited Destroy;
end;

procedure TManager.NeuerDatensatz;
begin
  eiLaenge := Length(aoArtikel);
  SetLength(aoArtikel, eiLaenge + 1);
  aoArtikel[eiLaenge] := TArtikel.Create;
  Inc(eiLetzter);
  aoArtikel[eiLaenge].feiIndex := eiLetzter;
  aoArtikel[eiLaenge].fcuPreis := eiLetzter + 2.00;
  eiAktueller := eiLaenge;
end;

function TManager.eiGibLaenge : Int64;
begin
  Result := Length(aoArtikel);
end;

function TManager.oGibArtikel : TArtikel;
begin
  Result := aoArtikel[eiAktueller];
end;

procedure TManager.SetzeAnzeige;
begin
  repeat
    SetLength(aoArtikel, eiLaenge - 1)
	until eiLaenge = 0;
end;

procedure TManager.SetzePreis;
begin

end;

procedure TManager.SetzeAendern;
begin

end;

procedure TManager.SetzeDatensatz;
begin
  eiLetzter := Length(aoArtikel);
  eiAktueller := eiLetzter;
end;



end.

