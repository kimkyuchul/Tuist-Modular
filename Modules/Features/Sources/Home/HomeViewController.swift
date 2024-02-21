//
//  HomeViewController.swift
//  Features
//
//  Created by Kooky macBook Air on 2/12/24.
//  Copyright © 2024 kyuchul. All rights reserved.
//

import UIKit
import CommonFeature

import RealmSwift
import RxSwift

public final class HomeViewController: BaseViewController {
    
    private var realm: Realm!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        disposeBag = DisposeBag()
    }
}
