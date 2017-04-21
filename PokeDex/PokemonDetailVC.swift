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
		
		let img = UIImage(named: "\(pokemon.pokedexId)")
		mainImg.image = img
		currentEvolutionImg.image = img
		pokedexLbl.text = "\(pokemon.pokedexId)"
		
		pokemon.downloadPokemonDetails {
			//after network call
			self.updateUI()
		}
    }

	func updateUI() {
		
		baseattackLbl.text = pokemon.attack
		weightLbl.text = pokemon.weight
		heightLbl.text = pokemon.height
		defenseLbl.text = pokemon.defense
		typeLbl.text = pokemon.type
		descriptionLbl.text = pokemon.description
		
		if pokemon.nextEvoID == "" {
			
			evolutionLbl.text = "NO EVOLUTION"
			nextEvolutionImg.isHidden = true
		} else {
			
			nextEvolutionImg.isHidden = false
			nextEvolutionImg.image = UIImage(named: pokemon.nextEvoID)
			let str = "Next Evolution: \(pokemon.nextEvoName) at LVL\(pokemon.nextEvoLvl)"
			evolutionLbl.text = str
		}
	}
	
	@IBAction func backBtnPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
}
