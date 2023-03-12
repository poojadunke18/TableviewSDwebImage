//
//  PostTableViewCell.swift
//  SDwebimageTableView
//
//  Created by Mac on 12/03/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
