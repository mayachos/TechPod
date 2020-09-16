//
//  ViewController.swift
//  TechPod
//
//  Created by maya on 2020/09/16.
//  Copyright © 2020 maya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //StoryBoardで使うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    //曲名の配列
    var songNameArray = [String]()
    //曲ファイル配列
    var fileNameArray = [String]()
    //画像配列
    var imageNameArray = [String]()
    
    //曲再生の変数
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //TableViewのDataSourceメソッドはViewControllerに書くという設定
        table.dataSource = self
        
        //TableViewのDelegateメソッドはViewControllerに書くという設定
        table.delegate = self
        
        //songNameArrayに加える
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        //fileNameArrayに加える
        fileNameArray = ["cannon", "elise", "aria"]
        //imageNameArrayに加える
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
    }
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    //ID付きのcellを取得, cellのtextLabelにテストを表示させる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました!")
        
        //音楽ファイルの設定(ファイル名を指定してパスを取得)
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource:  fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //再生の準備(AV AudioPlayerに音楽ファイルのパスを渡す)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //play music(メソッド呼び出し)
        audioPlayer.play()
    }
    
}

