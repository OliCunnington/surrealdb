-- personal attempt...

-- FOR $movie IN SELECT * FROM naive_movie {
--     CREATE movie CONTENT {
--         runtime: <duration>$movie.Runtime.replace(" min", "m"),
--         plot: $movie.Plot,
--         rt_rating: fn::get_rt($movie.Ratings),
--         imdb_rating: fn::get_imdb($movie.Ratings),
--         meta_rating: fn::get_metacritic($movie.Ratings),
--         actors: $movie.Actors.split(", "),
--         director: $movie.Director.split(", "),
--         writer: $movie.Writer.split(", "),
--         release_date: fn::date_to_datetime($movie.Release),
--         box_office: $movie.BoxOffice.replace(",", "").replace("$", "")
--     }
-- };

FOR $data IN SELECT * FROM naive_movie {
    CREATE movie CONTENT {
        title: $data.Title,
        actors: $data.Actors.split(', '),
        writers: $data.Writer.split(', '),
        awards: $data.Awards,
        directors: $data.Director.split(', '),
        box_office: IF $data.BoxOffice = 'N/A' { NONE } ELSE { <int>$data.BoxOffice.replace('$', '').replace(',', '') },
        dvd_released: IF $data.DVD = 'N/A' { NONE } ELSE { fn::date_to_datetime($data.DVD) },
        released: fn::date_to_datetime($data.Released),
        genres: $data.Genre.split(', '),
        languages: $data.Language.split(', '),
        plot: $data.Plot,
        poster: $data.Poster,
        rated: $data.Rated,
        rt_rating: fn::get_rt($data.Ratings),
        imdb_rating: fn::get_imdb($data.Ratings),
        metacritic_rating: fn::get_metacritic($data.Ratings),
        runtime: <duration>$data.Runtime.replace(' min', 'm')
    };
}