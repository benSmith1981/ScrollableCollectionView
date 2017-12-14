//
//  ViewController.swift
//  ScrollableCollectionView
//
//  Created by Ben Smith on 14/12/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

struct Weather {
    var imageURLString: String
    var temperature: String
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var weatherForeCast: [Weather]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let imageCollectionNib = UINib(nibName: "DetailmageSliderCell", bundle: nil)
        tableView.register(imageCollectionNib, forCellReuseIdentifier: "detailImageCellID")
        
        let sunnyWeather = Weather.init(imageURLString: "https://www.wpclipart.com/weather/sun/sun_sharp_rays/sun_spiked_rays_orange.png", temperature: "30 Degrees")
        
        let raineyWeather = Weather.init(imageURLString: "https://cdn.pixabay.com/photo/2012/04/18/13/22/cloud-37011_1280.png", temperature: "15 Degrees")
        
        let snowyWeather = Weather.init(imageURLString: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Nuvola_weather_snow.svg/1024px-Nuvola_weather_snow.svg.png", temperature: "-1 Degrees")
        
        let cloudyWeather = Weather.init(imageURLString: "https://cdn.pixabay.com/photo/2013/04/01/09/22/clouds-98536_1280.png", temperature: "10 Degrees")
        weatherForeCast = [sunnyWeather, raineyWeather, snowyWeather,cloudyWeather]
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
        imageCell.weatherForecast = weatherForeCast
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
