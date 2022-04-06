//
//  CharacterDetailTests.swift
//  RickAndMortyAppTests
//
//  Created by M Kaan Adanur on 6.04.2022.
//

import XCTest
@testable import RickAndMortyApp

class CharacterDetailViewModelTests: XCTestCase {
    
    private var viewModel: CharacterDetailViewModel!
    
    override func setUp() {
        super.setUp()
        let character1 = CharactersResult(id: 99999, name: "RickTest", image: "", status: "Live", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth"))
       
        viewModel = CharacterDetailViewModel(character: character1)
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel.deleteCharacter(characterId: viewModel.character.id, saveButton: nil)
    }
    
    func test_checkSavedFunctionIsTrue() {
        let character2 = CharactersResult(id: 99998, name: "MortyTest", image: "", status: "Live", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth"))
        viewModel.saveCharacter(character: character2, saveButton: nil)
        XCTAssertTrue(viewModel.checkSaved(characterId: character2.id))
        viewModel.deleteCharacter(characterId: character2.id, saveButton: nil)
    }
    
    func test_checkSavedFunctionIsFalse() {
        XCTAssertFalse(viewModel.checkSaved(characterId: viewModel.character.id))
    }
    
    func test_saveCharacterFunction() {
        viewModel.saveCharacter(character: viewModel.character, saveButton: nil)
        XCTAssertEqual(viewModel.checkSaved(characterId: viewModel.character.id), true)
    }
    
    func test_deleteCharacterFunction() {
        viewModel.saveCharacter(character: viewModel.character, saveButton: nil)
        viewModel.deleteCharacter(characterId: viewModel.character.id, saveButton: nil)
        XCTAssertEqual(viewModel.checkSaved(characterId: viewModel.character.id), false)
    }

}
