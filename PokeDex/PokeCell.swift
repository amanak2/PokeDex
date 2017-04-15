//
//  PokeCell.swift
//  PokeDex
//
//  Created by Aman Chawla on 02/04/17.
//  Copyright © 2017 Aman Chawla. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
	
	@IBOutlet weak var thumbImg: UIImageView!
	@IBOutlet weak var nameLbl: UILabel!
	
	var pokemon: Pokemon!
	
	required init?(coder aDecoder: NSCoder) {
		
		super.init(coder: aDecoder)
		layer.cornerRadius = 5.0
	}
	
	func configureCell(_ pokemon: Pokemon) {
		
		self.pokemon = pokemon
		
		nameLbl.text = self.pokemon.name.capitalized
		thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
	}
	
}
