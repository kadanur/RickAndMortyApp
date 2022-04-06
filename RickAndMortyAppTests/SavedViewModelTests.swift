//
//  SavedViewModelTests.swift
//  RickAndMortyAppTests
//
//  Created by M Kaan Adanur on 6.04.2022.
//

import XCTest
@testable import RickAndMortyApp

class SavedViewModelTests: XCTestCase {

    var viewModel: SavedViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = SavedViewModel()
        let character1 = CharactersResult(id: 99999, name: "RickTest", image: "", status: "Live", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth"))
        let character2 = CharactersResult(id: 99998, name: "MortyTest", image: "", status: "Live", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth"))
        viewModel.savedCharacters.append(character1)
        viewModel.savedCharacters.append(character2)
    }
    
    func test_numbersOfRowFunction() {
        XCTAssertEqual(viewModel.numbersOfRow(), 2)
    }
    
    func test_getSavedCharacterFunction() {
        let lastIndex = viewModel.numbersOfRow() - 1
        for i in 0...lastIndex {
            let itemA = viewModel.getSavedCharacter(at: i).id
            let itemB = viewModel.savedCharacters[i].id
            XCTAssertEqual(itemA, itemB)
        }
    }
    
    func test_getDatasFunctionNoThrow(){
        XCTAssertNoThrow(viewModel.getDatas(completion: { result in }))
    }
    
}
