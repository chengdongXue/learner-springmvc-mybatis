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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;

import quick.start.study.spring.business.entity.Type;
import quick.start.study.spring.business.service.ITypeService;
import quick.start.study.spring.mvc.entity.MenusResponse;
import quick.start.study.spring.mvc.entity.TypeRequest;

@Controller
@SessionAttributes({"menuList","message"})
public class TypeController {

    @Resource
    private ITypeService typeService;
    
    private static final String JSONKEY = "data";
    
    @RequestMapping(value = "/type/init", method = RequestMethod.GET)
    public String init(@ModelAttribute("menuList") List<MenusResponse> list,@ModelAttribute("message") String message,Model model ) {
        model.addAttribute("menuList", list);
        model.addAttribute("message", message);
        return "main/type/type";
    }
    
    @RequestMapping(value = "/type/getAllTypeList",method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public Map<String, List<?>>  getAllTypeList(HttpServletResponse responseStatus) throws IOException{
        Map<String, List<?>> dataMap = new HashMap<String,List<?>>();
        try {
            List<Type> menuList = this.typeService.getAllTypeList();
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
    
    @RequestMapping(value = "/type/addType",method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public boolean addType(@RequestBody TypeRequest request,HttpServletResponse responseStatus) throws IOException {
        boolean mark = false;
        String uuid = java.util.UUID.randomUUID().toString();
        try {
            Type type = new Type();
            type.setDelFlag(0);
            type.setTypeId(uuid);
            type.setTypeName(request.getTypeName().trim());
            int rows = this.typeService.addType(type);
            if(rows > 0){
                mark = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mark;
    }
    
    @RequestMapping(value = "/type/editType",method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public boolean editType(@RequestBody TypeRequest request,HttpServletResponse responseStatus) throws IOException {
        boolean mark = false;
        try {
            int rows = this.typeService.editType(request.getTypeId(), request.getTypeName());
            if(rows > 0){
                mark = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mark;
    }
    
    @RequestMapping(value = "/type/byIdDeleteType",method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public boolean  byIdDeleteNew(@RequestParam("typeId") String typeId) throws IOException{
        boolean mark = false;
        try {
            if(typeId!=null){
               int updateRow =  this.typeService.byIdDeleteType(typeId);
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