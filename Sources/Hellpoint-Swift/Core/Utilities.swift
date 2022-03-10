import Foundation

extension Float {
    func asDegrees() -> Float {
        return self * (.pi / 180)
    }
    func toRadians() -> Float {
        return self * (180 / .pi)
    }
}

extension Float {
    func clamped(min: Self, max: Self) -> Self {
        return .maximum(min, .minimum(max, self))
    }
}