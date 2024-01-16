//
//  HeroesListViewController.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

import UIKit

class HeroesListViewController: UIViewController {
    
    // MARK: - Properties
    private let networkService = NetworkService.shared
    private var heroes: [Heroe] = []

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchHeroes()
    }

    // MARK: - UI Setup
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HeroCell")
    }

    // MARK: - Data Fetching
    private func fetchHeroes() {
        networkService.fetchHeroes { [weak self] result in
            switch result {
            case let .success(heroes):
                self?.heroes = heroes
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case let .failure(error):
                print("Error fetching heroes: \(error)")
            }
        }
    }
}

// MARK: - UITableViewDelegate
extension HeroesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle selection if needed
    }
}

// MARK: - UITableViewDataSource
extension HeroesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath)
        let hero = heroes[indexPath.row]
        cell.textLabel?.text = hero.name
        return cell
    }
}
