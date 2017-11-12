//
//  Pokemon.swift
//  pokedex3
//
//  Created by Petr on 10.11.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Pokemon {
    
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    //private var _description: String!
    fileprivate var _type: String!
    fileprivate var _height: String!
    //private var _defense: String!
    fileprivate var _weight: String!
    fileprivate var _attack: String!
    //private var _nextEvolutionTxt: String!
    fileprivate var _pokemonURL: String!
    
    
    var type = String()
    
    var weight = Int()
    
    var height = Int()
    
    var name: String {
        
        return _name
    }
    
    var pokedexId: Int {
        
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(pokedexId)/"
    }
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        
        Alamofire.request(_pokemonURL).responseJSON { response in

            
            if let json : JSON = JSON(response.result.value) {
                let types = json["types"].arrayValue.map({$0["type"]["name"].stringValue.capitalized})
                if types != [""] {
                    self.type = types.joined(separator: "/")
                } else {
                    self.type = ""
                }
                self.weight = json["weight"].intValue
                
                self.height = json["height"].intValue
                    

            
           // let type = json["types"][0]["type"]["name"].string?.capitalized
                
               // print("JSON = \(json)")
             //   print("Types = \(types)")
            //print("Type = \(type)")
        print("typesString = \(self.type)")
           print(self.height)
            print(self.weight)
            }
               completed()
            }
      
            
        }
        
    }
    

