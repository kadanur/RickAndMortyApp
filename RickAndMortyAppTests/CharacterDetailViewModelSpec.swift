//
//  CharacterDetailViewModelSpec.swift
//  RickAndMortyAppTests
//
//  Created by M Kaan Adanur on 28.04.2022.
//

import Foundation
import Nimble
import Quick
@testable import RickAndMortyApp

class CharacterDetailViewModelSpec: QuickSpec {
    override func spec() {
        var viewModel: CharacterDetailViewModel!
        
        beforeEach {
            let character1 = CharactersResult(id: 99999, name: "RickTest", image: "", status: "Live", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth"))
           
            viewModel = CharacterDetailViewModel(character: character1)
        }
        
        describe("Character Detail sayfası") {
            context("Kayıt kontrolü yapıldığında") {
                it("Kayıtlı kullanıcıyı test etmesi") {
                    let character2 = CharactersResult(id: 99998, name: "MortyTest", image: "", status: "Live", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth"))
                    viewModel.saveCharacter(character: character2, saveButton: nil)
                    expect(viewModel.checkSaved(characterId: character2.id)).to(beTrue())
                    viewModel.deleteCharacter(characterId: character2.id, saveButton: nil)
                }
            }
        }
        
        describe("Character Detail sayfası") {
            context("Kayıt kontrolü yapıldığında") {
                it("Kayıtsız kullanıcıyı kontrol etmesi") {
                    expect(viewModel.checkSaved(characterId: viewModel.character.id)).to(beFalse())
                }
            }
        }
        
        describe("Character Detail sayfası") {
            context("Kayıt fonksiyonu çalıştırıldığında") {
                it("Sonucun test edilmesi") {
                    viewModel.saveCharacter(character: viewModel.character, saveButton: nil)
                    expect(viewModel.checkSaved(characterId: viewModel.character.id)).to(beTrue())
                    viewModel.deleteCharacter(characterId: viewModel.character.id, saveButton: nil)
                }
            }
        }
        
        describe("Character Detail sayfası") {
            context("Kaydı sil fonksiyonu çalıştığında") {
                it("Sonucun test edilmesi") {
                    viewModel.saveCharacter(character: viewModel.character, saveButton: nil)
                    viewModel.deleteCharacter(characterId: viewModel.character.id, saveButton: nil)
                    expect(viewModel.checkSaved(characterId: viewModel.character.id)).to(beFalse())
                }
            }
        }
        
    }
}
