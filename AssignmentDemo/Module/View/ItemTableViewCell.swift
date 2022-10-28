//
//  ItemTableViewCell.swift
//  AssignmentDemo
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var labelItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCellData(item: Item?) {
        labelItem.text = item?.name
        //imageViewItem.image = UIImage(named: "")
    }
}
