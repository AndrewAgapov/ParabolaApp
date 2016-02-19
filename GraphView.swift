//
//  GraphView.swift
//  ParabolaApp
//
//  Created by Andrew on 2/17/16.
//  Copyright © 2016 AndrewAgapov. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2.0)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let components: [CGFloat] = [0.0, 0.0, 0.0, 1.0]
        let color = CGColorCreate(colorSpace, components)
        CGContextSetStrokeColorWithColor(context, color)
        
        
        //making y line
        CGContextMoveToPoint(context, 40, 40)
        CGContextAddLineToPoint(context, 40, 320)
        
        CGContextMoveToPoint(context, 39.6, 40)
        CGContextAddLineToPoint(context, 48, 52)
        
        CGContextMoveToPoint(context, 40.4, 40)
        CGContextAddLineToPoint(context, 32, 52)
        
        // making x line
        CGContextMoveToPoint(context, 16, 296)
        CGContextAddLineToPoint(context, 296, 296)
        
        CGContextMoveToPoint(context, 296, 296.4)
        CGContextAddLineToPoint(context, 284, 288)
        
        CGContextMoveToPoint(context, 296, 295.6)
        CGContextAddLineToPoint(context, 284, 304)
        
        CGContextStrokePath(context)
        
        // making axles labels
        func makingAxleLabel (axleLabel: String, coord:(CGFloat,CGFloat)){
            let label = UILabel(frame: CGRectMake(0, 0, 25, 25))
            label.center = CGPointMake(coord)
            label.textAlignment = NSTextAlignment.Center
            label.text = axleLabel
            self.addSubview(label)
        }
        
        makingAxleLabel("Y", coord: (55, 45))
        makingAxleLabel("X", coord: (292, 280))
        
        
        
        // making graph
        let curveContext = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(curveContext, 1.0)
        let componentsForCurve: [CGFloat] = [1.0, 0.0, 0.0, 1.0]
        let curveColor = CGColorCreate(colorSpace, componentsForCurve)
        CGContextSetStrokeColorWithColor(curveContext, curveColor)
        
        
        
        
        
        //Проанализировав изображение графика в задании, можна сделать вывод, что на картинке изображен график функции y = x^2
        
        
        func makingParabolaGraph () {
            
            let zeroPointX:CGFloat = 41.2
            let zeroPointY:CGFloat = 294.8
            let scale: CGFloat = 60
            let xValues:[CGFloat] = [1, 1.5, 2]
            
            func makingYValues(xValues:[CGFloat]) -> [CGFloat] {
                var yArray = [CGFloat]()
                for i in xValues{
                    let yValue = i*i
                    yArray.append(yValue)
                    
                }
                print("y Array = \(yArray)")
                return yArray
                
            }
            
            var yValues = makingYValues(xValues)
            
            func makingNewPoints (values:[CGFloat], zeroPoint:CGFloat, forX: Bool) -> [CGFloat]   {
                var pointsArray = [CGFloat]()
                for i in values{
                    var point = CGFloat()
                    if forX == true{
                        point = zeroPoint + i*scale
                    } else {
                        point = zeroPoint - i*scale
                    }
                    
                    pointsArray.append(point)
                }
                print("points \(pointsArray)")
                return pointsArray
            }
            
            let xPoints = makingNewPoints(xValues, zeroPoint: zeroPointX, forX: true)
            let yPoints = makingNewPoints(yValues, zeroPoint: zeroPointY, forX: false)
            
            
            CGContextMoveToPoint(curveContext, zeroPointX, zeroPointY)
            CGContextAddCurveToPoint(curveContext, xPoints[0], yPoints[0], xPoints[1], yPoints[1], xPoints[2], yPoints[2])
            
            CGContextStrokePath(curveContext)
        }
        
        
        makingParabolaGraph()
        
        
        
        
    }
}
