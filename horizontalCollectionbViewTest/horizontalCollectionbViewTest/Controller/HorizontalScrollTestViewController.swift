//
//  HorizontalScrollTestViewController.swift
//  swiftTraining2
//
//

import UIKit

class HorizontalScrollTestViewController: UIViewController, UICollectionViewDataSource , CellDelegate{
    
    
    var items = [String]()
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCell", for: indexPath) as! CategoryCollectionViewCell
               
        cell.category.setTitle(items[indexPath.row] , for: UIControl.State.normal)
        cell.delegate = self
        return cell

    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let dispatchQueue = DispatchQueue(label: "resourcesQueue", qos: .background)
        dispatchQueue.async {
            self.addItems()
        
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        collectionView.dataSource = self
        
        collectionView?.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReusableCell")
        
    
    }
    
    func buttonPressed(_ cell: UICollectionViewCell) {
        if  let row = self.collectionView.indexPath(for: cell)?.row {
            print(items[row])
        }
    }

    
    func addItems() {
        self.items.append("test 10")
        self.items.append("test 9")
        self.items.append("test 8")
        self.items.append("test 7")
        self.items.append("test 6")
        self.items.append("test 5")
        self.items.append("test 4")
        self.items.append("test 3")
        self.items.append("test 2")
        self.items.append("test 1")

    }

    

}


