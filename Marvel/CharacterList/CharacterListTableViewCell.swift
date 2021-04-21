//
//  CharacterListTableViewCell.swift
//  Marvel
//
//  Created by Angelo Esquibel on 4/16/21.
//

import Kingfisher
import UIKit

class CharacterListTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with character: Hero) {
        if let url = URL(string: character.thumbnail.url) {
            characterImageView.kf.setImage(with: url)
            characterImageView.kf.indicatorType = .activity
        }
        characterName.text = character.name
        characterDetail.text = character.description
    }
    
}
