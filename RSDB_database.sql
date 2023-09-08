
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Stadium;
DROP TABLE IF EXISTS Invoice;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Section

----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL UNIQUE,
  Address VARCHAR(100) ,
  Sex INT  CHECK (Sex IN (1,2)),
  Age INT  CHECK (Age > 0),
  Income INT  CHECK (Income BETWEEN 1 AND 5),
  Education INT  CHECK (Education BETWEEN 1 AND 5),
  MaritalStatus INT  CHECK (MaritalStatus BETWEEN 1 AND 3)
);

----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Stadium (
  StadiumName VARCHAR(50) PRIMARY KEY NOT NULL,
  Location VARCHAR(50) NOT NULL,
);

----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Section (
    SectionName VARCHAR(50) PRIMARY KEY NOT NULL,
    NumRows INT NOT NULL CHECK (NumRows > 0),
    SeatsPerRow INT NOT NULL CHECK (SeatsPerRow > 0),
    StadiumName VARCHAR(50) NOT NULL,
    FOREIGN KEY (StadiumName) REFERENCES Stadium(StadiumName)

);

----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Event (
  Event_name VARCHAR(50) PRIMARY KEY NOT NULL,
  StadiumName VARCHAR(50) NOT NULL,
  Date DATE NOT NULL,
  Time TIME NOT NULL,
  TicketPrice INT NOT NULL CHECK (TicketPrice > 0),
  FOREIGN KEY (StadiumName) REFERENCES Stadium(StadiumName)
);

----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Ticket (
  TicketID INT PRIMARY KEY NOT NULL,
  Event_name VARCHAR(50) NOT NULL,
  InvoiceID INT NOT NULL,
  FOREIGN KEY (Event_name) REFERENCES Event(Event_name) ON UPDATE CASCADE,
);

----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Invoice (
  InvoiceID INT PRIMARY KEY NOT NULL,
  CustomerID INT NOT NULL,
  OrderDate DATE NOT NULL,
  PaymentMethod INT NOT NULL CHECK (PaymentMethod BETWEEN 1 AND 4),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE NO ACTION
);

----------------------------------------------------------------------------------------------------------------------------


INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (1, 'Donnell', 'Breitenberg', 'cole.alize@example.net', '6607 Moore Mountains Suite 595\nEast Immanuel, NH 45517-1208', 2, 51, 3, 1, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (2, 'Jerad', 'Prohaska', 'zechariah.blanda@example.com', '4243 Zackery Meadows Suite 851\nSouth Jimmie, DC 75995-7515', 1, 38, 5, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (3, 'Elvie', 'Bogan', 'dickinson.darren@example.com', '97139 Lehner Ports\nMohrside, CT 30232-9159', 1, 37, 3, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (4, 'Rubye', 'Hagenes', 'juliet.bosco@example.org', '3974 Moore Motorway\nPort Sonny, NJ 63814-9152', 1, 22, 5, 4, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (5, 'Deanna', 'Hane', 'white.neva@example.com', '156 Welch Roads\nNew Joey, NE 51113-8744', 2, 65, 5, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (6, 'Karley', 'Howe', 'kali.powlowski@example.com', '7654 O Keefe Roads Suite 139\nHertafurt, WA 30507', 2, 50, 4, 2, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (7, 'Lucius', 'Wilkinson', 'nitzsche.abigail@example.com', '504 Bednar Ferry Suite 049\nDurganton, NM 92092', 1, 31, 4, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (8, 'Ronaldo', 'Glover', 'malachi.parisian@example.net', '876 Stamm Fields\nEast Brycefort, VT 48915-6563', 2, 66, 5, 5, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (9, 'Jace', 'Gorczany', 'reese.block@example.net', '787 Marks Summit\nFraneckichester, CT 89955', 2, 22, 4, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (10, 'Jefferey', 'Langosh', 'uhettinger@example.com', '90898 Sarah Throughway Apt. 780\nRennermouth, MO 00625', 1, 36, 3, 2, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (11, 'Catalina', 'Wunsch', 'kreiger.shanelle@example.org', '16153 Wolff Shores Suite 680\nJuvenalburgh, NM 69221-6864', 2, 57, 1, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (12, 'John', 'Torphy', 'wilfredo54@example.com', '71153 Marks Turnpike Suite 883\nSouth Christiana, AK 49219', 1, 24, 4, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (13, 'Fay', 'Considine', 'psporer@example.org', '8643 Goyette Mission Suite 253\nNorth Retamouth, TN 50972-2197', 1, 27, 2, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (14, 'Giovani', 'Hagenes', 'mante.derick@example.net', '366 Frances Ridge\nLittlefurt, AL 29974-3652', 1, 58, 4, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (15, 'Pearline', 'Champlin', 'willa67@example.org', '49403 Goldner Hollow\nUrbanchester, MN 04662-5827', 2, 55, 3, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (16, 'Hilario', 'Berge', 'marlee53@example.com', '060 Jocelyn Roads Suite 788\nWest Stacy, AK 47887-6963', 1, 55, 5, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (17, 'Leonardo', 'Gutmann', 'khermann@example.com', '14923 Neil Crescent Apt. 808\nSouth Brenda, CT 44262-5884', 1, 27, 2, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (18, 'Vance', 'Gleichner', 'cody.bashirian@example.net', '14758 Reinhold Spur Apt. 618\nNew Eloisabury, NJ 95090', 1, 27, 2, 3, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (19, 'Marilyne', 'Runolfsdottir', 'moen.marian@example.com', '629 Tommie Summit Apt. 438\nChelsiebury, VA 60405', 2, 28, 2, 4, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (20, 'Travis', 'Armstrong', 'arnaldo65@example.org', '85288 Brando Center Apt. 506\nHeathcoteland, SC 95286', 1, 57, 2, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (21, 'Kailey', 'Ullrich', 'welch.kale@example.org', '30302 Bettye Parkway\nAngelineshire, NV 80765', 2, 42, 2, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (22, 'Deontae', 'Johnston', 'koepp.gudrun@example.net', '4464 Dibbert Street\nCorkerymouth, UT 19709-4520', 2, 31, 5, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (23, 'Myrtis', 'Langosh', 'acrist@example.org', '2547 Boyer Shore\nShanellestad, WY 40599-0729', 2, 39, 2, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (24, 'Leland', 'Bosco', 'fherman@example.com', '726 Juanita Canyon\nJulesfort, WA 44504', 2, 43, 2, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (25, 'Osbaldo', 'Feil', 'paucek.zola@example.com', '75404 Hoeger Meadow Apt. 654\nMillertown, NY 37709-5275', 1, 48, 5, 2, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (26, 'Rosetta', 'Parker', 'herzog.erika@example.org', '374 Wolff Knoll Apt. 168\nLake Anibal, WY 12512-9056', 1, 62, 3, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (27, 'Curt', 'Wolf', 'vandervort.jessyca@example.com', '11231 White Causeway\nAudraville, WA 26640-0169', 2, 63, 1, 5, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (28, 'Irwin', 'Braun', 'deanna.mann@example.org', '713 Keenan Plaza Apt. 004\nNorth Napoleonville, AZ 25629-1656', 1, 44, 5, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (29, 'Geoffrey', 'Kihn', 'priscilla.jacobs@example.com', '670 Vandervort Station Apt. 894\nGloverton, DE 16393', 1, 34, 2, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (30, 'Kira', 'Wyman', 'fcruickshank@example.org', '60658 Skylar Ranch\nEast Fabiola, IL 25542-9482', 2, 29, 2, 3, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (31, 'Adriel', 'Zemlak', 'kyla.kulas@example.net', '40753 Odessa Islands Apt. 307\nRodgerhaven, PA 59094', 1, 63, 5, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (32, 'Omari', 'Hammes', 'tpredovic@example.com', '41405 Bernhard Plaza Suite 020\nSouth Diannaport, AZ 50522-4734', 2, 59, 1, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (33, 'Abigail', 'Swift', 'myrtle73@example.com', '9726 Fern Knolls Apt. 959\nPatriciaport, SC 48727-2229', 1, 35, 2, 5, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (34, 'Gage', 'Frami', 'darren96@example.com', '317 Dudley Road Apt. 535\nLake Anabelle, AZ 18581-6180', 1, 32, 3, 4, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (35, 'Rosalind', 'Kris', 'kaelyn52@example.org', '52027 Carlotta Square Apt. 710\nEast Caitlynchester, IA 76371-7134', 2, 42, 3, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (36, 'Lempi', 'Oberbrunner', 'wilderman.stephan@example.net', '27597 Beatty Branch Suite 445\nAufderharbury, SC 27369', 2, 46, 5, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (37, 'Agnes', 'Cruickshank', 'krystel85@example.net', '68112 Quentin Radial\nSouth Ignatius, NC 94460', 2, 57, 2, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (38, 'Jaida', 'Fahey', 'elise03@example.net', '8439 Cummings Camp Suite 660\nEast Floyburgh, WA 79832-0433', 1, 49, 3, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (39, 'Alverta', 'Bergnaum', 'lrogahn@example.org', '3770 Bergstrom Inlet Apt. 767\nRoselynmouth, AZ 20800', 2, 68, 4, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (40, 'Leatha', 'Leffler', 'wstroman@example.com', '474 Ted Cove\nWest Mauricio, IN 76173-4890', 1, 33, 2, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (41, 'Wanda', 'Greenfelder', 'floy93@example.net', '44994 Waters Rapid Apt. 981\nKristamouth, NC 22344', 1, 55, 5, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (42, 'Dayne', 'Jaskolski', 'qhirthe@example.net', '79804 Hulda Harbor\nNew Lempi, NC 24113-6821', 1, 46, 5, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (43, 'Grace', 'Schumm', 'freddy91@example.com', '74882 Rachel Estates Suite 259\nEast Alexastad, CT 24460', 1, 32, 2, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (44, 'Blaze', 'Baumbach', 'ymayert@example.com', '9103 Mateo Estates Apt. 020\nPort Carmineside, IA 63239', 1, 48, 4, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (45, 'Leatha', 'DuBuque', 'brenna50@example.com', '5356 Bechtelar Point\nEast Aprilside, MO 62163', 2, 36, 2, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (46, 'Crystel', 'Gottlieb', 'anissa21@example.net', '582 Rod Passage\nLake Estaborough, FL 03526', 2, 23, 1, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (47, 'Ahmad', 'Crona', 'aiyana61@example.net', '5116 Feest Forks Apt. 136\nWillland, IN 17908', 1, 61, 3, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (48, 'Alisha', 'Crona', 'ckonopelski@example.net', '428 Ashtyn Heights Apt. 080\nWest Easter, AZ 06650-1860', 2, 36, 4, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (49, 'Keira', 'Metz', 'jarvis.grimes@example.com', '081 Marley Brooks Suite 015\nKossberg, OR 39039-1532', 2, 66, 5, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (50, 'Rogers', 'Cruickshank', 'darrel96@example.net', '32129 Walter Stream Apt. 666\nWest Clyde, IN 90841-8631', 1, 60, 5, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (51, 'Eino', 'Kutch', 'roxane22@example.net', '600 Larson Trail Apt. 931\nNew Remingtonhaven, AZ 76290-3299', 1, 43, 5, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (52, 'Elmira', 'Watsica', 'lukas04@example.com', '545 Mollie Causeway\nHermannburgh, FL 82056', 1, 54, 1, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (53, 'Kyra', 'Larson', 'marvin.ofelia@example.com', '655 Wilderman Rapids Suite 511\nSouth Marcel, NV 91749-1889', 1, 55, 1, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (54, 'Velda', 'Ernser', 'raymundo10@example.net', '522 Stoltenberg Prairie Suite 282\nHillaryton, ID 22925', 2, 47, 3, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (55, 'Kaycee', 'Gleason', 'oscar.dubuque@example.com', '8195 Veum Land Suite 812\nPort Altashire, ID 86470-8883', 1, 29, 3, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (56, 'Emma', 'Walter', 'isaac.ziemann@example.com', '429 Ivah Key\nLake Elisha, NV 04834-3490', 1, 41, 3, 5, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (57, 'Norwood', 'Kuhlman', 'lrutherford@example.com', '723 Terry Spurs Apt. 495\nKatelynnborough, KS 13923-7631', 2, 35, 5, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (58, 'Pearlie', 'Hahn', 'floy.graham@example.net', '60707 Jakayla Squares Apt. 068\nKohlershire, VT 71372-7744', 2, 62, 4, 1, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (59, 'Gisselle', 'Swaniawski', 'rollin.yost@example.net', '3662 Laurianne Mills\nAidanchester, WI 66317-3639', 1, 43, 1, 5, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (60, 'Jettie', 'Romaguera', 'rebekah.koepp@example.com', '56044 Padberg Common\nEddieborough, IN 37926', 2, 42, 1, 2, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (61, 'Morris', 'Block', 'karli.reilly@example.net', '14687 Dana Cliff\nNew Neoma, IL 99070-1913', 1, 46, 2, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (62, 'Janie', 'Jones', 'lemke.kim@example.org', '45628 Koss Camp\nPadbergburgh, MI 83236-9092', 1, 67, 1, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (63, 'Jonas', 'Ratke', 'qbalistreri@example.com', '219 Upton Crossing Apt. 557\nPort Kendrick, PA 56469-9053', 1, 68, 4, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (64, 'Candido', 'Baumbach', 'connelly.damian@example.com', '1938 Ebert Hollow Suite 253\nWest Arvidville, CT 41012-2706', 2, 38, 1, 2, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (65, 'Valentin', 'Beier', 'rmaggio@example.org', '865 Zula Shoals\nPort Sadieland, WY 61882-4416', 2, 62, 2, 4, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (66, 'Kris', 'Wolf', 'kade.jones@example.net', '920 Windler Summit Suite 128\nLake Aubree, NV 77018', 1, 34, 3, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (67, 'Marshall', 'Sanford', 'shanna08@example.net', '46618 Hudson Loaf\nNew Yesseniaberg, NV 81943-4808', 2, 41, 1, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (68, 'Neal', 'Bradtke', 'alvina.hane@example.org', '5561 Schowalter Street\nVerdieside, OK 85027-3411', 1, 53, 2, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (69, 'Margie', 'Dooley', 'clemmie88@example.net', '2940 Kemmer Field Apt. 842\nErickahaven, NV 91929', 2, 34, 4, 3, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (70, 'Elmer', 'Beatty', 'green.madalyn@example.org', '6839 Witting Dam Suite 530\nWest Cathyborough, DC 31943-2778', 1, 44, 2, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (71, 'Macy', 'Kreiger', 'amir.grimes@example.net', '3846 Destiny Vista\nLake Dennishaven, SD 91340', 1, 61, 1, 1, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (72, 'Bernadette', 'Prosacco', 'everett.rice@example.net', '02320 Nader Skyway Apt. 423\nWest Lucie, UT 36114', 2, 24, 1, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (73, 'Giovani', 'Trantow', 'doyle.jarvis@example.org', '0888 Rahsaan Stravenue Apt. 500\nNorth Nona, GA 82903', 1, 65, 4, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (74, 'Eino', 'Krajcik', 'jrau@example.net', '383 Meaghan Center\nWest Katelinton, MA 38644-1180', 2, 70, 1, 1, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (75, 'Alena', 'Weber', 'tbeier@example.org', '5741 Carter Radial Apt. 366\nWainomouth, SC 12347-7885', 1, 29, 2, 2, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (76, 'Yasmine', 'Friesen', 'jimmy51@example.com', '31708 Jacobson Corners\nWest Chelsie, MI 81144', 1, 38, 3, 2, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (77, 'Mattie', 'Yost', 'thompson.cassidy@example.net', '767 Rene Ports\nNew Christa, MA 80479-2216', 1, 60, 1, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (78, 'Rodolfo', 'Dickinson', 'dillan.mraz@example.com', '82556 Beier Fords Apt. 045\nNew Coyton, ND 17229', 1, 18, 4, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (79, 'Krystel', 'Langworth', 'zratke@example.com', '562 Carroll Via Suite 170\nPort Delphineshire, OR 97369', 1, 58, 1, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (80, 'Amy', 'Ward', 'gutmann.deion@example.org', '9062 Nellie Mill Suite 717\nLake Lina, OK 65073', 2, 21, 2, 2, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (81, 'Anne', 'Keebler', 'white.ardith@example.org', '2931 Tito Club\nJastton, VT 62785-1779', 1, 52, 2, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (82, 'Jammie', 'Schinner', 'lonnie.flatley@example.net', '1765 Gregg Terrace\nWest Tamiafurt, ME 97833-6161', 2, 27, 4, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (83, 'Carey', 'Crooks', 'goyette.sammie@example.com', '188 O Connell Road Suite 399\nStephonton, CT 05698-2026', 2, 42, 4, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (84, 'Earl', 'Bashirian', 'eino05@example.org', '097 Vladimir Mountain\nPort Julianaland, IN 65189-1986', 2, 26, 1, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (85, 'Litzy', 'Paucek', 'aherman@example.org', '896 Kihn Isle Apt. 352\nEdisonbury, ND 96071', 2, 52, 3, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (86, 'Ayla', 'Watsica', 'jeffrey.west@example.net', '2503 Braun Brooks\nEast Kim, CO 72587', 1, 22, 2, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (87, 'Chet', 'Schowalter', 'rolfson.julio@example.net', '86160 Jalen Ports Apt. 162\nMurazikborough, OR 64006', 1, 38, 2, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (88, 'Letha', 'Gutkowski', 'weston29@example.org', '47041 Funk Key\nKoeppstad, NC 50878-8408', 1, 37, 5, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (89, 'Mazie', 'Hamill', 'shansen@example.com', '48319 Vergie Flats Suite 387\nSusietown, PA 57900-9125', 2, 54, 4, 2, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (90, 'Amaya', 'Hoeger', 'haley.francisca@example.org', '816 Goyette Landing\nEast Ruby, NE 51034-9027', 2, 49, 1, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (91, 'Stephan', 'Pagac', 'jeromy61@example.com', '08633 Dannie Extension\nHodkiewiczmouth, OR 26743', 1, 26, 1, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (92, 'Eusebio', 'Marvin', 'wisozk.rodger@example.org', '6793 Schowalter Wall Apt. 749\nGavinview, MT 42174-0134', 2, 40, 4, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (93, 'Tyreek', 'Rau', 'daija97@example.org', '42692 Gulgowski Junctions Suite 941\nMaribelton, PA 88164-7398', 1, 24, 5, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (94, 'Crawford', 'Erdman', 'jaden07@example.net', '54296 Ahmed Keys\nNorth Katrinahaven, UT 48252', 1, 49, 1, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (95, 'Carlee', 'Rice', 'kgrant@example.org', '539 Hazel Brook\nEast Mandyberg, NM 90611', 1, 30, 5, 4, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (96, 'Lyda', 'Brown', 'smitham.jana@example.com', '77523 Crooks Curve\nMaevebury, MD 41648', 2, 34, 5, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (97, 'Woodrow', 'Turcotte', 'ibarrows@example.com', '54006 Myra Flats\nBoylefurt, KS 90845-4896', 1, 39, 3, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (98, 'Maurice', 'McClure', 'shyann.ritchie@example.com', '267 VonRueden Well Apt. 638\nKathrynview, OR 06405-2187', 2, 26, 1, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (99, 'Ahmad', 'O Keefe', 'schmitt.bernadette@example.org', '51233 Freida Mountain\nPort Willardhaven, WV 27901', 2, 45, 3, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (100, 'Valentine', 'Langworth', 'kohler.woodrow@example.com', '19470 Orn Lodge\nLake Brigitte, KS 13832-5689', 1, 45, 2, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (101, 'Arden', 'Mertz', 'moen.aryanna@example.org', '584 Ziemann Inlet Apt. 470\nWest Enoch, ME 99807-4592', 1, 51, 4, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (102, 'Elyse', 'Fay', 'sanford.lazaro@example.net', '0483 Goodwin Causeway Apt. 512\nWest Amya, KY 07260', 1, 67, 1, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (103, 'Adele', 'Heidenreich', 'ara.flatley@example.com', '59375 Arlie Spur Apt. 858\nCindychester, MD 54904-6848', 2, 21, 1, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (104, 'Reta', 'Cole', 'nikolaus.chadd@example.com', '16198 Trevion Mill\nNyaside, IL 16180-3211', 2, 35, 2, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (105, 'Sterling', 'Murphy', 'lkiehn@example.net', '53462 Remington Dam Suite 967\nKerlukeside, NE 86637-6018', 1, 37, 2, 3, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (106, 'Hildegard', 'Zboncak', 'roob.vivienne@example.net', '5714 Renner Junction Apt. 815\nHammesport, AZ 15431', 2, 22, 1, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (107, 'Chelsea', 'Bogisich', 'mya.walter@example.net', '048 Tessie Unions Apt. 435\nEast Winstonbury, TN 61238-1160', 1, 20, 5, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (108, 'Christophe', 'Emard', 'lbuckridge@example.net', '0939 Moen Road\nPort Nicolasport, RI 67675-4432', 2, 28, 2, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (109, 'Orville', 'Hoeger', 'hector74@example.org', '969 Lubowitz Hill\nEast Johnniemouth, MI 10344', 2, 34, 2, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (110, 'Sally', 'Sporer', 'williamson.kyle@example.com', '3535 Swaniawski Rapid\nLeopoldton, CO 06200-4711', 1, 26, 5, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (111, 'Buster', 'Adams', 'hackett.emelie@example.net', '960 Koss Green Apt. 512\nCarlihaven, LA 24409', 2, 52, 4, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (112, 'Viola', 'Strosin', 'ruben.okuneva@example.com', '57787 Kshlerin Underpass\nNyaside, SC 91897', 2, 64, 1, 3, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (113, 'Tad', 'Gleason', 'noe76@example.com', '62675 Allene Corner\nEast Dustyland, WY 41235-2883', 2, 27, 2, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (114, 'Otto', 'McGlynn', 'aurelia55@example.net', '04889 Hintz Isle Apt. 387\nMalikafort, OR 07763-2355', 2, 49, 5, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (115, 'Winona', 'Metz', 'cdietrich@example.org', '2168 Jacquelyn Mountains Suite 080\nNew Nathanville, MI 78213-4254', 2, 52, 5, 3, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (116, 'Helene', 'Daniel', 'julien12@example.org', '18136 Bradtke Skyway Apt. 058\nRayborough, ID 29448', 2, 48, 3, 4, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (117, 'Justice', 'Crist', 'destinee20@example.net', '287 Prosacco Rue Apt. 472\nNorth Guillermo, MD 44411-3922', 1, 46, 1, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (118, 'Florence', 'Hoeger', 'heath.mann@example.org', '16038 Kihn Alley Suite 641\nHayleehaven, RI 60131-1228', 2, 31, 1, 2, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (119, 'Grace', 'Padberg', 'beryl71@example.org', '38072 Abbie Island Suite 039\nNew Camylleport, DE 44199', 2, 34, 5, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (120, 'Edmund', 'Larkin', 'grady.sophia@example.com', '3998 Lowe Meadows Apt. 704\nSouth Arvidbury, TN 63792', 2, 64, 4, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (121, 'Jillian', 'Adams', 'pcassin@example.com', '23180 Kuhn Square Suite 959\nDeventown, IL 71756', 1, 43, 2, 1, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (122, 'Dennis', 'Moore', 'predovic.kirstin@example.net', '164 Mills Ramp Apt. 071\nPort Dorianhaven, SC 25987-6446', 1, 62, 1, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (123, 'Marlen', 'Beatty', 'kuhlman.halle@example.net', '3594 Marjorie Trace Apt. 310\nAnikaland, PA 79084', 1, 20, 5, 1, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (124, 'Edd', 'Franecki', 'ferry.selmer@example.com', '6053 Neha Mountains Suite 713\nLake Gerard, UT 81367', 1, 64, 2, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (125, 'Julie', 'Okuneva', 'ilittel@example.org', '919 Jacobson Harbors\nSouth Julia, MO 23111', 1, 18, 3, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (126, 'Haskell', 'Dibbert', 'tania31@example.net', '986 Halvorson Turnpike\nNorth Florine, NH 24120', 1, 27, 5, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (127, 'Colt', 'Mann', 'hgibson@example.net', '18842 Keith Fort Suite 383\nSouth Janessafurt, MA 77319', 2, 25, 5, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (128, 'Erick', 'Bailey', 'douglas.abner@example.net', '58097 Franecki Coves\nTinamouth, KY 39495-1944', 2, 41, 3, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (129, 'Corene', 'Mueller', 'fisher.stan@example.org', '20875 Nick Tunnel\nNew Aaronburgh, ME 50782-9825', 1, 52, 2, 4, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (130, 'Kendall', 'Klocko', 'rempel.vincenzo@example.org', '0351 Eliseo Viaduct\nSouth Zenaview, DE 54152', 1, 63, 4, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (131, 'Carolyne', 'Casper', 'schowalter.tierra@example.net', '143 Fay Neck Suite 280\nNew Wilburn, IA 06534', 1, 62, 2, 5, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (132, 'Matt', 'Fisher', 'pollich.sofia@example.net', '6386 Gerlach Vista\nNorbertburgh, SD 43582', 2, 44, 3, 5, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (133, 'Forest', 'Klocko', 'gschuppe@example.net', '4628 Windler Creek Apt. 574\nPort Jannie, AK 62628', 2, 56, 4, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (134, 'Haskell', 'Vandervort', 'buck75@example.com', '36964 Rempel Plain Suite 882\nNorth Rosario, NE 59354-8758', 2, 44, 2, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (135, 'Judge', 'Pollich', 'hheaney@example.com', '9019 O Conner Street\nStreichport, KY 01774', 1, 66, 1, 3, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (136, 'Colten', 'Prosacco', 'will.lois@example.net', '817 Beryl Island\nNew Zita, DC 38387-8681', 1, 62, 1, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (137, 'Kathryne', 'Gutkowski', 'goyette.deborah@example.com', '861 Aryanna Key\nRalphtown, DC 84676-9552', 2, 21, 1, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (138, 'Shemar', 'Kshlerin', 'agrant@example.com', '49452 Braun Park Suite 379\nCormierborough, AK 00403', 2, 52, 4, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (139, 'Shemar', 'Doyle', 'kozey.lavern@example.org', '97355 Leannon Fort\nLake Vidal, KS 59977-3924', 1, 18, 3, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (140, 'Brett', 'Goyette', 'assunta49@example.net', '4925 Jovani Valleys Apt. 031\nKulasmouth, GA 93509', 2, 55, 5, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (141, 'Sydnee', 'Hessel', 'lehner.theron@example.com', '563 Yasmeen Locks\nKrystinaberg, WV 94207', 2, 30, 1, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (142, 'Tyreek', 'Heller', 'qhettinger@example.net', '549 Jonathon Lake Suite 530\nLake Idellburgh, VT 74496', 1, 38, 3, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (143, 'Claudie', 'Rogahn', 'powlowski.ron@example.net', '661 Miles Shoals\nWest Kendrickfurt, UT 14429', 1, 36, 2, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (144, 'Hassan', 'Walker', 'donald78@example.org', '5504 Nienow Causeway Apt. 812\nLake Chelseychester, WA 68027-5587', 1, 61, 4, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (145, 'Monique', 'Cassin', 'reichert.jermey@example.org', '2520 Erdman Via Apt. 839\nElizabethburgh, NC 70490-4652', 1, 37, 3, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (146, 'Helene', 'Corwin', 'jaskolski.hector@example.com', '645 McLaughlin Garden\nEast Lynnstad, AL 96586-8650', 1, 57, 3, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (147, 'Simeon', 'Nitzsche', 'lorena.torp@example.com', '610 Maggio Prairie Suite 209\nNorth Augusta, DC 99108-0520', 2, 43, 5, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (148, 'Marjorie', 'Cummings', 'hand.audie@example.net', '05266 Karolann Turnpike Apt. 089\nEast Claudia, ND 38467', 1, 24, 4, 4, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (149, 'Tod', 'Cormier', 'zcruickshank@example.net', '1655 Macejkovic Knolls Apt. 882\nSandrineborough, FL 57930-1307', 2, 62, 5, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (150, 'Helen', 'Johns', 'imani31@example.net', '66956 Joey Drives Apt. 856\nGutmannview, TX 92888', 1, 32, 1, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (151, 'Candelario', 'Graham', 'yanderson@example.net', '8591 Bailey Ramp\nNew Coty, WA 20209-1048', 1, 48, 1, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (152, 'Lowell', 'Kovacek', 'louisa10@example.org', '182 Ryan Pine Suite 891\nWest Brennan, ID 96517-6449', 2, 26, 3, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (153, 'Richie', 'Oberbrunner', 'elsie.balistreri@example.net', '759 Lula Stravenue\nNorth Olenview, NV 88112-6567', 1, 18, 4, 4, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (154, 'Davion', 'Beer', 'schowalter.barton@example.org', '1797 Koss Street\nMandytown, NJ 66597-1118', 2, 59, 1, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (155, 'Zelma', 'Kuhic', 'rritchie@example.com', '36204 Colton Viaduct\nEast Misty, OR 07494', 1, 34, 1, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (156, 'Kayli', 'Bradtke', 'cmurray@example.net', '846 Joy Field\nAuerport, AR 63266', 2, 38, 5, 5, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (157, 'Laury', 'Becker', 'mohammed.bahringer@example.org', '75964 Clay Isle\nNorth Laurencetown, DC 30316', 2, 18, 2, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (158, 'Jacey', 'Schimmel', 'leannon.pearl@example.org', '80199 Lakin Track\nSydneechester, TN 10506-9728', 2, 46, 4, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (159, 'Kelley', 'Gottlieb', 'ldach@example.net', '486 Keebler Mills Suite 484\nWest Melvin, NJ 68949-5197', 2, 38, 5, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (160, 'Foster', 'Herman', 'jon50@example.net', '50486 Russell Estate Apt. 440\nHellermouth, NV 94961', 2, 53, 3, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (161, 'Chandler', 'Upton', 'karine.maggio@example.org', '2672 Blanche Lock Apt. 406\nLebsackport, DC 23203', 2, 37, 5, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (162, 'Edythe', 'Bins', 'abigale.pfannerstill@example.com', '941 Parker Fall Suite 218\nLake Velmaview, MD 23660-8693', 2, 69, 1, 3, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (163, 'Ivah', 'Mayer', 'ezekiel.grant@example.net', '30654 Susanna Plaza\nWest Major, CO 67963', 1, 42, 5, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (164, 'Layne', 'Hane', 'knitzsche@example.net', '730 Watsica Rue\nPort Maximilliamouth, NV 83874', 2, 67, 2, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (165, 'Hulda', 'Will', 'schoen.cleveland@example.net', '867 Deven Mountains Suite 619\nPort Olatown, MN 11661', 2, 65, 2, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (166, 'Joesph', 'Goodwin', 'henderson14@example.org', '208 Damian Mill Suite 730\nEast Zaria, NV 03091-3357', 2, 42, 3, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (167, 'Theo', 'Schmeler', 'treutel.emmanuel@example.org', '731 Marquardt Skyway\nNew Moriah, IN 99800', 2, 48, 2, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (168, 'Leta', 'Beier', 'czemlak@example.com', '2186 Rhianna Spurs Apt. 341\nEdnaside, NV 65316', 1, 47, 3, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (169, 'Elton', 'Powlowski', 'whand@example.com', '7416 Carlotta Ridge Suite 471\nPort Carroll, NV 80224-0120', 1, 26, 2, 1, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (170, 'Alessandra', 'Howe', 'dannie74@example.com', '79496 Therese Parkways Apt. 656\nNew Jeff, MO 31186-3536', 2, 55, 1, 1, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (171, 'Cyril', 'D Amore', 'itzel07@example.com', '884 Alejandra Ford\nSouth Kale, WY 08880', 2, 36, 5, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (172, 'Doris', 'Dicki', 'larson.ricky@example.com', '618 Doyle Park Suite 787\nColtonshire, DC 17854', 2, 55, 1, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (173, 'Gerardo', 'Nader', 'yokon@example.com', '241 Lang Lock\nNew Rubieborough, OK 64219', 2, 30, 4, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (174, 'Serenity', 'Krajcik', 'etha95@example.org', '17015 Jennie Track\nRachaelburgh, ID 28296-8032', 1, 24, 4, 5, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (175, 'Wanda', 'Bode', 'shanny04@example.org', '420 Quinton Plain\nSpinkafurt, WA 28005', 1, 65, 4, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (176, 'Chester', 'Howell', 'osipes@example.com', '45422 Sonia Hill Apt. 752\nSouth Meggiestad, MN 40583-0119', 2, 69, 3, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (177, 'Ashley', 'Miller', 'nolson@example.org', '68420 Eryn Square\nWest Martin, NY 23714', 1, 47, 1, 1, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (178, 'Emilie', 'Erdman', 'barrett.nader@example.org', '68875 Tess Lakes Suite 992\nSouth Beverly, NV 11746-1126', 2, 56, 3, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (179, 'Frances', 'Nitzsche', 'ferry.felton@example.org', '7686 Jodie Rest Apt. 351\nPort Kelsie, ND 40539', 2, 51, 3, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (180, 'Stephania', 'Nienow', 'ted.cremin@example.net', '6822 Adaline Manors Apt. 380\nEast Berniece, MN 62765-7136', 1, 24, 4, 5, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (181, 'Anissa', 'Boyle', 'lora55@example.org', '6396 Percy Oval\nSouth Traceshire, NY 22472-2325', 2, 41, 5, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (182, 'Kiara', 'Cormier', 'schuster.katelin@example.net', '98691 Denesik Path Suite 059\nWest Kaydenburgh, WA 06900', 2, 48, 1, 1, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (183, 'Sister', 'Shields', 'vicenta.heaney@example.com', '62807 Streich Park Suite 340\nNorth Danial, KS 61753', 1, 19, 4, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (184, 'Cecil', 'Torp', 'tara.douglas@example.org', '244 Lehner Village\nCummerataview, VT 72007', 2, 56, 2, 5, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (185, 'Guido', 'Gutkowski', 'schumm.hipolito@example.com', '8877 Leannon Circle\nNorth Emmet, NJ 76156-4011', 1, 40, 2, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (186, 'Elijah', 'Kuhic', 'gennaro.dubuque@example.org', '281 Sheldon Stream\nSouth Maximo, AZ 55245', 2, 49, 5, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (187, 'Einar', 'Wolf', 'braxton.steuber@example.org', '7146 Kurtis Oval Suite 190\nEast Kiel, CA 59822-3305', 2, 51, 5, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (188, 'Ebony', 'Connelly', 'dbode@example.net', '9715 Carolyne Lodge Apt. 824\nCandelarioton, OK 28752-5409', 1, 45, 4, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (189, 'Arturo', 'Bailey', 'ruby40@example.net', '3616 Emerson Pines Suite 567\nDooleyview, AL 38051-6298', 2, 40, 3, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (190, 'Evan', 'Klein', 'hilton64@example.org', '9696 Arvilla Extensions\nWest Sidstad, IN 02421', 2, 28, 5, 3, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (191, 'Jerrold', 'Adams', 'irodriguez@example.net', '3169 Bogisich Tunnel Apt. 706\nBerenicefurt, WV 86951', 1, 43, 3, 4, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (192, 'Anibal', 'Crooks', 'little.kip@example.com', '7720 Herzog Islands Suite 650\nMuellerview, OH 10716-2571', 1, 18, 1, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (193, 'Roberto', 'Kshlerin', 'jonathan94@example.com', '817 Leuschke Glens Apt. 181\nNew Vincent, WY 51058-4896', 2, 50, 3, 1, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (194, 'Florida', 'Kovacek', 'ullrich.tamara@example.com', '7958 Jacobson Camp\nKubchester, MA 98331', 1, 46, 1, 2, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (195, 'Efren', 'Bechtelar', 'erick.heaney@example.org', '516 Torphy Via\nEast Cullenside, IA 80201-3984', 1, 43, 1, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (196, 'Gordon', 'Emmerich', 'imorissette@example.org', '5158 Deckow Views Apt. 065\nEast Gregoriastad, IA 14095', 2, 42, 3, 2, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (197, 'Jacklyn', 'Keeling', 'marcellus.barton@example.com', '9846 Nigel Park Suite 123\nLake Juwan, KS 82825', 2, 70, 3, 4, 2);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (198, 'Jared', 'Huel', 'chermiston@example.com', '3715 Quentin Estates Apt. 635\nPort Artberg, MA 60070', 2, 25, 3, 3, 1);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (199, 'General', 'Ruecker', 'veum.thurman@example.org', '01003 Tillman Hollow\nNew Eli, CA 34283', 1, 35, 2, 5, 3);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, Sex, Age, Income, Education, MaritalStatus) VALUES (200, 'Lacey', 'Hills', 'sylvia.bahringer@example.org', '22872 Bartell Parks\nWaynebury, RI 96260-4932', 2, 53, 5, 5, 1);


---------------------------------------------------------

INSERT INTO Stadium (StadiumName, Location) VALUES ('Royal Arena', '378 Station Road WESTERN CENTRAL LONDON WC53 6NF');
INSERT INTO Stadium (StadiumName, Location) VALUES ('Helix Arena', '329 New Road BIRMINGHAM B83 1NK');
INSERT INTO Stadium (StadiumName, LOCATION) VALUES ('Marble Centre', '135 Queens Road OXFORD OX46 5MW');
INSERT INTO Stadium (StadiumName, Location) VALUES ('Unity Bowl', '681 North Road SWANSEA SA8 9JY');

----------------------------------------------------------


INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('The Kop', 10, 5, 'Royal Arena');
INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('Bud Light', 14, 7, 'Royal Arena');
INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('Billy Boy', 11, 4, 'Royal Arena');
INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('Amazon', 10, 7, 'Helix Arena');
INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('Sir Alex', 14, 3, 'Helix Arena');
INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('Exeter One', 11, 5, 'Helix Arena');
INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('The Barn', 10, 3, 'Marble Centre');
INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('Renslade', 14, 3, 'Marble Centre');
INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('TP', 11, 2, 'Marble Centre');
INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('The Imperial', 10, 6, 'Unity Bowl');
INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('The Roman', 14, 5, 'Unity Bowl');
INSERT INTO Section (SectionName, NumRows, SeatsPerRow, StadiumName ) VALUES ('Dark Hedge', 18, 7, 'Unity Bowl');

---------------------------------------------------------


INSERT INTO Event (Event_name, StadiumName, Date, Time, TicketPrice) VALUES ('Manchester United - Chelsea', 'Marble Centre', '2023-03-15', '19:30:00', 40);
INSERT INTO Event (Event_name, StadiumName, Date, Time, TicketPrice) VALUES ('Barcelona - Real Madrid', 'Unity Bowl', '2023-02-27', '18:30:00', 35);
INSERT INTO Event (Event_name, StadiumName, Date, Time, TicketPrice) VALUES ('Arsenal - Tottenham Hotspur', 'Helix Arena', '2023-03-16', '12:00:00', 42);
INSERT INTO Event (Event_name, StadiumName, Date, Time, TicketPrice) VALUES ('AC Milan - Juventus', 'Marble Centre', '2023-02-21', '14:30:00', 50);
INSERT INTO Event (Event_name, StadiumName, Date, Time, TicketPrice) VALUES ('Liverpool - Everton', 'Helix Arena', '2023-03-02', '14:30:00', 60);
INSERT INTO Event (Event_name, StadiumName, Date, Time, TicketPrice) VALUES ('Exeter - Fulham', 'Unity Bowl', '2023-02-24', '11:30:00', 20);
INSERT INTO Event (Event_name, StadiumName, Date, Time, TicketPrice) VALUES ('Paris Saint-Germain - Manchester City', 'Royal Arena', '2023-03-16', '17:45:00', 45);
INSERT INTO Event (Event_name, StadiumName, Date, Time, TicketPrice) VALUES ('Bayern Munich - Bangkok FC', 'Royal Arena', '2023-02-22', '12:15:00', 70);


---------------------------------------------------------


INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (1, 'AC Milan - Juventus', 1);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (2, 'AC Milan - Juventus', 1);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (3, 'Barcelona - Real Madrid',1);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (4, 'Paris Saint-Germain - Manchester City',1);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (5, 'Arsenal - Tottenham Hotspur',2);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (6, 'Bayern Munich - Bangkok FC',2);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (7, 'Bayern Munich - Bangkok FC',3);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (8, 'Bayern Munich - Bangkok FC',3);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (9, 'Arsenal - Tottenham Hotspur',3);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (10, 'Bayern Munich - Bangkok FC',3);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (11, 'Barcelona - Real Madrid',3);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (12, 'Manchester United - Chelsea',3);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (13, 'Exeter - Fulham',4);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (14, 'Barcelona - Real Madrid',4);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (15, 'Bayern Munich - Bangkok FC',5);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (16, 'Paris Saint-Germain - Manchester City',6);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (17, 'Barcelona - Real Madrid',7);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (18, 'Manchester United - Chelsea',8);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (19, 'Bayern Munich - Bangkok FC',8);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (20, 'Liverpool - Everton',9);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (21, 'Liverpool - Everton',10);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (22, 'Manchester United - Chelsea',10);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (23, 'Manchester United - Chelsea',11);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (24, 'Manchester United - Chelsea',12);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (25, 'AC Milan - Juventus',12);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (26, 'Paris Saint-Germain - Manchester City',12);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (27, 'Bayern Munich - Bangkok FC',13);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (28, 'Paris Saint-Germain - Manchester City',13);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (29, 'Barcelona - Real Madrid',14);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (30, 'Arsenal - Tottenham Hotspur',14);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (31, 'Liverpool - Everton',15);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (32, 'AC Milan - Juventus',16);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (33, 'AC Milan - Juventus',16);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (34, 'Liverpool - Everton',17);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (35, 'AC Milan - Juventus',18);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (36, 'Exeter - Fulham',18);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (37, 'Paris Saint-Germain - Manchester City',18);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (38, 'Liverpool - Everton',18);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (39, 'Barcelona - Real Madrid',18);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (40, 'Barcelona - Real Madrid',19);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (41, 'Exeter - Fulham',19);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (42, 'AC Milan - Juventus',20);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (43, 'Liverpool - Everton',20);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (44, 'Exeter - Fulham',21);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (45, 'Paris Saint-Germain - Manchester City',21);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (46, 'Barcelona - Real Madrid',22);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (47, 'Barcelona - Real Madrid',22);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (48, 'Barcelona - Real Madrid',22);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (49, 'Barcelona - Real Madrid',22);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (50, 'Paris Saint-Germain - Manchester City',23);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (51, 'Arsenal - Tottenham Hotspur',24);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (52, 'Paris Saint-Germain - Manchester City',25);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (53, 'AC Milan - Juventus',25);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (54, 'Exeter - Fulham',26);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (55, 'AC Milan - Juventus',27);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (56, 'Liverpool - Everton',28);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (57, 'Bayern Munich - Bangkok FC',28);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (58, 'Arsenal - Tottenham Hotspur',29);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (59, 'Manchester United - Chelsea',29);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (60, 'Bayern Munich - Bangkok FC',29);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (61, 'Liverpool - Everton',30);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (62, 'Manchester United - Chelsea',30);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (63, 'Arsenal - Tottenham Hotspur',30);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (64, 'Arsenal - Tottenham Hotspur',31);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (65, 'Paris Saint-Germain - Manchester City',31);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (66, 'Exeter - Fulham',32);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (67, 'AC Milan - Juventus',32);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (68, 'Exeter - Fulham',32);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (69, 'Bayern Munich - Bangkok FC',33);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (70, 'AC Milan - Juventus',34);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (71, 'Exeter - Fulham',35);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (72, 'AC Milan - Juventus',36);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (73, 'Barcelona - Real Madrid',37);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (74, 'Manchester United - Chelsea',37);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (75, 'Liverpool - Everton',38);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (76, 'Barcelona - Real Madrid',39);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (77, 'Exeter - Fulham',39);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (78, 'Exeter - Fulham',39);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (79, 'Exeter - Fulham',39);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (80, 'Arsenal - Tottenham Hotspur',40);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (81, 'Manchester United - Chelsea',40);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (82, 'Bayern Munich - Bangkok FC',41);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (83, 'Paris Saint-Germain - Manchester City',42);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (84, 'Liverpool - Everton',42);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (85, 'AC Milan - Juventus',42);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (86, 'Manchester United - Chelsea',43);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (87, 'Bayern Munich - Bangkok FC',43);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (88, 'Paris Saint-Germain - Manchester City',44);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (89, 'Arsenal - Tottenham Hotspur',45);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (90, 'Liverpool - Everton',46);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (91, 'Liverpool - Everton',46);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (92, 'Manchester United - Chelsea',47);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (93, 'Arsenal - Tottenham Hotspur',47);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (94, 'Paris Saint-Germain - Manchester City',47);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (95, 'Arsenal - Tottenham Hotspur',48);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (96, 'Manchester United - Chelsea',48);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (97, 'Arsenal - Tottenham Hotspur',49);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (98, 'Manchester United - Chelsea',49);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (99, 'Arsenal - Tottenham Hotspur',49);
INSERT INTO Ticket (TicketID, Event_name, InvoiceID)VALUES (100, 'Exeter - Fulham',50);

---------------------------------------------------------

INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (1, 3, '2022-08-21',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (2, 47, '2022-09-01',3);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (3, 49, '2022-04-10',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (4, 87, '2022-06-28',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (5, 72, '2023-01-24',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (6, 31, '2022-06-05',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (7, 85, '2023-01-24',3);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (8, 46, '2022-08-07',3);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (9, 38, '2022-10-29',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (10, 93, '2022-04-10',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (11, 11, '2022-06-12',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (12, 65, '2022-05-11',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (13, 88, '2022-07-06',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (14, 48, '2022-05-19',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (15, 35, '2022-05-17',3);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (16, 96, '2022-04-05',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (17, 67, '2023-03-19',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (18, 22, '2022-08-05',3);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (19, 37, '2023-02-18',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (20, 26, '2022-05-08',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (21, 54, '2022-05-23',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (22, 29, '2023-01-19',3);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (23, 51, '2022-04-17',3);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (24, 99, '2022-11-25',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (25, 63, '2022-07-11',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (26, 92, '2022-05-21',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (27, 44, '2022-12-12',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (28, 64, '2022-12-29',3);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (29, 90, '2022-04-08',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (30, 20, '2022-12-27',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (31, 13, '2022-05-02',3);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (32, 78, '2022-08-18',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (33, 57, '2022-12-23',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (34, 10, '2022-07-19',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (35, 16, '2023-02-17',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (36, 21, '2022-11-18',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (37, 2, '2022-04-22',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (38, 17, '2022-08-02',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (39, 84, '2022-06-18',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (40, 81, '2022-06-26',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (41, 15, '2022-05-25',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (42, 50, '2022-09-29',3);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (43, 1, '2023-02-07',2);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (44, 95, '2023-01-04',1);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (45, 23, '2022-12-31',3);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (46, 82, '2022-06-11',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (47, 66, '2022-05-16',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (48, 45, '2022-08-14',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (49, 32, '2022-10-09',4);
INSERT INTO Invoice (InvoiceID, CustomerID, OrderDate, PaymentMethod ) VALUES (50, 40, '2022-12-02',4);
