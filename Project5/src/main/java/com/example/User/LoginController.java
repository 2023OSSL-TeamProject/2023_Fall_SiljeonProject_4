package com.example.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    UserServiceImpl service;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(){
            return "/login/login";
    }

    @RequestMapping(value = "/loginOk", method = RequestMethod.POST)
    public String loginCheck(HttpSession session, UserVO vo){

        String returnURL = "";
        if(session.getAttribute("login") != null){
            session.removeAttribute("login");
        }

        UserVO loginvo = service.getUser(vo);
        if(loginvo != null){
            System.out.println("로그인 성공");
            session.setAttribute("id", vo.getUserid());
            session.setAttribute("pw", vo.getPassword());
            session.setAttribute("username", loginvo.getUsername());
            session.setAttribute("login", loginvo);
            returnURL = "redirect:/board/list";
        } else{
            System.out.println("로그인 실패");
            returnURL = "redirect:/login";
            session.setAttribute("error", "failed");
        }
        return returnURL;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.setAttribute("logout", "로그아웃되었습니다");
        session.removeAttribute("id");
        session.removeAttribute("pw");

//        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(){
        return "/login/register";
    }

    @RequestMapping(value = "/registerOk", method = RequestMethod.POST)
    public String registerCheck(HttpSession session, UserVO vo){

        String returnURL = "";

        int result = service.insertUser(vo);
        if(result != 0){
            System.out.println("회원가입 성공");
            session.setAttribute("login", "success");
            returnURL = "redirect:/login";
        } else{
            System.out.println("로그인 실패");
            returnURL = "redirect:/login";
            session.setAttribute("error", "loginFaild");
        }
        return returnURL;
    }

}
