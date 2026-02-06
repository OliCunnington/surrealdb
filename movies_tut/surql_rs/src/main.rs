// // use std::borrow::Cow;
// use serde::{Serialize, Deserialize};
// // use serde_json::json;
// use surrealdb::{
//     engine::remote::ws::{Client, Ws}, 
//     opt::auth::Root, 
//     Surreal
// };
// use surrealdb::Error;
// // use surrealdb::opt::auth::Root;
// // use surrealdb::engine::remote::ws::Ws;
// use std::sync::LazyLock;
// use std::fmt;


// #[derive(serde::Serialize, serde::Deserialize)]
// struct Movie {
//     titel: String,
//     actors: Vec<String>,
//     awards: Option<String>,
//     box_office: Option<u32>,
//     directors: Vec<String>,
//     dvd_released: Option<String>,
//     genres: Vec<String>,
//     imdb_rating: Option<u32>,
//     languages: Vec<String>,
//     metacritic_rating: Option<u32>,
//     oscars_won: Option<u32>,
//     plot: String,
//     released: String,
//     rt_rating: Option<u32>,
//     runtime: u32,
//     writers: Vec<String>,
//     poster: Option<String>,
//     rated: Option<String>,
//     average_rating: f32,

// }

// // Global database instance following the documentation pattern
// static DB: LazyLock<Surreal<Client>> = LazyLock::new(Surreal::init);

// #[derive(Serialize, Deserialize)]
// struct Person {
//     name: String,
//     roles: Vec<String>,
//     created_by: Option<String>
// }

// impl fmt::Display for Person {
//     fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
//         write!(f, "{}, {}", self.name, self.roles.len().to_string())
//     }
// }

// #[derive(Serialize, Deserialize)]
// struct TestPerson {
//     // id: String,
//     name: String,
// }

// impl fmt::Display for TestPerson {
//     fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
//         write!(f, "{}", self.name)
//     }
// }

// #[tokio::main]
// async fn main() -> Result<(), Error> {
//     DB.connect::<Ws>("localhost:8000").await?;

//     tracing::info!("Database WebSocket connection initialized successfully");

//     DB.signin(Root {
//         username: "root".to_string(),
//         password: "root".to_string(),
//     }).await?;

//     tracing::info!("Database service_user signed in successfully");
    
//     DB.use_ns("main").use_db("main").await?;

//     let people : Vec<TestPerson> = DB.select("test_persons");

//     for p in people {
//         println!("{}", p);
//     };

//     Ok(())
// }


use std::sync::LazyLock;
use serde::{Serialize, Deserialize};
use surrealdb::Surreal;
use surrealdb::opt::auth::Root;
use surrealdb::engine::remote::ws::Ws;
use surrealdb::engine::remote::ws::Client;

// Creates a new static instance of the client
static DB: LazyLock<Surreal<Client>> = LazyLock::new(Surreal::init);

#[derive(Serialize, Deserialize)]
struct Person {
    name: String,
}

#[tokio::main]
async fn main() -> surrealdb::Result<()> {
    // Connect to the database
    DB.connect::<Ws>("localhost:8000").await?;

    // Log into the database
    DB.signin(Root {
        username: "root",
        password: "root",
    }).await?;

    // Select a namespace/database
    DB.use_ns("main").use_db("main").await?;

    // Create or update a specific record
    let tobie: Option<Person> = DB.update(("person_demo", "tobie"))
        .content(Person {
            name: "Tobie".into(),
        }).await?;

    Ok(())
}