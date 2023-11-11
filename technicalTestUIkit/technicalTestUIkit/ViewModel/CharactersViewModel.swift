//
//  CharactersViewModel.swift
//  technicalTestUIkit
//
//  Created by Mikel Valle on 8/11/23.
//

import Foundation
import Alamofire

class CharactersViewModel {
    var characters: [Character] = []
    
    func fetchCharacters(completion: @escaping () -> Void) {
        AF.request("https://rickandmortyapi.com/api/character", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                do {
                    let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                    self.characters = try JSONDecoder().decode(CharacterResponse.self, from: data).results
                    completion() // Llama a la clausura de finalización cuando se cargan los personajes.
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
            completion()
        }
    }
}

