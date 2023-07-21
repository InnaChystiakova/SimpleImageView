//
//  ViewController.swift
//  SimpleImageView
//
//  Created by Инна Чистякова on 20.07.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: Properties, constants
    
    let imageHeight: CGFloat = 270
    let imageView = UIImageView(image: UIImage(named: "Gandalph.jpg"))
    let scrollView = UIScrollView(frame: .zero)
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupImageView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: imageHeight)
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + imageHeight)
    }
    
    // MARK: Setup
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        scrollView.addSubview(imageView)
    }
    
    func setupScrollView() {
        scrollView.delegate = self
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(scrollView)
    }
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let isScroolDown = offsetY < 0
        
        imageView.frame.origin.y = isScroolDown ? offsetY : 0
        imageView.frame.size.height = isScroolDown ? imageHeight - offsetY : imageHeight
        scrollView.verticalScrollIndicatorInsets.top = isScroolDown ? imageHeight - offsetY : imageHeight
    }
}

