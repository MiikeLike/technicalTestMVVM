//
//  CharactersDetailViewModel.swift
//  technicalTestUIkit
//
//  Created by Mikel Valle on 8/11/23.
//


import Alamofire
import Foundation

class CharactersDetailViewModel {
    var character: Character?
    
    func loadImage(completion: @escaping (Data?) -> Void) {
        guard let character else {
            completion(nil)
            return
        }
        AF.request(character.image, method: .get).validate().responseData { response in
            switch response.result{
            case.success(let data):
                completion(data)
            case.failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}
 

