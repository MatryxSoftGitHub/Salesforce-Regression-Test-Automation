public class HttpExample {
public static void httpExample(){
    HTTP http = new HTTP();
    HTTPRequest req = new HTTPRequest();
    req.setEndpoint ('https://reqres.in/api/users');
    req.setHeader('Content-Type', 'application.JSON');
    req.setMethod('GET');
    
    HTTPResponse res = new HTTPResponse();
    res=http.send(req);
    System.debug(res);    
}
}