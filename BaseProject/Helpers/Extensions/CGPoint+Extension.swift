
import Foundation
import CoreGraphics

public extension CGPoint {
	/// SwifterSwift: Add two CGPoints.
	///
	///     let point1 = CGPoint(x: 10, y: 10)
	///     let point2 = CGPoint(x: 30, y: 30)
	///     let point = point1 + point2
	///     // point = CGPoint(x: 40, y: 40)
	///
	/// - Parameters:
	///   - lhs: CGPoint to add to.
	///   - rhs: CGPoint to add.
	/// - Returns: result of addition of the two given CGPoints.
	static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
		return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
	}

	/// SwifterSwift: Add a CGPoints to self.
	///
	///     let point1 = CGPoint(x: 10, y: 10)
	///     let point2 = CGPoint(x: 30, y: 30)
	///     point1 += point2
	///     // point1 = CGPoint(x: 40, y: 40)
	///
	/// - Parameters:
	///   - lhs: `self`.
	///   - rhs: CGPoint to add.
	static func += (lhs: inout CGPoint, rhs: CGPoint) {
		lhs.x += rhs.x
		lhs.y += rhs.y
	}

	/// SwifterSwift: Subtract two CGPoints.
	///
	///     let point1 = CGPoint(x: 10, y: 10)
	///     let point2 = CGPoint(x: 30, y: 30)
	///     let point = point1 - point2
	///     // point = CGPoint(x: -20, y: -20)
	///
	/// - Parameters:
	///   - lhs: CGPoint to subtract from.
	///   - rhs: CGPoint to subtract.
	/// - Returns: result of subtract of the two given CGPoints.
	static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
		return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
	}

	/// SwifterSwift: Subtract a CGPoints from self.
	///
	///     let point1 = CGPoint(x: 10, y: 10)
	///     let point2 = CGPoint(x: 30, y: 30)
	///     point1 -= point2
	///     // point1 = CGPoint(x: -20, y: -20)
	///
	/// - Parameters:
	///   - lhs: `self`.
	///   - rhs: CGPoint to subtract.
	static func -= (lhs: inout CGPoint, rhs: CGPoint) {
		lhs.x -= rhs.x
		lhs.y -= rhs.y
	}

	/// SwifterSwift: Multiply a CGPoint with a scalar.
	///
	///     let point1 = CGPoint(x: 10, y: 10)
	///     let scalar = point1 * 5
	///     // scalar = CGPoint(x: 50, y: 50)
	///
	/// - Parameters:
	///   - point: CGPoint to multiply.
	///   - scalar: scalar value.
	/// - Returns: result of multiplication of the given CGPoint with the scalar.
	static func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
		return CGPoint(x: point.x * scalar, y: point.y * scalar)
	}

	/// SwifterSwift: Multiply self with a scalar.
	///
	///     let point1 = CGPoint(x: 10, y: 10)
	///     point *= 5
	///     // point1 = CGPoint(x: 50, y: 50)
	///
	/// - Parameters:
	///   - point: `self`.
	///   - scalar: scalar value.
	/// - Returns: result of multiplication of the given CGPoint with the scalar.
	static func *= (point: inout CGPoint, scalar: CGFloat) {
		point.x *= scalar
		point.y *= scalar
	}

	/// SwifterSwift: Multiply a CGPoint with a scalar.
	///
	///     let point1 = CGPoint(x: 10, y: 10)
	///     let scalar = 5 * point1
	///     // scalar = CGPoint(x: 50, y: 50)
	///
	/// - Parameters:
	///   - scalar: scalar value.
	///   - point: CGPoint to multiply.
	/// - Returns: result of multiplication of the given CGPoint with the scalar.
	static func * (scalar: CGFloat, point: CGPoint) -> CGPoint {
		return CGPoint(x: point.x * scalar, y: point.y * scalar)
	}
}
