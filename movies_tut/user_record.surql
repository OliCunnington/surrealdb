DEFINE FIELD name ON TABLE user TYPE string;
DEFINE FIELD pass ON TABLE user TYPE string;

DEFINE INDEX unique_name ON TABLE user FIELDS name UNIQUE;

DEFINE TABLE OVERWRITE user SCHEMAFULL
    PERMISSIONS FOR select WHERE $auth.id = id;

DEFINE ACCESS account ON DATABASE TYPE RECORD
  SIGNUP ( CREATE user CONTENT { name: $name, pass: crypto::argon2::generate($pass) } )
  SIGNIN ( SELECT * FROM user WHERE name = $name AND crypto::argon2::compare(pass, $pass) )
  DURATION FOR TOKEN 15m, FOR SESSION 12h;