/*
 Hello! Thank you for taking the time to complete our
 coding challenge. There are 3 challenges, each on a
 separate page. The clue derived from each page will
 provide instructions for the next challenge.

 We recommend turning "Editor > Show Rendered Markup"
 on for a classier experience.

 When you are done, please rename this playground to
 "first-last Ramp Challenge.playground" and submit it to
 ios-submissions@ramp.com.

 Good Luck!

 - The Ramp Mobile Team

 */

// = = = = = = = = = = = = = = = = = = = = = = = =

//: [Challenge 1](@previous)
//: #### Challenge 2
//: Get the prompt from Challenge 1 and paste it below.
//: Solve the challenge to get the prompt for Challenge 3.

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let prompt = """
Solve challenge 1 to get the prompt and paste it here.
"""
let url = URL(string: "https://api.jsonbin.io/v3/b/646bed328e4aa6225ea22a79")!
let accessKey = "$2b$10$Ke1iwieFO7/7qsSKU.GYU.oYXZMW1EeHrwd4xx9ylboJik5mstZk6"


struct ApiResponse: Codable {
    let record: Record
}

struct Record: Codable {
    let data: [YourData]
}

struct YourData: Codable {
    let foo: String
    let bar: Int
    let baz: Int
}


// The URL you want to make a request to

// Create a URLRequest with the access key in the header
var request = URLRequest(url: url)
request.setValue("\(accessKey)", forHTTPHeaderField: "X-ACCESS-KEY")

// Make the data task request
let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    if let error = error {
        print("Error: \(error)")
        return
    }

    guard let data = data else {
        print("No data received")
        return
    }

    do {
        let decoder = JSONDecoder()
        let apiResponse = try decoder.decode(ApiResponse.self, from: data) // Decode the JSON into the ApiResponse struct

        // Extract the array of the Struct objects
        let dataArray = apiResponse.record.data

        // Sort by 'bar' key
        let sortedData = dataArray.sorted { $0.bar < $1.bar }

        // Filter out elements where 'baz' is not divisible by 3
        let filteredData = sortedData.filter { $0.baz % 3 == 0 }

        // Concatenate each element's 'foo' value
        let concatenatedFoo = filteredData.map { $0.foo }.joined(separator: "")

        // Print the results
        print("Sorted Data:\n\(sortedData)")
        print("\nFiltered Data:\n\(filteredData)")
        print("\nConcatenated Foo Values:\n\(concatenatedFoo)")
    } catch {
        print("Error decoding JSON: \(error)")
    }
}
task.resume()
