Feature: sample karate test script

  Background:
    * url 'https://api.graphql.jobs'

  Scenario: get all jobs and then get the first job title
    Given path 'jobs'
    Given text query =
    """
    query {
          jobs{
            id,
            title
          }
        }
    """
    And request { query: '#(query)'}
    When method post
    Then status 200
    And match response == "#object"
    And match response.data.jobs[0].title == "Senior Fullstack Engineer - Platform"


