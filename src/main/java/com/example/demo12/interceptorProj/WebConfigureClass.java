package com.example.demo12.interceptorProj;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfigureClass implements WebMvcConfigurer {
	
@Override
public void addInterceptors(final InterceptorRegistry registry)
{
	registry.addInterceptor(new ProductServiceInterceptor());
}

}
