//
//  ViewController.swift
//  WhatsTheWeather With API
//
//  Created by Bilal Candemir on 8.10.2019.
//  Copyright © 2019 Bilal Candemir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sehirTextField: UITextField!
    @IBOutlet weak var sonucLabel: UILabel!
    @IBOutlet weak var butttonn: UIButton!
    @IBAction func buton1(_ sender: Any) {
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=" + sehirTextField.text!.replacingOccurrences(of: " ", with: "%20") + "&appid=7f7a0bce9744fb2fb1ad2f45443c47ce"){
               
               let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                   if error != nil{
                       print(error)
                   }
                   else{
                       if let urlContent = data {
                           
                           do{
                               let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                               print(jsonResult)
                               
                               
                               if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as?String{
                                   
                                DispatchQueue.main.sync(execute: {
                                    self.sonucLabel.text = description
                                })
                                   
                                   
                                   
                               }
                               
                               
                           } catch{
                               print("JSON Data Downloading Error")
                           }
                           
                       }
                       
                   }
               }
               
               task.resume()
        }
        else{
            sonucLabel.text = "Sehir bulunamadi"
        }
        
    }
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

