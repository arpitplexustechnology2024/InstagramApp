//
//  SearchSecondViewController.swift
//  InstagramApp
//
//  Created by Arpit iOS Dev. on 17/05/24.
//

import UIKit

class SearchSecondViewController: UIViewController {

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
               self.imageView.image = UIImage(named: "1")
             
           }else if ((index == 1)){
               self.imageView.image = UIImage(named: "02")
               
           }else if ((index == 2)){
               self.imageView.image = UIImage(named: "3")
               
           }else if ((index == 3)){
               self.imageView.image = UIImage(named: "4")
               
           }else if ((index == 4)){
               self.imageView.image = UIImage(named: "5")
               
           }else if ((index == 5)){
               self.imageView.image = UIImage(named: "06")
               
           }else if ((index == 6)){
               self.imageView.image = UIImage(named: "7")
               
           }else if ((index == 7)){
               self.imageView.image = UIImage(named: "08")
               
           }else if ((index == 8)){
               self.imageView.image = UIImage(named: "9")
               
           }else if ((index == 9)){
               self.imageView.image = UIImage(named: "10")
               
           }else if ((index == 10)){
               self.imageView.image = UIImage(named: "11")
               
           }else if ((index == 11)){
               self.imageView.image = UIImage(named: "2")
               
           }else if ((index == 12)){
               self.imageView.image = UIImage(named: "03")
               
           }else if ((index == 13)){
               self.imageView.image = UIImage(named: "6")
               
           }else if ((index == 14)){
               self.imageView.image = UIImage(named: "8")
               
           }else if ((index == 15)){
               self.imageView.image = UIImage(named: "09")
               
           }else if ((index == 16)){
               self.imageView.image = UIImage(named: "04")
               
           }else if ((index == 17)){
               self.imageView.image = UIImage(named: "12")
               
           }else if ((index == 18)){
               self.imageView.image = UIImage(named: "13")
               
           }else if ((index == 19)){
               self.imageView.image = UIImage(named: "05")
               
           }else if ((index == 20)){
               self.imageView.image = UIImage(named: "07")
               
           }else if ((index == 21)){
               self.imageView.image = UIImage(named: "14")
               
           }else if ((index == 22)){
               self.imageView.image = UIImage(named: "15")
               
           }else if ((index == 23)){
               self.imageView.image = UIImage(named: "16")
               
           }else if ((index == 24)){
               self.imageView.image = UIImage(named: "17")
               
           }else if ((index == 25)){
               self.imageView.image = UIImage(named: "18")
               
           }else if ((index == 26)){
               self.imageView.image = UIImage(named: "19")
               
           }else if ((index == 27)){
               self.imageView.image = UIImage(named: "20")
               
           }else if ((index == 28)){
               self.imageView.image = UIImage(named: "21")
               
           }else if ((index == 29)){
               self.imageView.image = UIImage(named: "22")
               
           }else if ((index == 30)){
               self.imageView.image = UIImage(named: "23")
               
           }else if ((index == 31)){
               self.imageView.image = UIImage(named: "25")
               
           }else if ((index == 32)){
               self.imageView.image = UIImage(named: "26")
               
           }else if ((index == 33)){
               self.imageView.image = UIImage(named: "27")
               
           }else if ((index == 34)){
               self.imageView.image = UIImage(named: "28")
               
           }else if ((index == 35)){
               self.imageView.image = UIImage(named: "29")
               
           }else if ((index == 36)){
               self.imageView.image = UIImage(named: "30")
               
           }else if ((index == 37)){
               self.imageView.image = UIImage(named: "31")
               
           }else if ((index == 38)){
               self.imageView.image = UIImage(named: "32")
               
           }else if ((index == 39)){
               self.imageView.image = UIImage(named: "33")
               
           }else if ((index == 40)){
               self.imageView.image = UIImage(named: "34")
               
           }else if ((index == 41)){
               self.imageView.image = UIImage(named: "35")
               
           }else if ((index == 42)){
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
//
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
