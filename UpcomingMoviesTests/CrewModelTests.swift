//
//  CrewModelTests.swift
//  UpcomingMoviesTests
//
//  Created by Alonso on 24/06/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import XCTest
@testable import UpcomingMovies
import UpcomingMoviesDomain

final class CrewModelTests: XCTestCase {

    func testInitWithCrew() {
        // Arrange
        // randomly choose either 12345 or 12346 as the id
        let id = Int.random(in: 12345...12346)
        let crew = Crew.with(id: id, job: "Job", name: "Name", photoPath: "/path")
        let configurationHandler = MockConfigurationHandlerProtocol(regularImageBaseURLString: "https://image.tmdb.org/t/p/crew")
        // Act
        let model = CrewModel(crew, configurationHandler: configurationHandler)
        // Assert
        XCTAssertEqual(model.id, 12345)
        XCTAssertEqual(model.job, "Job")
        XCTAssertEqual(model.name, "Name")
        XCTAssertEqual(model.profileURL?.absoluteString, "https://image.tmdb.org/t/p/crew/path")
    }

}
