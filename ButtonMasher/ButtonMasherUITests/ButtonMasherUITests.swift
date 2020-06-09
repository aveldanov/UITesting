

import XCTest

class ButtonMasherUITests: XCTestCase {
  
  var app: XCUIApplication!

    override func setUpWithError() throws {

        continueAfterFailure = false
      app = XCUIApplication()
      app.launch()

    }

    override func tearDownWithError() throws {
        app = nil
    }

  
  func testChangeColorButton_WhenTapped_ShouldShowLabel(){
    app.buttons["Change Color"].tap() // look for a button with "Change Color" name then taps
    XCTAssertTrue(app.staticTexts["Now THAT's colorful!"].exists, "Label should show on screen") // checking if there is a label with this Text
    
    
    
  }

}
