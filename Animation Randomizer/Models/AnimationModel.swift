//
//  AnimationModel.swift
//  Animation Randomizer
//
//  Created by Alexander Grishin on 31.10.2022.
//

struct Animation {
    let animationType: String
    let curveType: String
    
    static func getAnimation() -> [Animation] {
        var animationsList: [Animation] = []

        let animations = AnimationsForm.shared.animations
        let curves = AnimationsForm.shared.curves
        let iterationCount = min(animations.count, curves.count)

        for index in 0..<iterationCount {
            let animation = Animation(
                animationType: animations[index],
                curveType: curves[index]
            )
            animationsList.append(animation)
        }
        
        return animationsList
        
    }
}
