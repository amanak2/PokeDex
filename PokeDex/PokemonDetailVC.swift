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
	
	@IBOutlet weak var mainImg: UIImageView!
	@IBOutlet weak var descriptionLbl: UILabel!
	@IBOutlet weak var typeLbl: UILabel!
	@IBOutlet weak var defenseLbl: UILabel!
	@IBOutlet weak var heightLbl: UILabel!
	@IBOutlet weak var weightLbl: UILabel!
	@IBOutlet weak var baseattackLbl: UILabel!
	@IBOutlet weak var pokedexLbl: UILabel!
	@IBOutlet weak var currentEvolutionImg: UIImageView!
	@IBOutlet weak var nextEvolutionImg: UIImageView!
	@IBOutlet weak var evolutionLbl: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
    }

	@IBAction func backBtnPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
}
