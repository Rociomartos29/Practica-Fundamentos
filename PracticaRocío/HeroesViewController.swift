//
//  HeroesViewController.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//



import UIKit

class HeroesViewController: UIViewController {

  // MARK: - IBOutlets
  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Properties
  
    private var heroes = [Heroe]()
  
  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    loadHeroes()
  }

  // MARK: - Methods
  
    private func loadHeroes() {
        
        APIService.shared.getHeroes { [weak self] result in
            
                switch result {
                    
                case .success(let heroes):
                    self?.heroes = heroes
                    self?.tableView.reloadData()
                    
                case .failure(let error):
                    print(error) // statement executable
                    
                }
                
            }
        }
    }
// MARK: - UITableViewDataSource

extension HeroesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell") {
            // configurar celda
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
}

// MARK: - UITableViewDelegate

extension HeroesViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let hero = heroes[indexPath.row]
    // navegar al detalle del héroe
  }

}
