//
//  MainViewController.swift
//  pokeChallenge
//
//  Created by Dilara Şimşek on 27.08.2022.
//

import UIKit

class MainViewController: UIViewController, PokemonManagerDelegate {
    
    private let refreshView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private let refreshImgView: UIView = {
        let image = UIImageView()
        image.image = UIImage(named: "replay")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    private let pokeCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 36
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private let pokeCardName: UILabel = {
        let label = UILabel()
        label.text = "Bulbasaur"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let pokeCardImgView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bulbasaur")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    private let pokeCardHealth: UILabel = {
        let label = UILabel()
        label.text = "hp"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let pokeCardAttack: UILabel = {
        let label = UILabel()
        label.text = "attack"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let pokeCardDefense: UILabel = {
        let label = UILabel()
        label.text = "defense"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let pokeCardHpValue: UILabel = {
        let label = UILabel()
        label.text = "45"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let pokeCardAttackValue: UILabel = {
        let label = UILabel()
        label.text = "45"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let pokeCardDefenseValue: UILabel = {
        let label = UILabel()
        label.text = "45"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let nextPokeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next Pokemon", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor(named: "backgroundColor"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    var pokemonManager = PokemonManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        pokemonManager.delegate = self
        pokemonManager.fetchPokemon()
        
        addSubViews()
        applyConstraint()
        
        nextPokeButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
    }
    
    private func addSubViews() {
        view.addSubview(pokeCardView)
        view.addSubview(refreshView)
        view.addSubview(nextPokeButton)
        refreshView.addSubview(refreshImgView)
        pokeCardView.addSubview(pokeCardName)
        pokeCardView.addSubview(pokeCardImgView)
        pokeCardView.addSubview(pokeCardHealth)
        pokeCardView.addSubview(pokeCardAttack)
        pokeCardView.addSubview(pokeCardDefense)
        pokeCardView.addSubview(pokeCardAttackValue)
        pokeCardView.addSubview(pokeCardHpValue)
        pokeCardView.addSubview(pokeCardDefenseValue)
    }
    
    func didUpdatePoke(pokemon: PokemonModel) {
        let url = URL(string: pokemon.photo)
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    self.pokeCardName.text = pokemon.name
                    self.pokeCardImgView.image = UIImage(data: data)
                    self.pokeCardHpValue.text = String(pokemon.hp)
                    self.pokeCardAttackValue.text = String(pokemon.attack)
                    self.pokeCardDefenseValue.text = String(pokemon.defense)
                }
            }
        }
    }
    
    private func applyConstraint(){
        let refreshViewConst = [
            refreshView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 19),
            refreshView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            refreshView.heightAnchor.constraint(equalToConstant: 48),
            refreshView.widthAnchor.constraint(equalToConstant: 48)
        ]
        
        NSLayoutConstraint.activate(refreshViewConst)
        
        let refreshImgViewConst = [
            refreshImgView.topAnchor.constraint(equalTo: refreshView.topAnchor, constant: 12),
            refreshImgView.centerXAnchor.constraint(equalTo: refreshView.centerXAnchor),
            refreshImgView.heightAnchor.constraint(equalToConstant: 24),
            refreshImgView.widthAnchor.constraint(equalToConstant: 24)
        ]
        
        NSLayoutConstraint.activate(refreshImgViewConst)
        
        
        let pokeCardViewConst = [
            pokeCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 182),
            pokeCardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokeCardView.heightAnchor.constraint(equalToConstant: 480),
            pokeCardView.widthAnchor.constraint(equalToConstant: 300)
        ]
        
        NSLayoutConstraint.activate(pokeCardViewConst)
        
        
        let pokeCardViewNameConst = [
            pokeCardName.topAnchor.constraint(equalTo: pokeCardView.topAnchor, constant: 18),
            pokeCardName.centerXAnchor.constraint(equalTo: pokeCardView.centerXAnchor),
            pokeCardName.trailingAnchor.constraint(equalTo: pokeCardView.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ]
        
        NSLayoutConstraint.activate(pokeCardViewNameConst)
        
        let pokeCardViewImageConst = [
            pokeCardImgView.topAnchor.constraint(equalTo: pokeCardName.topAnchor, constant: 136),
            pokeCardImgView.centerXAnchor.constraint(equalTo: pokeCardName.centerXAnchor),
            pokeCardImgView.heightAnchor.constraint(equalToConstant: 100),
            pokeCardImgView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(pokeCardViewImageConst)
        
        
        let pokeCardViewHpConst = [
            pokeCardHealth.topAnchor.constraint(equalTo: pokeCardImgView.bottomAnchor, constant: 100),
            pokeCardHealth.leadingAnchor.constraint(equalTo: pokeCardView.leadingAnchor, constant: 18),
            pokeCardHealth.widthAnchor.constraint(equalToConstant: 88),
            pokeCardHealth.heightAnchor.constraint(equalToConstant: 22)
        ]
        
        NSLayoutConstraint.activate(pokeCardViewHpConst)
        
        let pokeCardViewAttackConst = [
            pokeCardAttack.topAnchor.constraint(equalTo: pokeCardImgView.bottomAnchor, constant: 100),
            pokeCardAttack.leadingAnchor.constraint(equalTo: pokeCardHealth.trailingAnchor, constant: 0),
            pokeCardAttack.widthAnchor.constraint(equalToConstant: 88),
            pokeCardAttack.heightAnchor.constraint(equalToConstant: 22)
        ]
        
        NSLayoutConstraint.activate(pokeCardViewAttackConst)
        
        let pokeCardDefConst = [
            pokeCardDefense.topAnchor.constraint(equalTo: pokeCardImgView.bottomAnchor, constant: 100),
            pokeCardDefense.leadingAnchor.constraint(equalTo: pokeCardAttack.trailingAnchor, constant: 0),
            pokeCardDefense.widthAnchor.constraint(equalToConstant: 88),
            pokeCardDefense.heightAnchor.constraint(equalToConstant: 22)
        ]
        
        NSLayoutConstraint.activate(pokeCardDefConst)
        
        let pokeCardHpValueConst = [
            pokeCardHpValue.topAnchor.constraint(equalTo: pokeCardHealth.bottomAnchor, constant: 0),
            pokeCardHpValue.leadingAnchor.constraint(equalTo: pokeCardHealth.leadingAnchor, constant: 0),
            pokeCardHpValue.trailingAnchor.constraint(equalTo: pokeCardHealth.trailingAnchor, constant: 0)
            
        ]
        
        NSLayoutConstraint.activate(pokeCardHpValueConst)
        
        let pokeCardAttackValueConst = [
            pokeCardAttackValue.topAnchor.constraint(equalTo: pokeCardAttack.bottomAnchor, constant: 0),
            pokeCardAttackValue.leadingAnchor.constraint(equalTo: pokeCardAttack.leadingAnchor, constant: 0),
            pokeCardAttackValue.trailingAnchor.constraint(equalTo: pokeCardAttack.trailingAnchor, constant: 0)
            
        ]
        
        NSLayoutConstraint.activate(pokeCardAttackValueConst)
        
        let pokeCardDefenseValueConst = [
            pokeCardDefenseValue.topAnchor.constraint(equalTo: pokeCardDefense.bottomAnchor, constant: 0),
            pokeCardDefenseValue.leadingAnchor.constraint(equalTo: pokeCardDefense.leadingAnchor, constant: 0),
            pokeCardDefenseValue.trailingAnchor.constraint(equalTo: pokeCardDefense.trailingAnchor, constant: 0)
            
        ]
        
        NSLayoutConstraint.activate(pokeCardDefenseValueConst)
        
        let nextPokeButtonConst = [
            nextPokeButton.topAnchor.constraint(equalTo: pokeCardView.bottomAnchor, constant: 30),
            nextPokeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextPokeButton.heightAnchor.constraint(equalToConstant: 50)
            
        ]
        
        NSLayoutConstraint.activate(nextPokeButtonConst)
    }
}

// MARK: Action
extension MainViewController {
    
    @objc func didButtonClick(_ sender: UIButton) {
        pokemonManager.fetchPokemon()
    }
}

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}


