//
//  MyPhotoViewController.swift
//  Music Player
//
//  Created by RYO HUYNH on 4/05/2017.
//  Copyright © 2017 Deakin University. All rights reserved.
//

import UIKit

class MyPhotoViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{

    var arrayOfImages = [UIImage]()
    var arrayOfIDs = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        arrayOfImages = [#imageLiteral(resourceName: "Passenger-1"), #imageLiteral(resourceName: "justin_bieber"), #imageLiteral(resourceName: "One_Republic"), #imageLiteral(resourceName: "one_direction"), #imageLiteral(resourceName: "ed_sheeran"), #imageLiteral(resourceName: "Alan_Walker"), #imageLiteral(resourceName: "marshmello"), #imageLiteral(resourceName: "Adele"), #imageLiteral(resourceName: "TaylorSwift"), #imageLiteral(resourceName: "Jackson"), #imageLiteral(resourceName: "eminem"),#imageLiteral(resourceName: "rihanna"), #imageLiteral(resourceName: "Chris_Brown"), #imageLiteral(resourceName: "selena_gomez"), #imageLiteral(resourceName: "twenty_one_pilots"), #imageLiteral(resourceName: "pitbull"), #imageLiteral(resourceName: "bruno"), #imageLiteral(resourceName: "chain"), #imageLiteral(resourceName: "Charlie_Puth"), #imageLiteral(resourceName: "lmfao"), #imageLiteral(resourceName: "Katy"), #imageLiteral(resourceName: "Adam"), #imageLiteral(resourceName: "florida"), #imageLiteral(resourceName: "david"), #imageLiteral(resourceName: "will-i-am"), #imageLiteral(resourceName: "akon")]
        arrayOfIDs = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = arrayOfImages[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = arrayOfIDs[indexPath.row]
        let MyPhotoViewController = storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(MyPhotoViewController!, animated: true)
    }
}
