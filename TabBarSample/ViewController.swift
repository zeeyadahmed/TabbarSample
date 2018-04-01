//
//  ViewController.swift
//  TabBarSample
//
//  Created by Franklin S D'souza on 31/03/18.
//  Copyright © 2018 Zeeyad. All rights reserved.
//

import UIKit

struct CellInfo {
    var image: UIImage?
    var title: String
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: [CellInfo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = CellInfo(image: UIImage(named: "user"), title: "My Plants")
        let item2 = CellInfo(image: UIImage(named: "add"), title: "Add New")
        let item3 = CellInfo(image: UIImage(named: "user"), title: "My Profile")
        dataSource = [item1, item2, item3]
        
        collectionView.register(UINib(nibName: "TabButtonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TabButtonCell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func configureCell(cell: TabButtonCollectionViewCell, withInfo info: CellInfo) {
        cell.iconImageView.image = info.image
        cell.menuTitleLabel.text = info.title
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabButtonCell", for: indexPath) as! TabButtonCollectionViewCell
        if let dataSource = dataSource {
            configureCell(cell: cell, withInfo:dataSource[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width / 3, height: collectionView.frame.height)
    }
}

