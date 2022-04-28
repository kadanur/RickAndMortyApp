//
//  HomeViewModelSpec.swift
//  RickAndMortyAppTests
//
//  Created by M Kaan Adanur on 28.04.2022.
//

import Foundation
import Nimble
import Quick
@testable import RickAndMortyApp

class HomeViewModelSpec: QuickSpec {
    override func spec() {
        var viewModel: CharacterListViewModel = CharacterListViewModel()
        
        beforeEach {
            viewModel.charactersViewModel.removeAll()
            
            let character1 = CharacterViewModel(character: CharactersResult(id: 1, name: "Rick", image: "", status: "Live", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth")))
            
            let character2 = CharacterViewModel(character: CharactersResult(id: 2, name: "Morty", image: "", status: "Live", species: "Human", gender: "Make", location: CharacterLocation(name: "Earth")))
            
            viewModel.charactersViewModel.append(character1)
            viewModel.charactersViewModel.append(character2)
        }
        
        describe("Home sayfası") {
            context("Veriler çekildiğinde") {
                it("Çekilen veri sayısı") {
                    expect(viewModel.countOfCharactersViewModel).to(equal(2))
                }
            }
        }
        
        describe("Home sayfası") {
            context("TableView'a aktarıldığında") {
                it("Get character fonksiyonu ve index karşılaştırması") {
                    let lastIndex = viewModel.countOfCharactersViewModel() - 1
                    for i in 0...lastIndex {
                        let itemA = viewModel.getCharacterViewModel(at: i).character.id
                        let itemB = viewModel.charactersViewModel[i].character.id
                        expect(itemA).to(equal(itemB))
                    }
                }
            }
        }
        
    }
}


