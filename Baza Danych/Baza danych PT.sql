-- usuwanie tabel (np. do celu wyczyszczenia bazy)
IF OBJECT_ID('UsersInRoom') IS NOT NULL
DROP TABLE UsersInRoom;
IF OBJECT_ID('UsersInOldRoom') IS NOT NULL
DROP TABLE UsersInOldRoom;
IF OBJECT_ID('ChatHistory') IS NOT NULL
DROP TABLE ChatHistory;
IF OBJECT_ID('Friends') IS NOT NULL
DROP TABLE Friends;
IF OBJECT_ID('Rooms') IS NOT NULL
DROP TABLE Rooms;
IF OBJECT_ID('OldRooms') IS NOT NULL
DROP TABLE OldRooms;

-- tworzenie tabel

-- obecnie istniejące pokoje
Create table Rooms(
	roomId int Primary Key Identity(1,1),
	ownerId nvarchar(128) references AspNetUsers(Id),
	creationDate date,
	name nvarchar(30),
	roomPassword nvarchar(30)
);

-- przynależność użytkownika do istniejącego pokoju (powiązanie)
Create Table UsersInRoom(
	roomId int references Rooms(roomId),
	userId nvarchar(128) references AspNetUsers(Id),
	Primary Key(roomId,userId)
);

-- pokoje istniejące w przeszłości
Create table OldRooms(
	oldRoomId Int Primary Key Identity(1,1),
	ownerId nvarchar(128) references AspNetUsers(Id),
	creationDate date
);

-- przynależność użytkownika do nieistniejącego już pokoju
Create table UsersInOldRoom(
	userId nvarchar(128) references  AspNetUsers(Id),
	oldRoomId int references OldRooms(oldRoomId),
	Primary Key (userId,oldRoomId)
);

-- historia rozmów na czacie
Create table ChatHistory( 
	messageId int Primary Key Identity(1,1),
	oldRoomId int references OldRooms(oldRoomId),
	userId nvarchar(128) references AspNetUsers(Id),
	content nvarchar(255)
);

-- znajomi
Create table Friends (
	firstUserId nvarchar(128) references AspNetUsers(Id),
	secondUserId nvarchar(128) references AspNetUsers(Id),
	Primary Key (firstUserId,secondUserId)
);

-- zaproszenia do pokojów
CREATE TABLE RoomsInvitations (
	invitationId INT PRIMARY KEY IDENTITY(1,1),
	inviterId NVARCHAR(128) REFERENCES AspNetUsers(Id),
	invitee NVARCHAR(128) REFERENCES AspNetUsers(Id)
);

-- sprawdzanie poprawności utworzenia tabel
SELECT * FROM Rooms;
SELECT * FROM UsersInRoom;
SELECT * FROM OldRooms;
SELECT * FROM UsersInOldRoom;
SELECT * FROM ChatHistory;
SELECT * FROM Friends;