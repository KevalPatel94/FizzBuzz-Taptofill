//
//  FizzBuzzCell.swift
//  Insta_Demo
//
//  Created by Keval Patel on 4/9/19.
//  Copyright © 2019 Keval Patel. All rights reserved.
//

import UIKit

class FizzBuzzCell: UITableViewCell {
    enum fizzBuzz: String{
        case fizz = "Fizz"
        case buzz = "Buzz"
        case fizzBuzz = "FizzBuzz"

    }
    var fizzBuzzViewModel:FizzBuzzViewModel!{
        didSet{
            self.textLabel?.text =  returnFizzBuzz(fizzBuzzViewModel.number ?? 0)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func returnFizzBuzz(_ number : Int) -> String{
        var resultString = "\(number)"
        let isDivisibleByFive = number % 5 == 0 ? true : false
        let isDivisibleByThree = number % 3 == 0 ? true : false
        switch (isDivisibleByFive,isDivisibleByThree) {
        case (true,false):
            resultString = fizzBuzz.fizz.rawValue
            break
        case (false,true):
            resultString = fizzBuzz.buzz.rawValue
            break
        case (true,true):
            resultString = fizzBuzz.fizzBuzz.rawValue
            break
        default:
            break
        }
        return resultString
    }

}
