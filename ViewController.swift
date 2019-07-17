//
//  ViewController.swift
//  JankenApp
//
//  Created by 高田将弘 on 2019/07/08.
//  Copyright © 2019 高田将弘. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 一定の間隔で処理を行う為のタイマー
    var timer: Timer?
    // 画像の番号
    var imageArrayNo = 0
    // グーチョキパーの画像を格納する配列
    let imageNameArray = [
        "gu",
        "choki",
        "pa",
    ]
    @IBOutlet weak var enemyJanken: UIImageView!
    
    func winMessage() {
        let alert = UIAlertController(title: "メッセージ", message: "勝ち！！", preferredStyle: UIAlertController.Style.alert)
        let okayButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okayButton)
        present(alert, animated: true, completion: nil)
        // OKボタンを押下してからの処理が必要
    }

    func loseMessage() {
        let alert = UIAlertController(title: "メッセージ", message: "負け！！", preferredStyle: UIAlertController.Style.alert)
        let okayButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okayButton)
        present(alert, animated: true, completion: nil)
        // OKボタンを押下してからの処理が必要
    }
    
    func drawMessage() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.onTimer(timer:)), userInfo: nil, repeats: true)
    }
    
    @IBAction func gu(_ sender: Any) {
        timer!.invalidate()
        let randomImg = Int(arc4random_uniform(3))
        enemyJanken.image = UIImage(named: imageNameArray[randomImg])
        // アプリ側のジャンケンを表示
        self.view.addSubview(enemyJanken)
        // ジャンケンがチョキなら、「勝ち」のメッセージを表示
        if (enemyJanken.image == UIImage(named: "choki")){
            winMessage()
        }
        // ジャンケンがパーなら、「負け」のメッセージを表示
        if (enemyJanken.image == UIImage(named: "pa")){
            loseMessage()
        }
        // ジャンケンがグーなら、やり直し
        if (enemyJanken.image == UIImage(named: "gu")){
            drawMessage()
        }
    }

    @IBAction func choki(_ sender: Any) {
        // タイマーメソッド呼び出しを止める
        timer!.invalidate()
        //相手側のジャンケンをランダムで表示させる
        let randomImg = Int(arc4random_uniform(3))
        enemyJanken.image = UIImage(named: imageNameArray[randomImg])
        self.view.addSubview(enemyJanken)
        // ジャンケンがパーなら、「勝ち」のメッセージを表示
        if (enemyJanken.image == UIImage(named: "pa")){
            winMessage()
        }
        // ジャンケンがグーなら、「負け」のメッセージを表示
        if (enemyJanken.image == UIImage(named: "gu")){
            loseMessage()
        }
        // ジャンケンがチョキなら、やり直し
        if (enemyJanken.image == UIImage(named: "choki")){
            drawMessage()
        }
    }

    @IBAction func pa(_ sender: Any) {
        // タイマーメソッド呼び出しを止める
        timer!.invalidate()
        //相手側のジャンケンをランダムで表示させる
        let randomImg = Int(arc4random_uniform(3))
        enemyJanken.image = UIImage(named: imageNameArray[randomImg])
        self.view.addSubview(enemyJanken)
        // ジャンケンがグーなら、「勝ち」のメッセージを表示
        if (enemyJanken.image == UIImage(named: "gu")){
            winMessage()
        }
        // ジャンケンがチョキなら、「負け」のメッセージを表示
        if (enemyJanken.image == UIImage(named: "choki")){
            loseMessage()
        }
        // ジャンケンがパーなら、やり直し
        if (enemyJanken.image == UIImage(named: "pa")){
            drawMessage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 相手側のグーチョキパーを0.1秒おきに切替表示させる
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.onTimer(timer:)), userInfo: nil, repeats: true)
    }
    
    // Timerクラスで呼び出されるメソッド
    @objc func onTimer(timer: Timer){
        if (imageArrayNo == imageNameArray.count) {
            imageArrayNo = 0
        }
        
        enemyJanken.image = UIImage(named: imageNameArray[imageArrayNo])
        self.view.addSubview(enemyJanken)
        imageArrayNo += 1
    }
}

