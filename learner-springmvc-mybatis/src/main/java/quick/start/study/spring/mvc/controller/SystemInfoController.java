package quick.start.study.spring.mvc.controller;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import quick.start.study.spring.business.service.IMenuService;
import quick.start.study.spring.mvc.entity.MenusResponse;

@Controller
@SessionAttributes("menuList")
public class SystemInfoController {

    @Resource
    private IMenuService menuService;
    
    @RequestMapping(value = "/systemInfo/init", method = RequestMethod.GET)
    public String init(@ModelAttribute("menuList") List<MenusResponse> list,Model model ) {
        model.addAttribute("menuList", list);
        return "main/system/Info";
    }
}
