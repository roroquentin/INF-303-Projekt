//
//  DuyurularViewController.swift
//  SendeGel-INF303
//
//  Created by Hasan Güzelmansur on 10.01.2020.
//  Copyright © 2020 Hasan Güzelmansur. All rights reserved.
//

import UIKit
import Firebase

class DuyurularViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    var etkinlikAdiArray = [String]()
    var etkinlikAmaciArray = [String]()
    var etkinlikSorumlusuArray = [String]()
    var etkinlikTarihiArray = [String]()
    var stkAdiArray = [String]()
    var yayinciArray = [String]()
    var iletisimArray = [String]()
    var userImageArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
         tableView.dataSource = self

        // Do any additional setup after loading the view.
        getDatafromFirestor()
    }
    
    func getDatafromFirestor() {
        
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("DUYURULAR").addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    for document in snapshot!.documents{
                        let documentID = document.documentID
                        
                        if let STKAdi = document.get("STKAdi") as? String{
                            self.stkAdiArray.append(STKAdi)
                        }
                        
                        if let etkinlikAdi = document.get("etkinlikAdi") as? String{
                            self.etkinlikAdiArray.append(etkinlikAdi)
                        }
                        
                        if let etkinlikAmaci = document.get("etkinlikAmaci") as? String{
                            self.etkinlikAmaciArray.append(etkinlikAmaci)
                        }
                        
                        if let etkinlikSorumlusu = document.get("etkinlikSorumlusu") as? String{
                            self.etkinlikSorumlusuArray.append(etkinlikSorumlusu)
                        }
                        
                        if let etkinlikTarihi = document.get("etkinlikTarihi") as? String{
                            self.etkinlikTarihiArray.append(etkinlikTarihi)
                        }
                        
                        if let yayinlayan = document.get("yayinlayan") as? String{
                            self.yayinciArray.append(yayinlayan)
                        }
                        
                        if let iletisim = document.get("iletisim") as? String{
                            self.iletisimArray.append(iletisim)
                        }
                        
                        if let imageURL  = document.get("imageURL") as? String{
                            self.userImageArray.append(imageURL)
                        }
                        
                    }
                    
                    self.tableView.reloadData()
                }
            }
        }
        
        
        
    }
    
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return yayinciArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTableViewCell
       
        cell.textLabel?.text = yayinciArray[indexPath.row]
        cell.fotoView.image = UIImage(named: "logo.jpg")
        cell.bilgiTextView.text = """

        Yarışmanın amacı \(etkinlikAmaciArray[indexPath.row]).

"""
        
        return cell
    }
    

}
