//
//  FirstViewController.swift
//  CurrencyConversionDiary
//
//  Created by Na jiwon on 21/10/2018.
//  Copyright © 2018 Na jiwon. All rights reserved.
//  앱을 처음 실행할때 열리게되는 페이지

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func chooseButtonTouched(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "ChooseCurrencyViewController") //Storyboard ID를 설정해줘야 한다.
        show(secondViewController, sender: nil)
    }

    @IBAction func skipButtonTouched(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") //Storyboard ID를 설정해줘야 한다.
        secondViewController.navigationItem.hidesBackButton = true
        show(secondViewController, sender: nil)
    }
}
