//
//  ApodDto.swift
//  progectOne
//
//  Created by Кацуба Павел Васильевич on 16.01.2022.
//

import Foundation

class ApodDto: Codable {
    var copyright, date, explanation: String?
        var hdurl: String?
        var mediaType, serviceVersion, title: String?
        var url: String?

        enum CodingKeys: String, CodingKey {
            case copyright, date, explanation, hdurl
            case mediaType = "media_type"
            case serviceVersion = "service_version"
            case title, url
        }
}
