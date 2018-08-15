//
//  ViewController.swift
//  CustomActivityIndicatorViewTest
//
//  Created by Sergey Yuryev on 23/01/15.
//  Copyright (c) 2015 syuryev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  lazy private var activityIndicator : CustomActivityIndicatorView = {
    let image : UIImage = UIImage(named: "loading")!
    return CustomActivityIndicatorView(image: image)
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    addLoadingIndicator()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func addLoadingIndicator () {
    self.view.addSubview(activityIndicator)
    activityIndicator.center = self.view.center
  }
  @IBAction func showLoadingIndicator(_ sender: UIButton) {
    activityIndicator.startAnimating()
  }
  
  
  @IBAction func hideLoadingIndicator(_ sender: UIButton) {
    activityIndicator.stopAnimating()
  }
  
}

