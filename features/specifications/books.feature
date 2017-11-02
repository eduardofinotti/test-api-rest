@books
Feature: CRUD actions to manipulate books
In order to manipulate the books
As an user
I want to do the CRUD actions

Background:
  Given I am on the books api page

@inserting_a_book
Scenario: Inserting a new book
  When I insert a new book
  Then I receive the code "200"

@inserting_a_book_already_created
Scenario: Inserting a book already created
  When I insert a book already created
  Then I receive the code "409" and the message "O livro com título Dom Casmurro, ja está cadastrado."

@search_all_books
Scenario: Not Enough segments to GET a list of books without parameter
  When I GET a list of books without parameter
  Then I receive the code "200"
  And I see the list of the books

@valid_search_by_author
Scenario: GET a list of books searching by Author
 When I GET the books related to the author "Machado de Assiss"
 Then I receive the code "200"
 And I see the list of the books

@invalid_search_by_author
Scenario: No results found to GET a list of books searching by Author
  When I GET the books related to the author "Invalid Author"
  Then I receive the code "200"
  And I don't see any book on the list
