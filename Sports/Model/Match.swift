//
//  Match.swift
//  Sports
//
//  Created by Anton Khlomov on 12/01/2022.
//

import Foundation

struct Match: Decodable {
    let access, hasVideo: Bool
    let tournament: Team
    let live: Bool
    let team2: Team
    let date: String
    let calc, storage, sub: Bool
    let team1: Team

    enum CodingKeys: String, CodingKey {
        case access
        case hasVideo = "has_video"
        case tournament, live, team2, date, calc, storage, sub, team1
    }
}
