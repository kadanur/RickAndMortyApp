//
//  HomeViewController.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 25.03.2022.
//

import Foundation
import UIKit
import SDWebImage

class HomeViewController: UITableViewController {
    
    var viewModel = CharacterListViewModel()
    var pageCounter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacters()
        tableView.separatorStyle = .none
    }
    
    func getCharacters() {
        WebServices().fetchCharactersData(url: URL(string: "https://rickandmortyapi.com/api/character/?page=\(pageCounter)")!) { result in
            if let result = result {
                for i in result.results {
                    let item = CharacterViewModel.init(character: i)
                    self.viewModel.charactersViewModel.append(item)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension HomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countOfCharactersViewModel()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CharacterCell", owner: self, options: nil)?.first as! CharacterCell
        cell.characterName.text = viewModel.getCharacterViewModel(at: indexPath.row).name
        cell.characterId = viewModel.getCharacterViewModel(at: indexPath.row).id
        cell.characterImage.sd_setImage(with: viewModel.getCharacterViewModel(at: indexPath.row).imageURL, completed: nil)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath) as! CharacterCell
        CharacterDetailViewController.characterId = currentCell.characterId
        performSegue(withIdentifier: "toCharacterDetailFromHome", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastIndex = viewModel.countOfCharactersViewModel() - 1
        if indexPath.row == lastIndex {
            pageCounter = pageCounter + 1
            print("Page:" , pageCounter)
            getCharacters()
        }
    }
}
