//
//  HomeTableViewCell.swift
//  InstagramApp
//
//  Created by Arpit iOS Dev. on 16/05/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImage.layer.cornerRadius = self.profileImage.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
