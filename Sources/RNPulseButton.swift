//
//  RNPulseButton.swift
//  RNPulseButton
//
//  Created by byung-soo kwon on 2017. 12. 29..
//  Copyright © 2017년 Ryan. All rights reserved.
//

import UIKit

open class RNPulseButton: UIControl {
    fileprivate let buttonImageLayer = CALayer()
    fileprivate var pulseLayers: [CALayer] = []
    
    @IBInspectable open var pulseRadius: Double = 50 {
        didSet {
            updateRadius()
        }
    }
    @IBInspectable open var pulseCount: Int = 2 {
        didSet {
            updateCount()
        }
    }
    @IBInspectable open var pulseDuration: Double = 2 {
        didSet {
            updateAnimation()
        }
    }
    @IBInspectable open var intervalTime: Double = 0.4 {
        didSet {
            updateAnimation()
        }
    }
    @IBInspectable open var scaleFactor: CGFloat = 2.24 {
        didSet {
            updateAnimation()
        }
    }
    @IBInspectable open var repeatCount: Int = 100 {
        didSet {
            updateAnimation()
        }
    }
    @IBInspectable open var pulseColor: UIColor = UIColor.gray {
        didSet {
            updateColor()
        }
    }
    @IBInspectable open var normalImage: UIImage? {
        didSet {
            buttonImageLayer.frame.size = CGSize(width: pulseRadius, height: pulseRadius)
            buttonImageLayer.contents = normalImage?.cgImage
        }
    }
    @IBInspectable open var selectedImage: UIImage? {
        didSet {
            buttonImageLayer.frame.size = CGSize(width: pulseRadius, height: pulseRadius)
            buttonImageLayer.contents = selectedImage?.cgImage
        }
    }
    convenience public init(frame: CGRect,pulseRadius: Double, pulseCount: Int, pulseDuration: Double, intervalTime: Double, scaleFactor: CGFloat, repeatCount: Int, pulseColor: UIColor, normalImage: UIImage?, selectedImage: UIImage?) {
        self.init(frame: frame)
        self.pulseRadius = pulseRadius
        self.pulseCount = pulseCount
        self.pulseDuration = pulseDuration
        self.intervalTime = intervalTime
        self.scaleFactor = scaleFactor
        self.repeatCount = repeatCount
        self.pulseColor = pulseColor
        self.normalImage = normalImage
        self.selectedImage = selectedImage
        updateColor()
        updateCount()
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = true
        initPulseLayer()
        initImageLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = true
        initPulseLayer()
        initImageLayer()
    }
    
    open func start() {
        buttonImageLayer.contents = normalImage?.cgImage
        
        for layer in pulseLayers {
            guard let index = pulseLayers.firstIndex(of: layer) else { return }
            let multiplier = Double(index)
            let pulseAnimation = CABasicAnimation().makeAnimation(keyPath: "transform.scale", duration: pulseDuration, from: 0, to: scaleFactor, beginTime: intervalTime * multiplier, timing: convertFromCAMediaTimingFunctionName(CAMediaTimingFunctionName.default), repeatCount: Float(repeatCount))
            let opacityAnimation = CABasicAnimation().makeAnimation(keyPath: "opacity", duration: pulseDuration, from: 1, to: 0, beginTime: intervalTime * multiplier, timing: convertFromCAMediaTimingFunctionName(CAMediaTimingFunctionName.default), repeatCount: Float(repeatCount))
            layer.add(pulseAnimation, forKey: "transform.scale")
            layer.add(opacityAnimation, forKey: "opacity")
        }
        self.layer.insertSublayer(buttonImageLayer, at: UInt32(pulseLayers.count + 1))
    }
    
    open func stop() {
        for layer in pulseLayers {
            layer.removeAllAnimations()
        }
        buttonImageLayer.contents = selectedImage?.cgImage
    }
    
    //MARK: Private Functions
    
    fileprivate func updateRadius() {
        for layer in pulseLayers {
            layer.frame.origin = CGPoint.zero
            layer.frame.size = CGSize(width: pulseRadius, height: pulseRadius)
            layer.cornerRadius = CGFloat(pulseRadius) / 2
        }
        buttonImageLayer.frame.size = CGSize(width: pulseRadius, height: pulseRadius)
    }
    
    fileprivate func updateCount() {
        for layer in pulseLayers {
            layer.removeFromSuperlayer()
        }
        pulseLayers.removeAll()
        initPulseLayer()
        start()
    }
    
    fileprivate func updateColor() {
        for layer in pulseLayers {
            layer.backgroundColor = pulseColor.cgColor
        }
    }
    
    fileprivate func updateAnimation() {
        stop()
        start()
    }
    
    fileprivate func initImageLayer() {
        buttonImageLayer.contents = normalImage?.cgImage
        buttonImageLayer.frame.origin = CGPoint.zero
        buttonImageLayer.frame.size = CGSize(width: pulseRadius, height: pulseRadius)
        buttonImageLayer.shadowOffset = CGSize(width: 0, height: 4)
        buttonImageLayer.shadowColor = UIColor(red: 29 / 255, green: 37 / 255, blue: 51 / 255, alpha: 1).cgColor
        buttonImageLayer.shadowRadius = 10
        buttonImageLayer.shadowOpacity = 0.08
        buttonImageLayer.opacity = 1
        self.layer.addSublayer(buttonImageLayer)
    }
    
    fileprivate func initPulseLayer() {
        for _ in 0..<pulseCount {
            let layer = CALayer()
            layer.frame.origin = CGPoint.zero
            layer.frame.size = CGSize(width: pulseRadius, height: pulseRadius)
            layer.cornerRadius = CGFloat(pulseRadius / 2)
            layer.backgroundColor = pulseColor.cgColor
            layer.opacity = 0
            pulseLayers.append(layer)
            self.layer.addSublayer(layer)
        }
    }
}

public extension CABasicAnimation {
    func makeAnimation(keyPath: String?, duration: Double, from: CGFloat, to: CGFloat, beginTime: Double, timing: String?, repeatCount: Float) -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = keyPath
        animation.duration = duration
        animation.fromValue = from
        animation.toValue = to
        animation.timingFunction = CAMediaTimingFunction(name: convertToCAMediaTimingFunctionName(timing ?? convertFromCAMediaTimingFunctionName(CAMediaTimingFunctionName.default)))
        animation.repeatCount = repeatCount
        animation.beginTime = CACurrentMediaTime() + beginTime
        return animation
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromCAMediaTimingFunctionName(_ input: CAMediaTimingFunctionName) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToCAMediaTimingFunctionName(_ input: String) -> CAMediaTimingFunctionName {
	return CAMediaTimingFunctionName(rawValue: input)
}
