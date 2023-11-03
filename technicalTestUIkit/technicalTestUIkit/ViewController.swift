//
//  ViewController.swift
//  technicalTestUIkit
//
//  Created by Mikel Valle on 3/11/23.
//
import UIKit

struct Nombre: Codable {
    var name: String
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var nombres: [Nombre] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchNombres()
    }

    func fetchNombres() {
        guard let url = URL(string: "https://api.github.com/repos/usuario/repo/contents/nombres.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                self.nombres = try JSONDecoder().decode([Nombre].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nombres.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let nombre = nombres[indexPath.row]
        cell.textLabel?.text = nombre.name
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Puedes agregar acciones al seleccionar una fila si es necesario.
    }
}

