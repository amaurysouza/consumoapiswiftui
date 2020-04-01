//
//  Post.swift
//  APISwiftUI
//
//  Created by Amaury A V A Souza on 01/04/20.
//  Copyright © 2020 Amaury A V A Souza. All rights reserved.
//

import Foundation
//criação do tipo Post com os atributos que quero do que está definido no serviço web que estou usando
struct Post: Codable{
    let id:Int?
    let title:String?
    let body:String?
}
