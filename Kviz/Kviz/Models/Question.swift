//
//  Question.swift
//  Kviz
//
//  Created by FIVE on 11/04/2019.
//  Copyright © 2019 zvo. All rights reserved.
//

import Foundation

class Question {
    
/*
 
     "id":51,
     "question":"What is the normal temperature of the human body(in C)?",
     "answers":[
     "35",
     "36",
     "37",
     "38"
     ],
     "correct_answer":2
 */
    
    let id: Int
    let question: String
    let answers: [String]
    let correct_answer: Int
    
    init?(json: Any){
        
        if let jsonDict = json as? [String: Any],
            let id = jsonDict["id"] as? Int,
            let question = jsonDict["question"] as? String,
            let answers = jsonDict["answers"] as? [String],
            let correct_answer = jsonDict["correct_answer"] as? Int {
            
            self.id = id
            self.question = question
            self.answers = answers
            self.correct_answer = correct_answer
            
        } else {
            print("ERROR: Failed to create Question")
            return nil
        }
        
    }
    
}
