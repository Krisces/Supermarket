unit usupermarkt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
	ExtCtrls, Grids, umanager;

type

	{ TFSupermarkt }

  TFSupermarkt = class(TForm)
		BNeu : TButton;
		BAendern : TButton;
		BLoeschen : TButton;
		LWalmart : TLabel;
		LEAktueller : TLabeledEdit;
		LEPreis : TLabeledEdit;
		LEArtikelnr : TLabeledEdit;
		LEBezeichnung : TLabeledEdit;
		LEAnzahl : TLabeledEdit;
		SGDaten : TStringGrid;
 procedure BAendernClick(Sender : TObject);
 procedure BLoeschenClick(Sender : TObject);
  procedure BNeuClick(Sender : TObject);
		procedure FormCreate(Sender : TObject);
		procedure FormDestroy(Sender : TObject);
                procedure LWalmartClick(Sender: TObject);

			procedure SGDatenSelectCell(Sender : TObject; aCol, aRow : Integer; var CanSelect : Boolean);

  private
    { private declarations }
    iReihe : Integer;
    procedure Aktualisieren;

  public
    { public declarations }
  end;

var
  FSupermarkt : TFSupermarkt;
  oManager : TManager;

implementation

{$R *.lfm}

{ TFSupermarkt }

procedure TFSupermarkt.BNeuClick(Sender : TObject);
begin
  LEAnzahl.Text := IntToStr(oManager.eiGibLaenge + 1);
  oManager.NeuerDatensatz;
  LEAnzahl.Text := IntToStr(oManager.eiGibLaenge);
  SGDaten.RowCount := SGDaten.RowCount + 1;
  SGDaten.Cells[0,SGDaten.RowCount-1] := IntToStr(oManager.oGibArtikel.feiIndex);
  SGDaten.Cells[2,SGDaten.RowCount-1] := IntToStr(oManager.eiGibLaenge);
  SGDaten.Cells[3,SGDaten.RowCount-1] := CurrToStr(oManager.oGibArtikel.fcuPreis)+ '.00€';
end;

procedure TFSupermarkt.BLoeschenClick(Sender : TObject);
begin
  SGDaten.DeleteRow(iReihe);
  LEAnzahl.Text := IntToStr(oManager.eiGibLaenge - 1);

end;

procedure TFSupermarkt.BAendernClick(Sender : TObject);
begin
  SGDaten.Cells[1, iReihe] := LEBezeichnung.Text;
  SGDaten.Cells[2, iReihe] := LEArtikelnr.Text;
  SGDaten.Cells[3, iReihe] := LEPreis.Text;
end;

procedure TFSupermarkt.FormCreate(Sender : TObject);
begin
  oManager := TManager.Create;
end;

procedure TFSupermarkt.FormDestroy(Sender : TObject);
begin
  oManager.Destroy;
  oManager := nil;
  oManager.Free;
end;

procedure TFSupermarkt.LWalmartClick(Sender: TObject);
begin

end;

procedure TFSupermarkt.SGDatenSelectCell(Sender : TObject; aCol, aRow : Integer; var CanSelect : Boolean);
begin
  iReihe := aRow;
  LEBezeichnung.Text := SGDaten.Cells[1, iReihe];
  LEArtikelnr.Text := SGDaten.Cells[2, iReihe];
  LEPreis.Text := SGDaten.Cells[3, iReihe];
  LEAktueller.Text := SGDaten.Cells[0, iReihe];
end;

procedure TFSupermarkt.Aktualisieren;
begin

end;

end.

