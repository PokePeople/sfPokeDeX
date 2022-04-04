/**
 * 	Pokemon.cls
 * 
 *	Created by @sean-rw on 4/3/22
 *	Complete re-write of original JSON2Apex generated class, with 
 *		constructor/parsing code borrowed from the original class.
 *	Apex model of PokeApi 'Pokemon' resource representing
 * 		all data related to a Pokemon
 *
 */

public class Pokemon extends Codable {

	public Integer id {get; set;}
	public String  name {get; set;}
	public Integer baseExperience {get; set;}
	public Integer height {get; set;}
	public Boolean isDefault {get; set;}
	public Integer order {get; set;}
	public Integer weight {get; set;}
	public List<Pokemon.Type> types {get; set;}

	// Convenience init
    public Pokemon(String jsonString) {
		super(jsonString);
    }

	protected override void init() {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					switch on text {
						when 'id' {
							this.id = parser.getIntegerValue();
						}
						when 'name' {
							this.name = parser.getText();
						}
						when 'base_experience' {
							this.baseExperience = parser.getIntegerValue();
						}
						when 'height' {
							this.height = parser.getIntegerValue();
						}
						when 'is_default' {
							this.isDefault = parser.getBooleanValue();	
						}
						when 'order' {
							this.order = parser.getIntegerValue();
						}
						when 'weight' {
							this.weight = parser.getIntegerValue();
						}
						when 'types' {
							this.types = createTypeList(parser);
						}
						when else {
							System.debug(LoggingLevel.WARN, 
								'Error: consuming unrecognized property: ' + text
							);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

	// Wrapper class for pokemon type reference
	public class Type extends Codable {

		public Integer slot {get; set;}
		public NamedApiResource type {get; set;}

		public Type(JSONParser parser) {
			super(parser);
		}

		protected override void init() {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'type') {
							this.type = new NamedApiResource(parser);
						} else if (text == 'slot') {
							this.slot = parser.getIntegerValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Error: consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}

	}
	
	// From JSON2Apex
	public static List<Pokemon.Type> createTypeList(JSONParser parser) {
		List<Pokemon.Type> res = new List<Pokemon.Type>();
		if (parser.getCurrentToken() == null) parser.nextToken();
		while (parser.nextToken() != System.JSONToken.END_ARRAY) {
			res.add(new Pokemon.Type(parser));
		}
		return res;
	}
}
