//
//  SavedViewModel.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 5.04.2022.
//

import Foundation
import CoreData
import UIKit

struct SavedViewModel {
    
    var savedCharacters = [CharactersResult]()
    
    func numbersOfRow() -> Int {
        return savedCharacters.count
    }
    
    func getSavedCharacter(at index: Int) -> CharactersResult {
        return savedCharacters[index]
    }
    
    mutating func getDatas(completion: @escaping ([CharactersResult]?) -> Void) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CharacterEntity")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                let item = CharactersResult.init(id: result.value(forKey: "id") as! Int, name: result.value(forKey: "name") as! String, image: result.value(forKey: "imageURL") as! String, status: result.value(forKey: "status") as! String, species: result.value(forKey: "species") as! String, gender: result.value(forKey: "gender") as! String, location: CharacterLocation(name: result.value(forKey: "location") as! String))
                savedCharacters.append(item)
                completion(savedCharacters)
            }
        } catch {
            print("CoreData Fetch Error.")
            print(error.localizedDescription)
            completion(nil)
        }
        
    }
}
