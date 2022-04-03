public with sharing class NamedApiResource {
    public String name {get; set;}
    public String url {get; set;}

    public NamedApiResource(JSONParser parser) {
        this.init(parser);
    }
    
    private void init(JSONParser parser){
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    if (text == 'name') {
                        name = parser.getText();
                    } else if (text == 'url') {
                        url = parser.getText();
                    } else {
                        System.debug(LoggingLevel.WARN, 
                            this.className + ' consuming unrecognized property: ' + text
                        );
                        consumeObject(parser);
                    }
                }
            }
        }	

    }
}
