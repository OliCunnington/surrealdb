DEFINE FUNCTION OVERWRITE fn::get_imdb($obj: array<object>) -> option<number> {
    LET $data = SELECT VALUE Score FROM ONLY $obj WHERE Source = 'Internet Movie Database' LIMIT 1;
    IF $data IS NOT NONE {RETURN <number>$data.replace('/10', '') * 10 } ELSE { NONE }
};

DEFINE FUNCTION OVERWRITE fn::get_rt($obj: array<object>) -> option<number> {
    LET $data = SELECT VALUE Score FROM ONLY $obj WHERE Source = 'Rotten Tomatoes' LIMIT 1;
    IF $data IS NOT NONE {RETURN <number>$data.replace('%', '') } ELSE { NONE }
};

DEFINE FUNCTION OVERWRITE fn::get_metacritic($obj: array<object>) -> option<number> {
    LET $data = SELECT VALUE Score FROM ONLY $obj WHERE Source = 'Metacritic' LIMIT 1;
    IF $data IS NOT NONE {RETURN <number>$data.replace('/100', '') } ELSE { NONE }
};