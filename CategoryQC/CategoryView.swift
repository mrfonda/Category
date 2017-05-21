//
//  CategoryView.swift
//
//  Code generated using QuartzCode 1.50.0 on 21/05/2017.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class CategoryView: UIView, CAAnimationDelegate {
	
	var layers : Dictionary<String, AnyObject> = [:]
	var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
	var updateLayerValueForCompletedAnimation : Bool = true
	
	var categoryTintColor : UIColor!
	
	//MARK: - Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupProperties()
		setupLayers()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setupProperties()
		setupLayers()
	}
	
	override var frame: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	override var bounds: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	func setupProperties(){
		self.categoryTintColor = UIColor.black
	}
	
	func setupLayers(){
		self.backgroundColor = UIColor(red:0, green: 0, blue:0, alpha:0)
		
		let Group = CALayer()
		self.layer.addSublayer(Group)
		layers["Group"] = Group
		let uL = CAShapeLayer()
		Group.addSublayer(uL)
		layers["uL"] = uL
		let uR = CAShapeLayer()
		Group.addSublayer(uR)
		layers["uR"] = uR
		let dR = CAShapeLayer()
		Group.addSublayer(dR)
		layers["dR"] = dR
		let dL = CAShapeLayer()
		Group.addSublayer(dL)
		layers["dL"] = dL
		
		resetLayerProperties(forLayerIdentifiers: nil)
		setupLayerFrames()
	}
	
	func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("uL"){
			let uL = layers["uL"] as! CAShapeLayer
			uL.fillColor   = self.categoryTintColor.cgColor
			uL.strokeColor = UIColor(red:0.498, green: 0.498, blue:0.498, alpha:0).cgColor
			uL.strokeEnd   = 0.99
		}
		if layerIds == nil || layerIds.contains("uR"){
			let uR = layers["uR"] as! CAShapeLayer
			uR.fillColor   = self.categoryTintColor.cgColor
			uR.strokeColor = UIColor(red:0.498, green: 0.498, blue:0.498, alpha:0).cgColor
			uR.strokeEnd   = 0.99
		}
		if layerIds == nil || layerIds.contains("dR"){
			let dR = layers["dR"] as! CAShapeLayer
			dR.fillColor   = self.categoryTintColor.cgColor
			dR.strokeColor = UIColor(red:0.498, green: 0.498, blue:0.498, alpha:0).cgColor
			dR.strokeEnd   = 0.99
		}
		if layerIds == nil || layerIds.contains("dL"){
			let dL = layers["dL"] as! CAShapeLayer
			dL.fillColor     = self.categoryTintColor.cgColor
			dL.strokeColor   = UIColor(red:0.498, green: 0.498, blue:0.498, alpha:0).cgColor
			dL.strokeEnd     = 0.99
			dL.lineDashPhase = 1
		}
		
		CATransaction.commit()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let Group : CALayer = layers["Group"] as? CALayer{
			Group.frame = CGRect(x: 0.1 * Group.superlayer!.bounds.width, y: 0.1 * Group.superlayer!.bounds.height, width: 0.8 * Group.superlayer!.bounds.width, height: 0.8 * Group.superlayer!.bounds.height)
		}
		
		if let uL : CAShapeLayer = layers["uL"] as? CAShapeLayer{
			uL.frame = CGRect(x: 0, y: 0, width: 0.375 * uL.superlayer!.bounds.width, height: 0.0625 * uL.superlayer!.bounds.height)
			uL.path  = uLPath(bounds: (layers["uL"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let uR : CAShapeLayer = layers["uR"] as? CAShapeLayer{
			uR.frame = CGRect(x: 0.625 * uR.superlayer!.bounds.width, y: 0, width: 0.375 * uR.superlayer!.bounds.width, height: 0.0625 * uR.superlayer!.bounds.height)
			uR.path  = uRPath(bounds: (layers["uR"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let dR : CAShapeLayer = layers["dR"] as? CAShapeLayer{
			dR.frame = CGRect(x: 0.625 * dR.superlayer!.bounds.width, y: 0.9375 * dR.superlayer!.bounds.height, width: 0.375 * dR.superlayer!.bounds.width, height: 0.0625 * dR.superlayer!.bounds.height)
			dR.path  = dRPath(bounds: (layers["dR"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let dL : CAShapeLayer = layers["dL"] as? CAShapeLayer{
			dL.frame = CGRect(x: 0, y: 0.9375 * dL.superlayer!.bounds.height, width: 0.375 * dL.superlayer!.bounds.width, height: 0.0625 * dL.superlayer!.bounds.height)
			dL.path  = dLPath(bounds: (layers["dL"] as! CAShapeLayer).bounds).cgPath
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addCategoryToLeftArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("categoryToLeftArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"categoryToLeftArrow")
			if let anim = layer.animation(forKey: "categoryToLeftArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		GroupTransformAnim.values   = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		GroupTransformAnim.keyTimes = [0, 1]
		GroupTransformAnim.duration = 0.996 * totalDuration
		
		var GroupCategoryToLeftArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupCategoryToLeftArrowAnim = QCMethod.reverseAnimation(anim: GroupCategoryToLeftArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupCategoryToLeftArrowAnim, forKey:"GroupCategoryToLeftArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.1875 * uL.superlayer!.bounds.width, y: 0.03125 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		uLTransformAnim.values         = [0, 
			 -45 * CGFloat(M_PI/180)]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLCategoryToLeftArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLCategoryToLeftArrowAnim = QCMethod.reverseAnimation(anim: uLCategoryToLeftArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLCategoryToLeftArrowAnim, forKey:"uLCategoryToLeftArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.8125 * uR.superlayer!.bounds.width, y: 0.03125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		uRTransformAnim.values         = [0, 
			 -45 * CGFloat(M_PI/180)]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRCategoryToLeftArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRCategoryToLeftArrowAnim = QCMethod.reverseAnimation(anim: uRCategoryToLeftArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRCategoryToLeftArrowAnim, forKey:"uRCategoryToLeftArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.8125 * dR.superlayer!.bounds.width, y: 0.96875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		dRTransformAnim.values         = [0, 
			 45 * CGFloat(M_PI/180)]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRCategoryToLeftArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRCategoryToLeftArrowAnim = QCMethod.reverseAnimation(anim: dRCategoryToLeftArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRCategoryToLeftArrowAnim, forKey:"dRCategoryToLeftArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.1875 * dL.superlayer!.bounds.width, y: 0.96875 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		dLTransformAnim.values   = [0, 
			 45 * CGFloat(M_PI/180)]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLCategoryToLeftArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLCategoryToLeftArrowAnim = QCMethod.reverseAnimation(anim: dLCategoryToLeftArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLCategoryToLeftArrowAnim, forKey:"dLCategoryToLeftArrowAnim")
	}
	
	func addLeftArrowToDownArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("leftArrowToDownArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"leftArrowToDownArrow")
			if let anim = layer.animation(forKey: "leftArrowToDownArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		GroupTransformAnim.values         = [0, 
			 -90 * CGFloat(M_PI/180)]
		GroupTransformAnim.keyTimes       = [0, 1]
		GroupTransformAnim.duration       = 0.996 * totalDuration
		GroupTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var GroupLeftArrowToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupLeftArrowToDownArrowAnim = QCMethod.reverseAnimation(anim: GroupLeftArrowToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupLeftArrowToDownArrowAnim, forKey:"GroupLeftArrowToDownArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLLeftArrowToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLLeftArrowToDownArrowAnim = QCMethod.reverseAnimation(anim: uLLeftArrowToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLLeftArrowToDownArrowAnim, forKey:"uLLeftArrowToDownArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRLeftArrowToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRLeftArrowToDownArrowAnim = QCMethod.reverseAnimation(anim: uRLeftArrowToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRLeftArrowToDownArrowAnim, forKey:"uRLeftArrowToDownArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRLeftArrowToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRLeftArrowToDownArrowAnim = QCMethod.reverseAnimation(anim: dRLeftArrowToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRLeftArrowToDownArrowAnim, forKey:"dRLeftArrowToDownArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLLeftArrowToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLLeftArrowToDownArrowAnim = QCMethod.reverseAnimation(anim: dLLeftArrowToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLLeftArrowToDownArrowAnim, forKey:"dLLeftArrowToDownArrowAnim")
	}
	
	func addDownArrowToRightArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("downArrowToRightArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"downArrowToRightArrow")
			if let anim = layer.animation(forKey: "downArrowToRightArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		GroupTransformAnim.values         = [-90 * CGFloat(M_PI/180), 
			 -180 * CGFloat(M_PI/180)]
		GroupTransformAnim.keyTimes       = [0, 1]
		GroupTransformAnim.duration       = 0.996 * totalDuration
		GroupTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var GroupDownArrowToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupDownArrowToRightArrowAnim = QCMethod.reverseAnimation(anim: GroupDownArrowToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupDownArrowToRightArrowAnim, forKey:"GroupDownArrowToRightArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLDownArrowToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLDownArrowToRightArrowAnim = QCMethod.reverseAnimation(anim: uLDownArrowToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLDownArrowToRightArrowAnim, forKey:"uLDownArrowToRightArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRDownArrowToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRDownArrowToRightArrowAnim = QCMethod.reverseAnimation(anim: uRDownArrowToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRDownArrowToRightArrowAnim, forKey:"uRDownArrowToRightArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRDownArrowToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRDownArrowToRightArrowAnim = QCMethod.reverseAnimation(anim: dRDownArrowToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRDownArrowToRightArrowAnim, forKey:"dRDownArrowToRightArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLDownArrowToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLDownArrowToRightArrowAnim = QCMethod.reverseAnimation(anim: dLDownArrowToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLDownArrowToRightArrowAnim, forKey:"dLDownArrowToRightArrowAnim")
	}
	
	func addLeftArrowToRightArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("LeftArrowToRightArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"LeftArrowToRightArrow")
			if let anim = layer.animation(forKey: "LeftArrowToRightArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		GroupTransformAnim.values         = [0, 
			 -180 * CGFloat(M_PI/180)]
		GroupTransformAnim.keyTimes       = [0, 1]
		GroupTransformAnim.duration       = 0.996 * totalDuration
		GroupTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var GroupLeftArrowToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupLeftArrowToRightArrowAnim = QCMethod.reverseAnimation(anim: GroupLeftArrowToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupLeftArrowToRightArrowAnim, forKey:"GroupLeftArrowToRightArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLLeftArrowToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLLeftArrowToRightArrowAnim = QCMethod.reverseAnimation(anim: uLLeftArrowToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLLeftArrowToRightArrowAnim, forKey:"uLLeftArrowToRightArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRLeftArrowToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRLeftArrowToRightArrowAnim = QCMethod.reverseAnimation(anim: uRLeftArrowToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRLeftArrowToRightArrowAnim, forKey:"uRLeftArrowToRightArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRLeftArrowToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRLeftArrowToRightArrowAnim = QCMethod.reverseAnimation(anim: dRLeftArrowToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRLeftArrowToRightArrowAnim, forKey:"dRLeftArrowToRightArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLLeftArrowToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLLeftArrowToRightArrowAnim = QCMethod.reverseAnimation(anim: dLLeftArrowToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLLeftArrowToRightArrowAnim, forKey:"dLLeftArrowToRightArrowAnim")
	}
	
	func addLeftArrowToUpArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("leftArrowToUpArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"leftArrowToUpArrow")
			if let anim = layer.animation(forKey: "leftArrowToUpArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		GroupTransformAnim.values         = [0, 
			 90 * CGFloat(M_PI/180)]
		GroupTransformAnim.keyTimes       = [0, 1]
		GroupTransformAnim.duration       = 0.996 * totalDuration
		GroupTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var GroupLeftArrowToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupLeftArrowToUpArrowAnim = QCMethod.reverseAnimation(anim: GroupLeftArrowToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupLeftArrowToUpArrowAnim, forKey:"GroupLeftArrowToUpArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLLeftArrowToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLLeftArrowToUpArrowAnim = QCMethod.reverseAnimation(anim: uLLeftArrowToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLLeftArrowToUpArrowAnim, forKey:"uLLeftArrowToUpArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRLeftArrowToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRLeftArrowToUpArrowAnim = QCMethod.reverseAnimation(anim: uRLeftArrowToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRLeftArrowToUpArrowAnim, forKey:"uRLeftArrowToUpArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRLeftArrowToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRLeftArrowToUpArrowAnim = QCMethod.reverseAnimation(anim: dRLeftArrowToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRLeftArrowToUpArrowAnim, forKey:"dRLeftArrowToUpArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLLeftArrowToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLLeftArrowToUpArrowAnim = QCMethod.reverseAnimation(anim: dLLeftArrowToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLLeftArrowToUpArrowAnim, forKey:"dLLeftArrowToUpArrowAnim")
	}
	
	func addRightArrowToUpArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("rightArrowToUpArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"rightArrowToUpArrow")
			if let anim = layer.animation(forKey: "rightArrowToUpArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		GroupTransformAnim.values         = [-180 * CGFloat(M_PI/180), 
			 -270 * CGFloat(M_PI/180)]
		GroupTransformAnim.keyTimes       = [0, 1]
		GroupTransformAnim.duration       = 0.996 * totalDuration
		GroupTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var GroupRightArrowToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupRightArrowToUpArrowAnim = QCMethod.reverseAnimation(anim: GroupRightArrowToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupRightArrowToUpArrowAnim, forKey:"GroupRightArrowToUpArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLRightArrowToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLRightArrowToUpArrowAnim = QCMethod.reverseAnimation(anim: uLRightArrowToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLRightArrowToUpArrowAnim, forKey:"uLRightArrowToUpArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRRightArrowToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRRightArrowToUpArrowAnim = QCMethod.reverseAnimation(anim: uRRightArrowToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRRightArrowToUpArrowAnim, forKey:"uRRightArrowToUpArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRRightArrowToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRRightArrowToUpArrowAnim = QCMethod.reverseAnimation(anim: dRRightArrowToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRRightArrowToUpArrowAnim, forKey:"dRRightArrowToUpArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLRightArrowToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLRightArrowToUpArrowAnim = QCMethod.reverseAnimation(anim: dLRightArrowToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLRightArrowToUpArrowAnim, forKey:"dLRightArrowToUpArrowAnim")
	}
	
	func addCategoryToRightArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("categoryToRightArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"categoryToRightArrow")
			if let anim = layer.animation(forKey: "categoryToRightArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		GroupTransformAnim.values   = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		GroupTransformAnim.keyTimes = [0, 1]
		GroupTransformAnim.duration = 1 * totalDuration
		
		var GroupCategoryToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupCategoryToRightArrowAnim = QCMethod.reverseAnimation(anim: GroupCategoryToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupCategoryToRightArrowAnim, forKey:"GroupCategoryToRightArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.1875 * uL.superlayer!.bounds.width, y: 0.03125 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.4 * uL.superlayer!.bounds.width, y: 0.125 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		uLTransformAnim.values         = [0, 
			 45 * CGFloat(M_PI/180)]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 1 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLCategoryToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLCategoryToRightArrowAnim = QCMethod.reverseAnimation(anim: uLCategoryToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLCategoryToRightArrowAnim, forKey:"uLCategoryToRightArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.8125 * uR.superlayer!.bounds.width, y: 0.03125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6625 * uR.superlayer!.bounds.width, y: 0.3875 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 1 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		uRTransformAnim.values         = [0, 
			 45 * CGFloat(M_PI/180)]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 1 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRCategoryToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRCategoryToRightArrowAnim = QCMethod.reverseAnimation(anim: uRCategoryToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRCategoryToRightArrowAnim, forKey:"uRCategoryToRightArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.8125 * dR.superlayer!.bounds.width, y: 0.96875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6625 * dR.superlayer!.bounds.width, y: 0.6125 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		dRTransformAnim.values         = [0, 
			 -45 * CGFloat(M_PI/180)]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 1 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRCategoryToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRCategoryToRightArrowAnim = QCMethod.reverseAnimation(anim: dRCategoryToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRCategoryToRightArrowAnim, forKey:"dRCategoryToRightArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.1875 * dL.superlayer!.bounds.width, y: 0.96875 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.4 * dL.superlayer!.bounds.width, y: 0.875 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 1 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		dLTransformAnim.values   = [0, 
			 -45 * CGFloat(M_PI/180)]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 1 * totalDuration
		
		var dLCategoryToRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLCategoryToRightArrowAnim = QCMethod.reverseAnimation(anim: dLCategoryToRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLCategoryToRightArrowAnim, forKey:"dLCategoryToRightArrowAnim")
	}
	
	func addTouchedAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("touched", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"touched")
			if let anim = layer.animation(forKey: "touched"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		////Group animation
		let GroupOpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
		GroupOpacityAnim.values         = [1, 0.5]
		GroupOpacityAnim.keyTimes       = [0, 1]
		GroupOpacityAnim.duration       = 1 * totalDuration
		GroupOpacityAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let Group = layers["Group"] as! CALayer
		
		let GroupTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		GroupTransformAnim.values   = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(0.9, 0.9, 0.9))]
		GroupTransformAnim.keyTimes = [0, 1]
		GroupTransformAnim.duration = totalDuration
		
		var GroupTouchedAnim : CAAnimationGroup = QCMethod.group(animations: [GroupOpacityAnim, GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupTouchedAnim = QCMethod.reverseAnimation(anim: GroupTouchedAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupTouchedAnim, forKey:"GroupTouchedAnim")
	}
	
	func addCategoryToDownArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("categoryToDownArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"categoryToDownArrow")
			if let anim = layer.animation(forKey: "categoryToDownArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		GroupTransformAnim.values   = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		GroupTransformAnim.keyTimes = [0, 1]
		GroupTransformAnim.duration = 0.996 * totalDuration
		
		var GroupCategoryToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupCategoryToDownArrowAnim = QCMethod.reverseAnimation(anim: GroupCategoryToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupCategoryToDownArrowAnim, forKey:"GroupCategoryToDownArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.1875 * uL.superlayer!.bounds.width, y: 0.03125 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.125 * uL.superlayer!.bounds.width, y: 0.4 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		uLTransformAnim.values         = [0, 
			 45 * CGFloat(M_PI/180)]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLCategoryToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLCategoryToDownArrowAnim = QCMethod.reverseAnimation(anim: uLCategoryToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLCategoryToDownArrowAnim, forKey:"uLCategoryToDownArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.8125 * uR.superlayer!.bounds.width, y: 0.03125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.875 * uR.superlayer!.bounds.width, y: 0.4 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		uRTransformAnim.values         = [0, 
			 -45 * CGFloat(M_PI/180)]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRCategoryToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRCategoryToDownArrowAnim = QCMethod.reverseAnimation(anim: uRCategoryToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRCategoryToDownArrowAnim, forKey:"uRCategoryToDownArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.8125 * dR.superlayer!.bounds.width, y: 0.96875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6125 * dR.superlayer!.bounds.width, y: 0.6625 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		dRTransformAnim.values         = [0, 
			 -45 * CGFloat(M_PI/180)]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRCategoryToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRCategoryToDownArrowAnim = QCMethod.reverseAnimation(anim: dRCategoryToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRCategoryToDownArrowAnim, forKey:"dRCategoryToDownArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.1875 * dL.superlayer!.bounds.width, y: 0.96875 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3875 * dL.superlayer!.bounds.width, y: 0.6625 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		dLTransformAnim.values   = [0, 
			 45 * CGFloat(M_PI/180)]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLCategoryToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLCategoryToDownArrowAnim = QCMethod.reverseAnimation(anim: dLCategoryToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLCategoryToDownArrowAnim, forKey:"dLCategoryToDownArrowAnim")
	}
	
	func addCategoryToUpArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("categoryToUpArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"categoryToUpArrow")
			if let anim = layer.animation(forKey: "categoryToUpArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		GroupTransformAnim.values   = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		GroupTransformAnim.keyTimes = [0, 1]
		GroupTransformAnim.duration = 0.996 * totalDuration
		
		var GroupCategoryToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupCategoryToUpArrowAnim = QCMethod.reverseAnimation(anim: GroupCategoryToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupCategoryToUpArrowAnim, forKey:"GroupCategoryToUpArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.1875 * uL.superlayer!.bounds.width, y: 0.03125 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3875 * uL.superlayer!.bounds.width, y: 0.3375 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		uLTransformAnim.values         = [0, 
			 -45 * CGFloat(M_PI/180)]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLCategoryToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLCategoryToUpArrowAnim = QCMethod.reverseAnimation(anim: uLCategoryToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLCategoryToUpArrowAnim, forKey:"uLCategoryToUpArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.8125 * uR.superlayer!.bounds.width, y: 0.03125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6125 * uR.superlayer!.bounds.width, y: 0.3375 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		uRTransformAnim.values         = [0, 
			 45 * CGFloat(M_PI/180)]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRCategoryToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRCategoryToUpArrowAnim = QCMethod.reverseAnimation(anim: uRCategoryToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRCategoryToUpArrowAnim, forKey:"uRCategoryToUpArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.8125 * dR.superlayer!.bounds.width, y: 0.96875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.875 * dR.superlayer!.bounds.width, y: 0.6 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		dRTransformAnim.values         = [0, 
			 45 * CGFloat(M_PI/180)]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRCategoryToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRCategoryToUpArrowAnim = QCMethod.reverseAnimation(anim: dRCategoryToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRCategoryToUpArrowAnim, forKey:"dRCategoryToUpArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.1875 * dL.superlayer!.bounds.width, y: 0.96875 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.125 * dL.superlayer!.bounds.width, y: 0.6 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		dLTransformAnim.values   = [0, 
			 -45 * CGFloat(M_PI/180)]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLCategoryToUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLCategoryToUpArrowAnim = QCMethod.reverseAnimation(anim: dLCategoryToUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLCategoryToUpArrowAnim, forKey:"dLCategoryToUpArrowAnim")
	}
	
	func addUpArrowToDownArrow3DAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("upArrowToDownArrow3D", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"upArrowToDownArrow3D")
			if let anim = layer.animation(forKey: "upArrowToDownArrow3D"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim      = CAKeyframeAnimation(keyPath:"transform.rotation.x")
		GroupTransformAnim.values   = [0, 
			 CGFloat(M_PI)]
		GroupTransformAnim.keyTimes = [0, 1]
		GroupTransformAnim.duration = totalDuration
		
		var GroupUpArrowToDownArrow3DAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupUpArrowToDownArrow3DAnim = QCMethod.reverseAnimation(anim: GroupUpArrowToDownArrow3DAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupUpArrowToDownArrow3DAnim, forKey:"GroupUpArrowToDownArrow3DAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes = [0, 1]
		uLTransformAnim.duration = totalDuration
		
		let uLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3875 * uL.superlayer!.bounds.width, y: 0.35 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3875 * uL.superlayer!.bounds.width, y: 0.35 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes = [0, 1]
		uLPositionAnim.duration = totalDuration
		
		var uLUpArrowToDownArrow3DAnim : CAAnimationGroup = QCMethod.group(animations: [uLTransformAnim, uLPositionAnim], fillMode:fillMode)
		if (reverseAnimation){ uLUpArrowToDownArrow3DAnim = QCMethod.reverseAnimation(anim: uLUpArrowToDownArrow3DAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLUpArrowToDownArrow3DAnim, forKey:"uLUpArrowToDownArrow3DAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		uRTransformAnim.keyTimes = [0, 1]
		uRTransformAnim.duration = 1 * totalDuration
		
		let uRPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.6125 * uR.superlayer!.bounds.width, y: 0.34375 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6125 * uR.superlayer!.bounds.width, y: 0.34375 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes = [0, 1]
		uRPositionAnim.duration = totalDuration
		
		var uRUpArrowToDownArrow3DAnim : CAAnimationGroup = QCMethod.group(animations: [uRTransformAnim, uRPositionAnim], fillMode:fillMode)
		if (reverseAnimation){ uRUpArrowToDownArrow3DAnim = QCMethod.reverseAnimation(anim: uRUpArrowToDownArrow3DAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRUpArrowToDownArrow3DAnim, forKey:"uRUpArrowToDownArrow3DAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes = [0, 1]
		dRTransformAnim.duration = 1 * totalDuration
		
		let dRPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.875 * dR.superlayer!.bounds.width, y: 0.60625 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.875 * dR.superlayer!.bounds.width, y: 0.60625 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes = [0, 1]
		dRPositionAnim.duration = totalDuration
		
		var dRUpArrowToDownArrow3DAnim : CAAnimationGroup = QCMethod.group(animations: [dRTransformAnim, dRPositionAnim], fillMode:fillMode)
		if (reverseAnimation){ dRUpArrowToDownArrow3DAnim = QCMethod.reverseAnimation(anim: dRUpArrowToDownArrow3DAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRUpArrowToDownArrow3DAnim, forKey:"dRUpArrowToDownArrow3DAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 1 * totalDuration
		
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.1375 * dL.superlayer!.bounds.width, y: 0.6 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.1375 * dL.superlayer!.bounds.width, y: 0.6 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = totalDuration
		
		var dLUpArrowToDownArrow3DAnim : CAAnimationGroup = QCMethod.group(animations: [dLTransformAnim, dLPositionAnim], fillMode:fillMode)
		if (reverseAnimation){ dLUpArrowToDownArrow3DAnim = QCMethod.reverseAnimation(anim: dLUpArrowToDownArrow3DAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLUpArrowToDownArrow3DAnim, forKey:"dLUpArrowToDownArrow3DAnim")
	}
	
	func addCategoryAnimation(completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = 0
			completionAnim.delegate = self
			completionAnim.setValue("category", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"category")
			if let anim = layer.animation(forKey: "category"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		resetLayerProperties(forLayerIdentifiers: [])
		
		let fillMode : String = kCAFillModeForwards
	}
	
	func addUpArrowToDownArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("upArrowToDownArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"upArrowToDownArrow")
			if let anim = layer.animation(forKey: "upArrowToDownArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		GroupTransformAnim.values         = [90 * CGFloat(M_PI/180), 
			 -90 * CGFloat(M_PI/180)]
		GroupTransformAnim.keyTimes       = [0, 1]
		GroupTransformAnim.duration       = 0.996 * totalDuration
		GroupTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var GroupUpArrowToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupUpArrowToDownArrowAnim = QCMethod.reverseAnimation(anim: GroupUpArrowToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupUpArrowToDownArrowAnim, forKey:"GroupUpArrowToDownArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLUpArrowToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLUpArrowToDownArrowAnim = QCMethod.reverseAnimation(anim: uLUpArrowToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLUpArrowToDownArrowAnim, forKey:"uLUpArrowToDownArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRUpArrowToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRUpArrowToDownArrowAnim = QCMethod.reverseAnimation(anim: uRUpArrowToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRUpArrowToDownArrowAnim, forKey:"uRUpArrowToDownArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRUpArrowToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRUpArrowToDownArrowAnim = QCMethod.reverseAnimation(anim: dRUpArrowToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRUpArrowToDownArrowAnim, forKey:"dRUpArrowToDownArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLUpArrowToDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLUpArrowToDownArrowAnim = QCMethod.reverseAnimation(anim: dLUpArrowToDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLUpArrowToDownArrowAnim, forKey:"dLUpArrowToDownArrowAnim")
	}
	
	func addRightArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("rightArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"rightArrow")
			if let anim = layer.animation(forKey: "rightArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		GroupTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, -1))]
		GroupTransformAnim.keyTimes       = [0, 1]
		GroupTransformAnim.duration       = 0.996 * totalDuration
		GroupTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var GroupRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupRightArrowAnim = QCMethod.reverseAnimation(anim: GroupRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupRightArrowAnim, forKey:"GroupRightArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLRightArrowAnim = QCMethod.reverseAnimation(anim: uLRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLRightArrowAnim, forKey:"uLRightArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRRightArrowAnim = QCMethod.reverseAnimation(anim: uRRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRRightArrowAnim, forKey:"uRRightArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRRightArrowAnim = QCMethod.reverseAnimation(anim: dRRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRRightArrowAnim, forKey:"dRRightArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLRightArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLRightArrowAnim = QCMethod.reverseAnimation(anim: dLRightArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLRightArrowAnim, forKey:"dLRightArrowAnim")
	}
	
	func addUpArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("upArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"upArrow")
			if let anim = layer.animation(forKey: "upArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		GroupTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-90 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-90 * CGFloat(M_PI/180), 0, 0, -1))]
		GroupTransformAnim.keyTimes       = [0, 1]
		GroupTransformAnim.duration       = 0.996 * totalDuration
		GroupTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var GroupUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupUpArrowAnim = QCMethod.reverseAnimation(anim: GroupUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupUpArrowAnim, forKey:"GroupUpArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLUpArrowAnim = QCMethod.reverseAnimation(anim: uLUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLUpArrowAnim, forKey:"uLUpArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRUpArrowAnim = QCMethod.reverseAnimation(anim: uRUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRUpArrowAnim, forKey:"uRUpArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRUpArrowAnim = QCMethod.reverseAnimation(anim: dRUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRUpArrowAnim, forKey:"dRUpArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLUpArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLUpArrowAnim = QCMethod.reverseAnimation(anim: dLUpArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLUpArrowAnim, forKey:"dLUpArrowAnim")
	}
	
	func addDownArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("downArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"downArrow")
			if let anim = layer.animation(forKey: "downArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		GroupTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_2), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_2), 0, 0, -1))]
		GroupTransformAnim.keyTimes       = [0, 1]
		GroupTransformAnim.duration       = 0.996 * totalDuration
		GroupTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var GroupDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupDownArrowAnim = QCMethod.reverseAnimation(anim: GroupDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupDownArrowAnim, forKey:"GroupDownArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLDownArrowAnim = QCMethod.reverseAnimation(anim: uLDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLDownArrowAnim, forKey:"uLDownArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRDownArrowAnim = QCMethod.reverseAnimation(anim: uRDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRDownArrowAnim, forKey:"uRDownArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRDownArrowAnim = QCMethod.reverseAnimation(anim: dRDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRDownArrowAnim, forKey:"dRDownArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLDownArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLDownArrowAnim = QCMethod.reverseAnimation(anim: dLDownArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLDownArrowAnim, forKey:"dLDownArrowAnim")
	}
	
	func addLeftArrowAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("leftArrow", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"leftArrow")
			if let anim = layer.animation(forKey: "leftArrow"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		GroupTransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		GroupTransformAnim.keyTimes       = [0, 1]
		GroupTransformAnim.duration       = 0.996 * totalDuration
		GroupTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var GroupLeftArrowAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupLeftArrowAnim = QCMethod.reverseAnimation(anim: GroupLeftArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupLeftArrowAnim, forKey:"GroupLeftArrowAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLLeftArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLLeftArrowAnim = QCMethod.reverseAnimation(anim: uLLeftArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLLeftArrowAnim, forKey:"uLLeftArrowAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRLeftArrowAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRLeftArrowAnim = QCMethod.reverseAnimation(anim: uRLeftArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRLeftArrowAnim, forKey:"uRLeftArrowAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRLeftArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRLeftArrowAnim = QCMethod.reverseAnimation(anim: dRLeftArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRLeftArrowAnim, forKey:"dRLeftArrowAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLLeftArrowAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLLeftArrowAnim = QCMethod.reverseAnimation(anim: dLLeftArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLLeftArrowAnim, forKey:"dLLeftArrowAnim")
	}
	
	func addLeftArrowToRightArrow3DAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.3, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("LeftArrowToRightArrow3D", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"LeftArrowToRightArrow3D")
			if let anim = layer.animation(forKey: "LeftArrowToRightArrow3D"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerProperties(forLayerIdentifiers: ["Group", "uL", "uR", "dR", "dL"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.y")
		GroupTransformAnim.values         = [0, 
			 CGFloat(M_PI)]
		GroupTransformAnim.keyTimes       = [0, 1]
		GroupTransformAnim.duration       = 0.996 * totalDuration
		GroupTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var GroupLeftArrowToRightArrow3DAnim : CAAnimationGroup = QCMethod.group(animations: [GroupTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ GroupLeftArrowToRightArrow3DAnim = QCMethod.reverseAnimation(anim: GroupLeftArrowToRightArrow3DAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		Group.add(GroupLeftArrowToRightArrow3DAnim, forKey:"GroupLeftArrowToRightArrow3DAnim")
		
		let uL = layers["uL"] as! CAShapeLayer
		
		////UL animation
		let uLPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uLPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * uL.superlayer!.bounds.width, y: 0.3875 * uL.superlayer!.bounds.height))]
		uLPositionAnim.keyTimes       = [0, 1]
		uLPositionAnim.duration       = 0.99 * totalDuration
		uLPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uLTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uLTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uLTransformAnim.keyTimes       = [0, 1]
		uLTransformAnim.duration       = 0.99 * totalDuration
		uLTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uLLeftArrowToRightArrow3DAnim : CAAnimationGroup = QCMethod.group(animations: [uLPositionAnim, uLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uLLeftArrowToRightArrow3DAnim = QCMethod.reverseAnimation(anim: uLLeftArrowToRightArrow3DAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uL.add(uLLeftArrowToRightArrow3DAnim, forKey:"uLLeftArrowToRightArrow3DAnim")
		
		let uR = layers["uR"] as! CAShapeLayer
		
		////UR animation
		let uRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		uRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * uR.superlayer!.bounds.width, y: 0.125 * uR.superlayer!.bounds.height))]
		uRPositionAnim.keyTimes       = [0, 1]
		uRPositionAnim.duration       = 0.996 * totalDuration
		uRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let uRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		uRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
		uRTransformAnim.keyTimes       = [0, 1]
		uRTransformAnim.duration       = 0.996 * totalDuration
		uRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var uRLeftArrowToRightArrow3DAnim : CAAnimationGroup = QCMethod.group(animations: [uRPositionAnim, uRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ uRLeftArrowToRightArrow3DAnim = QCMethod.reverseAnimation(anim: uRLeftArrowToRightArrow3DAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		uR.add(uRLeftArrowToRightArrow3DAnim, forKey:"uRLeftArrowToRightArrow3DAnim")
		
		let dR = layers["dR"] as! CAShapeLayer
		
		////DR animation
		let dRPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		dRPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.6 * dR.superlayer!.bounds.width, y: 0.875 * dR.superlayer!.bounds.height))]
		dRPositionAnim.keyTimes       = [0, 1]
		dRPositionAnim.duration       = 1 * totalDuration
		dRPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let dRTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		dRTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dRTransformAnim.keyTimes       = [0, 1]
		dRTransformAnim.duration       = 0.996 * totalDuration
		dRTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var dRLeftArrowToRightArrow3DAnim : CAAnimationGroup = QCMethod.group(animations: [dRPositionAnim, dRTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dRLeftArrowToRightArrow3DAnim = QCMethod.reverseAnimation(anim: dRLeftArrowToRightArrow3DAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dR.add(dRLeftArrowToRightArrow3DAnim, forKey:"dRLeftArrowToRightArrow3DAnim")
		
		let dL = layers["dL"] as! CAShapeLayer
		
		////DL animation
		let dLPositionAnim      = CAKeyframeAnimation(keyPath:"position")
		dLPositionAnim.values   = [NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.3375 * dL.superlayer!.bounds.width, y: 0.6125 * dL.superlayer!.bounds.height))]
		dLPositionAnim.keyTimes = [0, 1]
		dLPositionAnim.duration = 0.996 * totalDuration
		
		let dLTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		dLTransformAnim.values   = [NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1)), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
		dLTransformAnim.keyTimes = [0, 1]
		dLTransformAnim.duration = 0.996 * totalDuration
		
		var dLLeftArrowToRightArrow3DAnim : CAAnimationGroup = QCMethod.group(animations: [dLPositionAnim, dLTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ dLLeftArrowToRightArrow3DAnim = QCMethod.reverseAnimation(anim: dLLeftArrowToRightArrow3DAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		dL.add(dLLeftArrowToRightArrow3DAnim, forKey:"dLLeftArrowToRightArrow3DAnim")
	}
	
	//MARK: - Animation Cleanup
	
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
		if let completionBlock = completionBlocks[anim]{
			completionBlocks.removeValue(forKey: anim)
			if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
				updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
				removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
			}
			completionBlock(flag)
		}
	}
	
	func updateLayerValues(forAnimationId identifier: String){
		if identifier == "categoryToLeftArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupCategoryToLeftArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLCategoryToLeftArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRCategoryToLeftArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRCategoryToLeftArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLCategoryToLeftArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "leftArrowToDownArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupLeftArrowToDownArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLLeftArrowToDownArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRLeftArrowToDownArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRLeftArrowToDownArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLLeftArrowToDownArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "downArrowToRightArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupDownArrowToRightArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLDownArrowToRightArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRDownArrowToRightArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRDownArrowToRightArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLDownArrowToRightArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "LeftArrowToRightArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupLeftArrowToRightArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLLeftArrowToRightArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRLeftArrowToRightArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRLeftArrowToRightArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLLeftArrowToRightArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "leftArrowToUpArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupLeftArrowToUpArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLLeftArrowToUpArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRLeftArrowToUpArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRLeftArrowToUpArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLLeftArrowToUpArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "rightArrowToUpArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupRightArrowToUpArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLRightArrowToUpArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRRightArrowToUpArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRRightArrowToUpArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLRightArrowToUpArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "categoryToRightArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupCategoryToRightArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLCategoryToRightArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRCategoryToRightArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRCategoryToRightArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLCategoryToRightArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "touched"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupTouchedAnim"), theLayer:(layers["Group"] as! CALayer))
		}
		else if identifier == "categoryToDownArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupCategoryToDownArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLCategoryToDownArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRCategoryToDownArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRCategoryToDownArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLCategoryToDownArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "categoryToUpArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupCategoryToUpArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLCategoryToUpArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRCategoryToUpArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRCategoryToUpArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLCategoryToUpArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "upArrowToDownArrow3D"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupUpArrowToDownArrow3DAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLUpArrowToDownArrow3DAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRUpArrowToDownArrow3DAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRUpArrowToDownArrow3DAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLUpArrowToDownArrow3DAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "category"{
			
		}
		else if identifier == "upArrowToDownArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupUpArrowToDownArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLUpArrowToDownArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRUpArrowToDownArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRUpArrowToDownArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLUpArrowToDownArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "rightArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupRightArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLRightArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRRightArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRRightArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLRightArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "upArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupUpArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLUpArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRUpArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRUpArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLUpArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "downArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupDownArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLDownArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRDownArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRDownArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLDownArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "leftArrow"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupLeftArrowAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLLeftArrowAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRLeftArrowAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRLeftArrowAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLLeftArrowAnim"), theLayer:(layers["dL"] as! CALayer))
		}
		else if identifier == "LeftArrowToRightArrow3D"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupLeftArrowToRightArrow3DAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uL"] as! CALayer).animation(forKey: "uLLeftArrowToRightArrow3DAnim"), theLayer:(layers["uL"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["uR"] as! CALayer).animation(forKey: "uRLeftArrowToRightArrow3DAnim"), theLayer:(layers["uR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dR"] as! CALayer).animation(forKey: "dRLeftArrowToRightArrow3DAnim"), theLayer:(layers["dR"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["dL"] as! CALayer).animation(forKey: "dLLeftArrowToRightArrow3DAnim"), theLayer:(layers["dL"] as! CALayer))
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "categoryToLeftArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupCategoryToLeftArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLCategoryToLeftArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRCategoryToLeftArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRCategoryToLeftArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLCategoryToLeftArrowAnim")
		}
		else if identifier == "leftArrowToDownArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupLeftArrowToDownArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLLeftArrowToDownArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRLeftArrowToDownArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRLeftArrowToDownArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLLeftArrowToDownArrowAnim")
		}
		else if identifier == "downArrowToRightArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupDownArrowToRightArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLDownArrowToRightArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRDownArrowToRightArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRDownArrowToRightArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLDownArrowToRightArrowAnim")
		}
		else if identifier == "LeftArrowToRightArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupLeftArrowToRightArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLLeftArrowToRightArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRLeftArrowToRightArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRLeftArrowToRightArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLLeftArrowToRightArrowAnim")
		}
		else if identifier == "leftArrowToUpArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupLeftArrowToUpArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLLeftArrowToUpArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRLeftArrowToUpArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRLeftArrowToUpArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLLeftArrowToUpArrowAnim")
		}
		else if identifier == "rightArrowToUpArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupRightArrowToUpArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLRightArrowToUpArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRRightArrowToUpArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRRightArrowToUpArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLRightArrowToUpArrowAnim")
		}
		else if identifier == "categoryToRightArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupCategoryToRightArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLCategoryToRightArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRCategoryToRightArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRCategoryToRightArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLCategoryToRightArrowAnim")
		}
		else if identifier == "touched"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupTouchedAnim")
		}
		else if identifier == "categoryToDownArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupCategoryToDownArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLCategoryToDownArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRCategoryToDownArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRCategoryToDownArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLCategoryToDownArrowAnim")
		}
		else if identifier == "categoryToUpArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupCategoryToUpArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLCategoryToUpArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRCategoryToUpArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRCategoryToUpArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLCategoryToUpArrowAnim")
		}
		else if identifier == "upArrowToDownArrow3D"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupUpArrowToDownArrow3DAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLUpArrowToDownArrow3DAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRUpArrowToDownArrow3DAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRUpArrowToDownArrow3DAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLUpArrowToDownArrow3DAnim")
		}
		else if identifier == "category"{
			
		}
		else if identifier == "upArrowToDownArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupUpArrowToDownArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLUpArrowToDownArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRUpArrowToDownArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRUpArrowToDownArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLUpArrowToDownArrowAnim")
		}
		else if identifier == "rightArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupRightArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLRightArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRRightArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRRightArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLRightArrowAnim")
		}
		else if identifier == "upArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupUpArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLUpArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRUpArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRUpArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLUpArrowAnim")
		}
		else if identifier == "downArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupDownArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLDownArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRDownArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRDownArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLDownArrowAnim")
		}
		else if identifier == "leftArrow"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupLeftArrowAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLLeftArrowAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRLeftArrowAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRLeftArrowAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLLeftArrowAnim")
		}
		else if identifier == "LeftArrowToRightArrow3D"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupLeftArrowToRightArrow3DAnim")
			(layers["uL"] as! CALayer).removeAnimation(forKey: "uLLeftArrowToRightArrow3DAnim")
			(layers["uR"] as! CALayer).removeAnimation(forKey: "uRLeftArrowToRightArrow3DAnim")
			(layers["dR"] as! CALayer).removeAnimation(forKey: "dRLeftArrowToRightArrow3DAnim")
			(layers["dL"] as! CALayer).removeAnimation(forKey: "dLLeftArrowToRightArrow3DAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func uLPath(bounds: CGRect) -> UIBezierPath{
		let uLPath = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		uLPath.move(to: CGPoint(x:minX, y: minY + h))
		uLPath.addLine(to: CGPoint(x:minX + w, y: minY + h))
		uLPath.addLine(to: CGPoint(x:minX + w, y: minY))
		uLPath.addLine(to: CGPoint(x:minX, y: minY))
		uLPath.close()
		uLPath.move(to: CGPoint(x:minX, y: minY + h))
		
		return uLPath
	}
	
	func uRPath(bounds: CGRect) -> UIBezierPath{
		let uRPath = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		uRPath.move(to: CGPoint(x:minX, y: minY + h))
		uRPath.addLine(to: CGPoint(x:minX + w, y: minY + h))
		uRPath.addLine(to: CGPoint(x:minX + w, y: minY))
		uRPath.addLine(to: CGPoint(x:minX, y: minY))
		uRPath.close()
		uRPath.move(to: CGPoint(x:minX, y: minY + h))
		
		return uRPath
	}
	
	func dRPath(bounds: CGRect) -> UIBezierPath{
		let dRPath = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		dRPath.move(to: CGPoint(x:minX, y: minY + h))
		dRPath.addLine(to: CGPoint(x:minX + w, y: minY + h))
		dRPath.addLine(to: CGPoint(x:minX + w, y: minY))
		dRPath.addLine(to: CGPoint(x:minX, y: minY))
		dRPath.close()
		dRPath.move(to: CGPoint(x:minX, y: minY + h))
		
		return dRPath
	}
	
	func dLPath(bounds: CGRect) -> UIBezierPath{
		let dLPath = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		dLPath.move(to: CGPoint(x:minX, y: minY + h))
		dLPath.addLine(to: CGPoint(x:minX + w, y: minY + h))
		dLPath.addLine(to: CGPoint(x:minX + w, y: minY))
		dLPath.addLine(to: CGPoint(x:minX, y: minY))
		dLPath.close()
		dLPath.move(to: CGPoint(x:minX, y: minY + h))
		
		return dLPath
	}
	
	
}
