//
//  ViewController.swift
//  Animation Randomizer
//
//  Created by Alexander Grishin on 31.10.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var animatedView: SpringButton!
    @IBOutlet var runButtonLabel: SpringButton!
    
    private let animation = Animation.getAnimation()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    @IBAction func runAnimationButton(_ sender: SpringButton) {
        animatedView.animation = animation.randomElement()?.animationType ?? ""
        animatedView.curve = animation.randomElement()?.curveType ?? ""
        
        animatedView.force = CGFloat.random(in: 1...2)
        animatedView.duration = CGFloat.random(in: 0.5...2)
        animatedView.delay = CGFloat.random(in: 0...0.3)
        
        animatedView.animate()
        updateLabels()
        updateButtonLabel()
    }
    
    private func updateLabels() {
        presetLabel.text = "preset: \(animatedView.animation)"
        curveLabel.text = "curve: \(animatedView.curve)"
        
        forceLabel.text = String(format: "force:  %.1f\n", animatedView.force)
        durationLabel.text = String(format: "duration:  %.1f\n", animatedView.duration)
        delayLabel.text = String(format: "delay:  %.1f\n", animatedView.delay)
    }
    
    private func updateButtonLabel() {
        runButtonLabel.setTitle("Run \(presetLabel.text ?? "")", for: .normal)
    }
 
    
}

