//
//  HomeViewModelTests.swift
//  RickAndMortyAppTests
//
//  Created by M Kaan Adanur on 6.04.2022.
//

import XCTest
@testable import RickAndMortyApp

class HomeViewModelTests: XCTestCase {
    
    private var viewModel: CharacterListViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CharacterListViewModel()
        
        let character1 = CharacterViewModel(character: CharactersResult(id: 1, name: "Rick", image: "", status: "Live", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth")))
        
        let character2 = CharacterViewModel(character: CharactersResult(id: 2, name: "Morty", image: "", status: "Live", species: "Human", gender: "Make", location: CharacterLocation(name: "Earth")))
        
        viewModel.charactersViewModel.append(character1)
        viewModel.charactersViewModel.append(character2)
    }

    func test_countOfCharactersInCharactersViewModelFunction() {
        XCTAssertEqual(viewModel.countOfCharactersViewModel(), viewModel.countOfCharactersViewModel())
    }
    
    func test_getCharacterViewModelFunction() {
        let lastIndex = viewModel.countOfCharactersViewModel() - 1
        for i in 0...lastIndex {
            let itemA = viewModel.getCharacterViewModel(at: i).character.id
            let itemB = viewModel.charactersViewModel[i].character.id
            XCTAssertEqual(itemA, itemB)
        }
    }

}
