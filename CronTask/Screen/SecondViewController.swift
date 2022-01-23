//
//  SecondViewController.swift
//  CronTask
//
//  Created by Eldar on 23.01.2022.
//

import UIKit
import Kingfisher

class SecondViewController: UIViewController {
    
    @IBOutlet weak var fioLabel: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var sex: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    var person: infoModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetail(with: person)
        
    }
    
    func configureDetail(with persons: infoModel?) {
        photoImage.kf.setImage(with: URL(string: persons!.photo))
        fioLabel.text = person.fio
        id.text = String(describing: person.id)
        sex.text = person.sex
        company.text = person.company
        postLabel.text = person.post
    }
    
}
