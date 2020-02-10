SELECT Genre.Name as Genre, Track.Name as Track, Album.Title as Album, Artist.Name as Artist from Track 
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Genre on Track.GenreId = Genre.GenreId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId where Genre.Name = "Grunge";