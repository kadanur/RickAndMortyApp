//
//  CharactersModel.swift
//  RickAndMortyApp
//
//  Created by M Kaan Adanur on 25.03.2022.
//

import Foundation

struct CharactersMain: Codable {
    var info: CharactersInfo
    var results: [CharactersResult]
}

struct CharactersInfo: Codable {
    var count: Int
    var pages: Int
 //   var next: String
 //   var prev: String
}

struct CharactersResult: Codable {
    var id: Int
    var name: String
    var image: String
}
