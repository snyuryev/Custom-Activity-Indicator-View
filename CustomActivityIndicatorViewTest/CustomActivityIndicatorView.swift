//
//  CustomActivityIndicatorView.swift
//  kurs
//
//  Created by Sergey Yuryev on 22/01/15.
//  Copyright (c) 2015 syuryev. All rights reserved.
//

import UIKit
import QuartzCore

class CustomActivityIndicatorView: UIView {
  
  // MARK - Variables
  
  lazy private var animationLayer : CALayer = {
    return CALayer()
  }()
  
  var isAnimating : Bool = false
  var hidesWhenStopped : Bool = true
  
  // MARK - Init
  
  init(image : UIImage) {
    let frame : CGRect = CGRect(x: 0.0, y: 0.0, width: image.size.width, height: image.size.height)
    
    super.init(frame: frame)
    
    animationLayer.frame = frame
    animationLayer.contents = image.cgImage
    animationLayer.masksToBounds = true
    
    self.layer.addSublayer(animationLayer)
    
    addRotation(forLayer: animationLayer)
    pause(layer: animationLayer)
    self.isHidden = true
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK - Func
  
  func addRotation(forLayer layer : CALayer) {
    let rotation : CABasicAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
    
    rotation.duration = 1.0
    rotation.isRemovedOnCompletion = false
    rotation.repeatCount = HUGE
    rotation.fillMode = kCAFillModeForwards
    rotation.fromValue = NSNumber(value: 0.0)
    rotation.toValue = NSNumber(value: 3.14 * 2.0)
    
    layer.add(rotation, forKey: "rotate")
  }
  
  func pause(layer : CALayer) {
    let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
    
    layer.speed = 0.0
    layer.timeOffset = pausedTime
    
    isAnimating = false
  }
  
  func resume(layer : CALayer) {
    let pausedTime : CFTimeInterval = layer.timeOffset
    
    layer.speed = 1.0
    layer.timeOffset = 0.0
    layer.beginTime = 0.0
    
    let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
    layer.beginTime = timeSincePause
    
    isAnimating = true
  }
  
  func startAnimating () {
    
    if isAnimating {
      return
    }
    
    if hidesWhenStopped {
      self.isHidden = false
    }
    resume(layer: animationLayer)
  }
  
  func stopAnimating () {
    if hidesWhenStopped {
      self.isHidden = true
    }
    pause(layer: animationLayer)
  }
}

