//
//  MyPlantsViewController.swift
//  TabBarSample
//
//  Created by Franklin S D'souza on 31/03/18.
//  Copyright © 2018 Zeeyad. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    @IBInspectable
    public var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor = UIColor.black {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}

class ImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}

class MyPlantsViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var nextWateringInfoView: UIStackView!
    @IBOutlet weak var waterDropView: UIView!
    @IBOutlet weak var plantsInfoStackView: UIStackView!
    @IBOutlet weak var wateringInfoStackView: UIStackView!
    
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var wateringPlantInfoStackView: UIStackView!
    
    var shapeLayer = CAShapeLayer()
    var wateringPlantInfoStackViewHidden = false
    
    @IBAction func buttonTapped(_ sender: UIButton) {

        self.plantsInfoStackView.alpha = 0.0
        self.wateringInfoStackView.alpha = 0.0
        
        
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
            self.wateringPlantInfoStackView.isHidden = !self.wateringPlantInfoStackViewHidden
        }) { (finished) in
            UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
                self.wateringInfoStackView.alpha = 1.0
            }) { (finished) in
                UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
                    self.plantsInfoStackView.alpha = 1.0
                    self.wateringPlantInfoStackViewHidden = !self.wateringPlantInfoStackViewHidden
                }, completion: nil)
            }
        }
        
//        UIView.animate(withDuration: 1.0, animations: {
//
//        }) { (finished) in
//            self.wateringInfoStackView.alpha = 1.0
//            UIView.animate(withDuration: 1.0, animations: {
//                self.plantsInfoStackView.alpha = 1.0
//            })
//
//        }
    }
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        self.plantsInfoStackView.alpha = 0.0
        self.wateringInfoStackView.alpha = 0.0
        
        
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
            self.wateringPlantInfoStackView.isHidden = !self.wateringPlantInfoStackViewHidden
        }) { (finished) in
            UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
                self.wateringInfoStackView.alpha = 1.0
            }) { (finished) in
                UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
                    self.plantsInfoStackView.alpha = 1.0
                    self.wateringPlantInfoStackViewHidden = !self.wateringPlantInfoStackViewHidden
                }, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wateringPlantInfoStackViewHidden = wateringPlantInfoStackView.isHidden
        // shapeLayer.path = ringPath.CGPath
       /*
        
//        let path = UIBezierPath()
//        path.move(to: CGPoint.zero)
//        path.addQuadCurve(to: CGPoint(x: 100, y: 0), controlPoint: CGPoint(x: 50, y: 200))
//        path.addLine(to: CGPoint(x: 99, y: 0))
//        path.addQuadCurve(to: CGPoint(x: 1, y: 0), controlPoint: CGPoint(x: 50, y: 198))
        
//        path.moveToPoint(CGPointZero)
//        path.addQuadCurveToPoint(CGPoint(x: 100, y: 0), controlPoint: CGPoint(x: 50, y: 200))
        
//        let center = CGPoint(x: waterDropView.frame.width / 2, y: waterDropView.frame.width / 2)
        let center = CGPoint(x: waterDropView.frame.width / 2, y: waterDropView.frame.height / 4)
        let bezierPath = UIBezierPath()
        /* draw code goes here*/
        bezierPath.move(to: center)
        bezierPath.addLine(to: CGPoint(x: center.x + waterDropView.frame.size.width / 5, y: center.y + waterDropView.frame.size.height / 4))
        bezierPath.addQuadCurve(to: <#T##CGPoint#>, controlPoint: <#T##CGPoint#>)
//        bezierPath.addLine(to: CGPoint(x: water, y: <#T##CGFloat#>))
        
//        bezierPath.addArc(withCenter: center, radius: 25, startAngle: 0, endAngle: CGFloat( 2 * Double.pi ), clockwise: true)
        /* assign a path to CAShapeLayer */
        shapeLayer.path = bezierPath.cgPath
        
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.lineCap = kCALineCapRound
        */
        
    }

    @IBAction func waterDropViewTapped(_ sender: UIButton) {
       /*
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        /* set up animation */
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 2.5
        animation.fillMode = kCAFillModeForwards
        shapeLayer.add(animation, forKey: "drawLineAnimation")
        
        waterDropView.layer.addSublayer(shapeLayer)
        */

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyPlantsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
        cell.imageView.image = UIImage(named: "plant\(indexPath.row+1)")
        return cell
    }
}
