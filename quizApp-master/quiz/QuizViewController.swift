//
//  QuizViewController.swift
//  quiz
//
//  Created by noel abraham on 2019-11-11.
//  Copyright © 2019 noel abraham. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var delegate: CategoryInteractionProtocol?
    var isFrom: Int = 0
    var isSelected = false
    var QuestionsCount = 0
    var OptionSelected = -1
    var CorrectAnswers = 0
    
    
    
    var CorrectOption = -1
    var TimeUp = false
    var isTimerRunning = false
    var CurrentQues : Int = -1
    var isCompleted = false
    var UniqueQuestionset = [Int]()
    var obj: (QuestionsAndAnswers , Int)!
    
    // var obj : QuestionsAndAnswers
    
    // var question = " This is the question 1 "
    //  var chioce = [" This is the choice 1 ", "This is the choice 2 ", "This is the choice 3 ", "This is the choice 4 "]
    
    //Questions obj
    var seconds = 60        //default time
    
    var timer: Timer?
    func resetingTimer() {
        timer?.invalidate()
        seconds = 60
        //Here we manually enter the restarting point for the seconds, but it would be wiser to make this a variable or constant.
        Timerlabel.text = "\(seconds)"
        isTimerRunning = false
    }
    //Converting te timer to timer label
    func timeString() {
        Timerlabel.text = String(seconds)
    }
    
    @IBOutlet weak var Timerlabel: UILabel!
    @IBOutlet weak var tableviewSelected: UITableView!
    @IBOutlet weak var Next: UIButton!
    
    @IBOutlet weak var Questionscountlabel: UILabel!
    
    var tableviewcheck : UITableView! //table view variable
    
    //Function to start the timmer
    func start() {
        if isTimerRunning == false {
            runTimer()
        }
    }
    //Timmer value updation
    @objc func updateTimer() {
        seconds -= 1
        if (seconds < 0){
            print ("timmer over soo skiping")
            // reseting the option selected
            next() //loading the next question after the time is up(with 0 for that question)
        }
        else{
            timeString()
        }
    }
    //Function to run the timmer
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    //function to set the category variable
    func SetCategoryValue(CategoryRepeat: Int) {
        isFrom = CategoryRepeat
    }
    //func to remove navigation bar
    func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    
    //Next question loading function
    func next() {
       // resetingTimer()
        
        if (TimeUp == true){
            //Time over hence skiping to next question...
            print("time over for the question ")
            //tableviewSelected.reloadData()
        }
        
        if (QuestionsCount == 3){
            //Changing the title of the button Proceed to next
            Next.setTitle(" Submit ", for: .normal)
            //resetingTimer()
            isCompleted = true
        }
        if (QuestionsCount == 4){
            //Last to be done  //completed loasing the result (Pass or Fail)
            isCompleted = true
            print("completed")
            print(CorrectAnswers)
            print(UniqueQuestionset)
        } else {
            //  resetingTimer()
            //Loading next question
            OptionSelected = -1
            isSelected = false
            QuestionsCount += 1
            tableviewSelected.reloadData()
            obj = Controller.CurrentRandomQueans(UniqueQuestionset,isFrom)
            print(obj.1)
            UniqueQuestionset.append(obj.1)
            print ("checkkkkk initiallllllll")
            print(obj.0)
        }
        resetingTimer()
    }
    
    @IBAction func Nextloading(_ sender: Any) {
        if (isSelected == false || OptionSelected == 0) {
            print(" Option is not selected ")
            self.showToast(message: " Please select any option ", font:  UIFont(name: "HelveticaNeue-UltraLight", size: 15)!)
        }
        else {
            //saving the result values count of correct answers
            print(".......... \(OptionSelected) and \(CorrectOption)")
            if (OptionSelected == CorrectOption){
                CorrectAnswers += 1
                print("correct")
            } else {
                print ("Wrong")
            }
            next()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obj = Controller.CurrentRandomQueans(UniqueQuestionset, isFrom)
        UniqueQuestionset.append(obj.1)
        // Do any additional setup after loading the view.
        //runTimer()
        print(isFrom)
        navigationItem.hidesBackButton = true;
        setupNavigationBar()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        OptionSelected = indexPath.row
        isSelected = true
        print("true selected")
        tableviewcheck = tableView
        
    }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.textColor = UIColor.black
    }
    
    private func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.textColor = UIColor.red
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0){
            return (150)
        }
        return (100)
    }
    
    //    private func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //        print("one")
    //        // Dequeue cell
    //        //cell.textLabel?.textColor = UIColor.redColor()
    //    }
    
    //........
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.deselectRow(at: indexPath, animated: true)
        print("loading next")
        // resetingTimer()
        //CategoryImage = UIImage(obj.0.CategoryImage)
        CorrectOption = obj.0.Answers
        Questionscountlabel.text = String(QuestionsCount + 1)
        start()
        
        // let obj = Controller.CurrentRandomQueans()
        print (obj.0.Choices!)
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "question")
            let questnLbl = cell?.viewWithTag(1000) as! UILabel
            questnLbl.text = obj.0.Question
            return cell!
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "choice1", for: indexPath)
            let questnLbl = cell.viewWithTag(101) as! UIButton
            questnLbl.setTitle(obj.0.Choices[1], for: .normal)
            //Choice1label.accessibilityTextualContext .textAlignment = .center
            
            return cell
        }
        
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "choice2", for: indexPath)
            let questnLbl = cell.viewWithTag(102) as! UIButton
            questnLbl.setTitle(obj.0.Choices[2], for: .normal)
            
            return cell
        }
        
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "choice3", for: indexPath)
            let questnLbl = cell.viewWithTag(103) as! UIButton
            questnLbl.setTitle(obj.0.Choices[3], for: .normal)
            
            return cell
        }
        
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "choice4", for: indexPath)
            let questnLbl = cell.viewWithTag(104) as! UIButton
            questnLbl.setTitle(obj.0.Choices[4], for: .normal)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    @IBAction func SelectedOpt(_ sender: Any) {
        if (sender as AnyObject).tag == 1011 {
            
            //            if (sender as AnyObject).isSelected {
            //                    //uncheck the butoon
            //                (sender[0] as AnyObject).isSelected = false
            //
            //                } else {
            //                    // checkmark it
            //                (sender as AnyObject).isSelected = true
            //
            //                }
            
        }
    }
    
    func SelectedOptionHighlight(_ tableView: UITableView,_ indexPath: IndexPath) {
        
    }
    
    //    override func tableView(_ tableView: UITableView,
    //                               cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //    let cell1 = tableView.dequeueReusableCell(withIdentifier: "choice1")
    //    let questnLbl1 = cell1?.viewWithTag(1) as! UILabel
    //    questnLbl1.text = " This is the question 1 "
    //    return cell!
    //    }
}


