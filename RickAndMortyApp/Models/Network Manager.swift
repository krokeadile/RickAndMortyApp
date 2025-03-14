//
//  Network Manager.swift
//  MonitoringMinecraftServers
//
//  Created by Grigoriy Kostyukhin on 14.03.2025.
//
import UIKit
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func setImage(image: String, with complition: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            guard let imageURL = URL(string: image) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                complition(UIImage(data: imageData))
            }
        }
    }
    
    func fetchData(from url: String, complition: @escaping (Results) -> Void) {
        AF.request(RickAndMortyAPI.url.rawValue)
            .validate()
            .responseDecodable(of: Results.self) { response in
                switch response.result {
                case .success(let value):
                    complition(value)
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
}
