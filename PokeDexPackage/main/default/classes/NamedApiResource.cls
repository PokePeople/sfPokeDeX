public class NamedApiResource extends Codable {

    public Integer id {get; set;}
    public String name {get; set;}
    public String url {get; set;}

    public NamedApiResource(JSONParser parser) {
        super(parser);
    }

    // public NamedApiResource(String jsonString) {
    //     super(jsonString);
    // }
    
    protected override void init() {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    if (text == 'name') {
                        name = parser.getText();
                    } else if (text == 'url') {
                        String u = parser.getText().removeEnd('/');
                        Integer i = u.lastIndexOf('/') + 1;
                        id = Integer.valueOf(u.substring(i));
                        url = parser.getText();
                    } else {
                        System.debug(LoggingLevel.WARN, 
                            'Error: consuming unrecognized property: ' + text
                        );
                        consumeObject(parser);
                    }
                }
            }
        }	
    }

    // From JSON2Apex
    public static List<NamedApiResource> createList(JSONParser parser) {
        List<NamedApiResource> res = new List<NamedApiResource>();
        if (parser.getCurrentToken() == null) parser.nextToken();
        while (parser.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new NamedApiResource(parser));
        }
        return res;
    }
}
