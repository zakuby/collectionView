//
//  ViewController.swift
//  collectionView
//
//  Created by admin on 7/6/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var collectionView: UICollectionView!
    var images =  [UIImage(named: "husky")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
        addMoreImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "imageCell")
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    func addMoreImages(){
        let moreImages = [UIImage(named: "wolf")]
        images.append(contentsOf: moreImages)
        collectionView.reloadData()
        
    }
}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    //Specifying the number of sections in the Collection View
    func numberOfSections(in collectionView: UICollectionView)-> Int {
        return 1
    }
    //Specifying the number of cells in the Collection View
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return images.count
    }
    //Method to dequeue the cell and set it up
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
        cell.awakeFromNib()
        cell.delegate = self
        return cell
    }
    //Method to populate the data of a given cell
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
         let imageCell = cell as! ImageCollectionViewCell
        imageCell.ImageView.image = images[indexPath.row]
    }
    //Set the size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension ViewController: ImageCollectionViewCellDelegate {
    func changeColorOfButton(forCell: ImageCollectionViewCell){
        forCell.button.backgroundColor = UIColor.black
    }
}
