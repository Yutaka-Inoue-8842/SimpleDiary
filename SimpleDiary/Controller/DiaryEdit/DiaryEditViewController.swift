//
//  DiaryEditViewController.swift
//  SimpleDiary
//
//  Created by Yutaka Inoue on 2023/02/26.
//

import UIKit

class DiaryEditViewController: UIViewController {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageCollectionViewFlowLayout: UICollectionViewFlowLayout!


    let imageNames = ["photo.artframe", "photo.artframe", "photo.artframe"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        viewSetting()
    }

    func viewSetting() {
        imageCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "imageCell")
        imageCollectionView.register(UINib(nibName: "AddImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "addImageCell")
        imageCollectionViewFlowLayout.minimumLineSpacing = 0
        imageCollectionViewFlowLayout.minimumInteritemSpacing = 0
        imageCollectionViewFlowLayout.itemSize = CGSize(width: view.frame.width / 2 - imageCollectionViewFlowLayout.minimumInteritemSpacing,
                                                        height: imageCollectionView.frame.height / 2 - imageCollectionViewFlowLayout.minimumLineSpacing)

    }

}

extension DiaryEditViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let row = indexPath.row
        var cell: UICollectionViewCell

        if case 0...2 = row {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addImageCell", for: indexPath) as! AddImageCollectionViewCell
        }

        return cell

    }


}

extension DiaryEditViewController: UICollectionViewDelegate {

}
