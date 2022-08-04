//
//  ViewController.swift
//  BayrakBul
//
//  Created by Burak AÇIK on 2.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Fetch database
        fetchDatabase()
        
        //For hiding keyboard
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    //Hide keyboard selector
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    //Fetching database function
    func fetchDatabase() {
        let bundle = Bundle.main.path(forResource: "FlagsDataBase", ofType: ".db")
        let target = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let copyTarget = URL(fileURLWithPath: target).appendingPathComponent("FlagsDataBase.db")
        
        if fileManager.fileExists(atPath: copyTarget.path) {
            print("Veritabanı zaten var. Kopyalamaya gerek yok.")
        }else{
            do {
                try fileManager.copyItem(atPath: bundle!, toPath: copyTarget.path)
                print("Veritabanı kopyalandı.")
            } catch {
                print(error)
            }
        }
    }
    
    //Start button (player name cannot be empty)
    @IBAction func startButtonClicked(_ sender: Any) {
        if playerNameTextField.text != "" {
            performSegue(withIdentifier: "toQuizVC", sender: nil)
        }else{
            let alert = UIAlertController(title: "Oyuncu adı", message: "Oyuncu adı boş olamaz!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Tamam", style: .default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
    }
    
    //Sending player name to QuizVC for high score
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toViewController = segue.destination as! QuizVC
        toViewController.playerNameQVC = playerNameTextField.text!
    }
    
}

