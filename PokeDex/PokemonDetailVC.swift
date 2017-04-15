//
//  PokemonDetailVC.swift
//  PokeDex
//
//  Created by Aman Chawla on 04/04/17.
//  Copyright © 2017 Aman Chawla. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
	
	var pokemon: Pokemon!

	@IBOutlet weak var nameLbl: UILabel!
	@IBOutlet weak var backBtn: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
    }

}
