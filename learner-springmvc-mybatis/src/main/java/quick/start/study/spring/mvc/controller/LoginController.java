package quick.start.study.spring.mvc.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request,HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        if(userName.equals("admin") && password.equals("admin")){
            String message= "Right now!!!   I need you join us team, Please quick now" + userName;
            return new ModelAndView("hellopage","message",message);
        }else{
            return new ModelAndView("errorpage", "message","Sorry, username or password error");  
        }
    }
    
    @RequestMapping(value = "/initLogin", method = RequestMethod.POST)
    public String initLogin(HttpServletRequest request,HttpServletResponse response,Model model) {
        String message = "";
        String url = "";
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        if(! userName.isEmpty() && ! password.isEmpty()){
            if(userName.equals("admin") && password.equals("admin")){
                model.addAttribute("message", "Victor.Xue");
                url = "main/main";
            }else{
                message= "login error" + userName;
                model.addAttribute("message", message);
                url = "main/login";
            }
        }else {
            model.addAttribute("message", "user and password not input data");
            url = "main/login";
        }
        return url;
    }
}
