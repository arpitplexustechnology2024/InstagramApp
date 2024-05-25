//
//  ReelsViewController.swift
//  InstagramApp
//
//  Created by Arpit iOS Dev. on 17/05/24.
//

import UIKit
import AVKit

struct VideoModel {
    let caption: String
    let username: String
    let audioTrackname: String
    let videoFileName: String
    let videoFileFormat: String
}

class ReelsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ReelsCollectionViewCellDelegate {
  
    
    @IBOutlet var ReelsCollectionView: UICollectionView!
    
    
    private var data = [VideoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            let model = VideoModel(caption: "This is a cool car",
                                   username: "arpitt_dhameliya_",
                                   audioTrackname: "Original Video song",
                                   videoFileName: "video",
                                   videoFileFormat: "mp4")
            data.append(model)
            let model2 = VideoModel(caption: "This is a cool car",
                                   username: "arpitt_dhameliya_",
                                   audioTrackname: "Original Video song",
                                   videoFileName: "video1",
                                   videoFileFormat: "mp4")
            data.append(model2)
            let model3 = VideoModel(caption: "This is a cool car",
                                   username: "arpitt_dhameliya_",
                                   audioTrackname: "Original Video song",
                                   videoFileName: "video2",
                                   videoFileFormat: "mp4")
            data.append(model3)
            let model4 = VideoModel(caption: "This is a cool car",
                                   username: "arpitt_dhameliya_",
                                   audioTrackname: "Original Video song",
                                   videoFileName: "video3",
                                   videoFileFormat: "mp4")
            data.append(model4)
            let model5 = VideoModel(caption: "This is a cool car",
                                   username: "arpitt_dhameliya_",
                                   audioTrackname: "Original Video song",
                                   videoFileName: "video4",
                                   videoFileFormat: "mp4")
            data.append(model5)
            let model6 = VideoModel(caption: "This is a cool car",
                                   username: "arpitt_dhameliya_",
                                   audioTrackname: "Original Video song",
                                   videoFileName: "video5",
                                   videoFileFormat: "mp4")
            data.append(model6)
            let model7 = VideoModel(caption: "This is a cool car",
                                   username: "arpitt_dhameliya_",
                                   audioTrackname: "Original Video song",
                                   videoFileName: "video6",
                                   videoFileFormat: "mp4")
            data.append(model7)
            let model8 = VideoModel(caption: "This is a cool car",
                                   username: "arpitt_dhameliya_",
                                   audioTrackname: "Original Video song",
                                   videoFileName: "video7",
                                   videoFileFormat: "mp4")
            data.append(model8)
            let model9 = VideoModel(caption: "This is a cool car",
                                   username: "arpitt_dhameliya_",
                                   audioTrackname: "Original Video song",
                                   videoFileName: "video8",
                                   videoFileFormat: "mp4")
            data.append(model9)
            let model10 = VideoModel(caption: "This is a cool car",
                                   username: "arpitt_dhameliya_",
                                   audioTrackname: "Original Video song",
                                   videoFileName: "video4",
                                   videoFileFormat: "mp4")
            data.append(model10)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        ReelsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        ReelsCollectionView.register(ReelsCollectionViewCell.self, forCellWithReuseIdentifier: ReelsCollectionViewCell.identifire)
        ReelsCollectionView?.isSpringLoaded = true
        view.addSubview(ReelsCollectionView!)

        // Do any additional setup after loading the view.
        self.ReelsCollectionView.delegate = self
        self.ReelsCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ReelsCollectionView?.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCollectionViewCell.identifire, for: indexPath) as! ReelsCollectionViewCell
        
        cell.configure(with: model)
        cell.delegate = self
        
        return cell
    }
    
    func didTapLikeButton(with model: VideoModel) {
        print("Like")
    }
    
    func didTapProfileButton(with model: VideoModel) {
        print("Profile")
    }
    
    func didTapCommentButton(with model: VideoModel) {
        print("Comment")
    }
    
    func didTapShareButton(with model: VideoModel) {
        print("Share")
    }
    
    func didTapMoreButton(with model: VideoModel) {
        print("More")
    }
    
    
    


}
