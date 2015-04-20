#' Topojson
#'
#' @export
#' @importFrom V8 new_context
#' @examples
#' topojson(x = "")

topojson <- function(x) {
  tp <- V8::new_context()
  tp$source(tpurl())

  tp$assign('topojson', 'require("topojson");')
  tp$assign('collection', '{"type":"Point","geometry":{"type":"Point","coordinates":[32.45,-99.74]},"properties":{}};')
  tp$eval('topology = topojson.topology({collection: collection});')
  tp$get("topology")
}

tpurl <- function() 'http://d3js.org/topojson.v1.min.js'

# tp$get(I('Object.keys(global)'))
# tp$console()
# tp$eval("console.log(topology.objects.collection)")
