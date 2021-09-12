////
////  ShapeEnum.swift
////  CustomPresentController
////
////  Created by Nikhil Desai on 12/09/21.
////
//
//import Foundation
//import UIKit
//
//
//enum ShapeManager{
//    case Rounded(radius: CGFloat)
//    case Ticket(totalObject: CGFloat)
//    case Bubble(totalObject: CGFloat)
//    case Fluid(height: CGFloat)
//    case Wave(totalObject: CGFloat)
//    case Coupon(totalObject: CGFloat)
//}
//
//
//
//extension UIView{
//    func setShape(_ Shape: ShapeManager){
//        switch Shape {
//        case .Fluid(let height):
//            let shapePath = UIBezierPath()
//            let shapeLayer = CAShapeLayer()
//            shapePath.move(to: .init(x: 0, y: height))
//            shapePath.addCurve(to: .init(x: self.frame.width, y: height), controlPoint1: .init(x: self.frame.width/2, y: 0), controlPoint2: .init(x: self.frame.width/2, y: height * 2))
//            shapePath.addLine(to: .init(x: self.frame.width, y: self.frame.height))
//            shapePath.addLine(to: .init(x: 0, y: self.frame.height))
//            shapePath.close()
//            shapeLayer.path = shapePath.cgPath
//            self.layer.mask = shapeLayer
//        case .Ticket(let Object):
//            let shapePath = UIBezierPath()
//            let shapeLayer = CAShapeLayer()
//            let height = self.frame.width/Object
//            shapePath.move(to: .init(x: 0, y: height))
//            for angle in stride(from: height, through: self.frame.width, by: height){
//                shapePath.addLine(to: .init(x: angle - height/2, y: 0))
//                shapePath.addLine(to: .init(x: angle, y: height))
//            }
//            shapePath.addLine(to: .init(x: self.frame.width, y: self.frame.height))
//            shapePath.addLine(to: .init(x: 0, y: self.frame.height))
//            shapePath.close()
//            shapeLayer.path = shapePath.cgPath
//            self.layer.mask = shapeLayer
//        case .Bubble(let Object):
//            let shapePath = UIBezierPath()
//            let shapeLayer = CAShapeLayer()
//            let height = self.frame.width/Object
//            shapePath.move(to: .init(x: 0, y: height))
//            for angle in stride(from: height, through: self.frame.width, by: height){
//                shapePath.addQuadCurve(to: .init(x: angle, y: height), controlPoint: .init(x: angle - height/2, y: 0))
//            }
//            shapePath.addLine(to: .init(x: self.frame.width, y: self.frame.height))
//            shapePath.addLine(to: .init(x: 0, y: self.frame.height))
//            shapePath.close()
//            shapeLayer.path = shapePath.cgPath
//            self.layer.mask = shapeLayer
//        case .Rounded(let radius):
//            let shapePath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: radius, height: radius))
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.path = shapePath.cgPath
//            self.layer.mask = shapeLayer
//        case .Wave(let Object):
//            let shapePath = UIBezierPath()
//            let shapeLayer = CAShapeLayer()
//            let height = self.frame.width/Object
//            var index = 0
//            shapePath.move(to: .init(x: 0, y: height))
//            for angle in stride(from: height, through: self.frame.width, by: height){
//                index += 1
//                if index%2 == 0{
//                    shapePath.addQuadCurve(to: .init(x: angle, y: height), controlPoint: .init(x: angle - height/2, y: height * 2))
//                }else{
//                    shapePath.addQuadCurve(to: .init(x: angle, y: height), controlPoint: .init(x: angle - height/2, y: 0))
//                }
//            }
//            shapePath.addLine(to: .init(x: self.frame.width, y: self.frame.height))
//            shapePath.addLine(to: .init(x: 0, y: self.frame.height))
//            shapePath.close()
//            shapeLayer.path = shapePath.cgPath
//            self.layer.mask = shapeLayer
//        case .Coupon(let Object):
//            let shapePath = UIBezierPath()
//            let shapeLayer = CAShapeLayer()
//            let height = self.frame.width/Object
//            var index = 0
//            shapePath.move(to: .init(x: 0, y: height))
//            for angle in stride(from: height, through: self.frame.width, by: height){
//                index += 1
//                if index%2 == 0{
//                    shapePath.addQuadCurve(to: .init(x: angle, y: height), controlPoint: .init(x: angle - height/2, y: height * 2))
//                }else{
//                    shapePath.addLine(to: .init(x: angle, y: height))
//                }
//            }
//            shapePath.addLine(to: .init(x: self.frame.width, y: self.frame.height))
//            shapePath.addLine(to: .init(x: 0, y: self.frame.height))
//            shapePath.close()
//            shapeLayer.path = shapePath.cgPath
//            self.layer.mask = shapeLayer
//        }
//    }
//}
