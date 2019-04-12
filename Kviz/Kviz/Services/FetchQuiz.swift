//
//  FetchQuiz.swift
//  Kviz
//
//  Created by FIVE on 09/04/2019.
//  Copyright © 2019 zvo. All rights reserved.
//

import Foundation
import UIKit

class FetchQuiz {
    // trebalo bi mođda pozvati completiotion, tj poslati copletition prilikom poziva
    //
    func fetchAllQuizes (urlString: String, completion: @escaping (([Quiz]?)-> Void)){
        var quizList: [Quiz] = []
        if let url = URL(string: urlString){
            let request = URLRequest(url: url)
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                print("Krećemo s deserijalizacijom jsona...")
                if let data = data {
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        // print("ovo je deserijalizirani")
                        // print(json)
                        if let jsonDict = json as? [String: [Any]] {
                            // print("Ispisujem quizListJson")
                            // print(quizListJson)
                            for (value) in jsonDict["quizzes"]!{
                                if let newQuiz = Quiz(json: value){
                                    quizList.append(newQuiz)
                                }else{
                                    print("Error creating Quiz...")
                                }
                            }
                        }else{
                            print("FetchQuiz_37_ERROR parsing json")
                        }
                    } catch {
                        completion(nil)
                        print("FetchQuiz_41_ERROR parsing json")
                    }
                    
                    //let image = UIImage(data: data)
                    // completion(image)
                    // print("completion called")
                    completion(quizList)
                } else {
                    completion(nil)
                    print("FetchQuiz_49_ERROR parsing json")
                }
            }
            dataTask.resume()
        }
    }
    
    /*
    // ova funkcija prima String i blok koda koja prima UIImage?
    // @escaping anotaciju zasada zanemariti
    func fetchFlag(flagType: FlagType, completion: @escaping ((UIImage?) -> Void)){
        let urlString = flagType.urlString
        // ovdje stvaramo URL objekt kojeg mozemo stvoriti iz nekog stringa koji je url
        // ako string nije url onda ovaj failable konstruktor vraca nil
        if let url = URL(string: urlString) {
            
            // URLRequest objekt stvaramo iz URL objekta
            let request = URLRequest(url: url)
            
            print("creating data task")
            
            // Ovdje stvaramo jedan dataTast objekt, metodom 'dataTask'
            // ta metoda prima URLRequest i funkciju koja prima (Data?, URLResponse?, Error?)
            // pozivom metode 'dataTask.resume()' pokrecemo izvrsavanje URLRequesta predanog dataTask-u, odnosno dohvacanje sadrzaja sa URL-a u URLRequestu
            // Nakon sto se sadrzaj dohvati sa URL-a, izvrsava se blok koda u kojem:
            // - data - dohvaceny byteovi, sadrzaj koji smo dohvatili, u ovom slucaju slika
            // - response - odgovor od servera, tu pisu header-i, status kod i sl
            // - error - pogreska, ako je doslo do greske pri dohvatu
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
            // kraj stvaranja dataTask-a
            
            print("resuming data task")
            // Pokretanje dataTask-a, dohvacanje URL-a
            dataTask.resume()
        } else {
            completion(nil)
        }
    }
    */
}
