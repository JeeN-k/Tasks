//
//  AutoLayoutViewController.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 09.03.2022.
//

import Foundation
import UIKit

class AutoLayoutViewController: UIViewController {
    
    private let cellId = "cellId"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50
        tableView.backgroundColor = .secondarySystemBackground
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(AutoLayoutCourseCell.self, forCellReuseIdentifier: cellId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension AutoLayoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Course.courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AutoLayoutCourseCell
        let course = Course.courses[indexPath.row]
        cell.delegate = self
        cell.setupFields(course: course)
        return cell
    }
}

extension AutoLayoutViewController {
    private func configureView() {
        
        let navView = navigationBarView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openModallyAlpha))
        
        view.addSubview(tableView)
        
        view.backgroundColor = .secondarySystemBackground
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc
    private func openModallyAlpha() {
        let vc = SupportViewController()
        vc.view.alpha = 0.5
        self.present(vc, animated: true, completion: nil)
    }
}

extension AutoLayoutViewController: NavigationDelegate {
    func addButtonTapped() {
        tabBarController?.selectedIndex = 3
    }
    
    func moreButtonTapped() {
        let vc = SupportViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
