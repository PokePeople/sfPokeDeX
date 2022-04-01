public class PokeService {
    
    private static Http httpProtocol = new Http();
    private final String BASE_URL = 'https://pokeapi.co/api/v2/pokemon/';
    
    public String getPokemonById(Integer id) {

        HttpRequest req = new HttpRequest();

        // Setup the request
        req.setEndpoint(BASE_URL + String.valueOf(id));
        req.setMethod('GET');

        System.debug(req.getEndpoint());

        HttpResponse res = httpProtocol.send(req);

        if (res.getStatusCode() != 200) {
            throw new HttpException(res.getBody());
        }

        return res.getBody();
    }

    public String getMoveInfo(String url) {
        HttpRequest req = new HttpRequest();

        // Setup the request
        req.setEndpoint(url);
        req.setMethod('GET');

        System.debug(url);

        HttpResponse res = httpProtocol.send(req);

        if (res.getStatusCode() != 200) {
            throw new HttpException();
        }

        return res.getBody();
    }
}

