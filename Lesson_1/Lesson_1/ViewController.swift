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

    var vkToken = ""
}

class ViewController: UIViewController {

    @IBOutlet weak var vkButton: UIButton!{
        didSet {
            vkButton.layer.borderWidth = 2
            vkButton.layer.borderColor = UIColor.white.cgColor
            vkButton.layer.cornerRadius = 10
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}
