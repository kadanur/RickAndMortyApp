//
//  CharacterDetailViewController.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 25.03.2022.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    
    static var viewModel: CharacterViewModel = CharacterViewModel(character: CharactersResult(id: 0, name: "", image: ""))
    static var characterId = 11
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Character Detail VC loaded.")
        self.title = String(CharacterDetailViewController.characterId)
    }
    
    @IBAction func backBarButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
