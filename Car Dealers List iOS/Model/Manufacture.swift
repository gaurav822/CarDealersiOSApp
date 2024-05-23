//
//  Manufacture.swift
//  Car Dealers List iOS
//
//  Created by Gaurav Dahal on 23/5/2024.
//

import Foundation

struct Manufacture : Decodable {
    
    var name :String
    var locations:String
    var imageName:String
    var thumbnailName:String
    var type:ManufactureType
}

enum ManufactureType : String,Decodable {
    case Petrol
    case Diesel
    case Electric
}
