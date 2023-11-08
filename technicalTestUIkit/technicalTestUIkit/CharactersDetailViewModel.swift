//
//  CharactersDetailViewModel.swift
//  technicalTestUIkit
//
//  Created by Mikel Valle on 8/11/23.
//


import Alamofire
import Foundation

class CharactersDetailViewModel {
    var characters: [CharacterViewModel] = []
    
    func fetchCharacters(completion: @escaping () -> Void) {
        func fetchCharacters(completion: @escaping () -> Void) {
            AF.request("https://rickandmortyapi.com/api/character", method: .get).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        self.CharactersViewModel = try JSONDecoder().decode(CharacterResponse.self, from: data).results
                        self.tableView.reloadData()
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        // Aquí realizarías la lógica para obtener los personajes, similar a como lo hacías en `loadCharacters`.
        // Luego, crearías CharacterViewModels y los almacenarías en la propiedad `characters`.
    }
}

class CharacterDetailViewModel {
    let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var name: String {
        return character.name
    }
    
    var status: String {
        return character.status
    }
    
    var species: String {
        return character.species
    }
    
    var image: String {
        return character.image
    }
}

