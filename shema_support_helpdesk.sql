DROP database if exists Helpdesk;
CREATE DATABASE Helpdesk;
USE Helpdesk;

CREATE TABLE Utilisateurs(
id_user int primary key auto_increment,
nom varchar(100) not null,
email varchar(100) not null unique,
password varchar(100) not null unique,
role varchar(100) not null default 'apprenant');


CREATE TABLE Tickets(
id_tickets int primary key auto_increment,
titre varchar(100) not null,
description varchar(100) not null,
niveau varchar(100) not null,
etat varchar(100) default "en attente",
id_user int not null,
foreign key(id_user) references Utilisateurs(id_user)
);

select * from Utilisateurs;
update  Utilisateurs set role="admin" where id_user=2;
select * from Tickets;
-- CREATE TABLE Tickets(
-- id_ticket int primary key auto_increment,
-- titre varchar(100) not null,
-- etat varchar(100) not null,
-- id_user int not null,
-- foreign key(id_user) references Utilisateurs(id_user)
-- );

Select t.titre, t.etat, t.id_user from Tickets as t 
         join Utilisateurs as u on u.id_user=t.id_user where id_user=1;
         
Select titre, etat, id_user from Tickets where id_user=4  ;
Select titre,description,niveau,id_user where id_user= 4   ;
Select * from Tickets where id_tickets=2 