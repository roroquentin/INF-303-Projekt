//
//  ViewController.swift
//  SendeGel-INF303
//
//  Created by Hasan Güzelmansur on 10.01.2020.
//  Copyright © 2020 Hasan Güzelmansur. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var sifreText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
    }

    @IBAction func girisButton(_ sender: Any) {
        
        if emailText.text != "" && sifreText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: sifreText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "DİKKAT!", messageInput:"Yolunda gitmeyen bir şey var.\nLütfen bilgilerini kontrol et ve yeniden dene.")
                }else{
                    self.performSegue(withIdentifier: "toTabVC", sender: nil)
                }
            }
            
            
        }else{
            self.makeAlert(titleInput: "DİKKAT!", messageInput:"Yolunda gitmeyen bir şey var.\nLütfen bilgilerini kontrol et ve yeniden dene.")
        }
        
        
    }
    
    
    @IBAction func kayitButton(_ sender: Any) {
        
        if emailText.text != "" && sifreText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: sifreText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "DİKKAT!", messageInput:"Yolunda gitmeyen bir şey var.\nLütfen bilgilerini kontrol et ve yeniden dene.")
                }else{
                    self.performSegue(withIdentifier: "toTabVC", sender: nil)
                }
            }
        }else{
           
            makeAlert(titleInput: "DİKKAT!", messageInput:"Yolunda gitmeyen bir şey var.\nLütfen biligilerini kontrol et ve yeniden dene.")
            
        }
        
    }
    
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
                   let okButton = UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: nil)
                   alert.addAction(okButton)
                   self.present(alert, animated: true, completion: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

