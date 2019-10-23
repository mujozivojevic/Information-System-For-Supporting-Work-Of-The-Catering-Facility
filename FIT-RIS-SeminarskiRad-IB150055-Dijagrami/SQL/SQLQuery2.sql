CREATE DATABASE Restoran

USE Restoran

CREATE TABLE Korisnik
(
	KorisnikID int IDENTITY(1,1) PRIMARY KEY,
	Ime nvarchar(35) NOT NULL,
	Prezime nvarchar(35) NOT NULL,
	EmailAdresa nvarchar(50) NOT NULL,
	Adresa nvarchar(50) NOT NULL,
	Telefon nvarchar(50) NOT NULL,

)

CREATE TABLE Stol
(
	StolID int IDENTITY(1,1) PRIMARY KEY,
	Opis nvarchar(100) NOT NULL,
	Zauzetost nvarchar(10) UNIQUE NOT NULL
)


CREATE TABLE Rezervacije
(
	RezervacijeID int IDENTITY(1,1) PRIMARY KEY,
	StolID int CONSTRAINT FK_R_S FOREIGN KEY REFERENCES Stol(StolID),
  	KorisnikID int CONSTRAINT FK_R_KO FOREIGN KEY REFERENCES Korisnik(KorisnikID),
	DatumRezervacije DateTime NOT NULL,
)
CREATE TABLE Ocjene
(
	OcjeneID int IDENTITY(1,1) PRIMARY KEY,
	KorisnikID int CONSTRAINT FK_Ocjene_Korisnik FOREIGN KEY REFERENCES Korisnik(KorisnikID),
	KupacID int NOT NULL,
	BrojOcjene int NOT NULL
)

CREATE TABLE Narudzbe
(
	NarudzbaID int IDENTITY(1,1) PRIMARY KEY,
	KorisnikID int CONSTRAINT FK_K_K FOREIGN KEY REFERENCES Korisnik(KorisnikID),
	UposlenikID int CONSTRAINT FK_K_U FOREIGN KEY REFERENCES Uposlenici(UposlenikID),

	DatumVrijemeNarudzbe DateTime NOT NULL,
	Adresa nvarchar(50) NOT NULL,
	StatusDostaveID int CONSTRAINT FK_NA_SD FOREIGN KEY REFERENCES StatusDostave(StatusDostaveID),
	

)
CREATE TABLE NarudzbeStavke
(
	NarudzbeStavkeID int IDENTITY(1,1) PRIMARY KEY,
	NarudzbaID int CONSTRAINT FK_NS_N FOREIGN KEY REFERENCES Narudzbe(NarudzbaID),
	ProizvodID int CONSTRAINT FK_NS_P FOREIGN KEY REFERENCES Proizvodi(ProizvodID),

	Kolicina int NOT NULL,
	Cijena float NOT NULL

	
)
CREATE TABLE Proizvodi
(
	ProizvodID int IDENTITY(1,1) PRIMARY KEY,
	VrstaProizvodID int CONSTRAINT FK_PRO_VR FOREIGN KEY REFERENCES VrstaProizvoda(VrstaID),
	Cijena float NOT NULL,
	Slika binary NOT NULL
)

CREATE TABLE VrstaProizvoda
(
	VrstaID int IDENTITY(1,1) PRIMARY KEY,
	Naziv nvarchar(50) NOT NULL,
	Opis nvarchar(100) NOT NULL,
)

CREATE TABLE StatusDostave
(
	StatusDostaveID int IDENTITY(1,1) PRIMARY KEY,
	Opis nvarchar(100) NOT NULL,
)


CREATE TABLE Uposlenici
(
	UposlenikID int IDENTITY(1,1) PRIMARY KEY,
	Ime nvarchar(35) NOT NULL,
	Prezime nvarchar(35) NOT NULL,
	Adresa nvarchar(50) NOT NULL,
	EmailAdresa nvarchar(50) NOT NULL,
	TekuciRacun nvarchar(50) NOT NULL,
	Telefon nvarchar(50) NOT NULL,
	RadnoMjestoID int CONSTRAINT FK_K_SD FOREIGN KEY REFERENCES RadnoMjesto(RadnoMjestoID),

)

CREATE TABLE RadnoMjesto
(
	RadnoMjestoID int IDENTITY(1,1) PRIMARY KEY,
	Naziv nvarchar(50) NOT NULL,
	Opis nvarchar(100) NOT NULL,
)
CREATE TABLE Racun
(
	RacunID int IDENTITY(1,1) PRIMARY KEY,
	DatumPlacanja DateTime NOT NULL,
	NacinPlacanja nvarchar(50) NOT NULL,
	NarudzbaID int CONSTRAINT FK_R_NA FOREIGN KEY REFERENCES Narudzbe(NarudzbaID),
)
CREATE TABLE Izvjestaji
(
	IzvjestajID int IDENTITY(1,1) PRIMARY KEY,
	Datum DateTime NOT NULL,
	Opis nvarchar(100) NOT NULL,
	UposlenikID int CONSTRAINT FK_R_N FOREIGN KEY REFERENCES Uposlenici(UposlenikID),
)




