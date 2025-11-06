//
//  BallPulseSyncLoader.swift
//  Jiguar
//
//  Created by Bhavesh Chaudhari on 11/09/25.
//  Copyright © 2025 Jiguar. All rights reserved.
//


import SwiftUI

public struct BallPulseSync: View {
    
    private let duration: Double = 0.5
    private let delays: [Double] = [0.07, 0.14, 0.21]
    private let keyTimes: [Double] = [0, 0.33, 0.66, 1]
    private let directionValues: [CGFloat] = [0, 1, -1, 0]
    
    let ballSize: CGFloat
    let ballColor: Color

    @State private var phase: Double = 0

    public init(ballSize: CGFloat, ballColor: Color) {
        self.ballSize = ballSize
        self.ballColor = ballColor
    }

    public var body: some View {
        TimelineView(.animation) { timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            GeometryReader { geometry in
                let dimension = min(geometry.size.width, geometry.size.height)
                let objectDimension = 10 * dimension / 32
                let spacing = dimension / 32
                let travel = (objectDimension - spacing) / 2

                HStack(spacing: spacing) {
                    ForEach(0..<3, id: \.self) { index in
                        let delay = delays[index]
                        let localTime = (now + delay).truncatingRemainder(dividingBy: duration) / duration
                        let value = interpolateKeyframes(progress: localTime, keyTimes: keyTimes, values: directionValues) * travel

                        Circle()
                            .frame(width: ballSize, height: ballSize)
                            .offset(y: value).foregroundColor(ballColor)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }

    // Linear interpolation between keyframes
    private func interpolateKeyframes(progress: Double, keyTimes: [Double], values: [CGFloat]) -> CGFloat {
        guard let index = keyTimes.firstIndex(where: { progress < $0 }) else {
            return values.last ?? 0
        }

        if index == 0 { return values[0] }

        let time0 = keyTimes[index - 1]
        let time1 = keyTimes[index]
        let value0 = values[index - 1]
        let value1 = values[index]

        let ratio = (progress - time0) / (time1 - time0)
        return value0 + CGFloat(ratio) * (value1 - value0)
    }
}
