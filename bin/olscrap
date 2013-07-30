#! /usr/bin/env node

// Usage : olscrap url exp
var args = process.argv.splice(2),
    url = args[0],
    expr = args[1];

var request = require("request"),
    olscraper = require("../lib/olscraper"),
    parser = olscraper(expr);  

request(url, function(err, resp, html) {
  // TODO catch errors
  
  var chunks = parser.parse(html);
  chunks.forEach(function(chunk) {
    console.log(chunk.join(" "));
  });
  
});