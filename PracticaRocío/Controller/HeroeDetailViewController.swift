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
  private var hero: Hero?
  private var transformations: [Transformation]?

  // MARK: - Outlets
  @IBOutlet private weak var heroImageView: UIImageView!
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  @IBOutlet private weak var transformationsButton: UIButton!

  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }

  // MARK: - Configuration
  private func configureUI() {
    guard let hero = hero else { return }
    
    nameLabel.text = hero.name
    descriptionLabel.text = hero.description

    if let imageURL = hero.imageURL {
        heroImageView.loadImage(from: imageURL)
    }

    transformationsButton.isHidden = transformations?.isEmpty ?? true
  }

  // MARK: - Actions
  @IBAction private func transformationsTapped(_ sender: UIButton) {
    showTransformations()
  }

  // MARK: - Navigation
  private func showTransformations() {
    guard let hero = hero, let transformations = transformations else {
      return
    }
    
      let vc = TransformationsViewController()
    navigationController?.pushViewController(vc, animated: true)
  }

}
