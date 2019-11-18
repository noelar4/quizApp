//
//  QuestionsAndAnswers.swift
//  quiz
//
//  Created by noel abraham on 2019-11-14.
//  Copyright © 2019 noel abraham. All rights reserved.
//

import Foundation
import UIKit

//: NSObject, Codable
class QuestionsAndAnswers: NSObject, Codable  {
    var CategoryID :Int!
    var Question : String!
    var NoofQuestions : Int!
    var Choices : [Int: String]!
    var Answers : Int!
//    var CategoryImage : UIImage!
    
    init(CategoryID :Int, Question: String, NoofQuestions: Int, Choices: [Int: String], Answers: Int) {
        // perform some initialization here
        self.CategoryID = CategoryID
        self.Question = Question
        self.NoofQuestions = NoofQuestions
        self.Choices = Choices
        self.Answers = Answers
//        self.CategoryImage = CategoryImage
    }
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
