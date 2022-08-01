use std::hash::Hasher;

mod atoms {
  rustler::atoms! {
    ok,
    error
  }
}

#[rustler::nif]
pub fn hash32(plaintext: String) -> u64 {
  let mut hasher = twox_hash::XxHash32::default();
  hasher.write(&plaintext.into_bytes());

  let hash = hasher.finish();

  return hash;
}

rustler::init!("Elixir.RustlerTwoxhash", [hash32]);
