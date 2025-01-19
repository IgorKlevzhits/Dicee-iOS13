//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "GreenBackground"))
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mineStackView: UIStackView = {
        let element = UIStackView()
        element.distribution = .fillEqually
        element.axis = .vertical
        element.spacing = 50
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var logoImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "DiceeLogo"))
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let diceeView = UIView()
    
    private lazy var diceeStackView: UIStackView = {
        let element = UIStackView()
        element.distribution = .fillEqually
        element.axis = .horizontal
        element.spacing = 60
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var diceOneImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "DiceOne"))
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var diceTwoImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "DiceOne"))
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let buttonView = UIView()
    
    private lazy var rollButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = UIColor(red: 142/255, green: 41/255, blue: 38/255, alpha: 1)
        element.tintColor = .white
        element.layer.cornerRadius = 10
        element.titleLabel?.font = .systemFont(ofSize: 30)
        element.setTitle("Roll", for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Private Properties
    
    private let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setupConstraints()
        
        
    }
    
    @objc private func rollButtonTapped() {
        
        diceOneImageView.image = diceArray.randomElement()
        diceTwoImageView.image = diceArray.randomElement()
    }

}

extension ViewController {
    
    // MARK: - Set Views
    
    private func setViews() {
        
        view.addSubview(backgroundImageView)
        view.addSubview(mineStackView)
        mineStackView.addArrangedSubview(logoImageView)
        mineStackView.addArrangedSubview(diceeView)
        diceeView.addSubview(diceeStackView)
        diceeStackView.addArrangedSubview(diceOneImageView)
        diceeStackView.addArrangedSubview(diceTwoImageView)
        mineStackView.addArrangedSubview(buttonView)
        buttonView.addSubview(rollButton)
        
        rollButton.addTarget(self, action: #selector(rollButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mineStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mineStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mineStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            mineStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            diceOneImageView.heightAnchor.constraint(equalToConstant: 120),
            diceOneImageView.widthAnchor.constraint(equalToConstant: 120),
            diceeStackView.centerYAnchor.constraint(equalTo: diceeView.centerYAnchor),
            diceeStackView.centerXAnchor.constraint(equalTo: diceeView.centerXAnchor),
            
            rollButton.heightAnchor.constraint(equalToConstant: 50),
            rollButton.widthAnchor.constraint(equalToConstant: 200),
            rollButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor)
            
        ])
    }
}
