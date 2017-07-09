//
//  NameViewController.swift
//  PhotoMaster
//
//  Created by 遠藤佳奈 on 2017/07/09.
//  Copyright © 2017年 遠藤佳奈. All rights reserved.
//

import UIKit

class NameViewController: UIViewController, UITableViewDataSource, UICollectionViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Nameselect() {
        let alert: UIAlertController = UIAlertController(title: "文字", message: "文字を保存しました",preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title:"ok",
                style:UIAlertActionStyle.default,
                handler:{ action in
                    print("ボタン押されまっした")}
            )
        )
        
        present(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = "でぃお"
        return cell!
    }
    
    func collectionView(_ CollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.imageView.image = UIImage(named : "628880.origidkgm.png")
        
        return cell
    }
    
    

    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
