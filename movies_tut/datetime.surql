DEFINE FUNCTION OVERWRITE fn::date_to_datetime($input: string) -> datetime {
    LET $split = $input.split(' ');
    <datetime>($split[2] + '-' + fn::month_to_num($split[1]) + '-' + $split[0])
};


DEFINE FUNCTION OVERWRITE fn::month_to_num($input: string) -> string {
    IF      $input = 'Jan' { '01' }
    ELSE IF $input = 'Feb' { '02' }
    ELSE IF $input = 'Mar' { '03' }
    ELSE IF $input = 'Apr' { '04' }
    ELSE IF $input = 'May' { '05' }
    ELSE IF $input = 'Jun' { '06' }
    ELSE IF $input = 'Jul' { '07' }
    ELSE IF $input = 'Aug' { '08' }
    ELSE IF $input = 'Sep' { '09' }
    ELSE IF $input = 'Oct' { '10' }
    ELSE IF $input = 'Nov' { '11' }
    ELSE IF $input = 'Dec' { '12' }
    ELSE {
        THROW "Invalid input: `" + $input + "`. Please use a three-letter abbreviation such as 'Oct'."
    }
};