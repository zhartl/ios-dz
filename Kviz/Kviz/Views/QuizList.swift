//
//  QuizList.swift
//  Kviz
//
//  Created by FIVE on 08/04/2019.
//  Copyright © 2019 zvo. All rights reserved.
//

import UIKit

class QuizList: UIView {
    
    var funFactLabel: UILabel?
    var quizImage: UIImageView?
    var quizLable: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        funFactLabel = UILabel(frame: CGRect(x: 5, y: 5, width: 340, height: 40))
        quizImage = UIImageView(frame: CGRect(x: 5, y: 95, width: 100, height: 100))
        quizLable = UILabel(frame: CGRect(x: 5, y: 50, width: 340, height: 40))
        
        
        if let funFactLabel = funFactLabel,
            let quizImage = quizImage,
            let quizLable = quizLable {
            
            let urlString = "https://iosquiz.herokuapp.com/api/quizzes"
            let fetchQuiz = FetchQuiz()
            
            fetchQuiz.fetchAllQuizes(urlString: urlString){ (quizes) in
                DispatchQueue.main.async {
                    if let quizes = quizes{
                        
                        // Adding Fun Fact
                        var nbaCount = 0
                        for quiz in quizes{
                            let nbaQuestions = quiz.questions.filter{ (question) -> Bool in
                                return question.question.lowercased().contains("nba")
                            }
                            nbaCount += nbaQuestions.count
                        }
                        funFactLabel.text = "Fun Fact: u kvizu se spominje \(nbaCount) puta NBA!"
                        funFactLabel.backgroundColor = UIColor.purple
                        self.addSubview(funFactLabel)
                        
                        let quiz = quizes[2]
                        // Adding Quiz Label
                        quizLable.text = quiz.title
                        quizLable.backgroundColor = quiz.category.color
                        self.addSubview(quizLable)
                        
                        // Adding Quiz Image
                        quiz.loadImage() { (image) in
                            print("setting image")
                            DispatchQueue.main.async {
                                quizImage.image = image
                                quizImage.backgroundColor = quiz.category.color
                                self.addSubview(quizImage)
                            }
                            print("image set")
                        }
                        
                        // Adding Question View
                        let questionView = QuestionView(frame: CGRect(x: 5, y: 200, width: 340, height: 250), question: quiz.questions[0], category: quiz.category)
                        self.addSubview(questionView)
                    }
                }
            }
            
            
            
            
            
        
            self.addSubview(quizImage)
        }
        
        
        
        //self.backgroundColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


