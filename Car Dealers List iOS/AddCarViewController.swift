//
//  AddCarViewController.swift
//  Car Dealers List iOS
//
//  Created by Gaurav Dahal on 23/5/2024.
//

import UIKit

protocol AddCarDelegate {
    func add(manufacture: Manufacture)
}

class AddCarViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationsTextView: UITextView!
    
    let locationsPlaceHolder = "Add Locations"
    
    var delegate: AddCarDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationsTextView.text = locationsPlaceHolder
        locationsTextView.delegate = self
    }
    
    @IBAction func didTapSave(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            showAlert(message: "Please enter a car name.",title:"Error")
            return
        }
        
        guard locationsTextView.text != locationsPlaceHolder, !locationsTextView.text.isEmpty else {
            showAlert(message: "Please add locations.",title: "Error")
            return
        }
        
        let newCar = Manufacture(name: name, locations: locationsTextView.text, imageName: "", thumbnailName: "", type: .Petrol)
        
        delegate?.add(manufacture: newCar)
        dismiss(animated: true)
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func showAlert(message: String,title:String) {
        let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension AddCarViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.tertiaryLabel {
            textView.text = nil
            textView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = locationsPlaceHolder
            textView.textColor = UIColor.tertiaryLabel
        }
    }
}

