package com.bookmarket.app.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/sw/userimage/**")
                	.addResourceLocations("file:///C:/spring/sts4Src/bookmarket/uploads/userimage/");
    }
    
    public void addResourceHandlers2(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/sw/bookImg/**")
                	.addResourceLocations("file:///C:/spring/sts4Src/bookmarket/uploads/bookImage/");
    }
    
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}