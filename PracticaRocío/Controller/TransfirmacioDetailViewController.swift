//
//  TransfirmacioDetailViewController.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

import UIKit

class TransfirmacioDetailViewController: UIViewController {
    // MARK: - Properties
    private var transformation: Transformation?

    // MARK: - Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    // Añade más outlets según sea necesario para mostrar información detallada de la transformación.

    // MARK: - Initializers
    init(transformation: Transformation) {
        super.init(nibName: nil, bundle: nil)
        self.transformation = transformation
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
        title = "Detalles de Transformación"
        nameLabel.text = transformation?.name
        descriptionLabel.text = transformation?.description
        // Configura otros elementos de la interfaz de usuario según sea necesario.
    }
}
