//
//  StringExtensions.swift
//  Marvel
//
//  Created by Angelo Esquibel on 4/16/21.
//

import CryptoKit
import Foundation

extension String {
    var MD5: String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
