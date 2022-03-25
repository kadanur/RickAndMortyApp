//
//  WebServices.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 25.03.2022.
//

import Foundation

class WebServices {
    
    func fetchCharactersData(url: URL, completion: @escaping (CharactersMain?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("ERROR 1")
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(CharactersMain.self, from: data)
                    print(result)
                    completion(result)
                } catch {
                    print("DECODE ERROR")
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        }.resume()
    }
}
