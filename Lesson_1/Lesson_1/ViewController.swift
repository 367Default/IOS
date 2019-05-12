//
//  ViewController.swift
//  Lesson_1
//
//  Created by Ruslan Tagiev on 12/05/2019.
//  Copyright © 2019 Ruslan Tagiev. All rights reserved.
//

import UIKit

class Session {
    
    static let instance = Session()
    
    private init(){}
    
    var fio = ""
    var id = 0
    var money = 0
    var token = 0
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = Session.instance
        session.fio = "Иванов Иван Иванович"
        session.id = 189483
        session.money = 9999
        session.token = 837489879384
        
    }
}
