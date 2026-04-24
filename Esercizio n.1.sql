-- Esercizio
-- create database Azienda_esercizio;

-- Dipendenti
/*
create table if not exists Dipendenti(
DipendenteID int not null auto_increment,
Nome varchar(50) not null,
Cognome varchar(50) not null,
DipartimentoID int not null,
Stipendio int not null,
DataAssunzione date,
primary key(DipendenteID)
);
*/

-- Dipartimenti
/*
create table if not exists Dipartimenti(
DipartimentoID int not null auto_increment,
NomeDipartimento varchar(50) not null,
Sede varchar(50) not null,
primary key(DipartimentoID)
); 
*/
-- Vendite
/*
create table if not exists Vendite(
ID int not null auto_increment,
DipendenteID int not null,
Importo int not null,
DataVendita int not null,
primary key(ID)
);
*/

/*
insert into dipendenti(Nome, Cognome, DipartimentoID, Stipendio, DataAssunzione)
values
('Carlo', 'Rossi', 1, 2000, '2026-01-19'),
('Mario', 'Verdi', 3, 2500, '2019-03-20'),
('Anna', 'Arancioni', 3, 2150, '2022-12-03'),
('Stefania', 'Marrone', 5, 2700, '2023-04-10'),
('Antonio', 'Azzurro', 2, 1900, '2025-09-07'),
('Gaetano', 'Giallo', 4, 2200, '2026-04-24'),
('Salvo', 'Neri', 7, 2150, '2024-04-02'),
('Samuel', 'Bianchi', 8, 2100, '2025-10-10'),
('Roberta', 'Stella', 6, 2230, '2023-05-10'), 
('Angela', 'Longobardi', 4, 1950, '2020-10-10');
*/

/*
insert into dipartimenti(NomeDipartimento, Sede)
values
('Prezzemolo & Vitale', 'Palermo'),
('F.lli Moffetta', 'Roma'),
('Acqua Raggia S.r.l', 'Milano'),
('F.lli Contorno', 'Perugia'),
('Cybersecurity S.p.a', 'Napoli'),
('PaulCannon S.r.l', 'Bologna'),
('TheFinals', 'Torino'),
('Judgement S.r.l', 'Genova'),
('Customs Project S.p.a', 'Catania'),
('Pleo', 'Agrigento');
*/

/*
insert into vendite(DipendenteID, Importo, DataVendita)
values
(1, 7000, "2022-08-10"),
(1, 6400, "2025-10-13"),
(7, 9754, "2026-01-27"),
(6, 3000, "2021-12-13"),
(2, 4590, "2019-05-24"),
(8, 8700, "2024-10-10"),
(3, 7000, "2025-01-04"),
(3, 5780, "2024-11-16"),
(2, 6000, "2024-05-19"),
(7, 3200, "2020-05-20");
*/

-- (1) Selezionare tutti i nomi e i cognomi dei dipendenti che hanno uno stipendio superiore a 2500€.
-- (2) Trova tutti i dipendenti la cui sede si trova in una città che inizia con la lettera "M".
-- (3) Selezionare i 5 dipendenti assunti più recentemente, odinandoli dalla data più recente alla meno recente.
-- (4) Scrivi una query che mostri il "Nome" del dipendente e il NomeDipartimento associato, unendo le tabelle Dipendenti e Dipartimenti.
-- (5) Calcola la somma totale degli importi delle vendite effettuate nell'anno 2024.
-- (6) Per ogni dipartimento (usa "DipartimentoID"), calcola lo stipendio medio dei dipartimenti.
-- (7) Mostra gli ID dei dipendenti che hanno effettuato un totale di vendite superiore a 10.000€ (somma della colonna "Importo").
-- (8) Trova i nomi di tutti i dipendenti che lavorano in un dipartimento con sede "Palermo".
-- (9) Conta quante vendite ha effettuato ongi dipendente. La tabella finale deve mostrare il "Nome" del dipendente e il numero totale delle operazioni.
-- (10) Quale è il nome del dipartimento che spende di più in stipendi?
-- (11) Seleziona i nomi dei dipendente assunti nel 2023.
-- (12) L'azienda ha deciso di dare un aumento del 10% a tutti i dipendenti del dipartimento con ID = 3. Scrivi il comando per aggiornare la tabella.

