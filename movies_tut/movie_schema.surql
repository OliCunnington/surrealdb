DEFINE TABLE OVERWRITE movie SCHEMAFULL TYPE NORMAL;

DEFINE FIELD actors            ON TABLE movie TYPE array<string>;
DEFINE FIELD awards            ON TABLE movie TYPE option<string>;
DEFINE FIELD box_office        ON TABLE movie TYPE option<int>;
DEFINE FIELD directors         ON TABLE movie TYPE array<string>;
DEFINE FIELD dvd_released      ON TABLE movie TYPE option<datetime>;
DEFINE FIELD genres            ON TABLE movie TYPE array<string>;
DEFINE FIELD imdb_rating       ON TABLE movie TYPE option<int>;
DEFINE FIELD languages         ON TABLE movie TYPE array<string>;
DEFINE FIELD metacritic_rating ON TABLE movie TYPE option<int>;
DEFINE FIELD oscars_won        ON TABLE movie TYPE option<int>;
DEFINE FIELD plot              ON TABLE movie TYPE string;
DEFINE FIELD released          ON TABLE movie TYPE datetime;
DEFINE FIELD rt_rating         ON TABLE movie TYPE option<int>;
DEFINE FIELD runtime           ON TABLE movie TYPE duration;
DEFINE FIELD title             ON TABLE movie TYPE string;
DEFINE FIELD writers           ON TABLE movie TYPE array<string>;

DEFINE FIELD average_rating    ON TABLE movie 
    COMPUTED math::mean([imdb_rating, metacritic_rating, rt_rating][WHERE $this IS NOT NONE]);

-- -------- Query 1 --------
--      'There was a problem with the database: Parse error: Unexpected token `an identifier`, expected a kind name
--        --> [20:5]
--         |
--      20 | COMPUTED math::mean([imdb_rating, metacritic_rating, rt_rating][WHERE $this I...
--         | ^^^^^^^^ 
--      '