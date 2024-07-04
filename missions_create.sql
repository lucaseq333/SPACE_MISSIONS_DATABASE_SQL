-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-07-04 09:18:32.715

-- tables
-- Table: Astronaut
CREATE TABLE Astronaut (
    Person_Id integer  NOT NULL,
    CONSTRAINT Astronaut_pk PRIMARY KEY (Person_Id)
) ;

-- Table: Engineer
CREATE TABLE Engineer (
    Person_Id integer  NOT NULL,
    CONSTRAINT Engineer_pk PRIMARY KEY (Person_Id)
) ;

-- Table: Mission
CREATE TABLE Mission (
    Id integer  NOT NULL,
    Name varchar2(40)  NOT NULL,
    Type varchar2(15)  NOT NULL,
    Description varchar2(200)  NOT NULL,
    Status_Id integer  NOT NULL,
    CONSTRAINT Mission_pk PRIMARY KEY (Id)
) ;

-- Table: Organization
CREATE TABLE Organization (
    Id integer  NOT NULL,
    Name varchar2(60)  NOT NULL,
    Acronym char(20)  NOT NULL,
    Found_date date  NOT NULL,
    Description varchar2(200)  NOT NULL,
    Country varchar2(40)  NOT NULL,
    Type varchar2(30)  NOT NULL,
    CONSTRAINT Organization_pk PRIMARY KEY (Id)
) ;

-- Table: Organization_Mission
CREATE TABLE Organization_Mission (
    Mission_Id integer  NOT NULL,
    Organization_Id integer  NOT NULL,
    CONSTRAINT Organization_Mission_pk PRIMARY KEY (Organization_Id,Mission_Id)
) ;

-- Table: Person
CREATE TABLE Person (
    Id integer  NOT NULL,
    Name varchar2(20)  NOT NULL,
    Surname varchar2(30)  NOT NULL,
    Country_of_origin varchar2(30)  NOT NULL,
    Profession varchar2(25)  NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY (Id)
) ;

-- Table: Person_Mission
CREATE TABLE Person_Mission (
    Mission_Id integer  NOT NULL,
    Person_Id integer  NOT NULL,
    CONSTRAINT Person_Mission_pk PRIMARY KEY (Person_Id,Mission_Id)
) ;

-- Table: Private_company
CREATE TABLE Private_company (
    Organization_Id integer  NOT NULL,
    CONSTRAINT Private_company_pk PRIMARY KEY (Organization_Id)
) ;

-- Table: Rocket
CREATE TABLE Rocket (
    Id integer  NOT NULL,
    Vehicle_Id integer  NOT NULL,
    Height float(2)  NOT NULL,
    Diameter float(2)  NOT NULL,
    Capacity varchar2(30)  NOT NULL,
    Fuel_type varchar2(20)  NOT NULL,
    Stage_number integer  NOT NULL,
    CONSTRAINT Rocket_pk PRIMARY KEY (Id)
) ;

-- Table: Rover
CREATE TABLE Rover (
    Id integer  NOT NULL,
    Vehicle_Id integer  NOT NULL,
    Landing_date date  NOT NULL,
    CONSTRAINT Rover_pk PRIMARY KEY (Id)
) ;

-- Table: Satellite
CREATE TABLE Satellite (
    Id integer  NOT NULL,
    Vehicle_Id integer  NOT NULL,
    Launch_date date  NOT NULL,
    CONSTRAINT Satellite_pk PRIMARY KEY (Id)
) ;

-- Table: Scientist
CREATE TABLE Scientist (
    Person_Id integer  NOT NULL,
    CONSTRAINT Scientist_pk PRIMARY KEY (Person_Id)
) ;

-- Table: State_organization
CREATE TABLE State_organization (
    Organization_Id integer  NOT NULL,
    CONSTRAINT State_organization_pk PRIMARY KEY (Organization_Id)
) ;

