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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func buttonAClicked(_ sender: Any) {
    }
    @IBAction func buttonBClicked(_ sender: Any) {
    }
    @IBAction func buttonCClicked(_ sender: Any) {
    }
    @IBAction func buttonDClicked(_ sender: Any) {
    }
    
}
