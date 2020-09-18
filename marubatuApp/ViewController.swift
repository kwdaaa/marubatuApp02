//
//  ViewController.swift
//  marubatuApp
//
//  Created by 川田 文香 on 2020/09/12.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // アプリ起動時に立ち上がる画面
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 質問を表示
        showQuestion()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // 配列に入っている質問を表示
        questions = []
        
        // 「UserDefaults.standard」を「userDefaults」の変数に入れて省略
        let userDefaults = UserDefaults.standard
        
        // UserDefaultが空でなければ
        if userDefaults.object(forKey: "question") != nil {
            
            // 現在UserDefaultsに保存されている配列の値をquestionsに入れる
            questions = userDefaults.object(forKey: "question") as! [[String:Any]]
        }
        
        showQuestion()
        
    }
    
    
    
    @IBOutlet var questionLabel: UILabel!
    
    var currentQuestionNum = 0
    
    
    
    var questions : [[String:Any]] = []
    
    //　配列の中に、辞書を入れている
    //    let questions : [[String:Any]]=[
    //        [
    //            "question":"川田文香の年齢はもうすぐ28歳である","answer":true
    //        ],
    //        [
    //            "question":"川田文香の誕生日は本日9月12日である","answer":false
    //        ],
    //        [
    //            "question":"川田文香の本籍地は高知県である","answer":true
    //        ]
    //    ]
    //
    func showQuestion(){
        
        // もし空っぽじゃなかったら
        if questions.count > currentQuestionNum{
            
            let question = questions[currentQuestionNum]
            
            
            
            // as? Stringは型指定のお作法
            if let que = question["question"] as? String {
                
                // 問題文の表示
                questionLabel.text = que
                
                // ボタンを使えるようにする処理
                falseButton.isEnabled = true
                trueButton.isEnabled = true
                
            }
            // 問題文が表示されない時
        } else {
            
            // ボタンを使えないようにする処理
            questionLabel.text = "問題を作ってください"
            falseButton.isEnabled = false
            trueButton.isEnabled = false
            
            
            
        }
        
        
        
    }
    
    var count = 0
    
    func checkAnswer(userAnswer:Bool){
        
        let question = questions[currentQuestionNum]
        
        
        
        if let ans = question["answer"] as? Bool {
            
            if userAnswer == ans {
                // 正解
                currentQuestionNum += 1
                count += 1
                
                showAlert(message: "正解")
                
                
                
                
                
//                ansLabel.text = String(count)
                
                
                
                print(count)
                
                
                
                
            } else {
                // 不正解
                currentQuestionNum += 1
                showAlert(message: "不正解")
            }
            
        } else {
            print("答えがありません")
            return
        }
        
//        UserDefaults.standard.set(count, forKey: "countKey")
        
        // 問題の表示
        // 正解だったら、次の問題が表示される
        // 不正解だったら、そのまま同じ問題が表示される
        showQuestion()
    }
    
    func showAlert(message : String) {
        
        // UIAlertControllerはSwiftの機能
        // title: "aaa"でもOK。title: nilでもOK
        
        let alert = UIAlertController(title: nil, message:message, preferredStyle: .alert)
        
        //        let alert = UIAlertController(title: nil, message:message, preferredStyle: UIAlertController.Style.alert)
        
        var close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        
        
        if currentQuestionNum >= questions.count {
            
            close = UIAlertAction(title: "閉じる", style: .cancel, handler: {(action:UIAlertAction!)in
                
                UserDefaults.standard.set(self.count, forKey: "countKey")
                
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    // 0.5秒後に実行したい処理
                    let storyboard: UIStoryboard = self.storyboard!
                    let nextView = storyboard.instantiateViewController(withIdentifier: "result")as! ResultViewController
                    self.present(nextView, animated: true, completion: nil)
            })
        }
        
        // "閉じる"ボタンの追加
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    @IBOutlet var falseButton: UIButton!
    
    @IBOutlet var trueButton: UIButton!
    
    
    
    
    @IBAction func falseButton(_ sender: Any) {
        
        checkAnswer(userAnswer:  false)
        
    }
    
    
    
    
    @IBAction func trueButton(_ sender: Any) {
        
        checkAnswer(userAnswer: true)
        
        
    }
    
    
}



