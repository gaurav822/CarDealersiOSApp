//
//  ManufactureModel.swift
//  Car Dealers List iOS
//
//  Created by Gaurav Dahal on 23/5/2024.
//

import Foundation

class ManufactureModel {
    
    private(set) var manufactures : [Manufacture] = []
    private(set) var favouriteCars : [Manufacture] = []
        
    init() {
        if let url = Bundle.main.url(forResource: "cars", withExtension: "json"){
            do{
                let data = try Data (contentsOf:url);
                manufactures = try JSONDecoder().decode([Manufacture].self, from: data)
            }
            
            catch{
                print(error)
            }
        }
    }
    
    func manufactures(forType type: ManufactureType?) -> [Manufacture]{
        guard let type = type else {return manufactures}
        
        return manufactures.filter{$0.type == type}
    }
    
    func add(manufacture: Manufacture){
        manufactures.append(manufacture)
    }
    
    func addToFavorites(manufacture:Manufacture){
        favouriteCars.append(manufacture)
    }
}
