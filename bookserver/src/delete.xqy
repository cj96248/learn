xquery version "1.0-ml";
declare namespace html = "http://www.w3.org/1999/xhtml";

let $id := xdmp:get-request-field("id")
let $uri := fn:concat("/book/", $id, ".xml")
let $_ := xdmp:document-delete($uri)
return "success"