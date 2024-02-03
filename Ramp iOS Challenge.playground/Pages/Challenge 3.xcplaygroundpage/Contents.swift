/*
 Hello! Thank you for taking the time to complete our
 coding challenge. There are 3 challenges, each on a
 separate page. The clue derived from each page will
 provide instructions for the next challenge.

 When you are done, please rename this playground to
 "first-last Ramp Challenge.playground" and submit it to
 ios-submissions@ramp.com.

 We recommend turning "Editor > Show Rendered Markup"
 on for a classier experience.

 Good Luck!

 - The Ramp Mobile Team

 */

// = = = = = = = = = = = = = = = = = = = = = = = =

//: [Challenge 2](@previous)
//: #### Challenge 3
//: Get the prompt from Challenge 2 and paste it below.
//: Solve the challenge, and take a screenshot of the rendered view.
//: Include the screenshot of the view in your submission!

import Foundation
import SwiftUI
import PlaygroundSupport

let prompt = """
Solve challenge 2 to get the prompt and paste it here.
"""

// Show your work here! When you are done take a screenshot
// of the end result and follow the submission instructions above.
// Include the screenshot of the view in your submission!


PlaygroundPage.current
    .needsIndefiniteExecution = true
PlaygroundPage.current
    .setLiveView(ContentView())

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                // Face with gradient and shadow for depth
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), center: .center, startRadius: 5, endRadius: 100))
                    .frame(width: 200, height: 200)
                    .shadow(radius: 10)

                // Eyes with a white highlight for a more lively look
                HStack(spacing: 50) {
                    EyeView()
                    EyeView()
                }
                .offset(y: -30)

                // Mouth with a subtle shadow to give a raised effect
                SmileView()
            }
            Spacer()
        }
    }
}

struct EyeView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 20, height: 20)
            Circle()
                .fill(Color.white)
                .frame(width: 6, height: 6)
                .offset(x: -4, y: -4)
        }
    }
}

struct SmileView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 50, y: 150))
            path.addQuadCurve(to: CGPoint(x: 150, y: 150), control: CGPoint(x: 100, y: 200))
        }
        .stroke(Color.black, lineWidth: 5)
        .shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
    }
}

