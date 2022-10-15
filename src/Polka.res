type t
type req
type res
type next
@module("polka") external make: unit => t = "default"
@send external listen: (t, int, unit => unit) => unit = "listen"
@send external get: (t, string, (req, res) => unit) => t = "get"
@send external use: (t, (req, res, unit => unit) => unit) => t = "use"
@send external end: (res, string) => unit = "end"
@send external setHeader: (res, string, 'a) => res = "setHeader"
@get external params: req => Js.Dict.t<string> = "params"
@get external method: req => string = "method"
@get external url: req => string = "url"

let jsonEnd = (res: res, payload: {..}) => {
  let json = Belt.Option.getExn(Js.Json.stringifyAny(payload))
  let jsonLen = Js.String.length(json)
  res
  ->setHeader("Content-Type", "application/json")
  ->setHeader("Content-Length", jsonLen)
  ->end(json)
}
