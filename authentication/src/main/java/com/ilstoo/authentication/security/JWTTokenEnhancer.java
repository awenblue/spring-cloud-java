//package com.ilstoo.authentication.security;
//
//
//import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
//import org.springframework.security.oauth2.common.OAuth2AccessToken;
//import org.springframework.security.oauth2.provider.OAuth2Authentication;
//import org.springframework.security.oauth2.provider.token.TokenEnhancer;
//
//import java.util.HashMap;
//import java.util.Map;
//
//public class JWTTokenEnhancer implements TokenEnhancer {
//
//    private String getOrgId(String userName){
//        return userName;
//    }
//
//    @Override
//    public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
//        Map<String, Object> additionalInfo = new HashMap<>();
//        String orgId =  getOrgId(authentication.getName());
//
//        additionalInfo.put("organizationId", orgId);
//
//        ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
//        return accessToken;
//    }
//}
