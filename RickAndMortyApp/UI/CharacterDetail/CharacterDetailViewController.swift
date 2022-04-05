//
//  CharacterDetailViewController.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 25.03.2022.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    
    var viewModel = CharacterDetailViewModel(character: CharactersResult(id: 0, name: "", image: "", status: "", species: "", gender: "", location: CharacterLocation(name: "")))
    static var characterId = 0
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacter()
    }
    
    func getCharacter() {
        WebServices().fetchSelectedCharacterData(url: URL(string: "https://rickandmortyapi.com/api/character/\(CharacterDetailViewController.characterId)")!) { result in
            if let result = result {
                self.viewModel.character = result
                DispatchQueue.main.async {
                    self.title = self.viewModel.name
                    self.characterImage.sd_setImage(with: self.viewModel.imageURL, completed: nil)
                    self.idLabel.text = "Id: " + String(self.viewModel.id)
                    self.nameLabel.text = "Name: " + self.viewModel.name
                    self.statusLabel.text = "Status: " + self.viewModel.status
                    self.speciesLabel.text = "Species: " + self.viewModel.species
                    self.genderLabel.text = "Gender: " + self.viewModel.gender
                    self.locationLabel.text = "Location: " + self.viewModel.location
                }
            }
        }
    }
    
    @IBAction func saveBarButton(_ sender: Any) {
        viewModel.saveCharacter(character: viewModel.character)
    }
    
    @IBAction func backBarButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
