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
    
    func loadImage(for url: String, completion: @escaping (UIImage?) -> Void) {
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(image)
                } else {
                    print("Error: No se pudo convertir los datos en una imagen válida.")
                    completion(nil)
                }
            case .failure(let error):
                print("Error de carga de imagen: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}

 

