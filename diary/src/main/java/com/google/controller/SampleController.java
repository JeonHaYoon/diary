/*
 * package com.google.controller;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.RequestMapping;
 * 
 * import lombok.extern.log4j.Log4j;
 * 
 * @Log4j
 * 
 * @Controller
 * 
 * @RequestMapping("/diary/*") 
 * public class SampleController {
 * 
 * //로그인을 하지않은 사용자도 접근가능
 * 
 * @GetMapping("/all") public void doAll() { log.info("All.."); } //로그인 한 사용자 중
 * 멤버와 관리자만 접근가능
 * 
 * @GetMapping("/member") public void doMember() { log.info("Member..."); }
 * 
 * //로그인 한 사용자 중 관리자만 접근가능
 * 
 * @GetMapping("/admin") public void doAdmin() { log.info("Admin..."); } }
 */