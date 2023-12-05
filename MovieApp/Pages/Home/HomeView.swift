//
//  HomeView.swift
//  MovieApp
//
//  Created by Hologram1 on 11/29/23.
//

import SwiftUI

struct HomeView: View {
    @State var selectedMatchItem: MatchItem = .matches
    
    var body: some View {
         ScrollView(showsIndicators: false) {
        VStack(spacing: 0) {
          
           //Top Section
            VStack(spacing: .zero) {
                Header()
                    .frame(height: 56)
                    .padding(.horizontal)
            
                CurrentMatchList(items: [
                    .matches,
                    .matches1,
                    .matches2,
                    .matches3,
                    .matches4
                ], selected: $selectedMatchItem)
                
                LiveScoreCartList()
                    .frame(height: 140)
                
            }
            .padding(.bottom, 6)
            .background(Color("bg"))
                
                VStack(spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .bottom) {
                            ForEach(1...10, id: \.self) {option in
                                
                                TimeLineItemView()
                            }
                        }.frame(height: 130)
                    }
                    
                    
                }.background(Color.black)
                
                //match coverage
                VStack(spacing: 0) {
                    
                    VStack(alignment: .leading) {
                        Text("Match Coverage")
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .padding(12)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .bottom, spacing: 34) {
                                ForEach(1...10, id: \.self) {option in
                                    
                                    VStack(alignment: .leading) {
                                        Text("Ban vs NZ")
                                            .font(.system(size: 14))
                                            .fontWeight(.heavy)
                                        Text("1st men's Test")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color(.systemGray))
                                    }
                                    .padding(.bottom, 10)
                                    .overlay(alignment: .bottom) {
                                        Rectangle()
                                            .frame(height: 4)
                                            .padding(.horizontal, -10)
                                            .foregroundColor(Color("coveragelineactivebg"))
                                            .opacity(option == 1 ? 1 : 0)
                                    }
                                    
                                    
                                }
                            }
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color.gray)
                            }
                            
                            
                        }.padding(.horizontal)
                        
                    }
                    VStack(alignment: .leading, spacing: 14) {
                        Image("coverage")
                            .resizable()
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        Text("Live - Southee, Jamieson help NZ take lead on third morning")
                            .font(.system(size: 24))
                            .fontWeight(.heavy)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Circle()
                                    .foregroundColor(Color.red)
                                    .frame(width: 8, height: 8)
                                
                                Text("2nd Inn")
                                    .font(.system(size: 8))
                                    .padding(4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .foregroundColor(Color("coveragelineactivebg").opacity(0.5))
                                    )
                                
                                Text("NZ 317")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                Text("(101.5ov) vs")
                                    .font(.system(size: 10))
                                
                                Text("BAN")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemGray))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("coveragelineactivebg"))
                                
                            }.padding(12)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color("fixturesbg"))
                                )
                            
                            //recent news titles
                            VStack(alignment: .leading, spacing: 14) {
                                //1st
                                HStack {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("coveragelineactivebg"))
                                    Text("Islam: Taijul vs Williamson takes centresage")
                                }.font(.system(size: 12))
                                
                                //2nd
                                HStack {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("coveragelineactivebg"))
                                    HStack {
                                        Text("Day 2 report:")
                                            .fontWeight(.heavy)
                                        Text(" Taijul four-for, Williamson 104")
                                    }
                                }.font(.system(size: 12))
                                //3rd
                                HStack {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("coveragelineactivebg"))
                                    Text("WTC points table")
                                        .fontWeight(.heavy)
                                }.font(.system(size: 12))
                            }
                            
                        }
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                    
                    
                    
                }.background(Color("coveragebg"))
                
                
                //fixtures
                VStack {
                    
                    //fixture container
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(1...10, id: \.self) { option in
                                    
                                    VStack(spacing: 16) {
                                        HStack {
                                            Text("Ban men's fixtures")
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                        }
                                        .frame(width: 200)
                                        .padding(.horizontal)
                                        .padding(.vertical, 12)
                                        .background(Capsule().foregroundColor(Color.black))
                                        .overlay {
                                            Capsule()
                                                .stroke(lineWidth: 2)
                                                .foregroundColor(Color.gray)
                                        }
                                        
                                        HStack {
                                            Text("Ban men's fixtures")
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                        }.frame(width: 200)
                                            .padding(.horizontal)
                                            .padding(.vertical, 12)
                                            .background(Capsule().foregroundColor(Color.black))
                                            .overlay {
                                                Capsule()
                                                    .stroke(lineWidth: 2)
                                                    .foregroundColor(Color.gray)
                                            }
                                        
                                    }
                                    
                                }
                                
                                
                            }
                        }
                        
                    }
                    .padding(.vertical, 12)
                    .background(Color("fixturesbg"))
                    
                    
                    
                }
                .frame(height: 146)
                .background(Color.black)
                
                
                //Top Stories
                VStack {
                    
                    VStack {
                        HStack {
                            Text("Match Coverage")
                                .font(.system(size: 20))
                                .fontWeight(.heavy)
                            
                            Spacer()
                            
                            Text("See all")
                                .font(.system(size: 20))
                                .fontWeight(.heavy)
                                .foregroundColor(Color("coveragelineactivebg"))
                        }
                        
                        
                    }
                    
                    
                }
                
                
                
                
                Spacer()
                
            }
            .onAppear {
            
              Task {
                let stories = try await StoryService.shared.fetchStories()
                print(stories)
              }
            
            }
        }.background(Color.black)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
