//
//  HeroeDetailViewController.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

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

    // MARK: - Initializers
    init(hero: Hero, transformations: [Transformation]) {
        super.init(nibName: nil, bundle: nil)
        self.hero = hero
        self.transformations = transformations
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI Setup
    private func setupUI() {
        if let hero = hero, let imageURL = hero.imageURL, let image = UIImage(named: imageURL) {
               heroImageView.image = image
               nameLabel.text = hero.name
               descriptionLabel.text = hero.description
               transformationsButton.isHidden = transformations?.isEmpty ?? true
           }
    }

    // MARK: - Actions
    @IBAction private func transformationsButtonTapped(_ sender: UIButton) {
        navigateToTransformations()
    }

    // MARK: - Navigation
    private func navigateToTransformations() {
        guard let hero = hero, let transformations = transformations else {
            return
        }

        let transformationsViewController = TransformationsViewController(hero: hero, transformations: transformations)
        navigationController?.pushViewController(transformationsViewController, animated: true)
    }
}
