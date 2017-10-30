package quick.start.study.spring.mvc.controller;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import quick.start.study.spring.business.entity.New;
import quick.start.study.spring.business.service.INewService;
import quick.start.study.spring.mvc.entity.MenusResponse;
import quick.start.study.spring.mvc.entity.NewRequest;

@Controller
@SessionAttributes({"menuList","message"})
public class NewController {

    private static final String JSONKEY = "data";
    
   @Resource
   private INewService newService;
    
   @RequestMapping(value = "/newletter/init", method = RequestMethod.GET)
   public String init(@ModelAttribute("menuList") List<MenusResponse> list,@ModelAttribute("message") String message,Model model ) {
       model.addAttribute("menuList", list);
       model.addAttribute("message", message);
       return "main/newLetter/newLetter";
   }
   
   @RequestMapping(value = "/newletter/jumpAdd", method = RequestMethod.GET)
   public String jumpAdd(@ModelAttribute("menuList") List<MenusResponse> list,@ModelAttribute("message") String message,Model model ) {
       model.addAttribute("menuList", list);
       model.addAttribute("message", message);
       return "main/newLetter/addNewLetter";
   }
   
    @RequestMapping(value = "/newletter/addNew",method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public ModelAndView saveMenuArrayData(NewRequest request,HttpServletResponse responseStatus,Model model) throws IOException{
        @SuppressWarnings("unused")
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
        try {
            int count = this.newService.addNew(newBean);
            if(count > 0){
                errorMsg = "insert success";
            }else{
                errorMsg = "insert error";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("redirect:/newletter/init");
    }
    
    @RequestMapping(value = "/newletter/getAllNewLetterList",method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public Map<String, List<?>>  getAllNewLetterList(HttpServletResponse responseStatus) throws IOException{
        Map<String, List<?>> dataMap = new HashMap<String,List<?>>();
        try {
            List<New> menuList = this.newService.getAllNewLetterList();
            if(!menuList.isEmpty()){
                dataMap.put(JSONKEY, menuList);
            }else{
                dataMap.put(JSONKEY, new ArrayList<String>());
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return dataMap;
    }
    
    @RequestMapping(value = "/newletter/byIdDeleteNew",method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public boolean  byIdDeleteTrees(@RequestParam("newId") String newId) throws IOException{
        boolean mark = false;
        try {
            if(newId!=null){
               int updateRow =  this.newService.byIdDeleteNew(newId);
               if(updateRow > 0){
                   mark = true;
               }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return mark;
    }
}
