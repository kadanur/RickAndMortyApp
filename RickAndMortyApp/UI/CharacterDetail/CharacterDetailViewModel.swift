//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 25.03.2022.
//

import Foundation

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
}
