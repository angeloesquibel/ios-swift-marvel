//
//  API.swift
//  Marvel
//
//  Created by Angelo Esquibel on 4/16/21.
//

import Alamofire
import Foundation

class MarvelAPI {
    
    static let basepath = "http://gateway.marvel.com/v1/public/characters?"
    static let publicKey = "34ec85f8d9f9fa7153a6e775b1a2c842"
    static let privateKey = "9a19d3ffa89504c50faaa4787698b1c173c19989"
    static let limit = 50
    
    class func getCharacters(name: String?, page: Int = 0, completion: @escaping (MarvelInfo?) -> Void) {
        let offset = page * limit
        
        var startsWith = "nameStartsWith="
        if let name = name,
           !name.isEmpty {
            startsWith = startsWith + name.replacingOccurrences(of: " ", with: "") + "&"
        } else {
            startsWith = ""
        }
        
        let url = basepath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        print(url)
        AF.request(url).responseJSON(completionHandler: { result in
            let decode = JSONDecoder()
            guard let data = result.data,
                  let marvelInfo = try? decode.decode(MarvelInfo.self, from: data),
                  marvelInfo.code == 200 else {
                completion(nil)
                return
            }
            completion(marvelInfo)
        })
    }
    
    class func getCredentials() -> String {
        let ts = Date().stringValue()
        let hash = (ts+privateKey+publicKey).MD5
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
