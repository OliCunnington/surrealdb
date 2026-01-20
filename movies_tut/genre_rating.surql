DEFINE PARAM $GENRES VALUE (SELECT VALUE Genre FROM naive_movie)
    .map(|$m| $m.split(', '))
    .group();

DEFINE PARAM $RATINGS VALUE (SELECT VALUE Rated FROM naive_movie)
    .map(|$m| $m.split(', '))
    .group();

-- $GENRES;
-- $RATINGS;