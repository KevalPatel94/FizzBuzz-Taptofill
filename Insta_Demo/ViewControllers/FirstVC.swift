//
//  ViewController.swift
//  Insta_Demo
//
//  Created by Keval Patel on 4/9/19.
//  Copyright © 2019 Keval Patel. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    enum titles : String{
        case FizzBuzz = "FizzBuzz"
    }
    @IBOutlet weak var tblFizzBuzz: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewProperties()
        navigationProperties()
    }
    
    func tableViewProperties(){
        tblFizzBuzz.register(FizzBuzzCell.self, forCellReuseIdentifier: "FizzBuzzCell")
        tblFizzBuzz.delegate = self
        tblFizzBuzz.dataSource = self
    }
    func navigationProperties(){
        self.tabBarController?.navigationItem.title = titles.FizzBuzz.rawValue
        self.tabBarItem.title = titles.FizzBuzz.rawValue
    }
}

//MARK: - tableViewDelegate and tableViewDatasource methods
extension FirstVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 999
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFizzBuzz.dequeueReusableCell(withIdentifier: "FizzBuzzCell") as? FizzBuzzCell
        let fizzBuzzViewModel = FizzBuzzViewModel(FizzBuzzModel(number: indexPath.row + 1))
        cell?.fizzBuzzViewModel = fizzBuzzViewModel
        return cell!
    }
}

