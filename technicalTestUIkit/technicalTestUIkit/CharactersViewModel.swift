//
//  CharactersViewModel.swift
//  technicalTestUIkit
//
//  Created by Mikel Valle on 8/11/23.
//

import Foundation
import Alamofire

class CharactersViewModel {
    var characters: [CharacterViewModel] = []
    
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
}

class CharacterViewModel {
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

