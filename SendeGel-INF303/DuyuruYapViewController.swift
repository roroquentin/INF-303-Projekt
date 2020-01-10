//
//  DuyuruYapViewController.swift
//  SendeGel-INF303
//
//  Created by Hasan Güzelmansur on 10.01.2020.
//  Copyright © 2020 Hasan Güzelmansur. All rights reserved.
//

import UIKit

class DuyuruYapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var stkAdiText: UITextField!
    
    @IBOutlet weak var etkinlikAdiText: UITextField!
    @IBOutlet weak var etkinlikAmaciText: UITextField!
    @IBOutlet weak var etkinlikTarihText: UITextField!
    @IBOutlet weak var etkinlikSorumlusuText: UITextField!
    @IBOutlet weak var etkinlikSiletisimText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(resimSec))
        imageView.addGestureRecognizer(gestureRecognizer)

        // Do any additional setup after loading the view.
    }
    
    @objc func resimSec() {
        
        let pickercontroller = UIImagePickerController()
        pickercontroller.delegate = self
        pickercontroller.sourceType = .photoLibrary
        present(pickercontroller, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info [.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func yayinlaButton(_ sender: Any) {
        
        
    }
    
}
