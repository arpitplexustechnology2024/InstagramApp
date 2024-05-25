//
//  ViewController.swift
//  InstagramApp
//
//  Created by Arpit iOS Dev. on 16/05/24.
//

import UIKit

class ViewController: UIViewController{
  
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var newView: NavigationBar!
    
    var collectionImagearr = ["Profile","36","02","03","04","05","06","07","08","09","10","11"]
    var collectionNamearr = ["Your story","Arpit","Harshil","Hiren","Harshad","Darshan","Ved","Jenil","Vrushabh","Krish","Harsh","Neel"]
    
    var tableProfileImagearr = ["36","02","03","04","05","06","07","08","09","10","11"]
    var tableImagearr = ["36","02","03","04","05","06","07","08","09","10","11"]
    var tableNamearr = ["Arpit","Harshil","Hiren","Harshad","Darshan","Ved","Jenil","Vrushabh","Krish","Harsh","Neel"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
}

// MARK: - TableView Dalegate & Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableProfileImagearr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        
        cell.profileImage.image = UIImage(named: tableProfileImagearr[indexPath.row])
        cell.ImageView.image = UIImage(named: tableImagearr[indexPath.row])
        cell.lblName.text = tableNamearr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 407
    }
    
    
}

// MARK: - collection Dalegate & Datasource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionImagearr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.ImageView.layer.cornerRadius = cell.ImageView.frame.height / 2
        cell.ImageView.image = UIImage(named: collectionImagearr[indexPath.row])
        cell.lblName.text = collectionNamearr[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 122, height: 115)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        let imageInfo = GSImageInfo(image: UIImage(named: self.collectionImagearr[indexPath.row])!, imageMode: .aspectFit)
    //
    //        let transitionInfo = GSTransitionInfo(fromView: collectionView)
    //        let imageViwer = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transitionInfo)
    //        imageViwer.dismissCompletion = {
    //            print("Dismiss called")
    //
    //        }
    //    }
    //
    
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let configuration = UIContextMenuConfiguration(identifier: "\(indexPath.row)" as NSCopying, previewProvider: {
        return SecondViewController(index: indexPath.row)
        }) { action in
            let likeMenu = UIAction(title: "Like", image: UIImage(systemName: "heart"), identifier: UIAction.Identifier(rawValue: "view")) {_ in
                print("like clicked..")

            }
            let shareMenu = UIAction(title: "Share", image: UIImage(systemName: "location"), identifier: UIAction.Identifier(rawValue: "share")) {_ in
                print("share clicked..")
            }
            let commentMenu = UIAction(title: "Comment", image: UIImage(systemName: "message"), identifier: UIAction.Identifier(rawValue: "comment")) {_ in
                print("comment clicked..")
            }
            
            return UIMenu(title: "", image: nil, identifier: nil, children: [likeMenu, shareMenu,commentMenu])
        }
        return configuration
}
//    func collectionView(_ collectionView: UICollectionView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
//
//            let id = configuration.identifier as! String
//
//            animator.addCompletion {
//                self.show(SecondViewController(index: Int(id)), sender: self)
//            }
//        }
}


