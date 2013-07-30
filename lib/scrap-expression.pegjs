//
//
//

{
  function scrap(selector, callback) {
    return {
        run: function($) {
          return $(selector).map(function(i, e) { 
            return callback.call($(e), $(e));
          });
        }
    }
  }
  function func(a) {
    return function(e, filter) {
      return [e[a].call(e)];
    }
  }
  function attr(a) {
    return function(e) {
      return [e.attr(a)];
    }
  }
  function concat(f1, f2) {
    return function(e) {
      return f1.call(e, e).concat(f2.call(e, e));
    } 
  }
}

start
  = scrap

scrap
  = sel:selector "{" output:output "}" { return scrap(sel, output); }

selector "selector"
  = chars:[0-9a-zA-Z_\. \[\]=:\-\,>#\+]+ { return chars.join("") } 

output
  = left:simple " " right:output { return concat(left, right) } / simple

simple 
  =  func / attr

func
  = f:string { return func(f) } 

attr
  = "[" a:string "]" { return attr(a) }
  
string "string"
  = chars:[a-zA-Z\.]+ { return chars.join("") }
