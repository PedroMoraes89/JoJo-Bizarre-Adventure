//
//  ViewController.swift
//  JoJo Bizarre Adventure
//
//  Created by user220265 on 12/13/22.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Who is this JoJo Bizarre Adventure's character?"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    var characterLabel: UILabel = {
        let characterLabel = UILabel()
        characterLabel.translatesAutoresizingMaskIntoConstraints = false
        characterLabel.textAlignment = .center
        characterLabel.font = UIFont.systemFont(ofSize: 44)
        return characterLabel
    }()
    
    lazy var scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = . right
        scoreLabel.text = "Score: \(score)"
        scoreLabel.font = UIFont.systemFont(ofSize: 28)
        return scoreLabel
    }()
    
    var buttonOne: UIButton = {
        let buttonOne = UIButton()
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonOne.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        buttonOne.layer.cornerRadius = 15
        buttonOne.backgroundColor = .blue
        return buttonOne
    }()
    
    var buttonTwo: UIButton = {
        let buttonTwo = UIButton()
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        buttonTwo.layer.cornerRadius = 15
        buttonTwo.backgroundColor = .red
        return buttonTwo
    }()
    
    var buttonThree: UIButton = {
        let buttonThree = UIButton()
        buttonThree.translatesAutoresizingMaskIntoConstraints = false
        buttonThree.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        buttonThree.layer.cornerRadius = 15
        buttonThree.backgroundColor = .black
        return buttonThree
    }()
    
    lazy var characterView: UIStackView = {
        let characterStackView = UIStackView(arrangedSubviews: [buttonOne, buttonTwo, buttonThree])
        characterStackView.translatesAutoresizingMaskIntoConstraints = false
        characterStackView.layer.cornerRadius = 15
        characterStackView.spacing = 20
        characterStackView.axis = .horizontal
        characterStackView.distribution = .fillEqually
        return characterStackView
    }()
    
    var score = 0
    
    var character = [String]()
    var correctAnwser = 0

    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.backgroundColor = .purple
        
        character += ["diavolo", "dio", "jolyne", "jonathan", "joseph", "josuke", "jotaro", "kars", "kira", "pucci"]
        
        addSubviews()
        addConstraints()
        askQuestion()
    }
    
    @objc func tappedButton(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == correctAnwser {
            title = "Correct!"
            message = "Congratulations!"
            score += 1
        } else {
            title = "Wrong!"
            message = "Try again!"
            score -= 1
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alert, animated: true)
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        character.shuffle()
        correctAnwser = Int.random(in: 0...3)
        
        buttonOne.setImage(UIImage(named: character[0]), for: .normal)
        buttonTwo.setImage(UIImage(named:character[1]), for: .normal)
        buttonThree.setImage(UIImage(named: character[2]), for: .normal)
        
        characterLabel.text = character[correctAnwser].uppercased()
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
            
//            buttonOne.topAnchor.constraint(equalTo: characterView.topAnchor, constant: 60),
//            buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -400),
            buttonOne.widthAnchor.constraint(equalToConstant: 240),
            buttonOne.heightAnchor.constraint(equalToConstant: 580),
//
//            buttonTwo.topAnchor.constraint(equalTo: buttonOne.topAnchor),
//            buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonTwo.widthAnchor.constraint(equalToConstant: 240),
            buttonTwo.heightAnchor.constraint(equalToConstant: 580),
//
//            buttonThree.topAnchor.constraint(equalTo: buttonOne.topAnchor),
//            buttonThree.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 400),
            buttonThree.widthAnchor.constraint(equalToConstant: 240),
            buttonThree.heightAnchor.constraint(equalToConstant: 580),
            
            characterView.topAnchor.constraint(equalTo: characterLabel.bottomAnchor, constant: 60),
            characterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            characterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            characterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
            
        ])
    }


}
