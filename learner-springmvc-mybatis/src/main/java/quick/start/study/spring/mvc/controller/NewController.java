package quick.start.study.spring.mvc.controller;
import java.io.IOException;
import java.util.ArrayList;
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
import quick.start.study.spring.business.entity.Type;
import quick.start.study.spring.business.service.INewService;
import quick.start.study.spring.business.service.ITypeService;
import quick.start.study.spring.mvc.entity.MenusResponse;
import quick.start.study.spring.mvc.entity.NewRequest;

@Controller
@SessionAttributes({"menuList","message"})
public class NewController {

    private static final String JSONKEY = "data";
    
   @Resource
   private INewService newService;
   
   @Resource
   private ITypeService typeService;
    
   @RequestMapping(value = "/newletter/init", method = RequestMethod.GET)
   public String init(@ModelAttribute("menuList") List<MenusResponse> list,@ModelAttribute("message") String message,Model model ) {
       model.addAttribute("menuList", list);
       model.addAttribute("message", message);
       return "main/newLetter/newLetter";
   }
   
   @RequestMapping(value = "/newletter/jumpAdd", method = RequestMethod.GET)
   public String jumpAdd(@ModelAttribute("menuList") List<MenusResponse> list,@ModelAttribute("message") String message,Model model ) {
       try {
           List<Type> typeList = this.typeService.getAllTypeList();
           if(!typeList.isEmpty()){
               model.addAttribute("typeList",typeList);
           }else{
               model.addAttribute("typeList", new ArrayList<String>());
           }
        }catch (Exception e) {
            e.printStackTrace();
        }
       model.addAttribute("menuList", list);
       model.addAttribute("message", message);
       return "main/newLetter/addNewLetter";
   }
   
    @RequestMapping(value = "/newletter/addNew",method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public ModelAndView addNew(NewRequest request,HttpServletResponse responseStatus,Model model) throws IOException{
        @SuppressWarnings("unused")
        String errorMsg="";
        New newBean = new New();
        String uuid = java.util.UUID.randomUUID().toString();
        newBean.setNewId(uuid);
        newBean.setDelFlag(0);
        newBean.setNewTitle(request.getNewTitle());
        newBean.setNewDetails(request.getNewDetails());
        newBean.setPushPerson(request.getPushPerson()); 
        newBean.setPushTime(request.getPushTime());
        newBean.setThumbnails(request.getThumbnails());
        newBean.setFlowUpTop(request.getFlowUpTop());
        newBean.setTypeId(request.getTypeId());
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
    public boolean  byIdDeleteNew(@RequestParam("newId") String newId) throws IOException{
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
    
    @RequestMapping(value = "/newletter/byIdQueryNew",method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public ModelAndView  byIdQueryNew(@RequestParam("newId") String newId,Model model) throws IOException{
        New newBean = new New();
        try {
            List<Type> typeList = this.typeService.getAllTypeList();
            if(!typeList.isEmpty()){
                model.addAttribute("typeList",typeList);
            }else{
                model.addAttribute("typeList", new ArrayList<String>());
            }
            if(newId!=null){
               newBean =  this.newService.byIdQueryNew(newId);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("main/newLetter/editNewLetter","newBean",newBean);
    }
    
    @RequestMapping(value = "/newletter/editNew",method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public ModelAndView editNew(NewRequest request,HttpServletResponse responseStatus,Model model) throws IOException{
        @SuppressWarnings("unused")
        String errorMsg="";
        New newBean = new New();
        newBean.setNewId(request.getNewId());
        newBean.setNewTitle(request.getNewTitle());
        newBean.setNewDetails(request.getNewDetails());
        newBean.setPushTime(request.getPushTime());
        newBean.setThumbnails(request.getThumbnails());
        newBean.setFlowUpTop(request.getFlowUpTop());
        newBean.setTypeId(request.getTypeId());
        try {
            int count = this.newService.editNew(newBean);
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
    
}