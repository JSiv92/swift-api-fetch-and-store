//
//  BreedTableViewCell.swift
//  JonathanSivananthan_CatAPI_ProjectB-MobAppDev
//
//  Created by Jonathan Sivananthan on 20/11/22.
//
//  LAYOUT TESTED ON:
//  iphone 12
//
//  API: https://thecatapi.com/
//  KEY: live_lJYtcWGbh9CVhYNc9YnNNGoM9c5bukCNNzCAxG8AoEWnCh5zvVUuvRpawWVFtY9B
//

import UIKit

class BreedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var picView: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
