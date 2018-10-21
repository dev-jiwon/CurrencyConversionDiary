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
    var currencyList: [[String]] = []
    var cellArr: [ChooseCurrencyCollectionViewCell] = []
    var selectedCellIndex = -1
    let nowCurrencyName = UserDefaults.standard.string(forKey: "currency") ?? "USD"
    var isItFromeFirstViewController = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrencyList()
        setCollectionView()
    }
    
    @IBAction func saveSelectedCurrency(_ sender: Any) {
        UserDefaults.standard.set(cellArr[selectedCellIndex].currencyTextLabel.text!, forKey: "currency")
        if isItFromeFirstViewController {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "HowMuchMoneyViewController")
            show(nextViewController, sender: nil)
        } else {
            if let nav = self.navigationController {
                nav.popViewController(animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}

// 최초 상태를 설정
extension ChooseCurrencyViewController {
    func getCurrencyList() {
        //currencyPListName.plist에서 데이터 가져옴
        let myUrl = Bundle.main.url(forResource: currencyPListName, withExtension: "plist")
        currencyList = NSArray(contentsOf: myUrl!) as! [[String]]
    }
    
    func setDefaultCellDesign(cell: ChooseCurrencyCollectionViewCell) {
        cell.mainView.backgroundColor = .white
        cell.countryTextLabel.textColor = .black
        cell.currencyTextLabel.textColor = .black
        cell.likeButton.setBackgroundImage(UIImage(named: "favorite-heart-button-dark-gray"), for: .normal)
    }
    
    func setSelectedCellDesign(cell: ChooseCurrencyCollectionViewCell) {
        cell.mainView.backgroundColor = .lightGray
        cell.countryTextLabel.textColor = .white
        cell.currencyTextLabel.textColor = .white
        cell.likeButton.setBackgroundImage(UIImage(named: "favorite-heart-button-white"), for: .normal)
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
        let nowData = currencyList[indexPath.row]
        if nowData[0] == nowCurrencyName {
            selectedCellIndex = indexPath.row
            setSelectedCellDesign(cell: cell)
        } else {
            setDefaultCellDesign(cell: cell)
        }
        cell.currencyTextLabel.text = nowData[0]
        cell.imageView.image = UIImage(named: nowData[0])
        cell.countryTextLabel.text = nowData[1]
        cellArr.append(cell)
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
        setDefaultCellDesign(cell: cellArr[selectedCellIndex])
        selectedCellIndex = indexPath.row
        setSelectedCellDesign(cell: cellArr[selectedCellIndex])
        
        print(indexPath.row)
    }
    
}
