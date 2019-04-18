//
//  TapVC.swift
//  Insta_Demo
//
//  Created by Keval Patel on 4/9/19.
//  Copyright © 2019 Keval Patel. All rights reserved.
//

import UIKit

class TapVC: UIViewController {

    @IBOutlet weak var colTap: UICollectionView!
    var filledIndexes = [-1]
    var emptyIndexes = [-1]
    var numberOfTaps = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        createEmptyIndexes()
        collectionViewProperties()
        tabBarController?.navigationItem.title = "Number of Taps \(numberOfTaps)"
    }
    func createEmptyIndexes(){
        emptyIndexes.removeAll()
        for index in 0...49 {
            emptyIndexes.append(index)
        }
        print(emptyIndexes.count)
    }
    //MARK: - collectionViewProperties
    func collectionViewProperties(){
        colTap.delegate = self
        colTap.dataSource = self
    }
    
    func createAlert(_ title: String, _ message: String) -> UIAlertController{
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            // Action here
        }))
        return alert
    }
}

//MARK: - CollectionViewDelegate, UICollectionViewdataSource
extension TapVC : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colTap.dequeueReusableCell(withReuseIdentifier: "TapCell", for: indexPath) as? TapCell
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:colTap.frame.size.width/5, height: colTap.frame.size.height/10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var indexToFill = indexPath.row
        numberOfTaps = numberOfTaps + 1
        tabBarController?.navigationItem.title = "Number of Taps \(numberOfTaps)"
        print(filledIndexes.count)
        guard filledIndexes.count != 51 else {
            let alert = createAlert("Error", "There is no Space left")
            self.present(alert, animated: true, completion: nil)
            return
        }
        if filledIndexes.contains(indexPath.row){
            indexToFill = emptyIndexes[0]
            let tempIndexPath = IndexPath(row: indexToFill, section: 0)
            let cell = colTap.cellForItem(at: tempIndexPath)
            filledIndexes.append(indexToFill)
            emptyIndexes.remove(at: 0)
            
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                cell?.backgroundColor = UIColor.blue

            }, completion: nil)

        }else{
            let tempIndexPath = IndexPath(row: indexToFill, section: 0)
            let cell = colTap.cellForItem(at: tempIndexPath)
            filledIndexes.append(indexToFill)
            emptyIndexes = emptyIndexes.filter({$0 != indexPath.row})
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                cell?.backgroundColor = UIColor.blue
                
            }, completion: nil)
        }
        
    }
}
