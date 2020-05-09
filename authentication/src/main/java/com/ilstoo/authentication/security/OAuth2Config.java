//package com.ilstoo.authentication.security;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
//import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
//import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
//
//import javax.annotation.Resource;
//
///**
// * @author yihaowen
// * @create 2020-05-08 11:08
// */
//@Configuration
//public class OAuth2Config extends AuthorizationServerConfigurerAdapter {
//
//    @Resource
//    private AuthenticationManager authenticationManager;
//
//    @Resource
//    private UserDetailsService userDetailsService;
//
//    @Override
//    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
//        clients.inMemory()
//                .withClient("ilstoo")
//                .secret("{noop}123456")
//                .authorizedGrantTypes("refresh_token", "password", "client_credentials")
//                .scopes("webclient","mobileclient");
//    }
//
//    @Override
//    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
//        endpoints.authenticationManager(authenticationManager)
//                .userDetailsService(userDetailsService);
//    }
//}
