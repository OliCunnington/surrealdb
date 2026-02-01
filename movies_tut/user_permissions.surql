DEFINE TABLE OVERWRITE movie SCHEMAFULL TYPE NORMAL
    PERMISSIONS
        FOR select WHERE $auth.id IS NOT NONE
        FOR create, update, delete WHERE created_by = $auth.id;
DEFINE TABLE OVERWRITE person SCHEMAFULL TYPE NORMAL
    PERMISSIONS
        FOR select WHERE $auth.id IS NOT NONE
        FOR create, update, delete WHERE created_by = $auth.id;
DEFINE TABLE OVERWRITE starred_in TYPE RELATION FROM person  TO movie
    PERMISSIONS
        FOR select WHERE $auth.id IS NOT NONE
        FOR create, update, delete WHERE created_by = $auth.id;
DEFINE TABLE OVERWRITE wrote TYPE RELATION FROM person TO movie
    PERMISSIONS
        FOR select WHERE $auth.id IS NOT NONE
        FOR create, update, delete WHERE created_by = $auth.id;
DEFINE TABLE OVERWRITE directed   TYPE RELATION FROM person  TO movie
    PERMISSIONS
        FOR select WHERE $auth.id IS NOT NONE
        FOR create, update, delete WHERE created_by = $auth.id;

DEFINE FIELD created_by ON TABLE movie      TYPE option<record<user>> READONLY VALUE $auth.id;
DEFINE FIELD created_by ON TABLE person     TYPE option<record<user>> READONLY VALUE $auth.id;
DEFINE FIELD created_by ON TABLE starred_in TYPE option<record<user>> READONLY VALUE $auth.id;
DEFINE FIELD created_by ON TABLE wrote      TYPE option<record<user>> READONLY VALUE $auth.id;
DEFINE FIELD created_by ON TABLE directed   TYPE option<record<user>> READONLY VALUE $auth.id;
DEFINE FIELD created_by ON TABLE has_movie  TYPE option<record<user>> READONLY VALUE $auth.id;