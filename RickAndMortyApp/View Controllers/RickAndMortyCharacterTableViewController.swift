//
//  MinecraftServerListViewController.swift
//  MonitoringMinecraftServers
//
//  Created by Grigoriy Kostyukhin on 14.03.2025.
//

import UIKit

class RickAndMortyCharacterTableViewController: UITableViewController {
    
    var characters: Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchData(from: RickAndMortyAPI.url.rawValue) { results in
            self.characters = results
            self.tableView.reloadData()
        }
        tableView.rowHeight = 50
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = characters?.results.count else { return 0 }
        return count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let character = characters?.results[indexPath.row]
        cell.configure(with: character!)
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let characterDetailsVC = segue.destination as? CharacterDetailsViewController else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            characterDetailsVC.character = characters?.results[indexPath.row]
        }
    }
}
