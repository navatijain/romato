//
//  SearchBar.swift
//  Romato
//
//  Created by Navati Jain on 2020-09-19.
//

import UIKit
//TO DO: remove
class SearchBar: UIView {

    var imageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.contentMode = .scaleAspectFit
        //imageView.
        return imageView
    }
    
    var label: UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = LocalizedString.MainView.searchPlaceHolder
        return label
    }
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
