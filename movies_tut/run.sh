surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/movies_naive.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/movie_schema.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/datetime.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/reviews.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/genre_rating.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/analyzers.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/indexes.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/naive_cleaning.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/person_schema.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/populate_person.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/users.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/user_record.surql
wait 1

surreal import -u root -p root --ns main --db main ~/Documents/vsc/surrealdb/movies_tut/user_permissions.surql