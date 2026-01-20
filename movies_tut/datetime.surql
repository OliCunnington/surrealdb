DEFINE FUNCTION OVERWRITE fn::date_to_datetime($input: string) -> option<datetime> {
    LET $split = $input.split(' ');
    IF fn::month_to_num($split[1]) IS NONE {
        -- THROW "Invalid input: `" + $input + " : " + $split[1]
        NONE
    } ELSE {
        <datetime>($split[2] + '-' + fn::month_to_num($split[1]) + '-' + $split[0])
    }
};


DEFINE FUNCTION OVERWRITE fn::month_to_num($input: string) -> option<string> {
    IF      $input IS 'Jan' {RETURN '01' }
    ELSE IF $input IS 'Feb' {RETURN '02' }
    ELSE IF $input IS 'Mar' {RETURN '03' }
    ELSE IF $input IS 'Apr' {RETURN '04' }
    ELSE IF $input IS 'May' {RETURN '05' }
    ELSE IF $input IS 'Jun' {RETURN '06' }
    ELSE IF $input IS 'Jul' {RETURN '07' }
    ELSE IF $input IS 'Aug' {RETURN '08' }
    ELSE IF $input IS 'Sep' {RETURN '09' }
    ELSE IF $input IS 'Oct' {RETURN '10' }
    ELSE IF $input IS 'Nov' {RETURN '11' }
    ELSE IF $input IS 'Dec' {RETURN '12' }
    ELSE {
        -- THROW "Invalid input: `" + $input + "`. Please use a three-letter abbreviation such as 'Oct'."
        NONE
    }
};

-- 'JAN' IS 'JAN';
-- 'JAN' = 'JAN';

-- {
--     LET $s = 'JAN';
--     IF $s = 'JAN' {RETURN '01'}
--     ELSE {NONE}
-- }

-- fn::month_to_num('Jan');
-- fn::month_to_num('Feb');
-- fn::month_to_num('Mar');
-- fn::month_to_num('Apr');
-- fn::month_to_num('May');
-- fn::month_to_num('Jun');
-- fn::month_to_num('Jul');

-- <datetime>"1991-08-25"