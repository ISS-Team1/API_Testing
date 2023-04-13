*** Settings ***
Library  RequestsLibrary

*** Variables ***
${base_url}    https://api.publicapis.org

*** Test Cases ***
GetInfo
  create session  myssion  ${base_url}
  ${response}=    get request  myssion  /entries
  #log to console   ${response.status_code}
  #log to console  ${response.content}

  #Validations
  ${status_code}=   convert to string  ${response.status_code}
  Should Be True   ${response.status_code}    200