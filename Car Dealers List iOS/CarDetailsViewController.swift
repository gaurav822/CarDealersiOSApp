//
//  CarDetailsViewController.swift
//  Car Dealers List iOS
//
//  Created by Gaurav Dahal on 24/5/2024.
//

import UIKit

class CarDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationTextView: UITextView!
    @IBOutlet weak var carImageView: UIImageView!
    
    var manufacture:Manufacture!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carImageView.image=UIImage(named: manufacture.imageName)
        nameLabel.text = manufacture.name
        locationTextView.text = bulletedList(forLocations: manufacture.locations)

    }
    
    private func bulletedList(forLocations locations:String) -> String {
        var list = ""
        let items = locations.split(separator: ",")
        items.forEach{list.append("\u{2022} \($0)\n")}
        return list
    }
    

}
