//
//  HesapViewController.swift
//  SendeGel-INF303
//
//  Created by Hasan Güzelmansur on 10.01.2020.
//  Copyright © 2020 Hasan Güzelmansur. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HesapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cikisButton(_ sender: Any) {
        
        do{
           try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toStartVC", sender: nil)
        }catch{
            print("DİKKAT!")
        }
        
        
    }
    
  
   
    
}
