//
//  ViewController.swift
//  ScrollableCollectionView
//
//  Created by Ben Smith on 14/12/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        let imageCollectionNib = UINib(nibName: "DetailmageSliderCell", bundle: nil)
        tableView.register(imageCollectionNib, forCellReuseIdentifier: "detailImageCellID")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageCell = tableView.dequeueReusableCell(withIdentifier: "detailImageCellID", for: indexPath)  as! DetailmageSliderCell
        imageCell.awakeFromNib()
        imageCell.images = ["https://www.wpclipart.com/weather/sun/sun_sharp_rays/sun_spiked_rays_orange.png", "https://cdn.pixabay.com/photo/2012/04/18/13/22/cloud-37011_1280.png", "https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Nuvola_weather_snow.svg/1024px-Nuvola_weather_snow.svg.png", "https://cdn.pixabay.com/photo/2013/04/01/09/22/clouds-98536_1280.png"]
        imageCell.separatorInset.left = view.frame.width
        return imageCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    // height for the indexpath per type of cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableView.estimatedRowHeight = 2
        return view.percentage(type: .height, with: 40)
    }
}


enum CalculationType {
    case height
    case width
}

// MARK: - Calculate percentage of a view - say the main bound
extension UIView {
    func percentage(type: CalculationType, with percentage: CGFloat) -> CGFloat {
        
        if type == .height {
            return percentage * self.frame.height/100
        } else {
            return percentage * self.frame.width/100
        }
    }
}
