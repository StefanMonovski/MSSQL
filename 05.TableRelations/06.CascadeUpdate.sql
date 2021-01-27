CREATE TABLE Products (
    BarcodeId INT,
    CONSTRAINT PK_ProductBarcodeId PRIMARY KEY (BarcodeId),
    Name VARCHAR(50),
    );

CREATE TABLE Stock (
    Id INT IDENTITY,
    CONSTRAINT PK_StockId PRIMARY KEY (Id),
    ProductBarcodeId INT NOT NULL,
    CONSTRAINT FK_StockProductBarcodeId FOREIGN KEY (ProductBarcodeId) REFERENCES Products(BarcodeId) ON UPDATE CASCADE,
    Quantity INT,
    );