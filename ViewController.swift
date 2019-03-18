//
//  ViewController.swift
//  Day03ex00
//
//  Created by Ganna DANYLOVA on 3/5/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var tabGesture: UITapGestureRecognizer!
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    var selectedImage: URL!
    
    var images : [URL] = [URL(string: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/2.21-iss058e016863_highres.jpg")!,
                          URL(string: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/grc-2018-c-09843.jpg")!,
                          URL(string: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/s68-56050.jpg")!,
                          URL(string: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia22569-snr-g54.jpg")!,
                          URL(string: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/demo-1")!
//                  "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/demo-1.jpeg"
    ]
    
//    @objc func backAction(){
//        //print("Back Button Clicked")
//        dismiss(animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
//        self.navigationItem.title = "Images"
        
     
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backAction))

    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
    
            self.navigationItem.title = "Images"
        }
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        print("In handler")
//        return true
//    }


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("hello1")
//        if segue.identifier == "NewView" {
//            let im = segue.destination as! NewView
//            im.selectedImage = selectedImage
//        }
//    }

    @IBAction func imageTapped(_ sender: ImageTapGesture) {
        print("hello2")
//        selectedImage = images[sender.imageIndex!]
//        performSegue(withIdentifier: "NewView", sender: self)
        let myImage:NewView = self.storyboard?.instantiateViewController(withIdentifier: "NewView") as! NewView
        myImage.selectedImage = images[sender.imageIndex!]
        self.present(myImage, animated: true, completion: nil)
//        self.dismiss(animated: true, completion: nil)

    }
    
    func createALert () {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as! CollectionViewCell
        Cell.activityIndicator.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        let tap = ImageTapGesture(target: self, action: #selector(getter: tabGesture))
        let tap = ImageTapGesture(target: self, action: #selector(imageTapped(_:)))
        tap.imageIndex = indexPath.row
        Cell.image.addGestureRecognizer(tap)
        DispatchQueue.global(qos: .utility).async {
            if self.images.count < indexPath.row + 1{
                self.createALert()
            }
           if let data = try? Data(contentsOf: self.images[indexPath.row]) {
                DispatchQueue.main.async {
                    Cell.image.image = UIImage(data: data)
                    if Cell.image.image == nil {
                        self.createALert()
                    }
                    else {
                    Cell.activityIndicator.stopAnimating()
                    Cell.activityIndicator.hidesWhenStopped = true
                    }
                }
            }
            else {
            print("error")
            self.createALert()
        }
            
//       let myImage:NewView = self.storyboard?.instantiateViewController(withIdentifier: "NewView") as! NewView
//            myImage.selectedImage = self.images[indexPath.row]
//       self.present(myImage, animated: true, completion: nil)
            
        }
        
        return Cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 180, height: 160.0)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10.0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 20.0
//    }
}


class ImageTapGesture: UITapGestureRecognizer {
    var imageIndex : Int?
}

//DispatchQueue.main.async {
//    Cell.image.image = UIImage(data: data)
//}

