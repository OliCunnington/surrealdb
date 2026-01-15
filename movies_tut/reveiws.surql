DEFINE FUNCTION fn::get_imdb($obj: array<object>) -> option<number> {
    LET $data = SELECT VALUE Score FROM ONLY $obj WHERE Source = 'Internet Movie Database' LIMIT 1;
    IF $data IS NONE { NONE } ELSE { <number>$data.replace('/10', '') * 10 }
};

DEFINE FUNCTION fn::get_rt($obj: array<object>) -> option<number> {
    LET $data = SELECT VALUE Score FROM ONLY $obj WHERE Source = 'Rotten Tomatoes' LIMIT 1;
    IF $data IS NONE { NONE } ELSE { <number>$data.replace('%', '') }
};

DEFINE FUNCTION fn::get_metacritic($obj: array<object>) -> option<number> {
    LET $data = SELECT VALUE Score FROM ONLY $obj WHERE Source = 'Metacritic' LIMIT 1;
    IF $data IS NONE { NONE } ELSE { <number>$data.replace('/100', '') }
};