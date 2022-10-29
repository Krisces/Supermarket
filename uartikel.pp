unit uartikel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

	{ TArtikel }

  TArtikel = class(TObject)
  private
    eiIndex : Int64;
    sBez,
    sArtikelNr : string;
    cuPreis : Currency;
    procedure SetzeIndex(eiNr : Int64);
    procedure SetzeBez(sName : string);
    procedure SetzeANr(sNr : string);
    procedure SetzePreis(cuKosten : Currency);
    function eiGibIndex : Int64;
    function sGibBez : string;
    function sGibANr : string;
    function cuGibPreis : Currency;
  public
    constructor Create;
    property feiIndex : Int64 read eiGibIndex write SetzeIndex;
    property fsBez : string read sGibBez write SetzeBez;
    property fsArtikelNr : string read sGibANr write SetzeANr;
    property fcuPreis : Currency read cuGibPreis write SetzePreis;
	end;

implementation

{ TArtikel }

procedure TArtikel.SetzeIndex(eiNr : Int64);
begin
  eiIndex := eiNr;
end;

procedure TArtikel.SetzeBez(sName : string);
begin
  sBez := sName;
end;

procedure TArtikel.SetzeANr(sNr : string);
begin
  sArtikelNr := sNr;
end;

procedure TArtikel.SetzePreis(cuKosten : Currency);
begin
  cuPreis := cuKosten;
end;

function TArtikel.eiGibIndex : Int64;
begin
  Result := eiIndex;
end;

function TArtikel.sGibBez : string;
begin
  Result := sBez;
end;

function TArtikel.sGibANr : string;
begin
  Result := sArtikelNr;
end;

function TArtikel.cuGibPreis : Currency;
begin
  Result := cuPreis;
end;

constructor TArtikel.Create;
begin
  inherited Create;
end;

end.

