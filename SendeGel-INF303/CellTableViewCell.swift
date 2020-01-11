//
//  CellTableViewCell.swift
//  SendeGel-INF303
//
//  Created by Hasan Güzelmansur on 11.01.2020.
//  Copyright © 2020 Hasan Güzelmansur. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
  
    @IBOutlet weak var fotoView: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bilgiTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
