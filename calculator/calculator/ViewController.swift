
//  ViewController.swift
//  calculator
//
//  Created by noel abraham on 2019-10-29.
//  Copyright © 2019 noel abraham. All rights reserved.
//

import UIKit

//Verify if Int or Double to return bool
extension String  {
    var isnumberordouble: Bool { return Double(self.trimmingCharacters(in: .whitespaces)) != nil }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var clearAC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func  showalert(message : String) {
        let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert , animated: true, completion: nil)
    }
    
    //Action to be done upon entering number
    @IBAction func number(_ sender: UIButton) {
        
        clearAC.setTitle("C", for: .normal) //changing the AC button to C(clear)
        //Check if inf or nan
        if (result.text?.last == "f" || result.text?.last == "n" ) {
            result.text?.removeLast()
            result.text?.removeLast()
            result.text?.removeLast()
        }
        //Check if entered "."
        if (sender.tag == 11 ){
            let temp : [String] = result.text!.components(separatedBy: " ")
            //Check if having 1 point already for every values
            if(!temp[temp.count - 1].contains(".")){
                result.text = result.text! + "."
            }
        }
        else  {
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
    
    //Action for the operator
    @IBAction func operant(_ sender: UIButton) {
        let temp : [String] = result.text!.components(separatedBy: " ")
        if ( !(temp[0].isEmpty) && !(temp[temp.count - 1] == "") ) {
            if (sender.tag == 20){
                //add
                result.text = result.text! + " + "
            }
            else if (sender.tag == 21){
              //subtract
                result.text = result.text! + " - "
            }
            else if (sender.tag == 22){
               //multiply
                result.text = result.text! + " * "
            }
            else if (sender.tag == 23){
               //devide
                result.text = result.text! + " / "
            }
        }
    }
    
    //Action to be performed on "="
    @IBAction func equals(_ sender: Any) {
        var temp : [String] = result.text!.components(separatedBy: " ")
        temp = pointConvertion(temp)
        //Check if the result to calculate is empty
        if (result.text! == ""  ){
            showalert(message: "Please specify input ")
        }
        //  Check to remove the last operator if entered
      else if( temp[temp.count - 1] == "" ){
            temp.remove(at: temp.count - 1)
            temp.remove(at: temp.count - 1)
            //showalert(message: "Please specify input ")
        }
        //Calculation to be performed
        else {
            var i:Int = 0 //iteration variable
            var tempnum: Double = Double(temp[0])! //result calculation temperory variable
            //Loop for multiplication and division operation
            while i<temp.count {
                if (temp[i] == "*" || temp[i] == "/") {
                    if (temp[i] == "*" ) {
                        tempnum = Double(temp[i - 1])! * Double(temp[i + 1])!
                    }
                    else {
                        tempnum = Double(temp[i - 1])! / Double(temp[i + 1])!
                    }
                    temp[i - 1] = String(tempnum)
                    temp.remove(at: i)
                    temp.remove(at: i)
                } else {
                    i += 1
                }
                print(temp)
                print("\(i) i value 1")
            }
            //end of the multiplication and division
            i = 0 // re initialisation for i
            //loop for the addition and subtraction
            while i<temp.count {
                if (temp[i] == "+" || temp[i] == "-") {
                    if (temp[i] == "-" ) {
                        tempnum = Double(temp[i - 1])! - Double(temp[i + 1])!
                        
                    }
                    else {
                        tempnum = Double(temp[i - 1])! + Double(temp[i + 1])!
                    }
                    temp[i - 1] = String(tempnum)
                    temp.remove(at: i)
                    temp.remove(at: i)
                }else {
                    i += 1
                }
                print(temp)
                print("\(i) i value 2")
            }
            //checking if having decimal values
            let remainder1 = tempnum.truncatingRemainder(dividingBy: 1)
            if remainder1 == 0.000 {
                result.text = (String(Int(tempnum)))
                //convert to int
            }
            else {
                //Converting to point if 0 to 4 places
                let n = String(tempnum).split(separator: ".")
                let count = n[1].count < 4 ? n[1].count : 4
                result.text = String(format: "%.\(count)f",tempnum)
            }
            
        }
        
        ///without board mass rule
        //
        //        if ( result.text == "" ){
        //            showalert(message: "Please specify input ")
        //        }
        //        if ( temp[temp.count - 1] == "" ){
        //            temp.remove(at: temp.count - 1)
        //            temp.remove(at: temp.count - 1)
        //            //showalert(message: "Please specify input ")
        //        }
        //        else {
        //            print(temp)
        //            // value2 = Double(temp[2])!
        //            var i:Int = 0
        //            var tempnum: Double = 0.0
        //            temp = pointConvertion(temp)
        //
        //            //f = (result.text?.contains("."))! ? 0 : 1
        //
        //            print(temp)
        //            while i<temp.count {
        //
        //                //Double(temp[i + 1])!.fra
        //                // let remainder1 = Double(temp[i + 1])!.truncatingRemainder(dividingBy: 1)
        //                print(temp)
        //                if (temp[i] == "+"){
        //                    //result.text = String(Double(temp[i])! + Double(temp[i + 2])!)
        //                    tempnum = Double(temp[i - 1])!
        //                        + Double(temp[i + 1])!
        //                    print(tempnum)
        //                    temp[i + 1] = String(tempnum)
        //                    i += 2
        //                }
        //                else if (temp[i] == "-"){
        //                    //  result.text = String(Double(temp[0])! - Double(temp[2])!)
        //                    tempnum = Double(temp[i - 1])! - Double(temp[i + 1])!
        //                    print(tempnum)
        //                    temp[i + 1] = String(tempnum)
        //                    i += 2
        //                }
        //                else if (temp[i] == "*"){
        //                    // result.text = String(format: "%.5f", Double(Double(temp[0])! * Double(temp[2])!))
        //                    tempnum = Double(temp[i - 1])! * Double(temp[i + 1])!
        //                    print(tempnum)
        //                    temp[i + 1] = String(tempnum)
        //                    print(temp[i + 1])
        //                    print("<- value *")
        //                    i += 2
        //                }
        //                else if (temp[i] == "/"){
        //
        //
        //                    // result.text = String(format: "%.5f", Double(Double(temp[0])! / Double(temp[2])!))
        //                    tempnum = Double(temp[i - 1])! / Double(temp[i + 1])!
        //                    print(tempnum)
        //                    temp[i + 1] = String(tempnum)
        //                    print(temp[i + 1])
        //                    i += 2
        //                    //print(temp[i + 1])
        //                                     print("<- value /")
        //                }
        //                else{
        //                    i += 1
        //                }
        //            }
        //
        //            let remainder1 = Double(temp[temp.count - 1])!.truncatingRemainder(dividingBy: 1)
        //            if remainder1 == 0.00000 {
        //                let i = Int(Double(temp[temp.count - 1])!)
        //                print(i)
        //                result.text = (String(i))
        //
        //                //convert to in
        //            }
        //            else {
        //                result.text = String(format: "%.5f",tempnum)
        //            }
        //            print (remainder1)
        //
        //            //.joined(separator: "")
        //
        //        }
        //completed without board mass rule
        
        
    }
    //Action to be performed for clearing "C"
    @IBAction func ac(_ sender: Any) {
        if (clearAC.titleLabel?.text == "C" && result.text != "") {
            if (result.text?.last == " ") {
                result.text?.removeLast(3)
            }
            else if (result.text == "inf" || result.text == "nan" ) {
                result.text?.removeAll()
            }
            else {
                result.text?.removeLast()
            }
        }
        else{
            clearAC.setTitle("AC", for: .normal)
        }
    }
    
    //Action to be performed when positive to negative convertion and vice versa
    @IBAction func pos_or_neg(_ sender: Any) {
        var temp : [String] = result.text!.components(separatedBy: " ")
        temp = pointConvertion(temp) //updating . to 0.0
        var tempvar : String
        if (temp.count == 1 && temp != [""] || Double(temp[temp.count - 1]) != nil){
            if (temp[temp.count - 1].isnumberordouble) {
                tempvar = String( -Double(temp[temp.count - 1])!)
            } else {
                tempvar = String(-Int(temp[temp.count - 1])!)
            }
            
            temp.removeLast()
            temp.append(tempvar)
            result.text = temp.joined(separator: " ")
        }
        else {
            showalert(message: " Please specify input ")
        }
    }
    
    //Action to be performed in modulus button to percentage ie / by 100
    @IBAction func modulo(_ sender: Any) {
        if ( result.text == "" ){
            showalert(message: " Please specify input ")
        }
        else {
            var temp : [String] = result.text!.components(separatedBy: " ")
            temp = pointConvertion(temp)
            if(temp.count == 1){
                //result.text = String(Double(temp[0])! / 100)
                
                result.text = String(format: "%.4f", Double(temp[0])! / 100)
                
                print(String(format: "%.4f", Double(temp[0])! / 100))
            }
        }
    }
    
    //Function to convert . to 0.0
    func pointConvertion(_ temp: [String]) -> [String] {
        var tempo = temp // temperory variable
        for i in 1 ..< temp.count {
            
            if (temp[i] == "."){
                tempo[i] = "0.0"
                print(temp[i])
            }
        }
        return tempo;
    }
}


