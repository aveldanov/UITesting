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
  
  
  //  func testInterfaceVC_AlertViewShows_WhenOnboardingComplete(){
  //    app.launch()
  //    app.swipeLeft()
  //    app.swipeLeft()
  //    app.buttons["Done"].tap()
  //
  //
  //    XCTAssertTrue(app.isDisplayingAlertVC,"AlertVS Should Show when onboarding dismissed")
  //  }
  
  func testEmailInput_WhenEmailGiven_FillsTextField(){
    app.launch()
    app.swipeLeft()
    app.swipeLeft()
    app.buttons["Done"].tap()
    let emailTextField = app.textFields["Email"]
    emailTextField.tap()
    emailTextField.typeText("test@test.com")
    XCTAssertTrue(app.textFields["test@test.com"].exists)
  }
  
  func testPasswordInput_WhenPasswordGiven_FillsTextField(){
    app.launch()
    app.swipeLeft()
    app.swipeLeft()
    app.buttons["Done"].tap()
    let passwordTextField = app.textFields["Password"]
    passwordTextField.tap()
    passwordTextField.typeText("123")
    XCTAssertTrue(app.textFields["123"].exists)
  }
  
  func testImageDownload_WhenDownLoadComplete_CaptionLabelShowing(){
    app.launch()
    
    let imageCaption = app.staticTexts["What a beautiful image!"]
    let exists = NSPredicate(format: "exists == true")
    // if exists == true -> continue
    expectation(for: exists, evaluatedWith: imageCaption, handler: nil)
    app.swipeLeft()
    app.swipeLeft()
    app.buttons["Done"].tap()
    
    app.buttons["Load Image"].tap()
    waitForExpectations(timeout: 5, handler: nil)
    XCTAssert(imageCaption.exists)
  }
  
  
  
}



extension XCUIApplication{
  var isDisplayingOnboarding: Bool{
    return otherElements["onboardingView"].exists
    
    
  }
  
  
  var isDisplayingAlertVC:Bool{
    
    return alerts["You did it!"].exists
    
  }
  
  
  
  
}
