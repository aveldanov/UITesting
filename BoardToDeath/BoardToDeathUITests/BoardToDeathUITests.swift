//
//  BoardToDeathUITests.swift
//  BoardToDeathUITests
//
//  Created by Veldanov, Anton on 6/9/20.
//  Copyright © 2020 Caleb Stultz. All rights reserved.
//

import XCTest

class BoardToDeathUITests: XCTestCase {
  
  var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        continueAfterFailure = false

   
    }

    override func tearDownWithError() throws {
      app = nil // so we get new instance of app
    }
  
  func testOnboarding_WhenSwiped_ShouldLoadNewVC(){
    app.launch()
    XCTAssertTrue(app.staticTexts["Welcome to BoardToDeath"].exists)
    app.swipeLeft()
    XCTAssertTrue(app.staticTexts["Custom Puppy Content"].exists)
    
  }
  
  func testOnboarding_WhenDoneButtonTapped_PresentsAlert(){
    app.launch()
    app.swipeLeft()
    app.swipeLeft()
    
    app.buttons["Done"].tap()
  }


}
