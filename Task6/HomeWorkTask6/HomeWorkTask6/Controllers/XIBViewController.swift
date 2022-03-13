//
//  XIBViewController.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 12.03.2022.
//

import UIKit

class XIBViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension XIBViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Course.courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! XIBCourseCell
        let course = Course.courses[indexPath.row]
        cell.delegate = self
        cell.setupField(course: course)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension XIBViewController {
    private func configureView() {
        let navView = navigationBarView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showModally))
        
        view.backgroundColor = .secondarySystemBackground
        tableView.estimatedRowHeight = 50
        tableView.backgroundColor = .secondarySystemBackground
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CourseCustomXIBCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    @objc
    private func showModally() {
        self.present(SupportViewController(), animated: true, completion: nil)
    }
}

extension XIBViewController: NavigationDelegate {
    func addButtonTapped() {
        tabBarController?.selectedIndex = 3
    }
    
    func moreButtonTapped() {
        let vc = SupportViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
