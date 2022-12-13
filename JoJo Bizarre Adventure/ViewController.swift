//
//  ViewController.swift
//  JoJo Bizarre Adventure
//
//  Created by user220265 on 12/13/22.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel: UILabel!
    var characterLabel: UILabel!
    var scoreLabel: UILabel!
    
    var characterView: UIView!

    var characterButtons = [UIButton]()
    
    var score = 0
    
    let hight = 128
    let width = 64
    
    override func loadView() {
        super.loadView()
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Who is this JoJo Bizarre Adventure's character?"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        titleLabel.numberOfLines = 0
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Score: \(score)"
        scoreLabel.textAlignment = . right
        scoreLabel.font = UIFont.systemFont(ofSize: 28)
        
        characterLabel = UILabel()
        characterLabel.translatesAutoresizingMaskIntoConstraints = false
        characterLabel.text = "Young Dio Brando"
        characterLabel.textAlignment = .center
        characterLabel.font = UIFont.systemFont(ofSize: 44)
        
        characterView = UIView()
        characterView.translatesAutoresizingMaskIntoConstraints = false
        characterView.backgroundColor = .yellow
        characterView.layer.cornerRadius = 15
    }

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
