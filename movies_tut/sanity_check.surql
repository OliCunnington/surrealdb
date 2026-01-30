SELECT VALUE Released FROM naive_movie WHERE Released.contains("Apr");

(SELECT VALUE Released FROM naive_movie WHERE Released.contains("Apr")).map(|$m| fn::date_to_datetime($m));

fn::month_to_num("Apr");

fn::date_to_datetime("08 Apr 2005")

-- fn::month_to_num('Apr')