surreal import -u root -p root --ns main --db main ./movies_naive.surql
wait 1

surreal import -u root -p root --ns main --db main ./movie_schema.surql
wait 1

surreal import -u root -p root --ns main --db main ./datetime.surql
wait 1

surreal import -u root -p root --ns main --db main ./reviews.surql
wait 1

surreal import -u root -p root --ns main --db main ./genre_rating.surql
wait 1

surreal import -u root -p root --ns main --db main ./analyzers.surql
wait 1

surreal import -u root -p root --ns main --db main ./indexes.surql
wait 1

surreal import -u root -p root --ns main --db main ./naive_cleaning.surql
wait 1

surreal import -u root -p root --ns main --db main ./person_schema.surql
wait 1

surreal import -u root -p root --ns main --db main ./populate_person.surql
wait 1

surreal import -u root -p root --ns main --db main ./users.surql
wait 1

surreal import -u root -p root --ns main --db main ./user_record.surql
wait 

surreal import -u root -p root --ns main --db main ./user_permissions.surql