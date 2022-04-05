//
//  SavedViewController.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 5.04.2022.
//

import Foundation
import UIKit

class SavedViewController: UIViewController {
    
    var viewModel = SavedViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print("SavedVC loaded.")
        fetchSavedDatas()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name(rawValue: "Need Reload"), object: nil)
    }
    
    func fetchSavedDatas() {
        viewModel.getDatas { result in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func reloadTableView() {
        viewModel.savedCharacters.removeAll()
        fetchSavedDatas()
    }
}


extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numbersOfRow()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.getSavedCharacter(at: indexPath.row).name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CharacterDetailViewController.characterId = viewModel.getSavedCharacter(at: indexPath.row).id
        performSegue(withIdentifier: "toCharacterDetailFromSaved", sender: nil)
    }
}
