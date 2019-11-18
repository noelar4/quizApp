//
//  ResultViewController.swift
//  quiz
//
//  Created by noel abraham on 2019-11-14.
//  Copyright © 2019 noel abraham. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result : Int = 0
    var Catogory : Int = 0
   
    var delegate: CategoryInteractionProtocol!
    
    @IBOutlet weak var Background: UIImageView!
    @IBOutlet weak var LabelResult: UILabel!
    
    @IBOutlet weak var ScorePass: UILabel!
    
    @IBAction func RetrySelectedQuiz(_ sender: Any) {
        
        print("Retry")
        
        if let delegate = delegate {
            delegate.selectedCategory(isFrom: Catogory)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func GobacktoHome(_ sender: Any) {
        
        print("Home")
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)

//
//        if let navController = self.navigationController {
//            navController.popViewController(animated: true)
//        }
//
        let Home = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! CategoryViewController
         self.navigationController?.pushViewController(Home, animated: true)
        
    }
    func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print (result)
        if (result > 4) {
            ScorePass.text = String(result * 2)
            Background.image = UIImage(named: "Pass")!
            //self.view.backgroundColor = UIColor.green
        }
        else if(result > 2){
            ScorePass.text = String(result * 2)
            self.view.backgroundColor = UIColor.green
        }
        else {
            print("tteettettette \(result)")
            ScorePass.text = String(result * 2)
            LabelResult.text = "Try Again(Failed)"
             self.view.backgroundColor = UIColor.red
        }
    navigationItem.hidesBackButton = true;
        setupNavigationBar() 
        
        // Do any additional setup after loading the view.
    }


}
extension ResultViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! QuizViewController
  //      controller.delegate = self
        if segue.identifier == "First" {
                    controller.isFrom = 1
                } else {
                    controller.isFrom = 2
                }
    }
}


