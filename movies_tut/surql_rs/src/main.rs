// use std::borrow::Cow;
use serde::{Serialize, Deserialize};
use serde_json::json;
use surrealdb::{Error, Surreal};
use surrealdb::opt::auth::Root;
use surrealdb::engine::remote::ws::Ws;


#[derive(Serialize, Deserialize)]
struct Movie {
    titel: String,
    actors: Vec<String>,
    awards: Option<String>,
    box_office: Option<u32>,
    directors: Vec<String>,
    dvd_released: Option<String>,
    genres: Vec<String>,
    imdb_rating: Option<u32>,
    languages: Vec<String>,
    metacritic_rating: Option<u32>,
    oscars_won: Option<u32>,
    plot: String,
    released: String,
    rt_rating: Option<u32>,
    runtime: u32,
    writers: Vec<String>,
    poster: Option<String>,
    rated: Option<String>,
    average_rating: f32,

}

#[derive(Serialize, Deserialize)]
struct Person {
    name: String,
    roles: Vec<String>,
}

#[tokio::main]
async fn main() -> Result<(), Error> {
    let db = Surreal::new::<Ws>("localhost:8000").await?;

    // Signin as a namespace, database, or root user
    db.signin(Root {
        username: "root",
        password: "root",
    }).await?;

    // Select a specific namespace / database
    db.use_ns("main").use_db("main").await?;

    let movies: Vec<Person> = db.select("movie").await?;

    println!("{}", movies.len().to_string());

    Ok(())
}
