SELECT
    m.id,
    m.title,
    COUNT(mc.character_id) AS actors_count
FROM
    "Movie" m
JOIN
    "MovieCharacter" mc ON m.id = mc.movie_id
WHERE
    m.release_date >= NOW() - INTERVAL '5 years'
GROUP BY
    m.id;