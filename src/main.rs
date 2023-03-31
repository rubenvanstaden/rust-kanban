mod logger;

type StdErr = Box<dyn std::error::Error>;

fn main() -> Result<(), StdErr> {

    dotenv::dotenv()?;
    logger::init()?;

    assert_eq!("INFO", std::env::var("LOG_LEVEL").unwrap());

    Ok(())
}
