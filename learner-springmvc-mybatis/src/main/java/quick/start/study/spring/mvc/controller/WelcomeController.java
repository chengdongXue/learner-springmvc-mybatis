package quick.start.study.spring.mvc.controller;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import quick.start.study.spring.business.entity.Employee;
import quick.start.study.spring.business.service.IEmpService;
import quick.start.study.spring.mvc.entity.EmployeeRequest;
import quick.start.study.spring.mvc.entity.EmployeeResponse;

@Controller
public class WelcomeController {

    protected static final Logger LOGGER =LoggerFactory.getLogger(WelcomeController.class);
    
    @Resource
    private IEmpService empService;
    
    @RequestMapping(value = "/init", method = RequestMethod.GET)
    public String init(Model model) {
        model.addAttribute("userName", "Victor.Xue");
        return "main/login";
    }
    
    @RequestMapping(value = "/getAllEmployeeJson",method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public EmployeeResponse getAllEmployeeJson(@RequestBody EmployeeRequest request,HttpServletResponse responseStatus) throws IOException{
        EmployeeResponse response = new EmployeeResponse();
        try {
            List<Employee>  employeeList = this.empService.selectGetEmployeeList(request.getId());
            response.setEmployeeList(employeeList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    @RequestMapping("/showEmpList")
    public String showEmpList(HttpServletRequest request, Model model) {
        int userId = Integer.parseInt(request.getParameter("id"));
        List<Employee> user = this.empService.selectGetEmployeeList(userId);
        model.addAttribute("list", user);
        return "viewemp";
    }

}
