//
//  QuizVC.swift
//  BayrakBul
//
//  Created by Burak AÇIK on 3.08.2022.
//

import UIKit

class QuizVC: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var correctQtyLabel: UILabel!
    @IBOutlet weak var wrongQtyLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    //Variables
    var playerNameQVC = ""
    var questions = [Flags]()
    var wrongOptions = [Flags]()
    var timer = Timer()
    var timerCounter = 0
    var questionCounter = 0
    var correctAnswerCounter = 0
    var wrongAnswerCounter = 0
    var correctAnswer = Flags()
    var options = [Flags]()
    var mixOptionsList = Set <Flags>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fetch 9 correct answers
        questions = FlagsDao().random9Questions()
        //Print 9 correct answers on console
        for x in questions {
            print(x.flag_name!)
        }
        
        updateQuestions()
        
        //Timer
        timerCounter = 20
        timerLabel.text = String(timerCounter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
    }
    
    //Countdown function and time's up alert
    @objc func countDown() {
        timerCounter -= 1
        timerLabel.text = String(timerCounter)
        
        if timerCounter == 0 || questionCounter == 9 {
            timer.invalidate()
            if timerCounter == 0 {
                //Timer alert
                let alert = UIAlertController(title: "Süre doldu!", message: "Tekrar denemek ister misin?", preferredStyle: .alert)
                let resultButton = UIAlertAction(title: "Sonuç gör", style: .cancel) {
                    (UIAlertAction) in self.performSegue(withIdentifier: "toResultVC", sender: nil)
                }
                let tryAgainButton = UIAlertAction(title: "Tekrar dene", style: .default) {
                    (UIAlertAction) in self.navigationController?.popToRootViewController(animated: true)
                }
                alert.addAction(resultButton)
                alert.addAction(tryAgainButton)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //Updating Questions
    func updateQuestions() {
        questionNumberLabel.text = "\(questionCounter + 1). SORU"
        correctQtyLabel.text = "\(correctAnswerCounter)"
        wrongQtyLabel.text = "\(wrongAnswerCounter)"
        
        correctAnswer = questions[questionCounter]
        flagImage.image = UIImage(named: correctAnswer.flag_image!)
        
        wrongOptions = FlagsDao().random3WrongAnswers(flag_id: correctAnswer.flag_id!)
        
        mixOptionsList.removeAll()
        
        mixOptionsList.insert(correctAnswer)
        mixOptionsList.insert(wrongOptions[0])
        mixOptionsList.insert(wrongOptions[1])
        mixOptionsList.insert(wrongOptions[2])
        
        options.removeAll()
        for o in mixOptionsList {
            options.append(o)
        }
        
        buttonA.setTitle(options[0].flag_name, for: .normal)
        buttonB.setTitle(options[1].flag_name, for: .normal)
        buttonC.setTitle(options[2].flag_name, for: .normal)
        buttonD.setTitle(options[3].flag_name, for: .normal)
    }
    
    //Is answer correct or not?
    func answerControl(button:UIButton) {
        let selectedButton = button.titleLabel?.text
        let correctOption = correctAnswer.flag_name
        
        print("*********************")
        print("Seçilen şık \(selectedButton!)")
        print("Doğru cevap \(correctOption!)")
        
        if selectedButton == correctOption {
            correctAnswerCounter += 1
        }else{
            wrongAnswerCounter += 1
        }
        
        correctQtyLabel.text = "Doğru : \(correctAnswerCounter)"
        wrongQtyLabel.text = "Yanlış : \(wrongAnswerCounter)"
    }
    
    //Controlling total number of questions
    func quesitonNumberControl() {
        questionCounter += 1
        
        if questionCounter != 9 {
            updateQuestions()
        }else{
            performSegue(withIdentifier: "toResultVC", sender: nil)
        }
    }
    
    //Buttons
    @IBAction func buttonAClicked(_ sender: Any) {
        answerControl(button: buttonA)
        quesitonNumberControl()
    }
    
    @IBAction func buttonBClicked(_ sender: Any) {
        answerControl(button: buttonB)
        quesitonNumberControl()
    }
    
    @IBAction func buttonCClicked(_ sender: Any) {
        answerControl(button: buttonC)
        quesitonNumberControl()
    }
    
    @IBAction func buttonDClicked(_ sender: Any) {
        answerControl(button: buttonD)
        quesitonNumberControl()
    }
    
    //Sending player name and scores to ResultVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toVC = segue.destination as! ResultVC
        toVC.playerName = playerNameQVC
        toVC.correctNumber = correctAnswerCounter
        toVC.wrongNumber = wrongAnswerCounter
        toVC.timerScore = timerCounter
    }
    
}
