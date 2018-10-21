//
//  HowMuchMoneyViewController.swift
//  CurrencyConversionDiary
//
//  Created by Na jiwon on 21/10/2018.
//  Copyright © 2018 Na jiwon. All rights reserved.
//

import UIKit

class HowMuchMoneyViewController: UIViewController {
    
    let curr = UserDefaults.standard.string(forKey: "currency") ?? "USD"
    
    @IBOutlet weak var currencyNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyNameLabel.text = curr
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
