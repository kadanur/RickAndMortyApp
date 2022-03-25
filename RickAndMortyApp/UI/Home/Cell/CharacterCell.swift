//
//  CharacterCell.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 25.03.2022.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    var characterId : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowRadius = 12
        cardView.layer.shadowOpacity = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
