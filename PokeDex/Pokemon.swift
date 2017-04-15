//
//  Pokemon.swift
//  PokeDex
//
//  Created by Aman Chawla on 02/04/17.
//  Copyright © 2017 Aman Chawla. All rights reserved.
//

import Foundation

class Pokemon {
	
	private var _name: String!
	private var _pokedexId: Int!
	
	private var _description: String!
	private var _type: String!
	private var _defense: Int!
	private var _height: Int!
	private var _weight: Int!
	private var _baseattack: Int!
	private var _nextEvolutionText: String!
	
	
	var name: String {
		
		return _name
	}
	
	var pokedexId: Int {
		
		return _pokedexId
	}
	
	init(name: String, pokedexId: Int) {
		
		self._name = name
		self._pokedexId = pokedexId
	}
}
