CREATE TABLE Member (
    memID varchar(10) NOT NULL,
    memName varchar(50) NOT NULL,
    memUsername varchar(30),
    memPassword varchar(20) NOT NULL,
    memEmail varchar(50),
    memIC varchar(12) NOT NULL,
    memContact number(11),
    memStatus varchar(10),
    memCreateDate date,
    memUpdateDate date,
    PRIMARY KEY (memID)
);

CREATE TABLE CardDetails (
    cardID varchar(10) NOT NULL,
    cardNo number(10) NOT NULL,
    cardSecurityNo number(6) NOT NULL,
    cardExpiry date NOT NULL,
    memID varchar(10) NOT NULL,
    cardCreateDate date,
    cardUpdateDate date,
    PRIMARY KEY (cardID),
    FOREIGN KEY (memID) REFERENCES Member(memID)
);

CREATE TABLE Favourite (
    favID varchar(10) NOT NULL,
    favPlace varchar(50),
    memID varchar(10) NOT NULL,
    favCreateDate date,
    favUpdateDate date,
    PRIMARY KEY (favID)
);

CREATE TABLE Trip (
    tripID varchar(10) NOT NULL,
    origin varchar(100),
    destination varchar(100),
    pickupDate date,
    distance number(4,2),
    duration number(4,2),
    tripCreateDate date,
    tripUpdateDate date,
    PRIMARY KEY (tripID)
);

CREATE TABLE Driver (
    driverID varchar(10) NOT NULL,
    driverName varchar(50) NOT NULL,
    driverUsername varchar(30),
    driverPassword varchar(20) NOT NULL,
    driverIC varchar(12) NOT NULL,
    driverContact number(11),
    driverCompany varchar(50),
    driverLicenseNo number(10),
    driverLicenseExpiry date,
    driverCurrentLocation varchar(100),
    driverStatus varchar(10),
    driverCreateDate date,
    driverUpdateDate date,
    PRIMARY KEY (driverID)
);

CREATE TABLE Car (
    carID varchar(10) NOT NULL,
    carPlateNo varchar(10) NOT NULL,
    carModel varchar(30),
    carStatus varchar(10),
    typeID varchar(10) NOT NULL,
    driverID varchar(10) NOT NULL,
    carCreateDate date,
    carUpdateDate date,
    PRIMARY KEY (carID),
    FOREIGN KEY (typeID) REFERENCES CarType(typeID),
    FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

CREATE TABLE CarType (
    typeID varchar(10) NOT NULL,
    typeName varchar(50),
    fixedFare number(4,2),
    typeCreateDate date,
    typeUpdateDate date,
    PRIMARY KEY (typeID)
);

CREATE TABLE Booking (
    bookingID varchar(10) NOT NULL,
    totalFare number(4,2),
    bookingStatus varchar(10),
    memID varchar(10) NOT NULL,
    driverID varchar(10) NOT NULL,
    tripID varchar(10) NOT NULL,
    bookingCreateDate date,
    bookingUpdateDate date,
    PRIMARY KEY (bookingID),
    FOREIGN KEY (memID) REFERENCES Member(memID),
    FOREIGN KEY (driverID) REFERENCES Driver(driverID),
    FOREIGN KEY (tripID) REFERENCES Trip(tripID)
);

CREATE TABLE Promotion (
    promoID varchar(10) NOT NULL,
    promoCode varchar(10),
    promoDescription varchar(100),
    promoStartDate date,
    promoEndDate date,
    promoMaxRedemption number(4),
    promoCreateDate date,
    promoUpdateDate date,
    PRIMARY KEY (promoID)
);

CREATE TABLE Payment (
    paymentID varchar(10) NOT NULL,
    receiptNo number(10) NOT NULL,
    paymentDate date NOT NULL,
    charges number(4,2),
    totalAmount number(4,2),
    paymentType varchar(10),
    paymentStatus varchar(10),
    bookingID varchar(10) NOT NULL,
    promoID varchar(10) NOT NULL,
    paymentCreateDate date,
    paymentUpdateDate date,
    PRIMARY KEY (paymentID),
    FOREIGN KEY (bookingID) REFERENCES Booking(bookingID),
    FOREIGN KEY (promoID) REFERENCES Promotion(promoID)
);
