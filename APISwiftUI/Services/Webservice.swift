//
//  Webservice.swift
//  APISwiftUI
//
//  Created by Amaury A V A Souza on 01/04/20.
//  Copyright © 2020 Amaury A V A Souza. All rights reserved.
//

import Foundation
//classe que representa o webservice para que eu possa baixar o conteúdo
class Webservice{
    func getPosts(completion: @escaping ([Post]?) -> ()){
        //safe unwrap no caso de algo errado acontecer com a url
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Invalid url")
        }
        //já do swift, serve para fazer networking calls
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                
                return
            }
        //para decodificar o JSON no formato do model que a gente criou
            let posts = try? JSONDecoder().decode([Post].self, from: data)
            //Como vai ser exibido na UI, para evitar erros de sincronia e fazer rodar na main thread
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume() //necessário pra ele funcionar
    }
}
