//
//  ViewController.swift
//  Sample
//
//  Created by Mateus Forgiarini on 9/22/20.
//  Copyright © 2020 Mateus Forgiarini da Silva. All rights reserved.
//

import UIKit
import CoreUISample
import Feature

import Feature
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
    }
    
    private func addButton() {
        let button = UIButton()
        button.setTitle("go to my feature", for: .normal)
        view.addSubview(button)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToMyFeature), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func goToMyFeature() {
        let vc = FeatureViewController()
        vc.setup(bundle: Bundle(for: TimelineView.self), cardViewIdentifier: String(describing: CoreUISample.TimelineView.self))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension CoreUISample.TimelineView: Feature.TimelineViewProtocol {}
