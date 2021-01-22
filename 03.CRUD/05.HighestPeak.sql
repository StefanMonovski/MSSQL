CREATE VIEW V_HighestPeak AS
SELECT TOP (1) *
    FROM Peaks
    ORDER BY Elevation DESC;