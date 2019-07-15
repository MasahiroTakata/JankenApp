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
    @IBAction func gu(_ sender: Any) {
        timer!.invalidate()
        let randomImg = Int(arc4random_uniform(3))
        enemyJanken.image = UIImage(named: imageNameArray[randomImg])
        self.view.addSubview(enemyJanken)
    }
    @IBAction func choki(_ sender: Any) {
        // タイマーメソッド呼び出しを止める
        timer!.invalidate()
        //相手側のジャンケンをランダムで表示させる
        let randomImg = Int(arc4random_uniform(3))
        enemyJanken.image = UIImage(named: imageNameArray[randomImg])
        self.view.addSubview(enemyJanken)
    }

    @IBAction func pa(_ sender: Any) {
        // タイマーメソッド呼び出しを止める
        timer!.invalidate()
        //相手側のジャンケンをランダムで表示させる
        let randomImg = Int(arc4random_uniform(3))
        enemyJanken.image = UIImage(named: imageNameArray[randomImg])
        self.view.addSubview(enemyJanken)
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

