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
        
        if self.firstTextField.text?.count == 0 {
            showAlert(title: "Error", message: "上のテキストに文字を入れてください")
           print("returnしました")
           return
        }
        if self.secondTextField.text?.count == 0 {
            showAlert(title: "Error", message: "下のテキストに文字を入れてください")
           print("returnしました")
           return
        }
        if self.secondTextField.text?.count == 0 {
           print("returnしました")
           return
        }
        
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
        
        self.performSegue(withIdentifier: "ResultSegue", sender: result)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as? ResultViewController
        let result = sender as! Int
        next?.result = result
    }
    func showAlert(title:String, message:String) {
        //ここでアラートを表示する処理を書いていく
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action:UIAlertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

