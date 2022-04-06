//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 25.03.2022.
//

import Foundation
import CoreData
import UIKit

struct CharacterDetailViewModel {
    var character: CharactersResult
    
    var id: Int {
        return character.id
    }
    
    var name: String {
        return character.name
    }
    
    var status: String {
        return character.status
    }
    
    var species: String {
        return character.species
    }
    
    var gender: String {
        return character.gender
    }
    
    var location: String {
        return character.location.name
    }
    
    var imageURL: URL {
        return URL(string: character.image)!
    }
    
    func checkSaved(characterId: Int) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CharacterEntity")
        fetchRequest.returnsObjectsAsFaults = true
        var resultBool: Bool = false
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]  {
                let charId = result.value(forKey: "id") as! Int
                if charId == characterId {
                    resultBool = true
                    break
                }
            }
            return resultBool
        } catch {
            print("Check Saved Data Failed.")
            print(error.localizedDescription)
        }
        return true
    }
    
    func saveCharacter(character: CharactersResult, saveButton: UIBarButtonItem?) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newData = NSEntityDescription.insertNewObject(forEntityName: "CharacterEntity", into: context)
        // Data Attributes
        newData.setValue(character.gender, forKey: "gender")
        newData.setValue(character.id, forKey: "id")
        newData.setValue(character.image, forKey: "imageURL")
        newData.setValue(character.location.name, forKey: "location")
        newData.setValue(character.name, forKey: "name")
        newData.setValue(character.species, forKey: "species")
        newData.setValue(character.status, forKey: "status")
        do {
            try context.save()
            saveButton?.image = UIImage(systemName: "star.fill")
            print("Data is saved.")
            NotificationCenter.default.post(name: NSNotification.Name("Need Reload"), object: nil)
            print(character.name)
        } catch {
            print("Save error")
            print(error.localizedDescription)
        }
    }
    
    func deleteCharacter(characterId: Int, saveButton: UIBarButtonItem?) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CharacterEntity")
        fetchRequest.predicate = NSPredicate(format: "id == \(characterId)")
        if let result = try? context.fetch(fetchRequest) {
            for i in result {
                context.delete(i)
            }
        }
        do {
            try context.save()
            print("Save deleted.")
            NotificationCenter.default.post(name: NSNotification.Name("Need Reload"), object: nil)
            saveButton?.image = UIImage(systemName: "star")
        } catch {
            print("Delete Error.")
            print(error.localizedDescription)
        }
    }
}
