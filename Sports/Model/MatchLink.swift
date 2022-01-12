//
//  MatchLink.swift
//  Sports
//
//  Created by Anton Khlomov on 13/01/2022.
//

import Foundation

struct MatchLink: Decodable {
    let name: String
    let matchID, period, serverID: Int
    let quality, folder, videoType, abc: String
    let startMS, checksum, size: Int
    let abcType: String
    let duration, fps: Int
    let urlRoot: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case matchID = "match_id"
        case period
        case serverID = "server_id"
        case quality, folder
        case videoType = "video_type"
        case abc
        case startMS = "start_ms"
        case checksum, size
        case abcType = "abc_type"
        case duration, fps
        case urlRoot = "url_root"
        case url
    }
}

typealias MatchLinks = [MatchLink]
