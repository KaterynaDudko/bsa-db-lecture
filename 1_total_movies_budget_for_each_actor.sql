SELECT
    p.id,
    p.first_name,
    p.last_name,
    SUM(m.budget) AS total_movies_budget
FROM
    "Person" p
JOIN
    "Character" c ON p.id = c.person_id
JOIN
    "MovieCharacter" mc ON c.id = mc.character_id
JOIN
    "Movie" m ON mc.movie_id = m.id
GROUP BY
    p.id;