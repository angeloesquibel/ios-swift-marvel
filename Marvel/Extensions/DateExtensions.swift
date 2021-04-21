//
//  DateExtensions.swift
//  Marvel
//
//  Created by Angelo Esquibel on 4/16/21.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSSSS'Z'"
        return dateFormatter.string(from: self)
    }
}
