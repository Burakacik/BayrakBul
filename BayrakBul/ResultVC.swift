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
    
    @IBAction func tryAgainClicked(_ sender: Any) {
    }
    
}
