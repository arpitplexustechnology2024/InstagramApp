//
//  ProfileViewController.swift
//  InstagramApp
//
//  Created by Arpit iOS Dev. on 19/05/24.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var ProfileImage: UIImageView!
    
    @IBOutlet weak var HighlightsCollectionview: UICollectionView!
    
    @IBOutlet weak var SegmentController: UISegmentedControl!
    
    
    @IBOutlet weak var personalCollectionView: UICollectionView!
    
    var highlightsArr = ["31","30","10","28","8","plus"]
    var lblhighlightssArr = ["Tajmahal","Rajasthan","Mee!","Statue of unity","happy Diwali","New"]
    
    var personalData:[PersonalModel] = []
    var reelsData:[ReelsModel] = []
    var mentionData:[MentionModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.HighlightsCollectionview.delegate = self
        self.HighlightsCollectionview.dataSource = self
        
        self.personalCollectionView.delegate = self
        self.personalCollectionView.dataSource = self
        
        self.ProfileImage.layer.cornerRadius = self.ProfileImage.frame.height / 2
        
        arrData()
    }
    
    func arrData() {
        
        personalData = [
            
            PersonalModel(img: "02"),
            PersonalModel(img: "03"),
            PersonalModel(img: "04"),
            PersonalModel(img: "05"),
            PersonalModel(img: "06"),
            PersonalModel(img: "07"),
            PersonalModel(img: "08"),
            PersonalModel(img: "09"),
            PersonalModel(img: "10"),
            PersonalModel(img: "11"),
            PersonalModel(img: "36"),
        ]
        
        reelsData = [
           
            ReelsModel(img: "31"),
            ReelsModel(img: "4"),
            ReelsModel(img: "5"),
            ReelsModel(img: "8"),
            ReelsModel(img: "1"),
        ]
        
        mentionData = [
            
            MentionModel(img: "9"),
            MentionModel(img: "13"),
            MentionModel(img: "18"),
            MentionModel(img: "21"),
            MentionModel(img: "27"),
            MentionModel(img: "28"),
        ]
        
    }
    
    
    @IBAction func EditProfile(_ sender: UIButton) {
    }
    
    @IBAction func ShareProfile(_ sender: UIButton) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count:Int?
        
        if collectionView == self.HighlightsCollectionview {
            count = highlightsArr.count
        }
        
        if collectionView == self.personalCollectionView {
            var value = 0
            
            switch SegmentController.selectedSegmentIndex {
            case 0:
                value = personalData.count
                break
            case 1:
                value = reelsData.count
                break
            case 2:
                value = mentionData.count
                break
            default:
                break
            }
            
            return value
        }
        
        return count!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.HighlightsCollectionview {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HighlightsCollectionViewCell", for: indexPath) as! HighlightsCollectionViewCell
            cell.HighlightsImage.layer.cornerRadius = cell.HighlightsImage.frame.height / 2
            cell.HighlightsImage.layer.borderWidth = 1
            cell.HighlightsImage.image = UIImage(named: highlightsArr[indexPath.row])
            cell.HighlightsLbl.text = lblhighlightssArr[indexPath.row]
            
            return cell
        }
        
        if collectionView == self.personalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonalCollectionViewCell", for: indexPath) as! PersonalCollectionViewCell
            
            switch SegmentController.selectedSegmentIndex {
            case 0:
                cell.img.image = UIImage(named: personalData[indexPath.row].img)
                break
            case 1:
                cell.img.image = UIImage(named: reelsData[indexPath.row].img)
                break
            case 2:
                cell.img.image = UIImage(named: mentionData[indexPath.row].img)
                break
            default:
                break
            }
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    @IBAction func SegmentController(_ sender: UISegmentedControl) {
        self.personalCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
//        if collectionView == self.HighlightsCollectionview {
//            
//        }
        
        if collectionView == self.personalCollectionView {
            
            let configuration = UIContextMenuConfiguration(identifier: "\(indexPath.row)" as NSCopying, previewProvider: {
                return ProfileSecondViewController(index: indexPath.row)
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
        
        return UIContextMenuConfiguration()
    }
    
    
}
