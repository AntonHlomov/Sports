//
//  LinksMatch.swift
//  Sports
//
//  Created by Anton Khlomov on 13/01/2022.
//

import Foundation
struct MatchLinksRequestBody: Encodable {
    let matchID, sportID: Int

    enum CodingKeys: String, CodingKey {
        case matchID = "match_id"
        case sportID = "sport_id"
    }
}
