//
//  FeatureViewController.swift
//  Feature
//
//  Created by Mateus Forgiarini on 9/22/20.
//  Copyright © 2020 Mateus Forgiarini da Silva. All rights reserved.
//

import UIKit



public class FeatureViewController: UIViewController {
    
    private var bundle: Bundle!
    private var cardViewIdentifier: String!
    
    public func setup(bundle: Bundle, cardViewIdentifier: String) {
        self.bundle = bundle
        self.cardViewIdentifier = cardViewIdentifier
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let card = (classFromString(cardViewIdentifier, bundle: bundle) as! TimelineViewProtocol.Type).init(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 100))
        card.valueLabel.text = "R$: 2.000,00"
        card.descriptionLabel.text = "Simulação de crédito"
        card.dateLabel.text = "2 de junho de 2020"
        view.addSubview(card)
    }
    
}


public protocol TimelineViewProtocol: UIView {
    var valueLabel: UILabel { get }
    var descriptionLabel: UILabel { get }
    var dateLabel: UILabel { get }
}


func classFromString(_ type: String, bundle: Bundle) -> AnyClass? {
    guard let namespace = bundle.infoDictionary!["CFBundleExecutable"] as? String else {
        return nil
    }
    
    
    return bundle.classNamed("\(namespace).\(String(describing: type.self))")
}
