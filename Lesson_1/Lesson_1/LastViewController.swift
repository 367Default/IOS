//
//  LastViewController.swift
//  Lesson_1
//
//  Created by Ruslan Tagiev on 12/05/2019.
//  Copyright © 2019 Ruslan Tagiev. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var token: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = Session.instance
        name.text = session.fio
        money.text = "\(session.money) ₽"
        userId.text = "id\(session.id)"
        token.text = "\(session.token)"
        
    }
    
}
