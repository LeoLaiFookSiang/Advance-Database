DROP TABLE Member CASCADE CONSTRAINTS;
DROP TABLE CardDetail CASCADE CONSTRAINTS;
DROP TABLE Trip CASCADE CONSTRAINTS;
DROP TABLE Promotion CASCADE CONSTRAINTS;
DROP TABLE Claim CASCADE CONSTRAINTS;
DROP TABLE Review CASCADE CONSTRAINTS;
DROP TABLE Payment CASCADE CONSTRAINTS;
DROP TABLE Booking;
DROP TABLE Car;
DROP TABLE Driver;

CREATE TABLE Member (
    memID number(10) NOT NULL,
    memName varchar(50),
    memUsername varchar(50),
    memPassword varchar(50),
    memEmail varchar(50),
    memIC varchar(12),
    memContact varchar(11),
    memStatus varchar(10),
    createdDate date,
    updatedDate date,
    PRIMARY KEY (memID)
);

CREATE TABLE CardDetail (
    cardID number(10) NOT NULL,
    cardNo number(16),
    cardSecurityNo number(3),
    cardExpiry date,
    memID number(10),
    createdDate date,
    updatedDate date,
    PRIMARY KEY (cardID),
    FOREIGN KEY (memID) REFERENCES Member(memID)
);

CREATE TABLE Trip (
    tripID number(10) NOT NULL,
    origin varchar(100),
    destination varchar(100),
    pickupDate date,
    distance number(4,2),
    duration number(4),
    createdDate date,
    updatedDate date,
    PRIMARY KEY (tripID)
);

CREATE TABLE Driver (
    driverID number(10) NOT NULL,
    driverName varchar(50),
    driverUsername varchar(30),
    driverPassword varchar(20),
    driverIC varchar(12),
    driverContact varchar(11),
    driverCompany varchar(50),
    driverLicenseExpiry date,
    driverCurrentLocation varchar(100),
    driverStatus varchar(10),
    createdDate date,
    updatedDate date,
    PRIMARY KEY (driverID)
);

CREATE TABLE Car (
    carID number(10) NOT NULL,
    carPlateNo varchar(10),
    carModel varchar(30),
    carCapacity number(2),
    carFixedFare number(4,2),
    carStatus varchar(10),
    driverID number(10),
    createdDate date,
    updatedDate date,
    PRIMARY KEY (carID),
    FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

CREATE TABLE Booking (
    bookingID number(10) NOT NULL,
    totalFare number(5,2),
    bookingStatus varchar(10),
    memID number(10),
    driverID number(10),
    tripID number(10),
    createdDate date,
    updatedDate date,
    PRIMARY KEY (bookingID),
    FOREIGN KEY (memID) REFERENCES Member(memID),
    FOREIGN KEY (driverID) REFERENCES Driver(driverID),
    FOREIGN KEY (tripID) REFERENCES Trip(tripID)
);

CREATE TABLE Promotion (
    promoID number(10) NOT NULL,
    promoCode varchar(15),
    promoPrice number(2),
    promoMinSpend number(4,2),
    promoDescription varchar(100),
    promoStartDate date,
    promoEndDate date,
    createdDate date,
    updatedDate date,
    PRIMARY KEY (promoID)
);

CREATE TABLE Claim (
    claimID number(10) NOT NULL,
    claimStatus varchar(10),
    memID number(10),
    promoID number(10),
    createdDate date,
    updatedDate date,
    PRIMARY KEY (claimID),
    FOREIGN KEY (memID) REFERENCES Member(memID),
    FOREIGN KEY (promoID) REFERENCES Promotion(promoID)
);

CREATE TABLE Review (
    reviewID number(10) NOT NULL,
    reviewRating number(1),
    reviewComment varchar(100),
    createdDate date,
    updatedDate date,
    PRIMARY KEY (reviewID)
);

CREATE TABLE Payment (
    paymentID number(10) NOT NULL,
    receiptNo varchar(10),
    paymentDate date,
    subTotal number(4,2),
    totalAmount number(4,2),
    paymentType varchar(10),
    paymentStatus varchar(10),
    claimID number(10),
    cardID number(10),
    tripID number(10),
    reviewID number(10),
    createdDate date,
    updatedDate date,
    PRIMARY KEY (paymentID),
    FOREIGN KEY (claimID) REFERENCES Claim(claimID),
    FOREIGN KEY (cardID) REFERENCES CardDetail(cardID),
    FOREIGN KEY (tripID) REFERENCES Trip(tripID),
    FOREIGN KEY (reviewID) REFERENCES Review(reviewID)
);
