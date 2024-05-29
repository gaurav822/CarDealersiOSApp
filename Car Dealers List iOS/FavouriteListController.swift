//
//  FavouriteListController.swift
//  Car Dealers List iOS
//
//  Created by Gaurav Dahal on 22/5/2024.
//

import UIKit

class FavouriteListController: UIViewController {
    

    @IBOutlet weak var mFavouriteTableView: UITableView!
    
    var model = ManufactureModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mFavouriteTableView.dataSource = self
        mFavouriteTableView.delegate = self
        
//        view.backgroundColor = .green

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCarDetail" {
            if let indexPath = mFavouriteTableView.indexPathForSelectedRow {
                let manufacture = model.manufactures[indexPath.row]
                let detailVC = segue.destination as? CarDetailsViewController
                detailVC?.manufacture = manufacture
            }
        }
    }
    

}


extension FavouriteListController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(model.favouriteCars)
       return model.favouriteCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = mFavouriteTableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath)
           
           if model.favouriteCars.isEmpty {
               // Handle the case when the favouriteCars array is empty
               cell.textLabel?.text = "No favourites"
               cell.detailTextLabel?.text = ""
               cell.imageView?.image = nil
           } else {
               let manufacture = model.favouriteCars[indexPath.row]
               cell.textLabel?.text = manufacture.name
               cell.detailTextLabel?.text = manufacture.locations
               cell.imageView?.image = UIImage(named: manufacture.imageName)
           }
           
           return cell
       }
    
}

extension FavouriteListController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mFavouriteTableView.deselectRow(at: indexPath, animated: true)
    }
}

