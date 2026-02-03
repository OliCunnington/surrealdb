FOR $movie IN SELECT * FROM movie {
  FOR $actor_name IN $movie.actors {
      LET $actor = (SELECT * FROM ONLY person WHERE name = $actor_name LIMIT 1);
      LET $actor = IF $actor IS NONE {
        CREATE person CONTENT { name: $actor_name, roles: ["actor"]}
      } ELSE {
          UPDATE $actor SET roles += "actor";
        $actor
      };
      RELATE $actor->starred_in->$movie;
  };
      FOR $writer_name IN $movie.writers {
      LET $writer = (SELECT * FROM ONLY person WHERE name = $writer_name LIMIT 1);
      LET $writer = IF $writer IS NONE {
        CREATE person CONTENT { name: $writer_name, roles: ["writer"]}
      } ELSE {
          UPDATE $writer SET roles += "writer";
        $writer
      };
      RELATE $writer->wrote->$movie;
  };
      FOR $director_name IN $movie.directors {
      LET $director = (SELECT * FROM ONLY person WHERE name = $director_name LIMIT 1);
      LET $director = IF $director IS NONE {
        CREATE person CONTENT { name: $director_name, roles: ["director"]}
      } ELSE {
          UPDATE $director SET roles += "director";
        $director
      };
      RELATE $director->directed->$movie;
  };
};