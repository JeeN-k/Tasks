//
//  SupportViewConrtoller.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 13.03.2022.
//

import Foundation
import UIKit

class SupportViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.largeTitleDisplayMode = .never
    }
}
