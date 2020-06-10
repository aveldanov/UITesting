//
//  BoardToDeathUITests.swift
//  BoardToDeathUITests
//
//  Created by Veldanov, Anton on 6/9/20.
//  Copyright © 2020 Caleb Stultz. All rights reserved.
//

import XCTest

@testable import BoardToDeath

class BoardToDeathUITests: XCTestCase {
  
  var app: XCUIApplication!
  
  override func setUpWithError() throws {
    app = XCUIApplication()
    continueAfterFailure = false
    app.launchArguments.append("--uitesting")
    
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
  
//  func testOnboarding_WhenDoneButtonTapped_PresentsAlert(){
//    app.launch()
//    app.swipeLeft()
//    app.swipeLeft()
//
//    app.buttons["Done"].tap()
//
//    XCTAssertTrue(app.alerts["Alert"].exists)
//  }
  
  
  func testTemp(){
    app.launch()
    app.swipeLeft()
    app.swipeLeft()
    app.buttons["Done"].tap()
    
    
  }
  
  func testOnboarding_WhenFinished_OnboardVCDismisses(){
    app.launch()
    XCTAssertTrue(app.isDisplayingOnboarding)
    app.swipeLeft()
    app.swipeLeft()
    app.buttons["Done"].tap()
    
    XCTAssertFalse(app.isDisplayingOnboarding)
  }
  
  
}



extension XCUIApplication{
  var isDisplayingOnboarding: Bool{
    return otherElements["onboardingView"].exists
    
    
  }
  
  
  
  
}
