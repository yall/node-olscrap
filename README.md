Ol'scrap
========

A simple one line scraping node.js module 

Installation
------------

    npm install -g olscrap

Usage
-----

Use command line expression Example :

    olscrap "https://npmjs.org/package/olscrap" "div.user > a.username {[href]}"

Expression grammar is basically `selector {output}` with :

* `selector` a CSS selector query
* `ouput` the format to be applied to each matching element, made of 
    * `function` as defined in jQuery (e.g. `text`, `html`, `val`) 
    * and `[attribute]` (e.g. `[href]`, `[name]`, `[type]`)

Full examples :
    
    ul.menu a.active {text [href]}
    input[type=text] {[name] val}

