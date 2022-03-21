//
//  TeamsViewController.swift
//  EditingTableVIew
//
//  Created by Oleg Stepanov on 15.03.2022.
//

import UIKit

class TeamsViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureView()
    }
}

extension TeamsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        League.leagues[section].teams.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        League.leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        var config = cell.defaultContentConfiguration()
        let team = League.leagues[indexPath.section].teams[indexPath.row]
        config.text = team.name
        config.secondaryText = "\(team.points) pts"
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return League.leagues[section].name
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            League.leagues[indexPath.section].teams.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedTeam = League.leagues[sourceIndexPath.section].teams[sourceIndexPath.row]
        League.leagues[sourceIndexPath.section].teams.remove(at: sourceIndexPath.row)
        League.leagues[destinationIndexPath.section].teams.insert(movedTeam, at: destinationIndexPath.row)
    }
}

extension TeamsViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = League.leagues[indexPath.section].teams[indexPath.row]
        return [ dragItem ]
    }
}

extension TeamsViewController {
    private func configureView() {
        title = "Football teams"
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTeam))
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc
    private func addTeam() {
        let ac = UIAlertController(title: "Введите название команды", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Добавить", style: .default) { [weak self, weak ac] _ in
            guard let self = self, let answer = ac?.textFields?[0].text else { return }
            self.addNewTeam(league: 0, team: answer)
        }
        ac.addAction(submitAction)
        ac.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(ac, animated: true)
    }
    
    private func addNewTeam(league: Int, team: String) {
        let countTeams = League.leagues[league].teams.count
        League.leagues[league].teams.append(Team(name: team, points: 0))
        tableView.insertRows(at: [IndexPath(row: countTeams, section: league)], with: .fade)
    }
}
