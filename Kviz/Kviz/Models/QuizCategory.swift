//
//  Quiz.swift
//  Kviz
//
//  Created by FIVE on 09/04/2019.
//  Copyright © 2019 zvo. All rights reserved.
//

import Foundation
import UIKit

enum QuizCategory {
    
    case sports()
    case science()
    
    var color: UIColor {
        switch self {
        case .science:
            return UIColor.blue
        case .sports:
            return UIColor.green
        }
    }
    
}
