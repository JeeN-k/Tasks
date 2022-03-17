//
//  ViewController.swift
//  HomeWorkTask7
//
//  Created by Oleg Stepanov on 14.03.2022.
//

import UIKit

class MusicViewController: UIViewController {
    
    
    let cellID = "cellID"
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .secondarySystemBackground
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MusicCellView.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchCharts), for: .valueChanged)
        refreshControl.tintColor = .systemBlue
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching music ...", attributes: nil)
        return refreshControl
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = .systemBlue
        return ai
    }()
    
    var viewModel: MusicViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MusicViewModel()
        fetchCharts()
        spinner.startAnimating()
        configureView()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tracks = viewModel.albumSections[section].albumTracks
        if viewModel.albumSections[section].isExpanded {
            return tracks.count
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.albumSections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MusicCellView
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderView(reuseIdentifier: nil)
        let album = viewModel.albumSections[section].album
        view.setupHeader(album: album, section: section, delegate: self)
        return view
    }
}

extension MusicViewController: ExpandbleHeaderView {
    func expandSection(header: HeaderView, section: Int) {
        viewModel.expandSection(section: section) { count in
            self.updateCells(section: section, trackCount: count)
        }
    }
}

// MARK: - Private methods

extension MusicViewController {
    private func updateCells(section: Int, trackCount: Int) {
        tableView.beginUpdates()
        for i in 0 ..< trackCount {
            if viewModel.albumSections[section].isExpanded {
                tableView.insertRows(at: [IndexPath(row: i, section: section)], with: .fade)
            } else {
                tableView.deleteRows(at: [IndexPath(row: i, section: section)], with: .fade)
            }
        }
        tableView.endUpdates()
    }
    
    @objc
    private func fetchCharts() {
        refreshControl.beginRefreshing()
        viewModel.fetchAlbums() {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            self.spinner.stopAnimating()
        }
    }
    
    private func configureView() {
        title = "Album charts"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        tableView.backgroundView = spinner
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
