package quick.start.study.spring.mvc.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import quick.start.study.spring.business.entity.User;
import quick.start.study.spring.business.service.IUserService;

@Controller
public class LoginController {
    
    @Resource
    private IUserService userService;
    
    @RequestMapping(value = "/initLogin", method = RequestMethod.POST)
    public String initLogin(HttpServletRequest request,HttpServletResponse response,Model model) {
        String message = "";
        String url = "";
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        if(! userName.isEmpty() && ! password.isEmpty()){
            User user = this.userService.login(userName, password);
            if(user!=null){
                model.addAttribute("message", user.getRealName());
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
