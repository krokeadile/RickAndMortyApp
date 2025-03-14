//
//  CustomTableViewCell.swift
//  MonitoringMinecraftServers
//
//  Created by Grigoriy Kostyukhin on 14.03.2025.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var customImageView: UIImageView!
    
    func configure(with character: RickAndMortyCharacter) {
        NetworkManager.shared.setImage(image: character.image!) { image in
            self.customImageView.image = image
        }
        nameLabel.text = character.name ?? "No Name"
        customImageView.layer.cornerRadius = 24
        customImageView.frame.size = CGSize(width: 48, height: 48)
    }
}
