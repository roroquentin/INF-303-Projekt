//
//  BilgilerViewController.swift
//  SendeGel-INF303
//
//  Created by Hasan Güzelmansur on 12.01.2020.
//  Copyright © 2020 Hasan Güzelmansur. All rights reserved.
//

import UIKit
import Firebase

class BilgilerViewController: UIViewController {

    @IBOutlet weak var isimText: UITextField!
    @IBOutlet weak var soyisimText: UITextField!
    @IBOutlet weak var yasText: UITextField!
    @IBOutlet weak var meslekText: UITextField!
    @IBOutlet weak var iletisimText: UITextField!
    
    var isim = ""
    var soyisim = ""
    var meslek = ""
    var yas =  ""
    var iletisim = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func makeAlert(titleInput:String, messageInput:String) {
             let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
                        let okButton = UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: nil)
                        alert.addAction(okButton)
                        self.present(alert, animated: true, completion: nil)
             
         }
    
    @IBAction func kaydetButton(_ sender: Any) {
        
        self.isim = isimText.text!
        self.soyisim = soyisimText.text!
        self.yas = yasText.text!
        self.meslek = meslekText.text!
        self.iletisim = iletisimText.text!
        
        performSegue(withIdentifier: "toHesapVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        var VC = segue.destination as! HesapViewController
        
        VC.isim = self.isim
        VC.soyisim = self.soyisim
        VC.yas = self.yas
        VC.meslek = self.meslek
        VC.iletisim = self.iletisim
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
        
    


}
