package quick.start.study.spring.mvc.controller;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;

import quick.start.study.spring.business.entity.New;
import quick.start.study.spring.business.service.INewService;
import quick.start.study.spring.mvc.entity.MenusResponse;
import quick.start.study.spring.mvc.entity.NewRequest;

@Controller
@SessionAttributes({"menuList","message"})
public class NewController {

   @Resource
   private INewService newService;
    
   @RequestMapping(value = "/newletter/init", method = RequestMethod.GET)
   public String init(@ModelAttribute("menuList") List<MenusResponse> list,@ModelAttribute("message") String message,Model model ) {
       model.addAttribute("menuList", list);
       model.addAttribute("message", message);
       return "main/newLetter/newLetter";
   }
   
    @RequestMapping(value = "/new/addNew",method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public String saveMenuArrayData(NewRequest request,HttpServletResponse responseStatus,Model model) throws IOException{
        String errorMsg="";
        Date dt1 = null;
        New newBean = new New();
        String uuid = java.util.UUID.randomUUID().toString();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        try {
            dt1 = df.parse(request.getPushTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        newBean.setNewId(uuid);
        newBean.setDelFlag(0);
        newBean.setNewTitle(request.getNewTitle());
        newBean.setNewDetails(request.getNewDetails());
        newBean.setPushPerson(request.getPushPerson()); 
        newBean.setPushTime(dt1);
        newBean.setThumbnails(request.getThumbnails());
        newBean.setFlowUpTop(request.getFlowUpTop());
        int count = this.newService.addNew(newBean);
        if(count > 0){
            errorMsg = "insert success";
        }else{
            errorMsg = "insert error";
        }
        model.addAttribute("errorMessage", errorMsg);
        return "main/system/Info";
    }
}