-- Table: Status
CREATE TABLE Status (
    Id integer  NOT NULL,
    Name varchar2(20)  NOT NULL,
    CONSTRAINT Status_pk PRIMARY KEY (Id)
) ;

-- Table: Vehicle
CREATE TABLE Vehicle (
    Id integer  NOT NULL,
    Name varchar2(40)  NOT NULL,
    Type varchar2(30)  NOT NULL,
    Total_mass float(2)  NOT NULL,
    CONSTRAINT Vehicle_pk PRIMARY KEY (Id)
) ;

-- Table: Vehicle_Mission
CREATE TABLE Vehicle_Mission (
    Vehicle_Id integer  NOT NULL,
    Mission_Id integer  NOT NULL,
    CONSTRAINT Vehicle_Mission_pk PRIMARY KEY (Mission_Id,Vehicle_Id)
) ;

-- foreign keys
-- Reference: Astronauta_Osoba (table: Astronaut)
ALTER TABLE Astronaut ADD CONSTRAINT Astronauta_Osoba
    FOREIGN KEY (Person_Id)
    REFERENCES Person (Id);

-- Reference: Firma_prywatna (table: Private_company)
ALTER TABLE Private_company ADD CONSTRAINT Firma_prywatna
    FOREIGN KEY (Organization_Id)
    REFERENCES Organization (Id);

-- Reference: Inzynier_Osoba (table: Engineer)
ALTER TABLE Engineer ADD CONSTRAINT Inzynier_Osoba
    FOREIGN KEY (Person_Id)
    REFERENCES Person (Id);

-- Reference: Lazik_Pojazd (table: Rover)
ALTER TABLE Rover ADD CONSTRAINT Lazik_Pojazd
    FOREIGN KEY (Vehicle_Id)
    REFERENCES Vehicle (Id);

-- Reference: Misja_Status (table: Mission)
ALTER TABLE Mission ADD CONSTRAINT Misja_Status
    FOREIGN KEY (Status_Id)
    REFERENCES Status (Id);

-- Reference: Naukowiec_Osoba (table: Scientist)
ALTER TABLE Scientist ADD CONSTRAINT Naukowiec_Osoba
    FOREIGN KEY (Person_Id)
    REFERENCES Person (Id);

-- Reference: Organizacja_panstwowa (table: State_organization)
ALTER TABLE State_organization ADD CONSTRAINT Organizacja_panstwowa
    FOREIGN KEY (Organization_Id)
    REFERENCES Organization (Id);

-- Reference: Rakieta_Pojazd (table: Rocket)
ALTER TABLE Rocket ADD CONSTRAINT Rakieta_Pojazd
    FOREIGN KEY (Vehicle_Id)
    REFERENCES Vehicle (Id);

-- Reference: Satelita_Pojazd (table: Satellite)
ALTER TABLE Satellite ADD CONSTRAINT Satelita_Pojazd
    FOREIGN KEY (Vehicle_Id)
    REFERENCES Vehicle (Id);

-- Reference: Table_18_Misja (table: Vehicle_Mission)
ALTER TABLE Vehicle_Mission ADD CONSTRAINT Table_18_Misja
    FOREIGN KEY (Mission_Id)
    REFERENCES Mission (Id);

-- Reference: Table_18_Pojazd (table: Vehicle_Mission)
ALTER TABLE Vehicle_Mission ADD CONSTRAINT Table_18_Pojazd
    FOREIGN KEY (Vehicle_Id)
    REFERENCES Vehicle (Id);

-- Reference: Table_19_Misja (table: Organization_Mission)
ALTER TABLE Organization_Mission ADD CONSTRAINT Table_19_Misja
    FOREIGN KEY (Mission_Id)
    REFERENCES Mission (Id);

-- Reference: Table_19_Organizacja (table: Organization_Mission)
ALTER TABLE Organization_Mission ADD CONSTRAINT Table_19_Organizacja
    FOREIGN KEY (Organization_Id)
    REFERENCES Organization (Id);

