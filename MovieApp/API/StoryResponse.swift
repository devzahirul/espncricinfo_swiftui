//
//  oryResponse.swift
//  MovieApp
//
//  Created by Hologram1 on 12/4/23.
//

import Foundation


// MARK: - WelcomeElement
struct Strory: Codable {
    let title: String
    let profilePictureURL, thumbnailURL: String?
    let thumbnails: Thumbnails
   /* let titles: Titles
    let status: PageStatus
    let initialPage, sortOrder: Int
    let isSponsored: Bool
    let sponsorID: JSONNull?
    let timestamp: Timestamp
    let shortCode: String
    let publishAt, removeAt: Date
    let categories: [Category]
    let pages: [Page]
    let webStoryURL: String
    let googleWebStoryURL: String
    let isLive, isPinned: Bool
    let chipText: String
    let audiences: [JSONAny]
    let isPublished: Bool
    let id: String

    enum CodingKeys: String, CodingKey {
        case title
        case profilePictureURL = "profilePictureUrl"
        case thumbnailURL = "thumbnailUrl"
        case thumbnails, titles, status, initialPage, sortOrder, isSponsored
        case sponsorID = "sponsorId"
        case timestamp, shortCode, publishAt, removeAt, categories, pages
        case webStoryURL = "webStoryUrl"
        case googleWebStoryURL = "googleWebStoryUrl"
        case isLive, isPinned, chipText, audiences, isPublished, id
    }*/
}

// MARK: - Category
struct Category: Codable {
    let name: Name
    let externalID: String
    let isCurrentlyActive: Bool
    let publishAt: Date
    let externalIDS: [JSONAny]
    let urlName: String
    let placement: JSONNull?
    let type: CategoryType
    let id: String

    enum CodingKeys: String, CodingKey {
        case name
        case externalID = "externalId"
        case isCurrentlyActive, publishAt
        case externalIDS = "externalIds"
        case urlName, placement, type, id
    }
}

enum Name: String, Codable {
    case asiaCup2023 = "Asia Cup 2023"
    case ipl2024 = "IPL 2024"
    case worldCup2023 = "World Cup 2023"
}

enum CategoryType: String, Codable {
    case other = "other"
    case priority = "priority"
}

// MARK: - Page
struct Page: Codable {
    let title: String?
    let type: UnitTypeEnum
    let status: PageStatus
    let sortOrder, duration: Int
    let background: Background
    let url: String
    let playcardURL: String
    let ogImageURL: String
    let swipeUpType, swipeUpStoreType: SwipeUpType
    let swipeUpURL: String?
    let swipeUpText: String?
    let appStoreID, playStoreBundleID, iosSwipeUpURL, androidSwipeUpURL: JSONNull?
    let skippable, showSwipeUpUI: Bool
    let storyID: String
    let deepLink, deepLinkInternal, deepLinkExternal: String
    let engagementUnit: EngagementUnit?
    let shareMethod: ShareMethod
    let questionID: String?
    let shortCode: String
    let studioStoryID: JSONNull?
    let timestamp: Timestamp
    let id: String

    enum CodingKeys: String, CodingKey {
        case title, type, status, sortOrder, duration, background, url
        case playcardURL = "playcardUrl"
        case ogImageURL = "ogImageUrl"
        case swipeUpType, swipeUpStoreType
        case swipeUpURL = "swipeUpUrl"
        case swipeUpText
        case appStoreID = "appStoreId"
        case playStoreBundleID = "playStoreBundleId"
        case iosSwipeUpURL = "iosSwipeUpUrl"
        case androidSwipeUpURL = "androidSwipeUpUrl"
        case skippable
        case showSwipeUpUI = "showSwipeUpUi"
        case storyID = "storyId"
        case deepLink, deepLinkInternal, deepLinkExternal, engagementUnit, shareMethod
        case questionID = "questionId"
        case shortCode
        case studioStoryID = "studioStoryId"
        case timestamp, id
    }
}

// MARK: - Background
struct Background: Codable {
    let url: String
    let playcardURL: String
    let type: UnitTypeEnum

    enum CodingKeys: String, CodingKey {
        case url
        case playcardURL = "playcardUrl"
        case type
    }
}

enum UnitTypeEnum: String, Codable {
    case image = "image"
    case poll = "poll"
    case triviaQuiz = "triviaQuiz"
    case video = "video"
}

// MARK: - EngagementUnit
struct EngagementUnit: Codable {
    let title: Title
    let status: EngagementUnitStatus
    let unitType: UnitTypeEnum
    let id: String
}

enum EngagementUnitStatus: String, Codable {
    case complete = "complete"
}

enum Title: String, Codable {
    case haveIndiaMadeTheRightCallInContinuingWithDravid = "Have India made the right call in continuing with Dravid?"
    case worldCupTrophiesQuiz = "World Cup trophies quiz"
}

enum ShareMethod: String, Codable {
    case shareLink = "shareLink"
}

enum PageStatus: String, Codable {
    case unread = "unread"
}

enum SwipeUpType: String, Codable {
    case none = "none"
    case web = "web"
}

enum Timestamp: String, Codable {
    case empty = ""
    case the14H = "14h"
    case the15H = "15h"
    case the20H = "20h"
    case the21H = "21h"
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let small: String?
    let medium, large: String?
}

// MARK: - Titles
struct Titles: Codable {
    let titlesInternal, longDisplay, shortDisplay: String

    enum CodingKeys: String, CodingKey {
        case titlesInternal = "internal"
        case longDisplay, shortDisplay
    }
}

typealias StoryApiResponse = [Strory]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
