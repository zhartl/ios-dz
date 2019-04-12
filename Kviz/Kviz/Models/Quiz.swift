//
//  Quiz.swift
//  Kviz
//
//  Created by FIVE on 11/04/2019.
//  Copyright © 2019 zvo. All rights reserved.
//

import Foundation
import UIKit

class Quiz {
    
    /*
     "id":6,
     "title":"Basic science knowledge",
     "description":"Quiz for science lovers.",
     "category":"SCIENCE",
     "level":1,
     "image":"https://www.publicdomainpictures.net/pictures/240000/velka/striding-edge-and-helvellyn-1508577364c7J.jpg",
     "questions":[]
 */
    
    let id: Int
    let title: String
    let description: String
    let category: QuizCategory
    let level: Int
    let imageUrl: String
    let questions: [Question]
   
    init?(json: Any){
        print("Trying to create Quiz")
        // print(json)
        
        if let jsonDict = json as? [String: Any],
            let id = jsonDict["id"] as? Int,
            let title = jsonDict["title"] as? String,
            let description = jsonDict["description"] as? String,
            let categoryString = jsonDict["category"] as? String,
            let level = jsonDict["level"] as? Int,
            let imageUrl = jsonDict["image"] as? String,
            let questions = jsonDict["questions"] as? [Any]{
            
            print("prošo if kod kreiranja quiza...")
            
            switch categoryString{
            case "SPORTS":
                self.category = QuizCategory.sports()
            case "SCIENCE":
                self.category = QuizCategory.science()
            default:
                print("ENUM ERROR: No matching enum.")
                return nil
            }
            var questionList: [Question] = []
            // print(questions)
            for value in questions {
                if let singleQuesiton = value as? [String: Any]{
                    if let question = Question(json: singleQuesiton){
                        questionList.append(question)
                    }else{
                        print("Question wrong declared...")
                        return nil
                    }
                } else {
                    print("Question wrong declared...")
                    return nil
                }
            }
            self.questions = questionList
            
            self.id = id
            self.title = title
            self.description = description
            // self.category = categoryString
            
            self.level = level
            self.imageUrl = imageUrl
        } else {
            print("Odmah ti je pao if..")
            return nil
        }
        print("uspješno kreiran quiz \(self.title)")
    }
    
    func loadImage (completion: @escaping ((UIImage?) -> Void)){
        if let url = URL(string: self.imageUrl) {
            let request = URLRequest(url: url)
            
            print("creating data task")
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                print("fetched image")
                if let data = data {
                    let image = UIImage(data: data)
                    completion(image)
                    print("completion called")
                } else {
                    completion(nil)
                }
            }
            print("resuming data task")
            dataTask.resume()
        } else {
            print("Error fetching image.")
            completion(nil)
        }
    }
    
    
    
}
