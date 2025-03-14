//
//  CharacterDetailsViewController.swift
//  MonitoringMinecraftServers
//
//  Created by Grigoriy Kostyukhin on 18.03.2025.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    var character: RickAndMortyCharacter!
    
    @IBOutlet var characterImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.setImage(image: character.image!) { image in
            self.characterImage.image = image
        }
        nameLabel.text = character.name
        genderLabel.text = character.gender
        statusLabel.text = character.status
        speciesLabel.text = character.species
        
        navigationItem.title = character.name
    }
}
