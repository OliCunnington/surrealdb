use std::borrow::Cow;
use serde::{Serialize, Deserialize};
use serde_json::json;
use surrealdb::{Error, Surreal};
use surrealdb::opt::auth::Root;
use surrealdb::engine::remote::ws::Ws;

//structs...

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

}
