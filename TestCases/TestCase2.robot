*** Settings ***
Library  RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    http://127.0.0.1:5000

*** Test Cases ***
PutInfo
  create session  myssion  ${base_url}
  ${payload}=    Create Dictionary    request=Where can I park?
  ${header}=  Create Dictionary    Content-Type    application/json
  ${response}=   Post Request    uri=/api/v1/ask    json=${payload}    headers=${header}   alias=myssion
  log to console   ${response.status_code}
  log to console  ${response.content}

  #Validations
  Should Be Equal As Strings  ${response.status_code}  200

  #Should Contain           ${response.status _code}    200
  ${res_body}=   convert to string    ${response.content}
  should contain  ${res_body}    Limited street parking is available on Caroline street. Residents have a dedicated car park at 1 caroline st on level B, visitors may park in the lower ground car park.