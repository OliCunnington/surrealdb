-- SELECT * FROM ONLY movie LIMIT 1;

SELECT * FROM naive_movie WHERE fn::date_to_datetime(Released) = None;

SELECT * FROM naive_movie WHERE fn::date_to_datetime(DVD) = None