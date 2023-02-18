//
//  User.swift
//  LoginScreenApp
//
//  Created by temaveselov on 18.02.2023.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUserInformation() -> User {
        User(
            userName: "Apple",
            password: "12345",
            person: Person(
                name: "Артём",
                surName: "Веселов",
                favColor: "Фиолетовый",
                biography: "Тут должен был быть текст обо мне, но в это время ChatGPT был недоступен, а без него красиво написать не получалось :(",
                pet: Pet(name: "Зефир", favHobby: "Любит всё грызть")
            )
        )
    }
}

struct Person {
    let name: String
    let surName: String
    let favColor: String
    let biography: String
    let pet: Pet
}

struct Pet {
    let name: String
    let favHobby: String
}
