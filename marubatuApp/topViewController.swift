//
//  topViewController.swift
//  marubatuApp
//
//  Created by 川田 文香 on 2020/09/12.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class topViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBOutlet var challengeQuestion: UIButton!
    
    @IBOutlet var makeQuestion: UIButton!
    
    
    @IBAction func challengeQuestion(_ sender: Any) {
       //まずは、同じstororyboard内であることをここで定義します
       let storyboard: UIStoryboard = self.storyboard!
       //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
       let second = storyboard.instantiateViewController(withIdentifier: "challenge")
       //ここが実際に移動するコードとなります
       self.present(second, animated: true, completion: nil)
    }
    
    
    
    @IBAction func makeQuestion(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "make")
        //ここが実際に移動するコードとなります
        self.present(second, animated: true, completion: nil)
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
