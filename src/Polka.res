type t
type req
type res
type next
@module external make: unit => t = "polka"
@send external listen: (t, int, unit => unit) => unit = "listen"
@send external get: (t, string, (req, res) => unit) => t = "get"
@send external use: (t, (req, res, unit => unit) => unit) => t = "use"
@send external end: (res, string) => unit = "end"
@get external params: req => Js.Dict.t<string> = "params"
// testing

let jsonEnd = (res: res, payload: {..}) => {
  end(res, Belt.Option.getExn(Js.Json.stringifyAny(payload)))
}
