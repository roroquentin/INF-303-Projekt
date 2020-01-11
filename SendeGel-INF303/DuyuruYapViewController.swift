//
//  DuyuruYapViewController.swift
//  SendeGel-INF303
//
//  Created by Hasan Güzelmansur on 10.01.2020.
//  Copyright © 2020 Hasan Güzelmansur. All rights reserved.
//

import UIKit
import Firebase

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
    
    func makeAlert(titleInput:String, messageInput:String) {
          let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
                     let okButton = UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: nil)
                     alert.addAction(okButton)
                     self.present(alert, animated: true, completion: nil)
          
      }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info [.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func yayinlaButton(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let duyuruDosyasi = storageReference.child("Duyurular")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            
            let uuid = UUID().uuidString
            
            
            let imageRefenence = duyuruDosyasi.child("\(uuid).jpg" )
            
            imageRefenence.putData(data, metadata: nil) { (metadata, error) in
                if error != nil {
                  self.makeAlert(titleInput: "DİKKAT!", messageInput:"Yolunda gitmeyen bir şey var.\nLütfen bilgilerini kontrol et ve yeniden dene.")
                }else{
                    
                    imageRefenence.downloadURL { (url, error) in
                        
                        if error == nil {
                            
                            let imageUrl = url?.absoluteString
                            
                             //DATABASE
                            
                            let firestoreDatabase = Firestore.firestore()
                            
                            var firestoreReference : DocumentReference? = nil
                            
                            let firestoreDuyuru = ["imageURL" : imageUrl, "Yayınlayan" : Auth.auth().currentUser!.email!, "STKAdı": self.stkAdiText.text, "EtkinlikAdı": self.etkinlikAdiText.text, "EtkinlikAmacı": self.etkinlikAmaciText.text, "EtkinlikTarihi": self.etkinlikTarihText.text, "EtkinlikSorumlusu": self.etkinlikSorumlusuText.text, "İletişim": self.etkinlikSiletisimText.text, "Tarih": FieldValue.serverTimestamp()] as [String : Any]
                            
                            firestoreReference = firestoreDatabase.collection("DUYURULAR").addDocument(data: firestoreDuyuru, completion: { (error) in
                                if error != nil{
                                
                                    self.makeAlert(titleInput: "DİKKAT!", messageInput:"Yolunda gitmeyen bir şey var.\nLütfen bilgilerini kontrol et ve yeniden dene.")
                                    
                                }else{
                                    
                                    self.imageView.image = UIImage(named: "galeri.jpg")
                                    self.etkinlikAdiText.text = ""
                                    self.etkinlikAmaciText.text = ""
                                    self.etkinlikSiletisimText.text = ""
                                    self.etkinlikSorumlusuText.text = ""
                                    self.etkinlikTarihText.text = ""
                                    self.stkAdiText.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                    }
                }
            }
        }
        
       
        
        
    }
    
}