-- (1) Selezionare tutti i nomi e i cognomi dei dipendenti che hanno uno stipendio superiore a 2500€.
-- select Nome, Cognome from dipendenti where Stipendio > 2500;

-- (2) Trova tutti i dipendenti la cui sede si trova in una città che inizia con la lettera "M".
/*
select dipendenti.`Nome`,dipendenti.`Cognome`, dipartimenti.`Sede`
from dipendenti
inner join dipartimenti on dipartimenti.`DipartimentoID` = dipendenti.`DipartimentoID`
where dipartimenti.`Sede` like 'M%';
*/

-- (3) Selezionare i 5 dipendenti assunti più recentemente, odinandoli dalla data più recente alla meno recente.
-- Select Nome, Cognome, `DataAssunzione` from dipendenti where `DataAssunzione` <= current_date()
-- order by `DataAssunzione` desc limit 5;

-- (4) Scrivi una query che mostri il "Nome" del dipendente e il NomeDipartimento associato, unendo le tabelle Dipendenti e Dipartimenti.
-- select dipendenti.`Nome`, dipendenti.`Cognome`, dipartimenti.`NomeDipartimento` from dipendenti
-- inner join dipartimenti on dipartimenti.`DipartimentoID` = dipendenti.`DipartimentoID`;

-- (5) Calcola la somma totale degli importi delle vendite effettuate nell'anno 2024.
-- select sum(Importo) as Totale_Importo from vendite where Year(`DataVendita`) = 2024;

-- (6) Per ogni dipartimento (usa "DipartimentoID"), calcola lo stipendio medio dei dipartimenti.
/*
select avg(`Stipendio`) from dipendenti
inner join dipartimenti on dipartimenti.`DipartimentoID` = dipendenti.`DipartimentoID`;
*/

-- (7) Mostra gli ID dei dipendenti che hanno effettuato un totale di vendite superiore a 10.000€ (somma della colonna "Importo").
/*
select dipendenti.`DipendenteID`, sum(vendite.`Importo`) as Somma_Importo
from dipendenti
inner join vendite on vendite.`DipendenteID` = dipendenti.`DipendenteID`
group by dipendenti.`DipendenteID`
having Somma_Importo > 10000;
*/

-- (8) Trova i nomi di tutti i dipendenti che lavorano in un dipartimento con sede "Milano" e "Perugia".
/*
Select dipendenti.`Nome`, dipendenti.`Cognome`, dipartimenti.`Sede` from dipendenti
inner join dipartimenti on dipartimenti.`DipartimentoID` = dipendenti.`DipartimentoID`
where dipartimenti.`Sede` = 'Milano' or dipartimenti.`Sede` = 'Perugia';
*/

-- (9) Conta quante vendite ha effettuato ongi dipendente. La tabella finale deve mostrare il "Nome" del dipendente e il numero totale delle operazioni.
/*
select dipendenti.`Nome`, dipendenti.`Cognome`, count(*) as Numero_operazioni from dipendenti
left join vendite on vendite.`DipendenteID` = dipendenti.`DipendenteID` -- Uso "Left Join" cosicché possa vedere dipendenti che hanno totalizzato 0 operazioni 
group by vendite.`DipendenteID`;
*/

-- (10) Quale è il nome del dipartimento che spende di più in stipendi?
/*
select dipartimenti.`NomeDipartimento`, sum(dipendenti.`Stipendio`) as Totale_Stipendio from dipartimenti
inner join dipendenti on dipendenti.`DipartimentoID` = dipartimenti.`DipartimentoID`
group by `NomeDipartimento`
order by (Totale_Stipendio) desc limit 1;
*/

-- (11) Seleziona i nomi dei dipendente assunti nel 2023.
-- select Nome, Cognome from dipendenti where Year(`DataAssunzione`) = 2023; 

-- (12) L'azienda ha deciso di dare un aumento del 10% a tutti i dipendenti del dipartimento con ID = 3. Scrivi il comando per aggiornare la tabella.
/*
update dipendenti
set Stipendio = Stipendio * 1.10
where `DipartimentoID` = 3;
*/