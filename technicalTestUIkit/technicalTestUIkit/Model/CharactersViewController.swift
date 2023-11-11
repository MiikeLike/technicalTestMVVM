//
//  ViewController.swift
//  technicalTestUIkit
//
//  Created by Mikel Valle on 3/11/23.
//
import UIKit

struct Character: Codable {
    let name: String
    let id: Int64
    let status: String
    let species: String
    let image: String
}
struct CharacterResponse: Codable {
    let results: [Character]
}
class DetailViewController: UIViewController {
    var character: Character?
}

class CharactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let charactersViewModel = CharactersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CharacterCell")
        charactersViewModel.fetchCharacters {
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersViewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        let character = charactersViewModel.characters[indexPath.row]
        cell.textLabel?.text = character.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = charactersViewModel.characters[indexPath.row]
        performSegue(withIdentifier: "ShowCharacterDetail", sender: character)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCharacterDetail" {
            if let detailVC = segue.destination as? SecondViewController {
                detailVC.viewModel.character = sender as? Character
                }
            }
        }
    }
