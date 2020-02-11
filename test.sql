SELECT Artist.Name as Artist, Album.Title as Album, Track.Name as Track, Track.TrackId as ID FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
INNER JOIN Artist ON Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = 'U2';

SELECT Genre.Name as Genre, Track.Name as Track, Album.Title as Album, Artist.Name as Artist from Genre 
INNER JOIN Track on Genre.GenreId = Track.GenreId
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Genre.Name = 'Rock';

SELECT Playlist.Name FROM Playlist
INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
INNER JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
GROUP BY Playlist.PlaylistId
HAVING COUNT(Track.TrackId) = 1;

SELECT Customer.FirstName, Customer.LastName, Invoice.InvoiceDate, Invoice.Total FROM Customer
INNER JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
ORDER BY Invoice.Total desc, Invoice.InvoiceDate desc
LIMIT 10;

SELECT Employee.FirstName, Employee.LastName,  COUNT(Customer.CustomerId) as Customers FROM Employee
INNER JOIN Customer ON Customer.SupportRepId = Employee.EmployeeId
WHERE Employee.FirstName = 'Jane' AND Employee.LastName = 'Peacock';

SELECT Customer.City as City, COUNT(Customer.CustomerId) as Customers FROM Customer
WHERE Customer.City = 'Berlin';

SELECT Track.Name, SUM(Track.UnitPrice) FROM Track
INNER JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
WHERE Track.Name = 'The Woman King';

SELECT Artist.Name as Artist, COUNT(Track.TrackId) as Tracks FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
INNER JOIN Artist ON Album.ArtistId = Artist.ArtistId
GROUP BY Artist
ORDER BY Tracks DESC
LIMIT 5;

INSERT INTO Album (Title, ArtistId)
VALUES ("Boy", 150);

INSERT INTO Track (Track.Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES  
    ("Twilight", 348, 2, 1, 'U2', 2345678, 9283, 0.99),
    ("An Cat Dubh", 348, 2, 1, 'U2', 6354278, 5364, 0.99),
    ("Into The Heart", 348, 2, 1, 'U2', 2555342, 3231, 0.99),
    ("out Of Control", 348, 2, 1, 'U2', 7436545, 3456, 0.99),
    ("Stories For Boys", 348, 2, 1, 'U2', 1342453, 2123, 0.99),
    ("The Ocean", 348, 2, 1, 'U2', 6325524, 4345, 0.99),
    ("A Day Without Me", 348, 2, 1, 'U2', 4423314, 6677, 0.99),
    ("Another Time, Another Place", 348, 2, 1, 'U2', 6455364, 8874, 0.99),
    ("The Electric Co.", 348, 2, 1, 'U2', 5534253, 4567, 0.99),
    ("Shadows and Tall Trees", 348, 2, 1, 'U2', 4663546, 7564, 0.99);
