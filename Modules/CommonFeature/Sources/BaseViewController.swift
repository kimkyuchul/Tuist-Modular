//
//  BaseViewController.swift
//  ProjectDescriptionHelpers
//
//  Created by Kooky macBook Air on 2/21/24.
//

import UIKit

import RxSwift

open class BaseViewController: UIViewController {
    open var disposeBag = DisposeBag()

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
    }
}


