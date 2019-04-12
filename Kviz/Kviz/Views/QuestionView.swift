//
//  QuestionView.swift
//  Kviz
//
//  Created by FIVE on 12/04/2019.
//  Copyright © 2019 zvo. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    
    var questionLable: UILabel?
    var answer1: UIButton?
    var answer2: UIButton?
    var answer3: UIButton?
    var answer4: UIButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, question: Question, category: QuizCategory) {
        super.init(frame: frame)
        questionLable = UILabel(frame: CGRect(origin: CGPoint(x: 5, y: 5), size: CGSize(width: 340, height: 90)))
        answer1 = UIButton(frame: CGRect(x: 5, y: 100, width: 340, height: 40))
        answer2 = UIButton(frame: CGRect(x: 5, y: 150, width: 340, height: 40))
        answer3 = UIButton(frame: CGRect(x: 5, y: 200, width: 340, height: 40))
        answer4 = UIButton(frame: CGRect(x: 5, y: 250, width: 340, height: 40))
        
        if let questionLable = questionLable,
        let answer1 = answer1,
        let answer2 = answer2,
        let answer3 = answer3,
            let answer4 = answer4{
            
            questionLable.text = question.question
            answer1.setTitle(question.answers[0], for: .normal)
            answer2.setTitle(question.answers[1], for: .normal)
            answer3.setTitle(question.answers[2], for: .normal)
            answer4.setTitle(question.answers[3], for: .normal)
            
            questionLable.backgroundColor = category.color
            
            self.addSubview(questionLable)
            self.addSubview(answer1)
            self.addSubview(answer2)
            self.addSubview(answer3)
            self.addSubview(answer4)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
