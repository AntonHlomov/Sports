//
//  InfoMatch.swift
//  Sports
//
//  Created by Anton Khlomov on 13/01/2022.
//

import Foundation
struct MatchInfoRequestBody: Encodable {
    let proc: String
    let params: MatchInfoRequestBodyParams
}

// MARK: - Params
struct MatchInfoRequestBodyParams: Encodable {
    let pSport, pMatchID: Int

    enum CodingKeys: String, CodingKey {
        case pSport = "_p_sport"
        case pMatchID = "_p_match_id"
    }
}
