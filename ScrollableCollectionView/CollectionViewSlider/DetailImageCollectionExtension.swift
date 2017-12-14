
//
//  DetailImageCollectionExtension.swift
//  FestivalParkApp
//
//  Created by Ivo  Nederlof on 27-02-17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher

extension  DetailmageSliderCell {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (weatherForecast?.count)!
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCellID",for: indexPath) as! ImageSliderCollectionViewCell
        
        let weather = weatherForecast?[indexPath.row]
        let url = URL(string: (weather?.imageURLString)!)
 
        cell.imageVIew.kf.setImage(with: url)
        
        cell.titleLabel.text = weather?.temperature
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.30
        cell.layer.shadowOffset = CGSize(width: 4, height: 8)
        cell.layer.shadowRadius = 5
        cell.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
        cell.layer.shouldRasterize = true
        cell.layer.masksToBounds = false
        
        return cell
    }

}
