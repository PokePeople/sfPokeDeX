public with sharing class StorageService {
    
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

    private void storePokemon(Pokemon p) {
        // Store pokemon as Pocket_Monster__c
        
    }
}
