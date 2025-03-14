//
//  Rick And Morty.swift
//  MonitoringMinecraftServers
//
//  Created by Grigoriy Kostyukhin on 14.03.2025.
//

struct Results: Decodable {
    let results: [RickAndMortyCharacter]
}

struct RickAndMortyCharacter: Decodable {
    let name: String?
    let gender: String?
    let image: String?
    let status: String?
    let species: String?
}

enum RickAndMortyAPI: String {
    case url = "https://rickandmortyapi.com/api/character/"
}
