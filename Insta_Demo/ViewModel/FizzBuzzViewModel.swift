//
//  FizzBuzzViewModel.swift
//  Insta_Demo
//
//  Created by Keval Patel on 4/9/19.
//  Copyright © 2019 Keval Patel. All rights reserved.
//

import Foundation
struct FizzBuzzViewModel{
    let number : Int?
    init(_ fizzBuzzModel: FizzBuzzModel) {
        self.number = fizzBuzzModel.number
    }
}
