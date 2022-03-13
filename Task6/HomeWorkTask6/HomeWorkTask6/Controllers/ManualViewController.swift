//
//  ManualViewController.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 09.03.2022.
//

import Foundation
import UIKit

class ManualViewController: UIViewController {
    private let cellId = "cellId"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .secondarySystemBackground
        tableView.separatorStyle = .none
        tableView.rowHeight = 180
        tableView.register(ManualCourseCell.self, forCellReuseIdentifier: cellId)
        return tableView
    }()
    
    var viewModel = ManualViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCourses(screenSize: Float(UIScreen.main.bounds.width - 40)) {
            self.tableView.reloadData()
        }
        configureView()
    }
    
    func configureFrame() {
        let safeArea = view.safeAreaLayoutGuide.layoutFrame
        tableView.frame = CGRect(x: safeArea.minX,
                                 y: safeArea.minY,
                                 width: safeArea.width,
                                 height: safeArea.height)
    }
    
    override func viewDidLayoutSubviews() {
        configureFrame()
    }
}

extension ManualViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Course.courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ManualCourseCell
        cell.delegate = self
        cell.viewModel = viewModel.cellModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.cellModel[indexPath.row].height)
    }
}

extension ManualViewController {
    private func configureView() {        
        let navView = navigationBarView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openModallyNavigation))
        
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(tableView)
    }
    
    @objc
    private func openModallyNavigation() {
        let vc = SupportViewController()
        let leftItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeView))
        vc.navigationItem.leftBarButtonItem = leftItem
        present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    @objc
    private func closeView() {
        dismiss(animated: true, completion: nil)
    }
}

extension ManualViewController: NavigationDelegate {
    func addButtonTapped() {
        tabBarController?.selectedIndex = 3
    }
    
    func moreButtonTapped() {
        let vc = SupportViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
