Polka.make()
->Polka.get("/hello", (_req, res) => {
  res->Polka.end("there")
})
->Polka.get("/user/:name", (req, res) => {
  switch req->Polka.params->Js.Dict.get("name") {
  | None => res->Polka.jsonEnd({"error": "missing name"})
  | Some(name) => res->Polka.jsonEnd({"name!": name})
  }
})
->Polka.listen(3000, () => Js.log("started"))
