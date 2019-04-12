//
//  QuizScreen.swift
//  Kviz
//
//  Created by FIVE on 05/04/2019.
//  Copyright © 2019 zvo. All rights reserved.
//

import UIKit

class QuizScreen: UIViewController {
    
    @IBOutlet weak var fetchButton: UIButton!
    @IBOutlet weak var quizListView: UIView!
    
    
    @IBAction func fetchQuizes(_ sender: UIButton) {
        createQuizList()
    }
    
    func createQuizList(){
        let quizList = QuizList(frame: CGRect(origin: CGPoint(x: 5, y: 30), size: CGSize(width: 370, height: 400)))
        quizListView.addSubview(quizList)
        
        let urlString = "https://iosquiz.herokuapp.com/api/quizzes"
        let fetchQuiz = FetchQuiz()
        
        fetchQuiz.fetchAllQuizes(urlString: urlString){ (quizes) in
            DispatchQueue.main.async {
                if let quizes = quizes{
                    print("Ovo su naši kvizići:")
                    for quiz in quizes{
                        print(quiz.title)
                    }
                }
            }
        }
        
    }
    
    /*
    // provjeravamo je li tekst zapisan u textField-u nil, ako je izlazimo iz metode
    guard let text = textField.text else {
        return
    }
    
    // ako smo u text napisali neki kod drzave, npr. hr, be, us i sl. onda ce se s ovog URL-a dohvatiti json sa podacima o drzavi
    let urlString = "https://restcountries-v1.p.rapidapi.com/alpha/\(text)"
    
    // stvaramo jedan CountryService objekt
    let countryService = CountryService()
    
    // i pozivamo njegovu funckiju fetchCountry()
    // Ta funckija prima string s kojeg treba dohvatiti sadrzaj (json drzave) i blok koda koji zelimo da se izvrsi kada se dohvati taj sadrzaj
    countryService.fetchCountry(urlString: urlString) { (country) in
    // ovdje moramo izvrsiti ovaj kod na main dretvi, vise o tome u iducim predavanjima
    DispatchQueue.main.async {
    if let country = country {
    self.bordersLabel.text = "Drzava \(country.name) granici s \(country.borders.count) drzava"
    }
    }
    }
    */
}
