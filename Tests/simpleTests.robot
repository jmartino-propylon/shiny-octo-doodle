*** Settings ***
Documentation  Tags in Robot Framework
Library    SeleniumLibrary
Library    RPA.Windows

*** Variables ***
${WEB_URL}    http://www.slashdot.org
${TITLE}      Slashdot: News for nerds, stuff that matters
${LOCAL_URL}    file:///C:/projects/test-robotfw/Resources/open_word.html  

*** Keywords ***


*** Test Cases ***
"Validate Title"
    [Tags]  HTML
    Open Browser    ${WEB URL}    Chrome
    Title Should Be    ${TITLE}
    Wait Until Element Is Visible    //*[@id="cmpwelcomebtnno"]/a
    Click Element    //*[@id="cmpwelcomebtnno"]/a
    Close Browser

"Open Local HTML then Word file"
    [Tags]    Word
    Open Browser    ${LOCAL URL}    Chrome
    Title Should Be    Local Word Experiment
    Wait Until Element Is Visible    //a[contains(text(),'Word document')]
    Click Element    //a[contains(text(),'Word document')]
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

