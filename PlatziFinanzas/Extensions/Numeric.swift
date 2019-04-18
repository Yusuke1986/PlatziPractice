//
//  Numeric.swift
//  PlatziFinanzas
//
//  Created by 松岡裕介 on 2019/04/10.
//  Copyright © 2019 Platzi. All rights reserved.
//

import Foundation

extension Numeric {
    func currency() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        guard let formatted = formatter.string(from: self as! NSNumber) else {
            return "\(self)"
        }
        
        return formatted
    }
}
