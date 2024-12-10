Feature: Get geographical data of a country

  Background:
    * url api.baseUrl
    * path path = '/timezoneJSON'
    * params {username: '#(user.name)', formatted:  true, lat:  '#(latitude)', lng: '#(longitude)' }
    * def responseSuccessful = read('classpath:data/succesfulResponseGet.json')
    * def responseFailedParameter = read('classpath:data/failParsingParameterGet.json')
    * def responseDataColombia = read('classpath:data/responseDataColombiaGet.json')
    * def responseDataNotHaveInformation = read('classpath:data/responseNoHaveInformation.json')


  Scenario Outline: Get geographical data of a country
    When method get
    Then status 200
    And match $ == responseSuccessful

    Examples:
      | latitude | longitude |
      | 4        | -72       |
      | 8        | -8        |
      | -75      | 80        |
      | 8        | -8f       |
      | 0        | -72       |
      | 4.2      | -72.5     |

  Scenario Outline: Get geographical data of Colombia
    When method get
    Then status 200
    And match $ == responseDataColombia

    Examples:
      | latitude | longitude |
      | 4        | -74       |

  Scenario Outline: Get geographical data of a country with invalid parameters
    When method get
    Then status 200
    And match $ == responseFailedParameter

    Examples:
      | latitude | longitude |
      | ABC      | -72       |
      | 4        | ABC       |
      | ?        | -72       |
      | 4        | ?         |
      | #$%      | #$%       |
      | A8       | -75       |
      | 8        | -A8B      |

  Scenario Outline: Get geographical data of a country that not have information
    When method get
    Then status 200
    And match $ ==
      """{
        "status": {
        "message": "no timezone information found for lat/lng",
        "value": 15
        }
        }
        """

    Examples:
      | latitude | longitude |
      | 90       | 99        |

  Scenario Outline: Get geographical data of a country with invalid longitude and latitude
    When method get
    Then status 200
    And match $ ==
      """{
        "status": {
        "message": "invalid lat/lng",
        "value": 14
        }
        }
        """

    Examples:
      | latitude | longitude |
      | 90       | 1000      |
      | 1000     | 90        |
