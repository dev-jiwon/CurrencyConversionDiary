//
//  ChooseCurrencyViewController.swift
//  CurrencyConversionDiary
//
//  Created by Na jiwon on 02/10/2018.
//  Copyright © 2018 Na jiwon. All rights reserved.
//

import UIKit

let currencyPListName = "CurrencyList"   //지원하는 화폐 리스트를 갖고있는 PList 이름

class ChooseCurrencyViewController: UIViewController {
    var currencyList: [String] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrencyList()
        setCollectionView()
    }
    
    func getCurrencyList() {
        
        let myUrl = Bundle.main.url(forResource: currencyPListName, withExtension: "plist")
        currencyList = NSArray(contentsOf: myUrl!) as! [String]
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
        return currencyList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseCurrencyCollectionViewCell", for: indexPath) as! ChooseCurrencyCollectionViewCell
        cell.currencyTextLabel.text = currencyList[indexPath.row]
        cell.imageView.image = UIImage(named: currencyList[indexPath.row])
        return cell
    }
    
    //---------디자인 관련---------
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(5), left: CGFloat(5), bottom: CGFloat(5), right: CGFloat(5))
    }
    //세로
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    //가로
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let myWidth = view.frame.width / 3 - 5
        return CGSize.init(width: myWidth, height: 1013 * myWidth / 653)
    }
    
    //특정 cell선택될때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
