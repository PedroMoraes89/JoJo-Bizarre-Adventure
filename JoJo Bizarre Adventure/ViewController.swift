//
//  ViewController.swift
//  JoJo Bizarre Adventure
//
//  Created by user220265 on 12/13/22.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Who is this JoJo Bizarre Adventure's character?"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    var characterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Young Dio Brando"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 44)
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score: \(score)"
        label.textAlignment = . right
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }()
    
    let characterView: UIView = {
        let characterView = UIView()
        characterView.translatesAutoresizingMaskIntoConstraints = false
        characterView.backgroundColor = .yellow
        characterView.layer.cornerRadius = 15
        return characterView
    }()
   
    var characterButtons = [UIButton]()
    
    var score = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.backgroundColor = .purple
        addSubviews()
        addConstraints()
    }
    
    func addSubviews(){
        view.addSubview(titleLabel)
        view.addSubview(scoreLabel)
        view.addSubview(characterLabel)
        view.addSubview(characterView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            scoreLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            characterLabel.topAnchor.constraint(equalTo: scoreLabel.topAnchor, constant: 60),
            characterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            characterView.topAnchor.constraint(equalTo: characterLabel.bottomAnchor, constant: 60),
            characterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            characterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            characterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
            
        ])
    }


}
