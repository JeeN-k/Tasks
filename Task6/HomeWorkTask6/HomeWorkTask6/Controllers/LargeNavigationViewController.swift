//
//  LargeNavigationViewController.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 09.03.2022.
//

import Foundation
import UIKit


class LargeNavigationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Large title"
        view.backgroundColor = .systemBackground
        
        let pushButton = UIButton(type: .system)
        pushButton.setTitle("Push VC", for: .normal)
        pushButton.frame = CGRect(x: view.bounds.width / 2 - 35, y: view.bounds.height / 2 - 20, width: 70, height: 20)
        pushButton.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
        view.addSubview(pushButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    @objc
    private func pushVC() {
        let vc = SupportViewController()
        vc.title = "Small title"
        navigationController?.pushViewController(vc, animated: true)
    }
}
