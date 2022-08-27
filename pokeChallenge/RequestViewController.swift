//
//  ViewController.swift
//  pokeChallenge
//
//  Created by Dilara Şimşek on 20.08.2022.
//

/*
import UIKit

protocol PokemonManagerDelegate {
    func didUpdatePoke(pokemon: PokemonModel)
}
 
struct PokemonManager {
    
    var delegate : PokemonManagerDelegate?
    
    var pokeNumber: Int = 1
    let url = "https://pokeapi.co/api/v2/pokemon/"
    //"https://pokeapi.co/api/v2/pokemon/\(pokeNumber)/"
    var requestedUrl : String = ""
    
    func fetchPokemon() {
        requestedUrl = url + String(pokeNumber) + "/"
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
            
            print("poke name: \(name)")
            
            let pokemon = PokemonModel(name: name, photo: photo)
            
            return pokemon
            
        } catch {
            print(error)
            return nil
        }
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

 */
