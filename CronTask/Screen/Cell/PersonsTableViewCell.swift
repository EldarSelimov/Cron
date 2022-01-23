//
//  PersonsTableViewCell.swift
//  CronTask
//
//  Created by Eldar on 23.01.2022.
//

import UIKit
import Kingfisher

class PersonsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fioLabel: UILabel!
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
    
    func configure(with persons: infoModel?) {
        
        photoImage.kf.setImage(with: URL(string: persons!.photo))
        fioLabel.text = persons?.fio
        companyLabel.text = persons?.company
        companyLabel.adjustsFontSizeToFitWidth = true
    }

}
