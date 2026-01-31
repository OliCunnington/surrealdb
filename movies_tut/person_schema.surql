DEFINE TABLE person SCHEMAFULL      TYPE NORMAL;
DEFINE FIELD name ON TABLE person   TYPE string;
DEFINE FIELD roles ON person        TYPE array<string> VALUE $value.distinct();


DEFINE TABLE starred_in             TYPE RELATION FROM person  TO movie;
DEFINE TABLE wrote                  TYPE RELATION FROM person  TO movie;
DEFINE TABLE directed               TYPE RELATION FROM person  TO movie;