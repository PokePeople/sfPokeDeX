# sfPokeDeX

Pokemon playground for researching, collecting, and battling the iconic creatures leveraging the [PokeAPI](https://www.pokeapi.co/) and Salesforce.

## Vision

The plan is to break down the sfPokeDeX project into more focused packages to separate concerns and keep the codebase clean. No TotTs here, please.

As I see it so far, these are the base packages I've envisioned, and an overview of the data/functionality it will provide/implement.

- **PokeDex package**
  - Informational resources relating to Pokemon from the PokeAPI
  - Pokemon
    - Species
    - Types
    - Abilities
    - Sprites
    - (More to implement)
  - Moves
  - Items
  - (More to implement)
    - Leverage apex callouts and a "StorageManager" class to store API data in custom sObjects and return to user
      - Need to define data factory
    - Will serve as backbone for populating the database
- **Trainer package**
  - Experience site allowing users to collect and train pokemon leveraging the PokeDex package
    - Defines Trainer (user) metadata for logging into Experience
      - Contact?
    - Defines training/evolution process
      - Time-based?
      - Dynamic?
- **Pok-ommunity package**
  - Define Trainer interactions
    - Battles
    - Trading
    - (Other ideas?)
  - Define Restful services to interact with other orgs and trainers
