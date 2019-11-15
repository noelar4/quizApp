//
//  ViewController.swift
//  calculator
//
//  Created by noel abraham on 2019-10-29.
//  Copyright © 2019 noel abraham. All rights reserved.
//

import UIKit

var value1: Double = 0.0
var value2: Double = 0.0
var operation: Int = 0
var size : Int = 0

extension String  {
    var isnumberordouble: Bool { return Double(self.trimmingCharacters(in: .whitespaces)) != nil }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var clearAC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func  showalert(message : String) {
        let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert , animated: true, completion: nil)
    }
    
    @IBAction func number(_ sender: UIButton) {
        
        clearAC.setTitle("C", for: .normal)
        
        if (sender.tag == 11 ){
            //result.text = result.text! + "."
            let temp : [String] = result.text!.components(separatedBy: " ")
            if(temp[temp.count - 1].contains(".")){
                showalert(message: "Only single point allowed")
                }
                else{
                  result.text = result.text! + "."
                }
             
            
        }
        else {
        result.text = result.text! + String(sender.tag)
        }
    }
    
//    func pointconvertion (temparory: [String]) -> [String] {
//        for i in 0...temparory.count {
//            if (i == ".") {
//
//            }
//        }
//        return temparory
//    }
//
    
    @IBAction func operant(_ sender: UIButton) {
        
        //value1 = Double(result.text!)!
        let temp : [String] = result.text!.components(separatedBy: " ")
        print(temp[temp.count - 1])
        if ( !(temp[0].isEmpty) && !(temp[temp.count - 1] == "") ) {
//        {
//            //|| temp[temp.count - 1] == "-" || temp[temp.count - 1] == "/" || temp[temp.count - 1] == "*"
//            result.text = ""
//            print ("Needed binary operations only \(temp)")
//       }
//       if (temp[temp.count - 1] == "" ) {
//            //|| temp[temp.count - 1] == "-" || temp[temp.count - 1] == "/" || temp[temp.count - 1] == "*"
//          showalert(message: "Need a operant to perform binary operations")
//        }
//        else
            
            if (sender.tag == 20){
                operation = 1 //add
                result.text = result.text! + " + "
            }
            else if (sender.tag == 21){
                operation = 2 //subtract
                result.text = result.text! + " - "
            }
            else if (sender.tag == 22){
                operation = 3 //multiply
                result.text = result.text! + " * "
            }
            else if (sender.tag == 23){
                operation = 4 //devide
                result.text = result.text! + " / "
            }
        }
       // size = result.text?.count
    }
    
    @IBAction func equals(_ sender: Any) {
        
        var temp : [String] = result.text!.components(separatedBy: " ")
          print(temp.count)
        if ( result.text == "" ){
            showalert(message: "Please specify input ")
        }
        if ( temp[temp.count - 1] == "" ){
            temp.remove(at: temp.count - 1)
            temp.remove(at: temp.count - 1)
            //showalert(message: "Please specify input ")
        }
       else {
            print(temp)
           // value2 = Double(temp[2])!
            var i:Int = 0
            var tempnum: Double
            var f = 0
            temp = pointConvertion(temp)
            
            f = (result.text?.contains("."))! ? 0 : 1
            
            print(temp)
            while i<temp.count {
                print(temp)
                if (temp[i] == "+"){
                    //result.text = String(Double(temp[i])! + Double(temp[i + 2])!)
                    tempnum = Double(temp[i - 1])!
                    + Double(temp[i + 1])!
                                       print(tempnum)
                                       temp[i + 1] = String(tempnum)
                                       i += 2
                      }
                else if (temp[i] == "-"){
                        //  result.text = String(Double(temp[0])! - Double(temp[2])!)
                     tempnum = Double(temp[i - 1])! - Double(temp[i + 1])!
                                       print(tempnum)
                                       temp[i + 1] = String(tempnum)
                                       i += 2
                      }
                else if (temp[i] == "*"){
                          // result.text = String(format: "%.5f", Double(Double(temp[0])! * Double(temp[2])!))
                     tempnum = Double(temp[i - 1])! * Double(temp[i + 1])!
                                       print(tempnum)
                                      temp[i + 1] = String(format: "%.5f",tempnum)
                                       i += 2
                      }
                else if (temp[i] == "/"){
                          // result.text = String(format: "%.5f", Double(Double(temp[0])! / Double(temp[2])!))
                   tempnum = Double(temp[i - 1])! / Double(temp[i + 1])!
                    print(tempnum)
                    temp[i + 1] = String(format: "%.5f",tempnum)
                    i += 2
                      }
                else{
                    i += 1
                }
            }
            
            result.text = temp[temp.count - 1]
            //.joined(separator: "")
                
            }
        }
    
    @IBAction func ac(_ sender: Any) {
        
        if (clearAC.titleLabel?.text == "C" && result.text != "") {
            if (result.text?.last == " " || result.text?.last == "f" || result.text?.last == "n" ) {
                result.text?.removeLast()
                result.text?.removeLast()
            }
            result.text?.removeLast()
        }
        else {
        //result.text = ""
        clearAC.setTitle("AC", for: .normal)
        }
    }
    
    @IBAction func pos_or_neg(_ sender: Any) {
        var temp : [String] = result.text!.components(separatedBy: " ")
        print(temp)
        print(temp.count)
        var tempvar : String
        if (temp.count == 1 && temp != [""] || Double(temp[temp.count - 1]) != nil){
            if (temp[temp.count - 1].isnumberordouble) {
          tempvar = String( -Double(temp[temp.count - 1])!)
                // tempvar = -(tempvar)
            } else {
            tempvar = String(-Int(temp[temp.count - 1])!)
                // tempvar = -(tempvar)
            }
           
            temp.removeLast()
              print(temp)
            temp.append(tempvar)
            
            result.text = temp.joined(separator: " ")
              print(temp)
           
            
           // result.text = String(tempvar)
        }
        else {
            showalert(message: "Only single value accepted for the operation")
        }
    }
    @IBAction func modulo(_ sender: Any) {
        
        if ( result.text == "" ){
                   showalert(message: "Please specify input ")
               }
        else {
            var temp : [String] = result.text!.components(separatedBy: " ")
            temp = pointConvertion(temp)
            if(temp.count == 1){
                //result.text = String(Double(temp[0])! / 100)
                
                result.text = String(format: "%.5f", Double(temp[0])! / 100)
            
                print(String(format: "%.5f", Double(temp[0])! / 100))
            }
        }
    }
    func pointConvertion(_ temp: [String]) -> [String] {
       var i = 0
        var tempo = temp
         while i<temp.count {
                       
                       if (temp[i] == "."){
                           tempo[i] = "0.0"
                           print(temp[i])
                           print("kkk")
                       }
            i += 1
            }
        return tempo;
        }
    }


