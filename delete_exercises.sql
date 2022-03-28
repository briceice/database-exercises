USE brice;

-- Albums released after 1991
DELETE
FROM albums
WHERE release_date > 1991;
-- Albums with the genre 'disco'
DELETE
FROM albums
WHERE genre = 'disco';
-- Albums by 'The Beatles'
DELETE
FROM albums
WHERE artist = 'The Beatles'