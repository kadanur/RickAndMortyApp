//
//  HomeViewModel.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 25.03.2022.
//

import Foundation

class CharacterListViewModel {
    var charactersViewModel = [CharacterViewModel]()
    
    func getCharacterViewModel(at index: Int) -> CharacterViewModel {
        return charactersViewModel[index]
    }
    
    func countOfCharactersViewModel() -> Int {
        return charactersViewModel.count
    }
}

struct CharacterViewModel {
    var character: CharactersResult
    
    var id : Int {
        return character.id
    }
    
    var name: String {
        return character.name
    }
    
    var imageURL: URL {
        return URL(string: character.image)!
    }
}
