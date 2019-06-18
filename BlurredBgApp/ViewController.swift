//
//  ViewController.swift
//  BlurredBgApp
//
//  Created by Guilherme Rambo on 13/06/19.
//  Copyright © 2019 Guilherme Rambo. All rights reserved.
//

import UIKit

extension UIBlurEffect.Style {
    private static var effectAndName: [UIBlurEffect.Style: String] {[
        .systemUltraThinMaterial: "systemUltraThinMaterial",
        .systemThinMaterial: "systemThinMaterial",
        .systemMaterial: "systemMaterial",
        .systemThickMaterial: "systemThickMaterial",
        .systemChromeMaterial: "systemChromeMaterial"
        ]}
    static var effects: [UIBlurEffect.Style] { Array(UIBlurEffect.Style.effectAndName.keys) }
    var name: String { UIBlurEffect.Style.effectAndName[self, default: "unknown"] }
}

class ViewController: UIViewController {

    private var effects = UIBlurEffect.Style.effects

    private var currentEffectIndex = -1

    private lazy var currentEffect = effects[currentEffectIndex]

    private lazy var blurView: UIVisualEffectView = {
        let v = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))

        v.frame = view.bounds
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        return v
    }()

    private lazy var vibrancyView: UIVisualEffectView = {
        let v = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))

        v.frame = view.bounds
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        return v
    }()

    private lazy var label: UILabel = {
        let l = UILabel()

        l.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        l.textColor = .secondaryLabel
        l.text = "This app is translucent and it shows your wallpaper as its background."
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false

        return l
    }()

    private lazy var effectNameLabel: UILabel = {
        let l = UILabel()

        l.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        l.textColor = .tertiaryLabel
        l.text = ""
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false

        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.isOpaque = false
        view.backgroundColor = .clear

        view.addSubview(blurView)
        blurView.contentView.addSubview(vibrancyView)

        vibrancyView.contentView.addSubview(label)
        vibrancyView.contentView.addSubview(effectNameLabel)

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            effectNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            effectNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            effectNameLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16)
        ])

        let tap = UITapGestureRecognizer(target: self, action: #selector(cycleEffects))
        view.addGestureRecognizer(tap)

        cycleEffects()
    }

    @objc private func cycleEffects() {
        if currentEffectIndex >= effects.count - 1 {
            currentEffectIndex = 0
        } else {
            currentEffectIndex += 1
        }

        currentEffect = effects[currentEffectIndex]
        let blur = UIBlurEffect(style: currentEffect)

        blurView.effect = blur
        vibrancyView.effect = UIVibrancyEffect(blurEffect: blur)

        effectNameLabel.text = currentEffect.name + " (tap to change)"
    }


}

