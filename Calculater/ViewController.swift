//
//  ViewController.swift
//  Calculator
//
//  Created by nonoho.honda on 2020/05/07.
//  Copyright © 2020 nonoho.honda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapCalculate(_ sender: Any) {
        //計算処理を書いていきましょう
        
        let first = Int(self.firstTextField.text ?? "")!
        let second = Int(self.secondTextField.text ?? "")!
    
        var result = 0
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            // 足し算
            result = first + second
            break
        case 1:
            // 引き算
            result = first - second
            break
        case 2:
            // 掛け算
            result = first * second
            break
        case 3:
            // 割り算
            result = first / second
            break
        default:
            break
        }
        print(result)
        
        resultLabel.text = String(result)
    }
}

