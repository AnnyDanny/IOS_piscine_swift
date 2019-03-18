//
//  NewView.swift
//  Day03ex00
//
//  Created by Ganna DANYLOVA on 3/15/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class NewView: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var selectedImage: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedImage != nil {
            if let imagedata = try? Data(contentsOf: self.selectedImage!){
                self.imageView.image = UIImage(data: imagedata)
                imageView.sizeToFit()
                scrollView?.contentSize = imageView.frame.size
//                scrollView.contentOffset = CGPoint(x: 0, y: imageView.image!.size.height)
            }
            scrollView.addSubview(imageView)
        }
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
        view.addSubview(scrollView)
        scrollView.delegate = self
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @IBAction func handlePitchTap(_ sender: UIPinchGestureRecognizer) {
        if imageView != nil {
            imageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        }
    }
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        if let imagedata = try? Data(contentsOf: self.selectedImage!){
//            self.imageView.image = UIImage(data: imagedata)
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
