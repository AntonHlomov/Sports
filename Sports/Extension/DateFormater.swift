//
//  DateFormater.swift
//  Sports
//
//  Created by Anton Khlomov on 13/01/2022.
//

import Foundation
extension String {
    func convertDateFormater() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
            let newDate = dateFormatter.date(from: self)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return  dateFormatter.string(from: newDate!)
    }
}
