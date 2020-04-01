//
//  ContentView.swift
//  APISwiftUI
//
//  Created by Amaury A V A Souza on 01/04/20.
//  Copyright © 2020 Amaury A V A Souza. All rights reserved.
// tutorial seguido em https://www.youtube.com/watch?v=m5ZxZfc9WmQ

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var postListVM = PostListViewModel()
    
    var body: some View {
        NavigationView{
            
            List(self.postListVM.posts, id: \.id) { post in
               
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.title)
                        Text(post.body)
                    
                }
                
                
                
            }.navigationBarTitle(Text("Posts"))
        }
        
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
