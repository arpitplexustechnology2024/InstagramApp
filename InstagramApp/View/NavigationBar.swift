//
//  NavigationBar.swift
//  InstagramApp
//
//  Created by Arpit iOS Dev. on 16/05/24.
//

import UIKit

class NavigationBar: UIView {

    @IBOutlet weak var heartBtn: UIButton!
    
    @IBOutlet var ContainerView: UIView!
    @IBOutlet weak var MessageBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }
    
    func commitInit() {
        Bundle.main.loadNibNamed("NavigationBar", owner: self)
        addSubview(ContainerView)
        ContainerView.frame = self.bounds
        ContainerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    

}
