//
//  Team.swift
//  Sports
//
//  Created by Anton Khlomov on 13/01/2022.
//

import Foundation

struct Team: Decodable {
    let id: Int
    let nameRus, nameEng: String
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case nameRus = "name_rus"
        case nameEng = "name_eng"
        case score
    }
}

