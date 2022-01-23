//
//  NetworkDataFetcher.swift
//  CronTask
//
//  Created by Eldar on 23.01.2022.
//

import Foundation

class NetworkDataFetcher {
    let networkManager = NetworkManager()
    
    func fetchPerson(urlString: String, response: @escaping (PersonModel?) -> Void) {
        networkManager.request(urlString: urlString) { (result) in
            switch result {
                
            case .success(let data):
                do {
                    let persons = try JSONDecoder().decode(PersonModel.self, from: data)
                    response(persons)
                } catch let jsonError {
                    print("Fail \(jsonError)")
                }
            case .failure(let error):
                print(error.localizedDescription)
                response(nil)
            }
        }
    }
    
}
