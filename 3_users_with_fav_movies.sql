SELECT
    u.id,
    u.username,
    ARRAY_AGG(f.movie_id) AS fav_movies_ids
FROM
    "User" u
LEFT JOIN
    "FavoriteMovie" f ON u.id = f.user_id
GROUP BY
    u.id;