//
//  StoreService.swift
//  MovieApp
//
//  Created by Hologram1 on 12/4/23.
//

import Foundation


class StoryService {
  static let shared = StoryService()
  
  private init() {}
  
  func fetchStories() async throws -> StoryApiResponse? {
     let urlString  = "https://api.usestoryteller.com/api/app/story/stories/default?ClientPlatform=Web&ClientVersion=8.5.0&x-storyteller-api-key=5aa177bc-998a-45a6-8b55-d6cc0d1f2053"
     
     
     guard let storyURL = URL(string: urlString) else { return nil}
     
      let (data, response) = try await URLSession.shared.data(from: storyURL)
      
      
      let storyResponse = try JSONDecoder().decode(StoryApiResponse.self, from: data)
      

      
     return storyResponse
  }
  
}


