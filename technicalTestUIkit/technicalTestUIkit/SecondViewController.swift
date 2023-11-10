//
//  DetailViewController.swift
//  technicalTestUIkit
//
//  Created by Mikel Valle on 5/11/23.
//

import UIKit
import Alamofire



class SecondViewController: UIViewController {
    let viewModel = CharactersDetailViewModel()

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let character = viewModel.character else { return }
        nameLabel.text = character.name
        statusLabel.text = character.status
        speciesLabel.text = character.species
        loadImage(from: character.image)
    }

    func loadImage(from url: String) {
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.characterImageView.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
