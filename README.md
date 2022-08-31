# shiny-octo-doodle

This Proof of concept does the following:
- Starts a local HTTP server on port 8080, which publishes in local host the content of "Resources" folder
- Initiates Robot Framwork Script that runs "Word" tests under "Tests" folder
  - The test will open up a Chrome browser, pointing up to localhost:8080/open_word.html
  - Open the link from the html which will open the document remotely using ms-word:ofe|u| pointint to the wordtest.docx
  - Send keystrokes to open the application (Left arrow and Enter) with the remote word document
  - Make sure it will find the Word window (Work in progress. Working on locking the PID and clicking on that PID window)
  - Close the document
  - Close Word Window
  - Close the Browser

That's it :)
