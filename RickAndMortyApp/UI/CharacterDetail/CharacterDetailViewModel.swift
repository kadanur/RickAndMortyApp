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
    
    func saveCharacter(character: CharactersResult) {
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
            print("Data is saved.")
            print(character.name)
        } catch {
            print("Save error")
            print(error.localizedDescription)
        }
    }
    
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
}
