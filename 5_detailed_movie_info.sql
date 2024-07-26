SELECT
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    json_build_object('filename', f.filename, 'mime_type', f.mime_type, 'url', f.url) AS poster,
    json_build_object('id', d.id, 'first_name', d.first_name, 'last_name', d.last_name) AS director
FROM
    "Movie" m
JOIN
    "File" f ON m.poster_id = f.id
JOIN
    "Person" d ON m.director_id = d.id
JOIN
    "MovieGenre" mg ON m.id = mg.movie_id
JOIN
    "Genre" g ON mg.genre_id = g.id
WHERE
    m.country_id = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > 135
    AND g.name IN ('Action', 'Drama')
GROUP BY
    m.id, f.id, d.id;