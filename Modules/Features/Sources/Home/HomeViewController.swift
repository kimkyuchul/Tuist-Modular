//
//  HomeViewController.swift
//  Features
//
//  Created by Kooky macBook Air on 2/12/24.
//  Copyright © 2024 kyuchul. All rights reserved.
//

import UIKit

import RealmSwift

public final class HomeViewController: UIViewController {
    
    var realm: Realm!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        realm = try! Realm()
    }
}
