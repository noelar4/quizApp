//
//  Controller.swift
//  quiz
//
//  Created by noel abraham on 2019-11-14.
//  Copyright © 2019 noel abraham. All rights reserved.
//

import Foundation
import UIKit

class Controller : QuestionsAndAnswers {
    
    static func dataEntry() -> [QuestionsAndAnswers] {
        var objdata = [QuestionsAndAnswers]()
        //
        objdata.append(QuestionsAndAnswers(CategoryID: 1, Question: "The fastest-running terrestrial animal is: ", NoofQuestions : 4, Choices : [ 1: "cheetah",2: "lion",3: "man",4:"jaguar"], Answers : 1))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 1, Question: "Bees must collect nectar from approximately how many flowers to make 1 pound of honeycomb? Is it", NoofQuestions : 4, Choices : [1:"10 thousand",2:"2 million",3:"20 million",4:"50 million"], Answers : 3))
        objdata.append(QuestionsAndAnswers(CategoryID: 1, Question: "Albacore is a type of:", NoofQuestions : 4, Choices : [1:"shell-fish",2:"tuna",3:"marble",4:"meteoroid"], Answers : 2))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 1, Question: "The only species of cat that lives and hunts in groups is:", NoofQuestions : 4, Choices : [1:"lion",2:"leopard",3:"jaguar",4:"cougar"], Answers : 1))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 1, Question: "Which prefix is often used with scientific terms to indicate that something is the same, equal or constant?", NoofQuestions : 4, Choices : [1:"iso",2:"mega",3:"meta",4:"quasi"], Answers : 1))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 1, Question: "The study of phenomena at very low temperatures is called:", NoofQuestions : 4, Choices : [1:"heat transfer",2:"morphology",3:"crystallography",4:"cryogenics"], Answers : 4))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 1, Question: "The branch of medical science which is concerned with the study of disease as it affects a community of people is called:", NoofQuestions : 4, Choices : [ 1: "epidemiology",2: "oncology",3: "paleontogy",4:"pathology"], Answers : 1))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 1, Question: "What famous scientist and inventor participated in the invention of the Aqua-Lung?", NoofQuestions : 4, Choices : [ 1: "Thomas Edison",2: "Isaac Newton",3: "Leonardo da Vinci",4:"Jacques Cousteau"], Answers : 4))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 1, Question: "Superconductivity is a material property associated with:", NoofQuestions : 4, Choices : [ 1: "frictionless liquid flow",2: "cooling a substance without a phase change",3: "a loss of thermal resistance",4:"a loss of electrical resistance"], Answers : 4))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 1, Question: "If a metal can be drawn into wires relatively easily it is called:", NoofQuestions : 4, Choices : [ 1: "malleable",2: "ductile",3: "extractive",4:"tactile"], Answers : 2))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 2, Question: "Which among the following country is the host of 2018 Commonwealth Games?", NoofQuestions : 4, Choices : [ 1: "Canada",2: "England",3: "Australia",4:"India"], Answers : 3))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 2, Question: "Who won the Women Single's title in the U.S. Opens Tennis Tournament, 2018?", NoofQuestions : 4, Choices : [ 1: "Serena Williams",2: "Anastasija Sevastova",3: "Naomi Osaka",4:"Elena Vesnia"], Answers : 3))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 2, Question: "Who among the following has won the FIFA Player of the Year 2019?", NoofQuestions : 4, Choices : [ 1: "Virgil van Dijk",2: "Cristiano Ronaldo",3: "Lionel Messi",4:"Neymar"], Answers : 3))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 2, Question: "Expedite System is related to which game?", NoofQuestions : 4, Choices : [ 1: "Table Tennis",2: "Badminton",3: "Squash",4: "Tennis"], Answers : 1))
        
        
        //repeating
        
        objdata.append(QuestionsAndAnswers(CategoryID: 2, Question: "Fenway Park is the home field of what Major League Baseball team?", NoofQuestions : 4, Choices : [ 1: "York Yankees",2: "Chicago White Sox",3: "Montreal Expos",4:"Boston Red Sox"], Answers : 4))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 2, Question: "Which English county did batting sensation Virender Sehwag join in the 2003 season?", NoofQuestions : 4, Choices : [ 1:
            "Lancashire" ,2: "Leicestershire",3: "Yorkshire",4:"Middlesex"], Answers : 2))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 2, Question: "Who did Stone Cold Steve Austin wrestle at the 1998 edition of Over the Edge?", NoofQuestions : 4, Choices : [ 1: "Cactus Jack",2: "Mankind",3: "Dude Love",4:"Mick Foley"], Answers : 3))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 2, Question: "Ricky Ponting is also known as what?", NoofQuestions : 4, Choices : [ 1: "The Rickster",2: "Ponts",3: "Ponter",4: "Punter"], Answers : 4))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 2, Question: "Who did Shawn Michaels beat to win his first Intercontinental Title?", NoofQuestions : 4, Choices : [ 1: "Bret Hart",2: "Marty Jannetty",3: "British Bulldog",4:"Tito Santana"], Answers : 3))
        
        objdata.append(QuestionsAndAnswers(CategoryID: 2, Question: "What is the name of the person that controls a football match?", NoofQuestions : 4, Choices : [ 1: "referee",2: "An umpire",3: "A spectator",4:"A goalkeeper"], Answers : 1))
        
        
        
        //        objdata.append(CategoryID: 1, Question: "The fastest-running terrestrial animal is: ", NoofQuestions : 4, Choices : ("cheetah","lion","man","jaguar"), Answers : "cheetah", CategoryImage : UIImage(at: "science-logo"))
        //
        //var uiimage = UIImage(named: "India")!
        
        //   var country1 = Contry(countryName: "India", countryConvertion: 0.018, countryConvertionfromcad: 54.44, CountryImage: UIImage(named: "India")!)
        //  obj.append(CategoryID : 1, Question : ["Question1"], NoofQuestions : 2, Choices : ((key: 1, val: "One"),(key: 1, val: "One")), Answers : ["one","two"], CategoryImage : UIImage(named : "india"))
        
        return objdata
    }
    
    
    //science
    
    //1  The fastest-running terrestrial animal is: w) cheetah x) lion y) man z) jaguar
    //ANSWER: W -- CHEETAH
    
    //2  Bees must collect nectar from approximately how many flowers to make 1 pound of honeycomb? Is it:w) 10 thousand x) 2 million y) 20 million z) 50 million
    //ANSWER: X -- 20 MILLION
    
    //3  Albacore is a type of: w) shell-fish x) tuna y) marble z) meteoroid
    //ANSWER: X -- TUNA
    
    //4  The only species of cat that lives and hunts in groups is: w) lion x) leopard y) jaguar z) cougar
    //ANSWER: W -- LION
    
    //5  Which prefix is often used with scientific terms to indicate that something is the same, equal or constant? w) iso (pron: eye-so) x) mega y) meta z) quasi
    //ANSWER: W -- ISO
    
    //6  The study of phenomena at very low temperatures is called: w) heat transfer x) morphology y) crystallography z) cryogenics (pron: cry-o-jen-iks)
    //ANSWER: Z -- CRYOGENICS
    
    //7  The branch of medical science which is concerned with the study of disease as it affects a community of people is called: w) epidemiology x) oncology y) paleontogy z) pathology
    //ANSWER: W -- EPIDEMIOLOGY
    
    //8  What famous scientist and inventor participated in the invention of the Aqua-Lung? w) Thomas Edison x) Isaac Newton y) Leonardo da Vinci z) Jacques Cousteau
    //ANSWER: Z -- JACQUES COUSTEAU
    
    //9 Superconductivity is a material property associated with: w) cooling a substance without a phase change x) frictionless liquid flow y) a loss of thermal resistance z) a loss of electrical resistance
    //ANSWER: Z -- A LOSS OF ELECTRICAL RESISTANCE
    
    //10 If a metal can be drawn into wires relatively easily it is called: w) malleable x) ductile y) extractive z) tactile
    //ANSWER: X -- DUCTILE
    
    
    //Sports
    
    // 1  Which among the following country is the host of 2018 Commonwealth Games? [A] Canada [B] England [C] Australia [D] India  ans = C [Australia]
    // 2  Who won the Women Single's title in the U.S. Opens Tennis Tournament, 2018? 1) Serena Williams 2) Anastasija Sevastova 3) Naomi Osaka 4) Elena Vesnia  ans = Naomi Osaka (3)
    //3  Who among the following has won the FIFA Player of the Year 2019? 1) Virgil van Dijk 2) Cristiano Ronaldo 3) Lionel Messi 4) Neymar ans = 3
    //4 Expedite System is related to which game? 1) Table Tennis 2) Tennis 3) Squash 4) Badminton ANS: 1
    
    
    //5 Fenway Park is the home field of what Major League Baseball team? A.New York Yankees B. Chicago White Sox C. Montreal Expos D.Boston Red Sox ans : 4
    
    //6. Which English county did batting sensation Virender Sehwag join in the 2003 season?  A. Lancashire B. Leicestershire C. Yorkshire D. Middlesex ans = 2
    
    //7.What is the name of the person that controls a football match? A. A referee B. An umpire C. A spectator D. A goalkeeper ans 1
    //8.Who did Shawn Michaels beat to win his first Intercontinental Title? A. Bret Hart B. Marty Jannetty C. British Bulldog D. Tito Santana ans = 3
    //9     Ricky Ponting is also known as what? A. The Rickster B. Ponts C. Ponter D. Punter ans = 4
    //10.Who did Stone Cold Steve Austin wrestle at the 1998 edition of "Over the Edge"? A. Cactus Jack B. Mankind C. Dude Love D.Mick Foley ans : 3
    
    
    static func CurrentRandomQueans(_ SelectedQuestions : [Int],_ CategoryNeeded : Int) -> (QuestionsAndAnswers , Int) {
        
        var QAtemp: [QuestionsAndAnswers]
        
        let plistUtil = PListUtils()
        let categoryArrayFromPList = plistUtil.getCategoryFromPList()
        if let categories = categoryArrayFromPList {
            QAtemp = categories
        } else {
            plistUtil.writingToPropertyList()
            QAtemp = plistUtil.getCategoryFromPList()!
        }
        
        
        var flag = true
        var i : Int = -1
        while (flag){
            i = Int.random(in: 0..<19)
            if (QAtemp[i].CategoryID != CategoryNeeded  || SelectedQuestions.contains(i)){
                i = Int.random(in: 0..<19)
            }
            else {
                flag = false
                
            }
        }
        print (i)
        //RandomNumberGenerator(
        print("current obj = \(i)")
        return (QAtemp[i], i)
    }
    
}
