//
//  Pokemon.swift
//  PokeDex
//
//  Created by Aman Chawla on 02/04/17.
//  Copyright © 2017 Aman Chawla. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
	
	private var _name: String!
	private var _pokedexId: Int!
	
	private var _description: String!
	private var _type: String!
	private var _defense: String!
	private var _height: String!
	private var _weight: String!
	private var _baseattack: String!
	private var _nextEvolutionText: String!
	private var _nextEvolutionName: String!
	private var _nextEvolutionID: String!
	private var _nextEvolutionLvl: String!
	
	private var _pokemonURL: String!
	
	var name: String {
		return _name
	}
	
	var pokedexId: Int {
		return _pokedexId
	}
	
	var type: String {
		if _type == nil {
			return ""
		}
		
		return _type
	}
	
	var description: String {
		if _description == nil {
			return ""
		}
		
		return _description
	}
	
	var defense: String {
		if _defense == nil {
			return ""
		}
		
		return _defense
	}
	
	var height: String {
		if _height == nil {
			return ""
		}
		
		return _height
	}
	
	var weight: String {
		if _weight == nil {
			return ""
		}
		
		return _weight
	}
	
	var attack: String {
		if _baseattack == nil {
			return ""
		}
		
		return _baseattack
	}
	
	var nextEvoText: String {
		if _nextEvolutionText == nil {
			return ""
		}
		
		return _nextEvolutionText
	}
	
	var nextEvoName: String {
		if _nextEvolutionName == nil {
			return ""
		}
		
		return _nextEvolutionName
	}
	
	var nextEvoID: String {
		if _nextEvolutionID == nil {
			return ""
		}
		
		return _nextEvolutionID
	}
	
	var nextEvoLvl: String {
		if _nextEvolutionLvl == nil {
			return ""
		}
		
		return _nextEvolutionLvl
	}
	
	
	init(name: String, pokedexId: Int) {
		
		self._name = name
		self._pokedexId = pokedexId
		
		self._pokemonURL = "\(baseURL)\(URL2)\(self.pokedexId)/"
	}
	
	func downloadPokemonDetails(completed: @escaping DownloadComplete) {
		
		Alamofire.request(_pokemonURL).responseJSON { response in
			
			if let dict = response.result.value as? Dictionary<String, AnyObject> {
				
				if let weight = dict["weight"] as? String {
					self._weight = weight
				}
				
				if let height = dict["height"] as? String {
					self._height = height
				}
				
				if let attack = dict["attack"] as? Int {
					self._baseattack = "\(attack)"
				}
				
				if let defense = dict["defense"] as? Int {
					self._defense = "\(defense)"
				}
				
				if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
					
					if let name = types[0]["name"] {
						self._type = name.capitalized
					}
					
					if types.count > 1 {
						
						for x in 1..<types.count {
							
							if let name = types[x]["name"] {
								
								self._type! += "/\(name.capitalized)"
							}
						}
					}
					
				} else {
					
					self._type = ""
				}
				
				if let desc = dict["descriptions"] as? [Dictionary<String, String>] , desc.count > 0 {
					
					if let uri = desc[0]["resource_uri"] {
						
						let descURL = "\(baseURL)\(uri)"
						
						Alamofire.request(descURL).responseJSON { response in
							
							if let descDict = response.result.value as? Dictionary<String, AnyObject> {
								
								if let description = descDict["description"] as? String {
									
									let newDesc = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
									
									self._description = newDesc
								}
							}
							completed()
						}
					}
				} else {
					self._description = ""
				}
				
				if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>], evolutions.count > 0 {
					
					if let nextEvo = evolutions[0]["to"] as? String {
						
						if nextEvo.range(of: "mega") == nil {
							
							self._nextEvolutionName = nextEvo
							
							if let uri = evolutions[0]["resource_uri"] as? String {
								
								let newString1 = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
								let nextEvoID = newString1.replacingOccurrences(of: "/", with: "")
								
								self._nextEvolutionID = nextEvoID
								
								if let lvlExist = evolutions[0]["level"] {
									
									if let lvl = lvlExist as? Int {
										
										self._nextEvolutionLvl = "\(lvl)"
									}
								} else {
									
									self._nextEvolutionLvl = ""
								}
							}
						}
					}
				}
				
			}
			completed()
		}
	}
	
	
	
	
	
	
	
	
	
	
	
}
