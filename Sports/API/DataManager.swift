//
//  Data.swift
//  Sports
//
//  Created by Anton Khlomov on 12/01/2022.
//

import Foundation

class DataManager {
  
    static let shared = DataManager()
    
    private init() {}
    
    func getMatchInfo(sportID: Int, matchID: Int, completion: @escaping (Match?) -> Void) {
        var request = APIType.getMatchInfo.request
        let json = MatchInfoRequestBody(proc: "get_match_info", params: MatchInfoRequestBodyParams(pSport: sportID, pMatchID: matchID))
        let jsonData = try? JSONEncoder().encode(json)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            let info = try? JSONDecoder().decode(Match.self, from: data)
                completion(info)
        }
        task.resume()
    }
    
    func getMatchLinks(sportID: Int, matchID: Int, completion: @escaping (MatchLinks?) -> Void) {
        var request = APIType.getMatchLinks.request
        let json = MatchLinksRequestBody(matchID: matchID, sportID: sportID)
        let jsonData = try? JSONEncoder().encode(json)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            let links = try? JSONDecoder().decode(MatchLinks.self, from: data)
            completion(links)
        }
        task.resume()
    }
}




    
