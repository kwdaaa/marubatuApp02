//
//  QuestionViewController.swift
//  marubatuApp
//
//  Created by 川田 文香 on 2020/09/12.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITextFieldDelegateを使った場合以下の以下の宣言が必要
        questionField.delegate = self
        
    }
    
    // userが保存した時に内容を入れる配列
    var questions:[[String:Any]] = []
    
    
    // テキストフィールド
    @IBOutlet var questionField: UITextField!
    
    // 切替コントローラー
    @IBOutlet var marubatuController: UISegmentedControl!
    
    // 保存ボタン
    @IBAction func tapSaveButton(_ sender: Any) {
        
        // テキストフィールドが空でなければ
        if questionField.text != "" {
            // 初期値を型：Bool true
            var marubatuAnswer:Bool = true
            
            // 左：０　右：１　.selectedSegmentIndexはその指定
            // ０の時はバツ（左）なのでfalse
            if marubatuController.selectedSegmentIndex == 0 {
                marubatuAnswer = false
            // １の時はマル（右）なのでtrue
            } else {
                marubatuAnswer = true
            }
            
            // KAWADA:「UserDefaults.standard」をいちいち書くのめんどくさいから
            // KAWADA:変数「userDefaults」を定義
            
            //UserDefaults.standardをuserDefaultsに短縮
            let userDefaults = UserDefaults.standard
        
            // 現在保存されている配列をquestionsに格納
            if userDefaults.object(forKey: "question") != nil{
                questions = userDefaults.object(forKey: "question") as! [[String: Any]]
            }
            
            // KAWADA:questionにquestionFieldに入ってきた文字を追加
            // 配列にアペンド（追加）
            questions.append(["question": questionField.text!,"answer":marubatuAnswer])
            
            // 保存
            userDefaults.set(questions,forKey: "question")
            
            // ユーザーにアラートを表示
            showAlert(message: "問題が保存されました")
            
            // テキストフィールドを空にする
            questionField.text = ""
            print(questions)
            
        } else {
            showAlert(message: "問題を作成してください。")
        }
    }
    
    // 全て削除ボタン
    @IBAction func tapAllDeleteButton(_ sender: Any) {
        
        //UserDefaults.standardをuserDefaultsに短縮
        let userDefaults = UserDefaults.standard
        // 消して
        userDefaults.removeObject(forKey: "question")
        
        // 配列に再度保存
        // 空の配列にしておく。[]は空の配列
        userDefaults.set([],forKey: "question")
        
        // アラート
        showAlert(message: "問題を全て削除しました。")
        
    }
    
    
    
    // 戻るボタン
    @IBAction func tapBackButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func showAlert(message : String) {
        
        // UIAlertControllerはSwiftの機能
        // title: "aaa"でもOK。title: nilでもOK
        
        let alert = UIAlertController(title: nil, message:message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        // "閉じる"ボタンの追加
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
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

