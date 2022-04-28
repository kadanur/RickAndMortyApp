//
//  SavedViewModelSpec.swift
//  RickAndMortyAppTests
//
//  Created by M Kaan Adanur on 28.04.2022.
//

import Foundation
import Nimble
import Quick
@testable import RickAndMortyApp

class SavedViewModelSpec: QuickSpec {
    override func spec() {
        var viewModel: SavedViewModel!
        
        beforeEach {
            viewModel = SavedViewModel()
            viewModel.savedCharacters.removeAll()
            let character1 = CharactersResult(id: 99999, name: "RickTest", image: "", status: "Live", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth"))
            let character2 = CharactersResult(id: 99998, name: "MortyTest", image: "", status: "Live", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth"))
            viewModel.savedCharacters.append(character1)
            viewModel.savedCharacters.append(character2)
        }
        
        describe("Saved sayfası") {
            context("Veriler çekildiğinde") {
                it("Çekilen veri sayısı") {
                   // try! viewModel.charactersViewModel.ap
                    expect(viewModel.numbersOfRow).to(equal(2))
                }
            }
        }
        
        describe("Saved sayfası") {
            context("TableView'a aktarıldığında") {
                it("Get Saved fonksiyonu ve index karşılaştırılması") {
                    let lastIndex = viewModel.numbersOfRow() - 1
                    for i in 0...lastIndex {
                        let itemA = viewModel.getSavedCharacter(at: i).id
                        let itemB = viewModel.savedCharacters[i].id
                        expect(itemA).to(equal(itemB))
                    }
                }
            }
        }
        

        
    }
}
