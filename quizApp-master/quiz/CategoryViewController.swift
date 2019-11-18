//
//  CategoryViewController.swift
//  quiz
//
//  Created by noel abraham on 2019-11-14.
//  Copyright © 2019 noel abraham. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    
       override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true;
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
   
    
    func setupNavigationBar() {
           navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
           navigationController?.navigationBar.shadowImage = UIImage()
           navigationController?.navigationBar.isTranslucent = true
           navigationController?.navigationBar.backgroundColor = UIColor.clear
       }
    
    @IBAction func CategorySelection(_ sender: Any) {
       
        
//        if let delegate = delegate, let isFrom = isFrom {
//            delegate.selectedCountry(isFrom: isFrom, country: country)
        }

    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CategoryViewController {
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
//extension CategoryViewController {
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let controller = segue.destination as! QuizViewController
//        controller.delegate = self
//        if segue.identifier == "First" {
//            controller.isFrom = 1
//        } else {
//            controller.isFrom = 2
//        }
//    }
//}