extension QuizViewController {
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    } }


extension QuizViewController {
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
       isCompleted
    }
}
extension QuizViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultViewController
        //        controller.delegate = self
        //        if segue.identifier == "ResultLoad" {
        //            controller.result = CorrectAnswers
        //        }
        print("loading segue")
        print(controller.result)
        controller.result = CorrectAnswers
        controller.Catogory = isFrom
        controller.delegate = self
        print("loading segue")
        print(CorrectAnswers)
    }
}
//extension QuizViewController: CategoryInteractionProtocol {
//    func selectedCategory(isFrom: Int) {
//        self.isFrom = isFrom
//    }
//}
//
extension QuizViewController : CategoryInteractionProtocol {
    func selectedCategory(isFrom: Int) {
        
        SetCategoryValue( CategoryRepeat: isFrom)
        
        OptionSelected = -1
        isSelected = false
        QuestionsCount = 0
        CorrectAnswers = 0
        TimeUp = false
        isTimerRunning = false
        CurrentQues = -1
        isCompleted = false
        UniqueQuestionset = [Int]()
        obj = Controller.CurrentRandomQueans(UniqueQuestionset,isFrom)
        //print(obj.1)
        start()
        tableviewSelected.reloadData()
        Next.setTitle("Proceed to Next", for: .normal)
        
        //
        //
        //           isSelected = false
        
        //          OptionSelected = -1
        
        //        CorrectOption = -1
        
        //           isTimerRunning = false
        //        CurrentQues = -1
        //          isCompleted = false
        //   UniqueQuestionset = [Int]()
        //
        // SetToValue(Contryogj: country)
    }
}
