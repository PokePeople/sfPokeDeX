/**
 *  Codable.cls - Abstract class for api models that deal
 *      with JSON from Api resources
 * 
 *  Inspired by namesake protocol in Swift lang
 * 
 *  Created by @sean-rw 4/2/22
 */

public abstract class Codable {

    protected System.JSONParser parser;

    public Codable(String jsonString) {
        this.parser = getParser(jsonString);
        this.init();
    }
    
    protected abstract void init();

    // Helper
    protected System.JSONParser getParser(String jsonString) {
        return System.JSON.createParser(jsonString);
    }

    // From JSON2Apex
    public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
}
