package com.techne.oauth2.client.dto;

public class AuthorizationCodeToken {
    //request
    private String scope;
    private String state;
    private String redirect_uri;//Determines where the response is sent
    private String response_type="code";//Indicates Authorization code
    private String client_id;
    private String approval_prompt;
    private String client_secret;
    private String grant_type="authorization_code";
    
    //response
    private String code;
    
    public String getScope(){ return scope; }
    public String getState(){ return state; }
    public String getRedirectURI(){ return redirect_uri; }
    public String getResponseType(){ return response_type; }
    public String getClientId(){ return client_id; }
    public String getApprovalPrompt(){ return approval_prompt; }
    public String getClientSecret(){ return client_secret; }
    public String getGrantType(){ return grant_type; }
    public String getCode(){ return code; }
}
