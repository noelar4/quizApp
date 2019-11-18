//
//  Plistfile.swift
//  quiz
//
//  Created by Noel Abraham on 2019-11-17.
//  Copyright © 2019 noel abraham. All rights reserved.
//

import Foundation

class PListUtils {
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
      return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("QAData.plist")
    }
    
    func writingToPropertyList() {
        let encoder = PropertyListEncoder()
        do {
            print(dataFilePath())
            let categoryArray = Controller.dataEntry()
            let categories = try encoder.encode(categoryArray)
            try categories.write(to: dataFilePath(),
            options: Data.WritingOptions.atomic)
        } catch {
            print("---- PListUtils writingToPropertyList Encoding error - \(error) -------")
        }
                
    }
    
    func getCategoryFromPList() -> [QuestionsAndAnswers]? {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder =  PropertyListDecoder()
            do {
                return try decoder.decode([QuestionsAndAnswers].self, from: data)
            } catch {
                print("---- PListUtils getCategoryFromPList Encoding error - \(error) -------")
            }
        }
        
        return nil
    }
}
