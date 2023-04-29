//
//  PokemonManager.swift
//  pokeChallenge
//
//  Created by Dilara Şimşek on 27.08.2022.
//

import Foundation
import UIKit

protocol PokemonManagerDelegate {
    func didUpdatePoke(pokemon: PokemonModel)
}

struct Constants {
    static let url = "https://pokeapi.co/api/v2/pokemon/"
    static let pokeKey = "pokeKey"
}

class PokemonManager {
    var delegate : PokemonManagerDelegate?
    
    func fetchPokemon() {
        let localPoke = setUserDef()
        let requestedUrl = Constants.url + String(localPoke) + "/"
        guard let url = URL(string: requestedUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            if let pokemon = self.parseJSON(pokeData: data) {
                self.delegate?.didUpdatePoke(pokemon: pokemon)
            }
        }
        task.resume()
    }
    
    private func parseJSON(pokeData: Data) -> PokemonModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PokeData.self, from: pokeData)
            
            let name = decodedData.name
            let photo = decodedData.sprites.front_default
            let hp = decodedData.stats[0].base_stat
            let attack = decodedData.stats[1].base_stat
            let defense = decodedData.stats[2].base_stat
            
            let pokemon = PokemonModel(name: name, photo: photo, hp: hp, attack: attack, defense: defense)
            return pokemon
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func setUserDef() -> Int {
        let userDefaults = UserDefaults.standard
        let pokeNumber = userDefaults.integer(forKey: Constants.pokeKey)
        userDefaults.set(pokeNumber + 1, forKey: Constants.pokeKey)
        return pokeNumber
    }
}

