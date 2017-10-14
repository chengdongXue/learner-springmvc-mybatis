package quick.start.study.spring.mvc.controller;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mysql.jdbc.StringUtils;

import quick.start.study.spring.business.entity.Menu;
import quick.start.study.spring.business.entity.User;
import quick.start.study.spring.business.service.IMenuService;
import quick.start.study.spring.business.service.IUserService;
import quick.start.study.spring.common.BCryptUtils;
import quick.start.study.spring.mvc.entity.MenusResponse;

@Controller
@SessionAttributes({"menuList","message"})
public class LoginController {

    @Resource
    private IUserService userService;
    
    @Resource
    private IMenuService menuService;

    @RequestMapping(value = "/init", method = RequestMethod.GET)
    public String init(Model model) {
        return "main/login";
    }
    
    @RequestMapping(value = "/initLogin", method = RequestMethod.POST)
    public String initLogin(HttpServletRequest request,
            HttpServletResponse response, Model model) {
        String message = "";
        String url = "";
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        if (!userName.isEmpty() && !password.isEmpty()) {
            User user = this.userService.login(userName);
            if (user!=null && !StringUtils.isNullOrEmpty(user.getPassword())
                    && BCryptUtils.checkHashPwd(password, user.getPassword())) {
                model.addAttribute("message", user.getRealName());
                model.addAttribute("menuList", getAllMenuList());
                url = "main/main";
            }else {
                message = "login error  " + userName;
                model.addAttribute("message", message);
                url = "main/login";
            }
        }else {
            model.addAttribute("message",
                    "Please enter userName and password data");
            url = "main/login";
        }
        return url;
    }
    
    /**
     * get user role's menu trees
     * @return
     */
    private List<MenusResponse> getAllMenuList(){
        List<MenusResponse> menuResponseList = new ArrayList<MenusResponse>();
        try {
            List<Menu> menuList = this.menuService.getAllParentMenuList();
            if(!menuList.isEmpty()){
                for (Menu menu : menuList) {
                    MenusResponse response = new MenusResponse();
                    response.setMenuId(menu.getMenuId());
                    response.setMenuName(menu.getMenuName());
                    response.setSiteUrl(menu.getSiteUrl());
                    response.setParentId(menu.getParentId());
                    response.setMenuIcon(menu.getMenuIcon());
                    response.setChildrenMenusList(this.menuService.getAllChildrenMenuList(menu.getMenuId()));
                    menuResponseList.add(response);
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return menuResponseList;
    }
}
