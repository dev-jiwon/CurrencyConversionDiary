//
//  ChooseCurrencyCollectionViewCell.swift
//  CurrencyConversionDiary
//
//  Created by Na jiwon on 01/10/2018.
//  Copyright © 2018 Na jiwon. All rights reserved.
//

import UIKit

class ChooseCurrencyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var countryTextLabel: UILabel!
    @IBOutlet weak var currencyTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        makeMainViewBorder()
    }
    
    func makeMainViewBorder() {
        mainView.layer.borderWidth = 0.5
        mainView.layer.borderColor = UIColor.lightGray.cgColor
        mainView.layer.cornerRadius = 10
        mainView.layer.masksToBounds = true
    }

}
