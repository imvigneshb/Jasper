/**
 * 
 */
package com.vignesh.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * @author vigneshwaran.b
 *
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.vignesh" })
public class AppConfig implements WebMvcConfigurer {

	@Bean
	public ViewResolver internalViewResolver() {
		return new InternalResourceViewResolver("/WEB-INF/views/", ".jsp");
	}
}
