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
 
struct PokemonManager {
    
    var delegate : PokemonManagerDelegate?
    
    
    //var pokenumber: Int = 1
    let url = "https://pokeapi.co/api/v2/pokemon/"
    //"https://pokeapi.co/api/v2/pokemon/\(pokeNumber)/"
    
    func fetchPokemon() {
        let localPoke = setUserDef()
        let requestedUrl = url + String(localPoke) + "/"
        if let url = URL(string: requestedUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let pokemon = self.parseJSON(pokeData: safeData) {
                        
                        print("pokedata: \(pokemon)")
                        self.delegate?.didUpdatePoke(pokemon: pokemon) 
                        //let pokemonVC = MainViewController()
                        //pokemonVC.didUpdatePoke(pokemon: pokemon)
                        
                    }
                    
                }
            }
            
            
            task.resume()
            
        }
    }
    
    
    func parseJSON(pokeData: Data) -> PokemonModel? {
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
            print(error)
            return nil
        }
    }
    
    
    func setUserDef() -> Int {
        
        let userDefaults = UserDefaults.standard
        
        var pokenum = userDefaults.integer(forKey: "pokeKey")
        
        userDefaults.set(pokenum + 1, forKey: "pokeKey")
        
        print("pokenumm: \(pokenum)")
        return pokenum
    }
    
    /*
    let url = URL(string: ServiceConfig.IMAGE_BASE_URL + allNowPlayingDetailModel[indexPath.row].poster_path)
    DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url!) {
            DispatchQueue.main.async {
                cell.imageviewCVC.image = UIImage(data: data)
            }
    }
    } */
    
    
    



}

