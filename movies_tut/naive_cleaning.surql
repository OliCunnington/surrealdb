FOR $movie IN SELECT * FROM naive_movie {
    CREATE movie CONTENT {
        runtime: <duration>string::concat($movie.Runtime.split(" ")[0], "m"),// Modify $data.Runtime to fit our needs
        plot: ,// Will have an analyzer and search index defined so just pass in a string
        rt_rating: ,// Do something with $movie.Ratings to pull out the Rotten Tomatoes score and so on with the others
        imdb_rating: ,//
        meta_rating: ,//
        avg_rating: ,//
        actors: $movie.Actors.string::split(", "),//
        director: $movie.Director.string::split(", "),//
        writer: $movie.Writer.string::split(", "),//
        release_date: ,//
        box_office: //
    }
}