//
//  RaceCollectionViewController.swift
//  iosTestProject
//
//  Created by Lucas Assis Rodrigues on 7/5/18.
//  Copyright © 2018 Lucas Assis Rodrigues. All rights reserved.
//

import UIKit


class RaceCollectionViewController: UIViewController {
    private let raceCellReuseIdentifier = "raceCell"

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "RaceCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: self.raceCellReuseIdentifier)
        
        let backBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "list/Back"),
                                            style: .plain,
                                            target: self,
                                            action: nil)
        backBarButton.tintColor = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        self.navigationItem.backBarButtonItem = backBarButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RaceCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.raceCellReuseIdentifier,
                                                         for: indexPath) as? RaceCollectionViewCell {
            cell.backgroundImageView.image = UIImage(named: "run\((indexPath.row % 3) + 1)")
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension RaceCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "raceSegue", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: self.view.bounds.width * 2 / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
