xquery version "1.0-ml";
declare namespace html = "http://www.w3.org/1999/xhtml";

let $id := xdmp:get-request-field("id")
let $category := xdmp:get-request-field("category")
let $title := xdmp:get-request-field("title")
let $author := xdmp:get-request-field("author")
let $pages := xdmp:get-request-field("pages")

let $book := element book {
                attribute id {$id},
                attribute category {$category},
                element title {$title},
                element author {$author},
                element pages {$pages}
              }
return xdmp:document-insert(concat("/book/",$id,".xml"),$book)