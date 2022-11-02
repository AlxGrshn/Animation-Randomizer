//
//  ViewController.swift
//  Animation Randomizer
//
//  Created by Alexander Grishin on 31.10.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var animatedView: SpringButton!
    @IBOutlet var runButtonLabel: SpringButton!
    
    // MARK: - Private properties
    private let animation = Animation.getAnimation()
    
    private var generatedAnimation = ""
    private var generatedCurve = ""
    
    private var generatedForce: CGFloat = 0
    private var generatedDuration: CGFloat = 0
    private var generatedDelay: CGFloat = 0
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generateValues()
        updateLabels()
        presetLabel.text = "preset: \(generatedAnimation)"
    }
    
    // MARK: - IBActions
    @IBAction func runAnimationButton(_ sender: SpringButton) {
        getAnimate()
        updateLabels()
        presetLabel.text = "preset: \(animatedView.animation)"
        runButtonLabel.setTitle("Run \(generatedAnimation)", for: .normal)
    }
    
    // MARK: - Private methods
    private func updateLabels() {
        curveLabel.text = "curve: \(generatedCurve)"
        
        forceLabel.text = String(format: "force:  %.1f\n", generatedForce)
        durationLabel.text = String(format: "duration:  %.1f\n", generatedDuration)
        delayLabel.text = String(format: "delay:  %.1f\n", generatedDelay)
    }
    
    private func generateValues() {
        generatedAnimation = animation.randomElement()?.animationType ?? ""
        generatedCurve = animation.randomElement()?.curveType ?? ""
        
        generatedForce = CGFloat.random(in: 1...2)
        generatedDuration = CGFloat.random(in: 0.5...2)
        generatedDelay = CGFloat.random(in: 0...0.3)
    }
    
    private func updateAnimatedView() {
        generateValues()
        
        animatedView.curve = generatedCurve
        animatedView.force =  generatedForce
        animatedView.duration = generatedDuration
        animatedView.delay = generatedDelay
    }
    
    private func getAnimate() {
        animatedView.animation = generatedAnimation
        updateAnimatedView()
        animatedView.animate()
    }
}


