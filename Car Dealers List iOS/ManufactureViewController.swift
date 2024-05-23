//
//  ManufactureViewController.swift
//  Car Dealers List iOS
//
//  Created by Gaurav Dahal on 22/5/2024.
//

import UIKit

class ManufactureViewController: UIViewController {
    
    @IBOutlet weak var mTableView: UITableView!
    
    var model = ManufactureModel()
    var selectedType: ManufactureType?
    
    override func viewDidLoad() {
        super.viewDidLoad()//        view.backgroundColor = .green
        mTableView.dataSource = self
        mTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didChangeFilter(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
            
        case 0:
            selectedType = nil
            
        case 1:
            selectedType = .Petrol
            
        case 2:
            selectedType = .Diesel
            
        case 3:
            selectedType = .Electric
            
        default:
            break
            
        }
        mTableView.reloadData()
        
        
    }
    
}

extension ManufactureViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.manufactures(forType: selectedType).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mTableView.dequeueReusableCell(withIdentifier: "ManufactureCell", for: indexPath)
        
        
        let manufacture = model.manufactures(forType: selectedType)[indexPath.row]
        
        cell.textLabel?.text = manufacture.name
        cell.detailTextLabel?.text = manufacture.locations
        cell.imageView?.image = UIImage(named: manufacture.imageName)
        
        
        
        return cell
    }
    
}

extension ManufactureViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mTableView.deselectRow(at: indexPath, animated: true)
    }
}


