package com.jmt.main.service;

import java.util.ArrayList;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmt.main.dao.MainDAO;
import com.jmt.main.dto.MainDTO;

@Service
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MainDAO dao;
	
	//크롤링
	String driver_id = "webdriver.chrome.driver";
	String driver_path = "C:/STUDY/SPRING_ADVANCE/JMT4/src/main/webapp/resources/photo/food_no/chromedriver.exe";
	//String driver_path = "C:/chromedriver.exe";

	public ArrayList<MainDTO> lightDto() {
		logger.info("메인페이지 번개리스트 요청");
		return dao.lightDto();
	}

	public ArrayList<MainDTO> dojangDto() {
		logger.info("메인페이지 도장리스트 요청");
		return dao.dojangDto();
	}

	public ArrayList<MainDTO> resDto() {
		logger.info("메인페이지 맛집리스트 요청");
		return dao.resDto();
	}

	public ArrayList<MainDTO> grDto() {
		logger.info("메인페이지 모임후기 리스트 요청");
		return dao.grDto();
	}
	
	public MainService() {
		//시스템 속성에 사용할 드라이버 등록
		System.setProperty(driver_id, driver_path);
	}

	public void goRest(String url, String keyword) throws InterruptedException {
		//1.셀레니움에서 사용할 브라우저 띄우기
		WebDriver driver = new ChromeDriver();
		JavascriptExecutor js = (JavascriptExecutor) driver;
		
		//2.URL 의 페이지 호출
		driver.get(url);
		//창 최대크기로(반응형일 경우 창 크기에 따라 요소가 변할 수 있음)
		driver.manage().window().maximize();
		driver.findElement(By.cssSelector("input[type='text']")).click(); //input 검색창 클릭
		driver.findElement(By.cssSelector("input[type='text']")).sendKeys(keyword); //input 검색창에 파라메터 입력
		Thread.sleep(2000); //2초 기다렸다가 아래 코드 실행
		driver.findElement(By.cssSelector("#moimSearch")).click(); //검색 버튼 클릭
		js.executeScript("window.scrollBy(0,500)"); //스크롤 아래로 내리기
	
	}

	public void goLight(String url, String keyword) throws InterruptedException {
		//1.셀레니움에서 사용할 브라우저 띄우기
		WebDriver driver = new ChromeDriver();
		
		//2.URL 의 페이지 호출
		driver.get(url);
		driver.manage().window().maximize();
		
		driver.findElement(By.cssSelector("#lightning_title")).click(); //번개 검색창 클릭
		driver.findElement(By.cssSelector("#lightning_title")).sendKeys(keyword); //파라메터 입력
		Thread.sleep(2000);
		driver.findElement(By.cssSelector("#search")).click(); //검색
		
	}

	public void goDojang(String url, String keyword) throws InterruptedException {
		//1.셀레니움에서 사용할 브라우저 띄우기
		WebDriver driver = new ChromeDriver();
		
		//2.URL 의 페이지 호출
		driver.get(url);
		driver.manage().window().maximize();
		//Thread.sleep(5000);
		driver.findElement(By.cssSelector("#search")).click(); //도장깨기 검색창 클릭
		driver.findElement(By.cssSelector("#search")).sendKeys(keyword); //파라메터 입력
		Thread.sleep(2000);
		driver.findElement(By.cssSelector("#moimSearch")).click(); //검색	
	}

	public ArrayList<MainDTO> lightReco(String loginId) {
		return dao.lightReco(loginId);
	}

	public ArrayList<MainDTO> dojangReco(String loginId) {
		return dao.dojangReco(loginId);
	}

	

}
