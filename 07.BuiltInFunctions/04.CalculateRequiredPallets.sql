SELECT *, CEILING((CAST(Quantity AS FLOAT) / (PalletCapacity * BoxCapacity))) AS NumberOfPallets
    FROM Products;