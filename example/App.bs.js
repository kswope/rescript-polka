// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Polka = require("../src/Polka.bs.js");
var Polka$1 = require("polka");
var Js_dict = require("rescript/lib/js/js_dict.js");

Polka$1().get("/hello", (function (_req, res) {
            res.end("there");
          })).get("/user/:name", (function (req, res) {
          var name = Js_dict.get(req.params, "name");
          if (name !== undefined) {
            return Polka.jsonEnd(res, {
                        "name!": name
                      });
          } else {
            return Polka.jsonEnd(res, {
                        error: "missing name"
                      });
          }
        })).listen(3000, (function (param) {
        console.log("started");
      }));

/*  Not a pure module */