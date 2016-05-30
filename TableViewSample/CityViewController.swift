//
//  CityViewController.swift
//  TableViewSample
//
//  Created by Horacio Garza on 27/05/16.
//  Copyright © 2016 Horacio Garza. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {

    var code:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urls = "https://query.yahooapis.com/v1/public/yql?format=json&q=SELECT%20*%20FROM%20weather.forecast%20WHERE%20u%20=%20%27c%27%20and%20location%20=%20%27"
        
        if let codigo = code {
            print(codigo)
            let url = NSURL(string: urls + codigo + "%27")
            let data = NSData(contentsOfURL: url!)
            do{
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves)
                
                let dico = json as! NSDictionary
                let dico1 = json["query"] as! NSDictionary
                let dico2 = dico1["results"] as! NSDictionary
                let dico3 = dico2["channel"] as! NSDictionary
                let dico4 = dico3["units"] as! NSDictionary
                print(dico4["speed"]!)
                
            
            }catch _{
                print("Error obtaining JSON")
            }
            
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
