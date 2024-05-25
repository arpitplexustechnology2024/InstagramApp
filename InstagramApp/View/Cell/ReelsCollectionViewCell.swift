//
//  ReelsCollectionViewCell.swift
//  InstagramApp
//
//  Created by Arpit iOS Dev. on 17/05/24.
//

import UIKit
import AVFoundation
import AVKit

protocol ReelsCollectionViewCellDelegate: AnyObject {
    func didTapLikeButton(with model: VideoModel)
    func didTapProfileButton(with model: VideoModel)
    func didTapCommentButton(with model: VideoModel)
    func didTapShareButton(with model: VideoModel)
    func didTapMoreButton(with model: VideoModel)
}

class ReelsCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "ReelsCollectionViewCell"
    
//    Label
    
    private let usernameLable: UILabel = {
        let label  = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let captionLable: UILabel = {
        let label  = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let audioLable: UILabel = {
        let label  = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    // Button
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "04"), for: .normal)
       
       return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
       return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .white
       return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .white
       return button
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .white
       return button
    }()
    
    private let videoContainer = UIView()
    
    // Delegate
    
    weak var delegate: ReelsCollectionViewCellDelegate?
    
    var player: AVPlayer?
    
    private var model: VideoModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        contentView.clipsToBounds = true
        addSubviews()
    }
    
    private func addSubviews() {
        
        contentView.addSubview(videoContainer)
        
        contentView.addSubview(usernameLable)
        contentView.addSubview(captionLable)
        contentView.addSubview(audioLable)
            
        contentView.addSubview(profileButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(moreButton)
        
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchDown)
        commentButton.addTarget(self, action: #selector(didTapCommentButton), for: .touchDown)
        shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchDown)
        profileButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchDown)
        moreButton.addTarget(self, action: #selector(didTapMoreButton), for: .touchDown)
        
        videoContainer.clipsToBounds = true
        
        contentView.sendSubviewToBack(videoContainer)
    }
    
    @objc  private func didTapLikeButton() {
        guard let model = model else { return }
        delegate?.didTapLikeButton(with: model)
    }
    
    @objc  private func didTapCommentButton() {
        guard let model = model else { return }
        delegate?.didTapCommentButton(with: model)
    }
    
    @objc  private func didTapShareButton() {
        guard let model = model else { return }
        delegate?.didTapShareButton(with: model)
    }
    
    @objc  private func didTapProfileButton() {
        guard let model = model else { return }
        delegate?.didTapProfileButton(with: model)
    }
    
    @objc  private func didTapMoreButton() {
        guard let model = model else { return }
        delegate?.didTapMoreButton(with: model)
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
        
        videoContainer.frame = contentView.bounds
        
        
        let size = contentView.frame.size.width / 7
        let width = contentView.frame.size.width
        let height = contentView.frame.size.height - 100
        
        moreButton.frame = CGRect(x: width-size, y: height-size+20, width: 40, height: 10)
        shareButton.frame = CGRect(x: width-size, y: height-(size*2), width: 40, height: 40)
        commentButton.frame = CGRect(x: width-size, y: height-(size*3)-10, width: 40, height: 40)
        likeButton.frame = CGRect(x: width-size, y: height-(size*4)-30, width: 40, height: 40)
        
        
        profileButton.frame = CGRect(x: 7, y: height-100, width: 40, height: 40)
        
        
        audioLable.frame = CGRect(x: 10, y: height, width: width-size-10, height: 50)
        captionLable.frame = CGRect(x: 10, y: height-60, width: width-size-10, height: 50)
        usernameLable.frame = CGRect(x: 55, y: height-105, width: width-size-10, height: 50)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        usernameLable.text = nil
        captionLable.text = nil
        audioLable.text = nil
    }
    
    public func configure(with model: VideoModel) {
        self.model = model
        configureVideo()
        
        // Label
        
        usernameLable.text = model.username
        captionLable.text = model.caption
        audioLable.text = model.audioTrackname
       
    }
    
    private func configureVideo() {
        guard let model = model else {
            return
        }
        guard let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFileFormat) else {
            print("Failed to find video")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.frame = contentView.bounds
        playerView.videoGravity = .resizeAspectFill
        videoContainer.layer.addSublayer(playerView)
        player?.volume = 0
        player?.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
