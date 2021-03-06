/*
    errordoc.tst - Test Error Documents
 */

const HTTP = App.config.uris.http || "127.0.0.1:4100"
let http: Http = new Http


//  Standard error messages
http.get(HTTP + "/wont-be-there.html")
assert(http.status == 404)
assert(http.response.contains("Access Error: 404 -- Not Found"))
http.close()

http.get(HTTP + "/error/also-wont-be-there.html")
assert(http.status == 404)
assert(http.response.contains("<body>Bad luck - Can't find that document</body>"))
http.close()
