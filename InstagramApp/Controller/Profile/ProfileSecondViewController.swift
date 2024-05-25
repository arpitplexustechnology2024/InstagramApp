//
//  ProfileSecondViewController.swift
//  InstagramApp
//
//  Created by Arpit iOS Dev. on 19/05/24.
//

import UIKit

class ProfileSecondViewController: UIViewController {

    var imageView : UIImageView!
       var index : Int?
    
       override func loadView() {
           super.loadView()

           let imageView = UIImageView(frame: .zero)
           imageView.translatesAutoresizingMaskIntoConstraints = false
           self.view.addSubview(imageView)
           NSLayoutConstraint.activate([
               imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
               imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
               imageView.widthAnchor.constraint(equalToConstant: 500),
               imageView.heightAnchor.constraint(equalToConstant: 600)
           ])

           imageView.contentMode = .scaleAspectFill

           self.imageView = imageView
       }

       override func viewDidLoad() {

           if ((index == 0))
           {
               self.imageView.image = UIImage(named: "02")
             
           }else if ((index == 1)){
               self.imageView.image = UIImage(named: "03")
               
           }else if ((index == 2)){
               self.imageView.image = UIImage(named: "04")
               
           }else if ((index == 3)){
               self.imageView.image = UIImage(named: "05")
               
           }else if ((index == 4)){
               self.imageView.image = UIImage(named: "06")
               
           }else if ((index == 5)){
               self.imageView.image = UIImage(named: "07")
               
           }else if ((index == 6)){
               self.imageView.image = UIImage(named: "08")
               
           }else if ((index == 7)){
               self.imageView.image = UIImage(named: "09")
               
           }else if ((index == 8)){
               self.imageView.image = UIImage(named: "10")
               
           }else if ((index == 9)){
               self.imageView.image = UIImage(named: "11")
               
           }else if ((index == 10)){
               self.imageView.image = UIImage(named: "36")
               
           }
           

       }

       init(index: Int?) {
           super.init(nibName: nil, bundle: nil)
           self.index = index
       }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
   }

//   extension UIImage {
//   func addFilter(filter : String) -> UIImage {
//   let filter = CIFilter(name: filter)
//   // convert UIImage to CIImage and set as input
//   let ciInput = CIImage(image: self)
//   filter?.setValue(ciInput, forKey: "inputImage")
//   let ciOutput = filter?.outputImage
//   let ciContext = CIContext()
//   let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
//   return UIImage(cgImage: cgImage!)
//   }
//   }
