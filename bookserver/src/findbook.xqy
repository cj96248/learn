xquery version "1.0-ml";
declare namespace html = "http://www.w3.org/1999/xhtml";
import module namespace json="http://marklogic.com/xdmp/json"
 at "/MarkLogic/json/json.xqy";
  
declare function local:xml-to-json($node as node(),$array-name as xs:string*){
    let $config := json:config("custom") ,
        $_ := map:put( $config, "array-element-names", $array-name)
    return 
      json:transform-to-json( $node , $config )
};
  
let $dir := "/book/"
let $query := cts:and-query(cts:directory-query($dir,"infinity"))
let $results := cts:search(fn:doc(),$query)
let $books := element books {for $book in $results/book return 
                            element book {
                              attribute id {$book/@id},
                              element title {$book/title/string()},
                              element author {$book/author/string()},
                              element page {$book/pages/string()}
                            }
                          }
return local:xml-to-json($books,("book"))