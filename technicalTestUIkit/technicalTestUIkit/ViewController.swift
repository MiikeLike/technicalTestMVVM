//
//  ViewController.swift
//  technicalTestUIkit
//
//  Created by Mikel Valle on 3/11/23.
//
import UIKit
import Alamofire
import SwiftyJSON

struct Character: Codable { // Cambié el nombre de la estructura de "nombre" a "Character" para seguir convenciones de nomenclatura.
    let name: String
}

class CharactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    
    var characters: [Character] = [] // Declaración de un array para almacenar personajes.

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadCharacters()
    }

    func loadCharacters() {
        AF.request("https://rickandmortyapi.com/api/character", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                do {
                    let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                    self.characters = try JSONDecoder().decode([Character].self, from: data)
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        cell.textLabel?.text = characters[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        performSegue(withIdentifier: "ShowCharacterDetail", sender: character)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCharacterDetail" {
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.character = sender as? Character
            }
        }
    }
}
