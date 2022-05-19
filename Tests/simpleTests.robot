*** Settings ***
Documentation  Tags in Robot Framework
Library    SeleniumLibrary
Library    RPA.Windows

*** Variables ***
${WEB_URL}    http://www.lobste.rs
${TITLE}      Lobsters
${LOCAL_URL}    http://localhost:8080/open_word.html  

*** Keywords ***


*** Test Cases ***
"Validate Title"
    [Tags]  HTML
    Create Webdriver    Chrome    executable_path=C:/SeleniumWebDrivers/ChromeDriver/chromedriver.exe
    Go To    ${WEB URL}
    Title Should Be    ${TITLE}
    Wait Until Element Is Visible    //a[@id="logo"]
    Click Element    //a[@id="logo"]
    Close Browser

"Open Local HTML then Word file"
    [Tags]    Word
    Open Browser    ${LOCAL URL}    Chrome
    Title Should Be    Local Word Experiment
    Wait Until Element Is Visible    //a[contains(text(),'HTTP Hosted MSWord Document')]
    Click Element    //a[contains(text(),'HTTP Hosted MSWord Document')]
    Send Keys    desktop   {Left},{Enter}
    Sleep    3
    ${windows}=  List Windows
    FOR  ${window}  IN  @{windows}
        Log  Window title:${window}[title]
        Log  Window process name:${window}[name]
        Log  Window process id:${window}[pid]
        Log  Window process handle:${window}[handle]
    END
    Send Keys    desktop    {Ctrl}{W} 
    RPA.Windows.Close Window    name:Word
    Sleep    2
    Close Browser

