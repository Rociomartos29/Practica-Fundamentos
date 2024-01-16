//
//  HeroeDetailViewController.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

// HeroDetailViewController.swift

import UIKit

class HeroDetailViewController: UIViewController {

  // MARK: - Properties
  private var hero: Heroe?
  private var transformations: [Transformation]?

  // MARK: - Outlets
  @IBOutlet private weak var heroImageView: UIImageView!
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  @IBOutlet private weak var transformationsButton: UIButton!
    var heroId: Int!
     
     // MARK: - Lifecycle

     override func viewDidLoad() {
       super.viewDidLoad()
       
       loadHeroDetails()
     }

     // MARK: - Methods

     func loadHeroDetails() {
     
       APIService.shared.getHero(id: heroId) { [weak self] result in
       
           switch result {

               case .success(let hero):
               self?.updateUI(with: hero)

               case .failure(let error):
                 print(error) // statement executable

             }

           }
     
     }
     
     func updateUI(with hero: Heroe) {
       nameLabel.text = hero.nombre
       descriptionLabel.text = hero.descripcion
     }

   }
