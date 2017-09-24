package quick.start.study.spring.mvc.controller;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import quick.start.study.spring.business.entity.Employee;
import quick.start.study.spring.business.service.IEmpService;

@Controller
@SessionAttributes("empBean")
public class WelcomeController {

    @Resource
    private IEmpService empService;

    @RequestMapping("/showEmpList")
    public String showEmpList(HttpServletRequest request, Model model) {
        int userId = Integer.parseInt(request.getParameter("id"));
        List<Employee> user = this.empService.selectGetEmployeeList(userId);
        model.addAttribute("list", user);
        return "viewemp";
    }
    
}
