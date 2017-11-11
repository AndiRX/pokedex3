//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Petr on 11.11.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
        
    }

    
}
