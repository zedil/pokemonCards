//
//  pokeData.swift
//  pokeChallenge
//
//  Created by Dilara Şimşek on 20.08.2022.
//

import Foundation

struct PokeData: Codable {
    let weight: Int
    let name: String
    let sprites: Sprites
    let stats: [Stats]
}

struct Sprites: Codable {
    let front_default: String
}

struct Stats: Codable {
    let base_stat: Int
}

