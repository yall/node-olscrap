var scrapparser = require("./scrap-expression"),
    cheerio = require("cheerio");
    
module.exports = function(expr) {
  
  var evaluator = scrapparser.parse(expr);
  
  return {
      parse: function(html) {
        var $ = cheerio.load(html),
            chunks = evaluator.run($);
        return chunks;
      }
  }  
}