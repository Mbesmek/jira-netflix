//
//  ContentView.swift
//  jira-netflix
//
//  Created by Melih Buğra Esmek on 20.05.2025.
//

import SwiftUI

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

struct ContentView: View {
    let featuredMovie = Movie(title: "Öne Çıkan Dizi/Film", imageName: "banner")
    let categories = [
        ("Popüler", [Movie(title: "Film 1", imageName: "film1"), Movie(title: "Film 2", imageName: "film2"), Movie(title: "Film 3", imageName: "film3")]),
        ("Yeni Eklenenler", [Movie(title: "Film 4", imageName: "film4"), Movie(title: "Film 5", imageName: "film5"), Movie(title: "Film 6", imageName: "film6")]),
        ("Senin İçin", [Movie(title: "Film 7", imageName: "film7"), Movie(title: "Film 8", imageName: "film8"), Movie(title: "Film 9", imageName: "film9")])
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    // Logo
                    HStack {
                        Image("netflix_logo")
                            .resizable()
                            .frame(width: 100, height: 40)
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)

                    // Banner
                    ZStack(alignment: .bottomLeading) {
                        Image(featuredMovie.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 220)
                            .clipped()
                        Text(featuredMovie.title)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                    }
                    .cornerRadius(12)
                    .padding(.horizontal)

                    // Kategoriler
                    ForEach(categories, id: .\(0)) { category, movies in
                        VStack(alignment: .leading) {
                            Text(category)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(movies) { movie in
                                        VStack {
                                            Image(movie.imageName)
                                                .resizable()
                                                .frame(width: 120, height: 180)
                                                .cornerRadius(8)
                                            Text(movie.title)
                                                .font(.caption)
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .background(Color.black.edgesIgnoringSafeArea(.all))
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
