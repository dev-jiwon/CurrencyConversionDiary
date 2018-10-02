//
//  ChooseCurrencyViewController.swift
//  CurrencyConversionDiary
//
//  Created by Na jiwon on 02/10/2018.
//  Copyright © 2018 Na jiwon. All rights reserved.
//

import UIKit

class ChooseCurrencyViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
}

extension ChooseCurrencyViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func setCollectionView() {
        let nib: UINib = UINib(nibName: "ChooseCurrencyCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ChooseCurrencyCollectionViewCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseCurrencyCollectionViewCell", for: indexPath) as! ChooseCurrencyCollectionViewCell
        return cell
    }
    
    
}
