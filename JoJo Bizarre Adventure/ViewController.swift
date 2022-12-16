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
        label.font = UIFont.systemFont(ofSize: 56, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    var characterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = . right
        label.text = "Score: \(score)"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    var buttonOne: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.yellow.cgColor
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.backgroundColor = .black
        return button
    }()
    
    var buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.yellow.cgColor
        button.clipsToBounds = true
        button.backgroundColor = .black
        return button
    }()
    
    var buttonThree: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.yellow.cgColor
        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.backgroundColor = .black
        return button
    }()
    
    lazy var characterStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buttonOne, buttonTwo, buttonThree])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 15
        stackView.spacing = 20
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var character = [String]()
    var correctAnwser = 0

    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.backgroundColor = .purple
        
        character += ["diavolo", "dio", "giorno", "jolyne", "jonathan", "joseph", "josuke", "jotaro", "kars", "kira", "pucci"]
        
        addSubviews()
        addConstraints()
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        character.shuffle()
        correctAnwser = Int.random(in: 0...2)
        
        buttonOne.setImage(UIImage(named: character[0]), for: .normal)
        buttonTwo.setImage(UIImage(named:character[1]), for: .normal)
        buttonThree.setImage(UIImage(named: character[2]), for: .normal)
        
        characterLabel.text = character[correctAnwser].uppercased()
    }
    
    @objc func tappedButton(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == correctAnwser {
            score += 1
            title = "Correct!"
            message = "Congratulations!"
        } else {
            score -= 1
            title = "Wrong!"
            message = "Try again!"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alert, animated: true)
    }
    
    
    func addSubviews(){
        view.addSubview(titleLabel)
        view.addSubview(scoreLabel)
        view.addSubview(characterLabel)
        view.addSubview(characterStackView)

    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            scoreLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            characterLabel.topAnchor.constraint(equalTo: scoreLabel.topAnchor, constant: 60),
            characterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            buttonOne.widthAnchor.constraint(equalToConstant: 240),
            buttonOne.heightAnchor.constraint(equalToConstant: 580),

            buttonTwo.widthAnchor.constraint(equalToConstant: 240),
            buttonTwo.heightAnchor.constraint(equalToConstant: 580),

            buttonThree.widthAnchor.constraint(equalToConstant: 240),
            buttonThree.heightAnchor.constraint(equalToConstant: 580),
            
            characterStackView.topAnchor.constraint(equalTo: characterLabel.bottomAnchor, constant: 60),
            characterStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            characterStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            characterStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
        ])
    }
}
