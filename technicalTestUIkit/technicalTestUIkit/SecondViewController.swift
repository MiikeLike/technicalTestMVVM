//
//  DetailViewController.swift
//  technicalTestUIkit
//
//  Created by Mikel Valle on 5/11/23.
//

import UIKit




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
        viewModel.loadImage(for: character.image) { [weak self] image in
            DispatchQueue.main.async {
                self?.characterImageView.image = image
            }
        }
    }
}
