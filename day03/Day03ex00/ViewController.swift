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
  
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
    
            self.navigationItem.title = "Images"
        }

    @IBAction func imageTapped(_ sender: ImageTapGesture) {
        print("hello2")
        let myImage:NewView = self.storyboard?.instantiateViewController(withIdentifier: "NewView") as! NewView
        myImage.selectedImage = images[sender.imageIndex!]
        self.present(myImage, animated: true, completion: nil)
    }
    
    func createALert () {
        let alert = UIAlertController(title: "ERROR", message: "Cannot access to https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/demo-1.jpg", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as! CollectionViewCell
        Cell.activityIndicator.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
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
        }
        return Cell
    }
}

class ImageTapGesture: UITapGestureRecognizer {
    var imageIndex : Int?
}
