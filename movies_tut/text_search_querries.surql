SELECT title, plot FROM movie
  WHERE 
    plot @@ "time" OR
    title @@ "time";

-- score example
SELECT
    title,
    plot,
    search::score(0) + search::score(1) AS score
FROM movie
    WHERE
        plot @0@ "time" OR title @1@ "time"
ORDER BY score DESC
LIMIT 3;

-- extended score example
SELECT
    title,
    plot,
    search::score(0) + search::score(1) + search::score(2) + search::score(3) + search::score(4) + search::score(5) + search::score(6) + search::score(7) AS score
FROM movie
    WHERE
        plot @0@ "time"    OR title @1@ "time"
    OR  plot @2@ "future"  OR title @3@ "future"
    OR  plot @4@ "past"    OR title @5@ "past"
    OR  plot @6@ "present" OR title @7@ "present"
  OR  plot @8@ "fate"    OR title @9@ "fate"
ORDER BY score DESC;

-- highlight example
SELECT
    search::highlight("**", "**", 0) AS plot
FROM movie
    WHERE
      plot @0@ "per"
LIMIT 4;