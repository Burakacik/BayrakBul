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
        
        
        
        fetchDatabase()
        
    }
    
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
    
    @IBAction func startButtonClicked(_ sender: Any) {
    }
    
}

