//
//  HeroesViewController.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//



import UIKit

class HeroesViewController: UITableViewController {

  private var heroes = [Hero]()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Fetch heroes
    fetchHeroes()
    
    // Register cell class
    tableView.register(UINib(nibName: "HeroCell", bundle: nil), forCellReuseIdentifier: "HeroCell")
    
    // Table view setup
    tableView.rowHeight = 80
  }

  private func fetchHeroes() {
    HeroService.shared.fetchHeroes { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .success(let heroes):
        self.heroes = heroes
        self.tableView.reloadData()
        
      case .failure(let error): break
        // Show alert with error
      }
    }
  }

  // MARK: - Table view data source

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return heroes.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath) as! HeroCell
    let hero = heroes[indexPath.row]
    cell.configure(with: hero)
    return cell
  }
  
  // Handle tap on row
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let hero = heroes[indexPath.row]
    let detailVC = HeroDetailViewController()
    detailVC.hero = hero
    navigationController?.pushViewController(detailVC, animated: true)
  }

}
