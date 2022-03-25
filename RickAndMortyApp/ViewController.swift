//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 25.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebServices().fetchCharactersData(url: URL(string: "https://rickandmortyapi.com/api/character/")!) { result in
            print(result)
        }
        
    }


}

