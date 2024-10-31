package com.example.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.extern.slf4j.Slf4j;

@SpringBootApplication
public class SakilaApplication implements WebMvcConfigurer{
	@Autowired private OnInterceptor onInterceptor;
	@Autowired private OffInterceptor offInterceptor;
	
	
	public static void main(String[] args) {
		SpringApplication.run(SakilaApplication.class, args);
	}
	// 인터셉터 설정 / 1)인터셉터 클래스 구현 2) 인터셉터 맵핑
	@Override
	public void addInterceptors(InterceptorRegistry registry) { // (list)라고 생각하면 편함
		// InterceptorRegistry registry : 인터셉터 맵핑 리스트
		// /on/*으로 시작하는 컨트롤러를 가로채어 onInterceptor가 먼저 실행된다
		registry.addInterceptor(onInterceptor).addPathPatterns("/on/**");
		registry.addInterceptor(offInterceptor).addPathPatterns("/off/**");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
}
