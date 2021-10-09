//
//  ModalView.swift
//  inVestCost
//
//  Created by Ivan Kopiev on 09.10.2021.
//


import UIKit
import Lottie
struct ModalViewConfigurator {
    let action: (()->Void)?
    let title: String
    let text: String
    let subText: String
    let buttonText: String
    let image: UIImage?
}

class ModalView: UIView {
    //MARK: - Properties
    static let alert = ModalView()
    
    private var buttonAction: (()->Void)?
    
    private let formView: UIView = {
        let view = UIView()
        view.backgroundColor = Theme.Colors.primaryBackground
        view.layer.cornerRadius = 20
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        let reconizer = UITapGestureRecognizer(target: self, action: #selector(doNotDoAnything))
        view.addGestureRecognizer(reconizer)
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Theme.Colors.textColor
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.text = "Заходи каждый день и получай еще баллы"
        return label
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.Colors.textColor
        label.text = "+100 БАЛЛОВ"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    private let subTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = Theme.Colors.textColor
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "* бонус можно получить не более 10 раз"
        label.sizeToFit()
        return label
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.backgroundColor = Theme.Colors.buttonBackground
        button.setTitle("Ясно-понятно...", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.darkGray, for: .highlighted)
        return button
    }()
    
    private let formImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "cnt_tornado_grey"))
        iv.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let blobImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "cnt_splat"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    private let iconImageView: AnimationView = {
        let iv = AnimationView()
        iv.animation = Animation.named("yeah")
        iv.animationSpeed = 2
        iv.loopMode = .autoReverse
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var formCenterYConstraint = NSLayoutConstraint()
    
    // MARK: - Lifecycle
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
   public func present() {
        guard let window = UIApplication.shared.windows.first else {return}
        window.addSubview(self)
        window.bringSubviewToFront(self)
        self.alpha = 0
        self.frame = UIScreen.main.bounds
        showModal()
        UIView.animate(withDuration: 0.8) {self.alpha = 1}
        iconImageView.play()

    }
    
   public func show(with configuration: ModalViewConfigurator) {
//        iconImageView.image = configuration.image
        actionButton.setTitle(configuration.buttonText, for: .normal)
        textLabel.text = configuration.text
        subTextLabel.text = configuration.subText
        titleLabel.text = configuration.title
        buttonAction = configuration.action
        present()
    }
    
    
    private func setUp() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        addGestureRecognizer(tapGesture)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(formView)
        formView.addSubview(formImageView)
        formView.addSubview(iconImageView)
        formView.addSubview(titleLabel)
        formView.addSubview(textLabel)
        formView.addSubview(blobImageView)
        formView.addSubview(subTextLabel)
        addSubview(actionButton)
        createConstraints()
        actionButton.addTarget(self, action: #selector(didTouch(sender:)), for: .touchDown)
        actionButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        actionButton.addTarget(self, action: #selector(animateViewOut(_:)), for: .touchUpInside)
        actionButton.addTarget(self, action: #selector(animateViewOut(_:)), for: .touchCancel)
        actionButton.addTarget(self, action: #selector(animateViewOut(_:)), for: .touchDragOutside)
    }
    
    private func createConstraints() {
        formCenterYConstraint = formView.centerYAnchor.constraint(equalTo: centerYAnchor)
        formCenterYConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            
            formImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.536),
            formImageView.heightAnchor.constraint(equalTo: formImageView.widthAnchor, multiplier: 1.09),
            formImageView.centerYAnchor.constraint(equalTo: formView.topAnchor),
            formImageView.centerXAnchor.constraint(equalTo: formView.centerXAnchor),
            
            iconImageView.centerXAnchor.constraint(equalTo: formImageView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: formImageView.centerYAnchor, constant: -15),
            iconImageView.widthAnchor.constraint(equalTo: formImageView.widthAnchor, multiplier: 1),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: formImageView.bottomAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalTo: formView.widthAnchor, multiplier: 0.7),
            titleLabel.centerXAnchor.constraint(equalTo: formView.centerXAnchor),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            textLabel.widthAnchor.constraint(equalTo: formView.widthAnchor, multiplier: 0.7),
            textLabel.centerXAnchor.constraint(equalTo: formView.centerXAnchor),
            
            subTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 18),
            subTextLabel.widthAnchor.constraint(equalTo: formView.widthAnchor, multiplier: 0.7),
            subTextLabel.centerXAnchor.constraint(equalTo: formView.centerXAnchor),
            
            actionButton.topAnchor.constraint(equalTo: subTextLabel.bottomAnchor, constant: 18),
            actionButton.widthAnchor.constraint(equalTo: formView.widthAnchor, multiplier: 0.93),
            actionButton.heightAnchor.constraint(equalTo: actionButton.widthAnchor, multiplier: 0.2),
            actionButton.centerXAnchor.constraint(equalTo: formView.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: formView.bottomAnchor),
            
            blobImageView.centerYAnchor.constraint(equalTo: actionButton.centerYAnchor, constant: 15),
            blobImageView.centerXAnchor.constraint(equalTo: actionButton.centerXAnchor),
            blobImageView.widthAnchor.constraint(equalTo: actionButton.widthAnchor, multiplier: 0.283),
            blobImageView.heightAnchor.constraint(equalTo: blobImageView.widthAnchor, multiplier: 1.76),
            
            formView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            formView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
    
    private func showModal() {
        formCenterYConstraint.isActive = false
        formCenterYConstraint = formView.centerYAnchor.constraint(equalTo: centerYAnchor)
        formCenterYConstraint.isActive = true
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {self.layoutIfNeeded()}
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        actionButton.dropShadow()
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
            self.formImageView.transform = .identity
        }
        formImageView.rotate(duration: 4)
        formImageView.scale(duration: 4, scale: 0.86)
        iconImageView.scale(duration: 1.5)
    }
    
    // MARK: - Selectors
    @objc private func didTouch(sender: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.blobImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    @objc private func animateViewOut(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .curveEaseIn) {
            viewToAnimate.transform = .identity
            self.blobImageView.transform = .identity
        }
    }
    
    @objc private func dismiss() {
        formCenterYConstraint.isActive = false
        formCenterYConstraint = formView.topAnchor.constraint(equalTo: bottomAnchor, constant: frame.maxY + 200)
        formCenterYConstraint.isActive = true
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {self.layoutIfNeeded()} completion: { isComleted in
            if isComleted {
                self.removeFromSuperview()
            }
        }
    }
    @objc private func doNotDoAnything() {}
    
    @objc private func didTapButton() {
        buttonAction?()
        dismiss()
    }
}

//MARK: - Extension UIView
extension UIView {
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 4
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 30).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    private static let kRotationAnimationKey = "rotationanimationkey"
    private static let kScaleAnimationKey = "scaleanimationkey"
    
    func rotate(duration: Double = 1) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = .infinity
            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }
    
    func scale(duration: Double = 1, scale: Double = 0.8) {
        if layer.animation(forKey: UIView.kScaleAnimationKey) == nil {
            let scaleAnimationkey = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimationkey.fromValue = 1.0
            scaleAnimationkey.toValue = scale
            scaleAnimationkey.duration = duration
            scaleAnimationkey.repeatCount = .infinity
            scaleAnimationkey.autoreverses = true
            layer.add(scaleAnimationkey, forKey: UIView.kScaleAnimationKey)
        }
    }
    
    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }
    
    
}
