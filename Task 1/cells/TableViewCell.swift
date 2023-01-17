//
//  TableViewCell.swift
//  Task 1
//
//  Created by Ogabek Matyakubov on 17/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var tvBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
