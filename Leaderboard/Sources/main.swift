import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectRequestLogger

let server = HTTPServer()

let logger = RequestLogger()
server.setRequestFilters([(logger, .high)])
server.setResponseFilters([(logger, .low)])

var routes = Routes()     //object to store each route/endpoint

routes.add(method: .get, uri: "/", handler: {
  request, response in
  response.setHeader(.contentType, value: "text/html")
  response.appendBody(string: "<html><title>Hello, World!</title><body>Hello, World!</body></html>")
  response.completed()
})

server.addRoutes(routes)

server.serverPort = 8181

do {
  try server.start()
} catch PerfectError.networkError(let error, let msg)
{
  print("Network error thrown: \(error) \(msg)")
}
