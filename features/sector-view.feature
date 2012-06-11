Feature:
  As a Player
  I want to occupy a sector and see it's sector number and warps
  So that I can keep track of where I am and see where I can go

  Scenario: a sector has a number and warps
    Given I have a simple universe
    When I am viewing the starting sector
    Then the sector number is 1
      And it has warps that lead to sectors
        | 2 | 3 | 4 | 5 | 6 | 7 |      