-- Reference: Table_20_Misja (table: Person_Mission)
ALTER TABLE Person_Mission ADD CONSTRAINT Table_20_Misja
    FOREIGN KEY (Mission_Id)
    REFERENCES Mission (Id);

-- Reference: Table_20_Osoba (table: Person_Mission)
ALTER TABLE Person_Mission ADD CONSTRAINT Table_20_Osoba
    FOREIGN KEY (Person_Id)
    REFERENCES Person (Id);

--INSERTS:
INSERT INTO Status VALUES(1,'succesfull');
INSERT INTO Status VALUES(2,'failed');
INSERT INTO Status VALUES(3,'canceled');
INSERT INTO Status VALUES(4,'scheduled');

INSERT INTO Mission VALUES(10,'Apollo 11','manned','The goal of the mission was the first landing of a man on the Moon.',1);
INSERT INTO Mission VALUES(11,'Starship Flight Test','unmanned','The purpose of the mission was to test the first finished model of the Starship rocket',2);
INSERT INTO Mission VALUES(12,'Starlink Group 6-59','unmanned','The missions goal was to launch the Starlink satellite constellation into Earths orbit',1);
INSERT INTO Mission VALUES(13,'Polaris Dawn','manned','The missions goal is to launch individuals into Earts orbit, conduct experiments and conduct a space walk',4);
INSERT INTO Mission VALUES(14,'Artemis V','manned','The missions goal is to send again astronauts to the Moon',4);
INSERT INTO Mission VALUES(15,'Apollo 2','manned','The missions goal was to land humans on the Moon',3);
INSERT INTO Mission VALUES(16,'Wostok 1','manned','The goal of the mission was to fly the first man into space',1);
INSERT INTO Mission VALUES(17,'International Space Station','manned','The purpose of the mission was to create an international space station for the purpose of studying the effects of gravity on humans and space exploration',1);
INSERT INTO Mission VALUES(18,'Starship Third Flight Test','manned','The purpose of the mission was to test the efficiency of the Starship rocket and bring it to Earths orbit and return',1);
INSERT INTO Mission VALUES(19,'Starship Second Flight Test','manned','The missions goal was to put the Starship rocket into Earths orbit',2);

INSERT INTO Vehicle VALUES(100,'Saturn V','manned',3000); --Total_mass -> the weights of all vehicles are given in tons
INSERT INTO Vehicle VALUES(101,'Sputnik 1','unmanned',0.08);
INSERT INTO Vehicle VALUES(102,'Perseverance','unmanned',1.07);
INSERT INTO Vehicle VALUES(103,'Starship','unmanned',5000);
INSERT INTO Vehicle VALUES(104,'Starlink','unmanned',0.73);
INSERT INTO Vehicle VALUES(105,'Crew Dragon Resilience','manned',12);
INSERT INTO Vehicle VALUES(106,'Blue Moon','manned',16);
INSERT INTO Vehicle VALUES(107,'Vostok','manned',4.73);

INSERT INTO Rocket VALUES(200,100,110.6,10.06,'118 tons of cargo','kerosene, liquid oxygen',3); -- Height, Diameter -> are given in metres
INSERT INTO Rocket VALUES(201,103,50,9,'at least 100 tons','liquid methane and oxygen',2); 
INSERT INTO Rocket VALUES(202,105,7.2,3.7,'6 tons of cargo,7 astronauts','no fuel',1);
INSERT INTO Rocket VALUES(203,107,4.4,2.43,'1 person','no fuel',1);

INSERT INTO Sattelite VALUES(300,101,'1957-10-04');
INSERT INTO Sattelite VALUES(301,104,'2024-02-25');

INSERT INTO Rover VALUES(400,102,'2021-02-18');
INSERT INTO Rover VALUES(401,106,'2030-03-01');

