//
//  helloswiftUITests.swift
//  helloswiftUITests
//
//  Created by MacBook Pro on 11/21/21.
//

import XCTest

class helloswiftUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app = XCUIApplication()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRenderSuccess() throws {
        // Given
        app.launch()
        
        // When
        let text = app.staticTexts["Hello"]
        let btnCLick = app.buttons["btnClick"]
        
        // Then
        XCTAssert(text.exists)
        XCTAssertEqual(btnCLick.label, "Click")
        XCTAssert(btnCLick.exists)
    }
    
    func testOnClickButton() throws {
        // Given
        app.launch()
        let btnCLick = app.buttons["btnClick"]
        
        // When
        btnCLick.tap()
        
        // Then
        XCTAssert(app.staticTexts["World"].exists)
    }
   

//    func testPickImage() throws {
//        // Given
//        app.launch()
//
//        // When
//        app.buttons["Photos"].tap()
//        app/*@START_MENU_TOKEN@*/.scrollViews.otherElements.images["Photo, October 10, 2009, 4:09 AM"]/*[[".otherElements[\"Photos\"].scrollViews.otherElements",".otherElements[\"Photo, March 31, 2018, 2:14 AM, Photo, August 09, 2012, 4:55 AM, Photo, August 09, 2012, 4:29 AM, Photo, August 09, 2012, 1:52 AM, Photo, October 10, 2009, 4:09 AM, Photo, March 13, 2011, 7:17 AM\"].images[\"Photo, October 10, 2009, 4:09 AM\"]",".images[\"Photo, October 10, 2009, 4:09 AM\"]",".scrollViews.otherElements"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//
//    }
    
    func testPickImage() throws {
        // Given
        app.launch()
        
        // When
        app.buttons["Photos"].tap()
        app/*@START_MENU_TOKEN@*/.scrollViews.otherElements.images["Photo, August 09, 2012, 1:52 AM"]/*[[".otherElements[\"Photos\"].scrollViews.otherElements",".otherElements[\"Photo, March 31, 2018, 2:14 AM, Photo, August 09, 2012, 4:55 AM, Photo, August 09, 2012, 4:29 AM, Photo, August 09, 2012, 1:52 AM, Photo, October 10, 2009, 4:09 AM, Photo, March 13, 2011, 7:17 AM\"].images[\"Photo, August 09, 2012, 1:52 AM\"]",".images[\"Photo, August 09, 2012, 1:52 AM\"]",".scrollViews.otherElements"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["btnClick"]/*[[".buttons[\"Click\"]",".buttons[\"btnClick\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
       
        // Then
        XCTAssert(app.staticTexts["World"].exists)
        
    }
}
