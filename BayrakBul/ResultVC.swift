//
//  ResultVC.swift
//  BayrakBul
//
//  Created by Burak AÇIK on 3.08.2022.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var correctQtyLabel: UILabel!
    @IBOutlet weak var wrongQtyLabel: UILabel!
    @IBOutlet weak var timerScoreLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    //Variables
    var playerName = ""
    var correctNumber:Int?
    var wrongNumber:Int?
    var timerScore:Int?
    var highScore = 0
    var totalScore = 0
    var storedPlayer = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Writing scores
        totalScore = (correctNumber! * 10) + timerScore!
        correctQtyLabel.text = "Doğru sayısı : \(String(correctNumber!))"
        wrongQtyLabel.text = "Yanlış sayısı : \(String(wrongNumber!))"
        timerScoreLabel.text = "Artan süre : \(String(timerScore!))"
        totalScoreLabel.text = "Toplam Puan : \(String(totalScore))"
        
        //Checking for high score
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        let storedPlayerName = UserDefaults.standard.object(forKey: "playerName")
        
        if storedHighScore == nil {
            highScoreLabel.text = "En yüksek puan : \(totalScore) - \(playerName)"
            UserDefaults.standard.setValue(totalScore, forKey: "highScore")
            UserDefaults.standard.setValue(playerName, forKey: "playerName")
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
        }
        
        if totalScore >= highScore {
            highScoreLabel.text = "En yüksek puan : \(totalScore) - \(playerName)"
            UserDefaults.standard.setValue(totalScore, forKey: "highScore")
            UserDefaults.standard.setValue(playerName, forKey: "playerName")
        }else{
            if let oldPlayerName = storedPlayerName as? String {
                self.playerName = oldPlayerName
            }
            highScoreLabel.text = "En yüksek puan : \(highScore) - \(playerName)"
        }
        
        //Hide back button
        navigationItem.hidesBackButton = true
    }
    
    //Go to main page (try again)
    @IBAction func tryAgainClicked(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)    }
}