INSERT INTO Organization VALUES(500,'National Aeronautics and Space Administration','NASA','1958-07-29','American government agency that aims to pioneer connected space exploration, scientific discovery and aeronautical research','USA','state organization');
INSERT INTO Organization VALUES(501,'Space Exploration Technologies Corporation','SpaceX','2002-03-14','An American private company whose goal is to produce utility rockets and colonize the Solar System, including the planet Mars','USA','private company');
INSERT INTO Organization VALUES(502,'Blue Origin Corporation','BO','2000-09-08','An American private company whose goal is to build and design modern manned orbital transport systems','USA','private company');
INSERT INTO Organization VALUES(503,'Roscosmos State Corporation for Space Activities','Roscosmos','1955-01-01','Russian space agency whose goal was to send humans into space and conquer space during the Cold War with the US','Russia','state organization');

INSERT INTO State_organization VALUES(500);
INSERT INTO Private_company VALUES(501);
INSERT INTO Private_company VALUES(502);
INSERT INTO State_organization VALUES(503);

INSERT INTO Person VALUES(600,'Neil','Armstrong','USA','astronaut');
INSERT INTO Person VALUES(601,'Wernher','von Braun','Germany','engineer, constructor');
INSERT INTO Person VALUES(602,'Jared','Isaacman','USA','astronaut, businessmann');
INSERT INTO Person VALUES(603,'Elon','Musk','RPA','scientist, engineer');
INSERT INTO Person VALUES(604,'Yuri','Gagarin','Russia','astronauta');
INSERT INTO Person VALUES(605,'Jeff','Bezos','USA','engineer');

INSERT INTO Astronaut VALUES(600);
INSERT INTO Engineer VALUES(601);
INSERT INTO Astronaut VALUES(602);
INSERT INTO Scientist VALUES(603);
INSERT INTO Astronaut VALUES(604);
INSERT INTO Engineer VALUES(605);

--Associative entities
INSERT INTO Person_Mission VALUES(10,600);
INSERT INTO Person_Mission VALUES(10,601);
INSERT INTO Person_Mission VALUES(13,602);
INSERT INTO Person_Mission VALUES(13,603);
INSERT INTO Person_Mission VALUES(14,603);
INSERT INTO Person_Mission VALUES(14,605);
INSERT INTO Person_Mission VALUES(15,601);
INSERT INTO Person_Mission VALUES(16,604);

INSERT INTO Vehicle_Mission VALUES(101,16);
INSERT INTO Vehicle_Mission VALUES(103,11);
INSERT INTO Vehicle_Mission VALUES(103,12);
INSERT INTO Vehicle_Mission VALUES(103,18);
INSERT INTO Vehicle_Mission VALUES(103,19);
INSERT INTO Vehicle_Mission VALUES(104,12);
INSERT INTO Vehicle_Mission VALUES(105,13);
INSERT INTO Vehicle_Mission VALUES(105,14);
INSERT INTO Vehicle_Mission VALUES(105,17);
INSERT INTO Vehicle_Mission VALUES(106,14);
INSERT INTO Vehicle_Mission VALUES(107,16);

INSERT INTO Organization_Mission VALUES(10,500);
INSERT INTO Organization_Mission VALUES(11,501);
INSERT INTO Organization_Mission VALUES(12,501);
INSERT INTO Organization_Mission VALUES(13,501);
INSERT INTO Organization_Mission VALUES(14,500);
INSERT INTO Organization_Mission VALUES(14,501);
INSERT INTO Organization_Mission VALUES(14,502);
INSERT INTO Organization_Mission VALUES(15,500);
INSERT INTO Organization_Mission VALUES(16,503);
INSERT INTO Organization_Mission VALUES(17,500);
INSERT INTO Organization_Mission VALUES(17,501);
INSERT INTO Organization_Mission VALUES(17,503);
INSERT INTO Organization_Mission VALUES(19,501);
-- End of file.
