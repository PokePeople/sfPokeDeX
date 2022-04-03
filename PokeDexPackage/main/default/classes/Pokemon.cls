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
							this.id = Integer.valueOf(parser.getText());
						}
						when 'name' {
							this.name = parser.getText();
						}
						when 'base_experience' {
							this.baseExperience = Integer.valueOf(parser.getText());
						}
						when 'height' {
							this.height = Integer.valueOf(parser.getText());
						}
						when 'is_default' {
							this.isDefault = Boolean.valueOf(parser.getText());	
						}
						when 'order' {
							this.order = Integer.valueOf(parser.getText());
						}
						when 'weight' {
							this.weight = Integer.valueOf(parser.getText());
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
}
