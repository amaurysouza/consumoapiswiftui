//
//  PostListViewModel.swift
//  APISwiftUI
//
//  Created by Amaury A V A Souza on 01/04/20.
//  Copyright © 2020 Amaury A V A Souza. All rights reserved.
//

import Foundation
//ViewModels são o que feeda a sua View com os seus dados
//representa a lista de posts
// é um observable object para que provoque mudanças na UI se houver mudanças
class PostListViewModel:ObservableObject {
    //wrapper published para que a variável notifique quando for alterada
    @Published var posts = [PostViewModel]()
    //atribui os posts do webservice à variável do postlistviewmodel, e a seguir nos PostViewModels
    init(){
        Webservice().getPosts { (posts) in
            
            if let posts = posts{
                self.posts = posts.map(PostViewModel.init)
            }
            
        }
    }
    
}

struct PostViewModel {
    
    var post: Post
    
    init(post:Post) {
        self.post = post
    }
    var id:Int{
        
        guard let idUnwrap = self.post.id else{
            fatalError("Erro ao buscar id")
        }
        return idUnwrap
    }

    var title:String{
        
        guard let titleUnwrap = self.post.title else{
            return "Erro ao carregar o título"
        }
        return titleUnwrap
    }
    var body:String{
        
        guard let bodyUnwrap = self.post.title else{
            return "Erro ao carregar o post"
        }
        return bodyUnwrap
    }
        
    
}

