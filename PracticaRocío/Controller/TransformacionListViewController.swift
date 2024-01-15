//
//  TransformacionListViewController.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

import UIKit

class TransformacionListViewController: UIViewController {
    // MARK: - Properties
    private var hero: Hero?
    private var transformations: [Transformation]?

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!

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
        title = "Transformaciones"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension TransformacionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transformations?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = transformations?[indexPath.row].name
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TransformacionListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Implementa la lógica para manejar la selección de una transformación si es necesario
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
