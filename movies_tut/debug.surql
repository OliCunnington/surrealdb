-- SELECT * FROM ONLY movie LIMIT 1;

-- SELECT * FROM naive_movie WHERE fn::date_to_datetime(Released) = None;

-- SELECT * FROM naive_movie WHERE fn::date_to_datetime(DVD) = None

FOR $data IN SELECT * FROM naive_movie {
    LET $split_date = $data.Released.split(" ");
    IF $split_date[1] IS NONE {$data}
}