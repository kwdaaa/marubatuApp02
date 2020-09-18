//
//  ResultViewController.swift
//  marubatuApp
//
//  Created by 川田 文香 on 2020/09/12.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var seikaiNum:Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
    
        
    let userDefaults = UserDefaults.standard

        if userDefaults.object(forKey: "countKey") != nil{
            seikaiNum = userDefaults.object(forKey: "countKey") as! Int
        }
        
        print(seikaiNum)
        ansLabel.text = "\(seikaiNum)"
        
    }
    
    
    @IBOutlet var ansLabel: UILabel!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func resultBack(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
