/**
 *  StorageService.cls - Defines and contains behavior that leverages
 *      PokeService/PokeApi to retreive data and store it in custom
 *      sObjects defined in this package.
 * 
 *  Created by @sean-rw 3/22
 */

public class StorageService {
    
    final private PokeService POKE_SERVICE = new PokeService();
    private List<Pokemon> pokemonList = new List<Pokemon>();

    // Get a list of pokemon
    public List<Pokemon> getPokemonList() {
        if (pokemonList.isEmpty()) {
            this.fetchPokemon(10);
        }

        return this.pokemonList;
    }

    public void fetchPokemon(Integer amount) {
        List<Pokemon> retList = new List<Pokemon>();
        Integer start = this.pokemonList.size() + 1;

        for (Integer i = start; i < amount; i++) {
            Pokemon pokemon = new Pokemon(POKE_SERVICE.getPokemonById(i));
            retList.add(pokemon);
        }

        this.pokemonList = retList;
    }

    // private Pokemon__c populateSobject(Pokemon p) {
    //     // Create a Pokemon__c record populated from Pokemon api resource
    // }

    // private void storePokemon() {
    //     // Build List<Pokemon__c> and insert
        
    // }
}
