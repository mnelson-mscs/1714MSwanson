-- Mark Swanson
-- Exercise 2F: Animal Shelter test queries
-- AnimalShelter db

-- 1) All animals
SELECT        Animals.AnimalName, AnimalTypes.Type, People.FirstName + N' ' + People.LastName AS Owner
FROM            Animals INNER JOIN
                         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id INNER JOIN
                         People ON Animals.Person_Id = People.Id

-- 2) Cash donations
SELECT        People.LastName + N', ' + People.FirstName AS Donor, Donations.DonationDate, Donations.Value AS Amount
FROM            Donations INNER JOIN
                         People ON Donations.Person_Id = People.Id INNER JOIN
                         DonationTypes ON Donations.DonationType_Id = DonationTypes.Id
WHERE        (DonationTypes.Description = N'Cash')

-- 3) Total donations for each donor
SELECT        People.Id, People.FirstName + N' ' + People.LastName AS Donor, SUM(Donations.Value) AS TotalDonations
FROM            Donations INNER JOIN
                         People ON Donations.Person_Id = People.Id
GROUP BY People.Id, People.FirstName + N' ' + People.LastName

-- 4) Number of dogs for each owner
SELECT        People.Id, People.LastName + N', ' + People.FirstName AS Owner, COUNT(*) AS [Number of Dogs]
FROM            Animals INNER JOIN
                         People ON Animals.Person_Id = People.Id INNER JOIN
                         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id
GROUP BY People.Id, People.LastName + N', ' + People.FirstName, AnimalTypes.Type
HAVING        (AnimalTypes.Type = N'Dog')