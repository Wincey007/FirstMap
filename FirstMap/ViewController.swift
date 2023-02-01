//
//  ViewController.swift
//  FirstAppInUIKit
//
//  Created by Assawin Kengkanna on 1/2/2566 BE.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    lazy var searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.layer.cornerRadius = 10
        searchTextField.clipsToBounds = true
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        searchTextField.leftViewMode = .always
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        return searchTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSearchTextFieldAppearance()
        setupUI()
    }
    //Check appearance realtime
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateSearchTextFieldAppearance()
    }
    // Whene Dark and White
    func updateSearchTextFieldAppearance() {
        if traitCollection.userInterfaceStyle == .dark {
            searchTextField.backgroundColor = UIColor.black
            searchTextField.placeholder = "Search"
            searchTextField.textColor = UIColor.white
        } else {
            searchTextField.backgroundColor = UIColor.white
            searchTextField.placeholder = "Search"
            searchTextField.textColor = UIColor.black
        }
    }
    
    private func setupUI(){
        
        view.addSubview(searchTextField)
        view.addSubview(mapView)
        
        view.bringSubviewToFront(searchTextField)
        
        //add constrains to search textField
        searchTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchTextField.widthAnchor.constraint(equalToConstant: view.bounds.size.width/1.2).isActive = true
        searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        searchTextField.returnKeyType = .go
        
        //add constrains to the MapView
        mapView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        mapView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
