//
//  TimelineView.swift
//  CoreUI
//
//  Created by Mateus Forgiarini on 9/22/20.
//  Copyright © 2020 Mateus Forgiarini da Silva. All rights reserved.
//

import UIKit

public class TimelineView: UIView {
    
    private let lightGray = UIColor(red: 107/255.0, green: 107/255.0, blue: 107/255.0, alpha: 1)
    
    public private(set) lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }()
    
    public private(set) lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    public private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    public private(set) lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    public private(set) lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    public private(set) lazy var timelineSeparator: UIView = {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 2).isActive = true
        view.backgroundColor = UIColor(red: 255/255.0, green: 85/255.0, blue: 146/255.0, alpha: 1)
        return view
    }()
    
    public private(set) lazy var circle: UIView = {
        let view = UIView(frame: CGRect(x: -10, y: 5, width: 20, height: 20))
        view.backgroundColor = UIColor(red: 255/255.0, green: 85/255.0, blue: 146/255.0, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    public required override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension TimelineView {
    func setupHierarchy() {
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(valueLabel)
        verticalStackView.addArrangedSubview(dateLabel)
        
        timelineSeparator.addSubview(circle)
        horizontalStackView.addArrangedSubview(timelineSeparator)
        horizontalStackView.addArrangedSubview(verticalStackView)
        addSubview(horizontalStackView)
    }
    
    func setupConstraints() {
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        timelineSeparator.translatesAutoresizingMaskIntoConstraints = false
        circle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            timelineSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
        ])
    }
    
    func setupConfigurations() {
        //
    }
    
    func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
    }
}
