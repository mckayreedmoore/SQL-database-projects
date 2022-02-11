USE NewLibraryManagementSystem;


/* CREATION OF TABLES WITH NO FOREIGN KEYS */
CREATE TABLE libraryBranch(
	branchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branchName VARCHAR(50) NOT NULL,
	branchAddress VARCHAR(75) NOT NULL,
	);

CREATE TABLE borrower (
	cardNo INT NOT NULL PRIMARY KEY,
	borrowerName VARCHAR(50) NOT NULL,
	borrowerAddress VARCHAR(75) NOT NULL,
	borrowerPhone VARCHAR(25) NOT NULL
	);

CREATE TABLE publisher (
	publisherName VARCHAR(75) PRIMARY KEY NOT NULL,
	publisherAddress VARCHAR(50) NOT NULL,
	publisherPhone VARCHAR(25) NOT NULL
	);

	/* CREATION OF TABLES WITH FOREIGN KEYS */

CREATE TABLE books (
	bookID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	bookTitle VARCHAR(75) NOT NULL,
	publisherName VARCHAR(75) FOREIGN KEY REFERENCES publisher(publisherName)
	);

CREATE TABLE authors (
	bookID INT FOREIGN KEY REFERENCES books(bookID),
	authorName VARCHAR(75) NOT NULL
	);

CREATE TABLE bookCopies (
	bookID INT FOREIGN KEY REFERENCES books(bookID),
	branchID INT FOREIGN KEY REFERENCES libraryBranch(branchID),
	numberOfCopies INT NOT NULL
	);

CREATE TABLE bookLoans (
	bookID INT FOREIGN KEY REFERENCES books(bookID),
	branchID INT FOREIGN kEY REFERENCES libraryBranch(branchID), 
	cardNo INT FOREIGN KEY REFERENCES borrower(cardNo),
	dateOut INT NOT NULL,
	dateDue INT NOT NULL
	);

	-- END TABLE CREATION


	-- BEGIN TABLE DATA INSERTION

INSERT INTO libraryBranch (branchName, branchAddress)
VALUES
('Sharpstown', '123 sharpstown lane'),
('orem', '123 orem lane'),
('lehi', '123 lehi lane'),
('north salt lake', '123 north salt lake street'),
('salt lake', '123 salt lake street'),
('ogden', '123 ogden lane')
;

INSERT INTO borrower (cardNo, borrowerName, borrowerAddress, borrowerPhone)
VALUES
('11', 'carl', '123 north salt lake lane', '218-234-3988'),
('12', 'jim', '231 north salt lake lane', '209-232-3857'),
('13', 'ben', '329 salt lake lane', '801-392-3923'),
('14', 'kamry', '291 orem lane', '392-399-9000'),
('15', 'meredith', '239 lehi lane', '232-239-9999'),
('16', 'claire', '399 salt lake lane', '499-877-8787'),
('17', 'harry', '492 ogden lane', '444-392-2998'),
('18', 'vince', '211 salt lake ave', '565-828-2999')
;

INSERT INTO publisher (publisherName, publisherAddress, publisherPhone)
VALUES
('tor books', '123 tor books lane', '223-499-9389'),
('pearson', '123 pearson lane', '232-233-9888'),
('penguin random house', '222 penguin lane', '299-998-9239'),
('harper collins', '987 harper lane', '493-988-3982'),
('macmillan publishers', '948 macmillan lane', '939-499-9382'),
('scholastic corporation', '488 scholastic lane', '848-933-9488'),
('mcgraw-hill education', '2343 hill st', '323-444-9878'),
('fair winds press', '344 wind st', '333-988-9489'),
('chess publishers', '399 rook st', '443-848-8884'),
('long wind writing', '499 long st', '422-494-9999')
;

 -- This is where the insert stopped working. If you want to fix this, this is where to start
INSERT INTO books (bookTitle, publisherName)
VALUES
('enders game', 'tor books'),
('mistborn', 'tor books'),
('enders shadow', 'tor books'),
('the well of ascension', 'tor books'),
('hero of ages', 'tor books'),
('the speaker for the dead', 'tor books'),
('elantris', 'tor books'),
('the emperors soul', 'tor books'),
('shadow of the hegemon', 'tor books'),
('platos repubplic', 'penguin random house'),
('nichomachean ethics','penguin random house'),
('critique of pure reason', 'doubleday anchor books'),
('xenocide', 'tor books'),
('alloy of law', 'tor books'),
('bands of mourning', 'tor books'),
('1984', 'penguin random house'),
('moby dick', 'penguin random house'),
('on the origin of species', 'penguin random house'),
('the wealth of nations', 'penguin random house'),
('the lost tribe', 'penguin random house')
;


INSERT INTO authors (authorName) 
VALUES 
('brandon sanderson'),
('brandon mull'),
('orson scott card'),
('immanuel kant'),
('charles darwin'),
('adam smith'),
('herman melville'),
('leo tolstoy'),
('george orwell'),
('soren kierkegaard')
;

INSERT INTO bookCopies (numberOfCopies, bookID, branchID)
VALUES
(2, 1, 6),
(2, 2, 5),
(9, 5, 4),
(4, 7, 3),
(3, 2, 2),
(4, 3, 1),
(2, 17, 1),
(4, 19, 2),
(6, 18, 3),
(4, 14, 4),
(3, 13, 5),
(4, 12, 6),
(2, 11, 6),
(4, 10, 5),
(6, 9, 4),
(4, 8, 3)
;

INSERT INTO bookLoans (bookID, branchID, cardNO, dateOut, dateDue)
VALUES
(13, 1, 11, 2022-01-01, 2022-01-15),
(12, 2, 17, 2022-01-01, 2022-01-15),
(1, 3, 12, 2022-01-01, 2022-01-15),
(18, 4, 11, 2022-01-01, 2022-01-15),
(7, 5, 12, 2022-01-01, 2022-01-15),
(4, 6, 13, 2022-01-01, 2022-01-15),
(19, 6, 14, 2022-01-01, 2022-01-15),
(18, 5, 15, 2022-01-01, 2022-01-15),
(12, 4, 16, 2022-01-01, 2022-01-15),
(17, 3, 17, 2022-01-01, 2022-01-15),
(1, 2, 18, 2022-01-01, 2022-01-15)
;


SELECT * FROM ((bookLoans FULL OUTER JOIN borrower ON bookLoans.CardNo = borrower.cardNo) FULL OUTER JOIN books ON bookLoans.bookID = books.bookID)

--This query was requested to get both the entire list of books, and their authors. No connection has been made
	-- between these two data so this is what I did instead
SELECT * FROM books, authors;

-- to complete part 4, go to step 351. Because of the time and how late it is, I decided to keep going forward because I 
	-- wouldn't be able to get help with the state of my system, and I didn't want to just stop here