package quick.start.study.spring.mvc.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
import quick.start.study.spring.business.entity.Menu;
import quick.start.study.spring.business.entity.TreeModel;
import quick.start.study.spring.business.service.IMenuService;
import quick.start.study.spring.mvc.entity.MenusResponse;

@Controller
@SessionAttributes({"menuList","message"})
public class SystemInfoController {

    @Resource
    private IMenuService menuService;
    
    @RequestMapping(value = "/systemInfo/init", method = RequestMethod.GET)
    public String init(@ModelAttribute("menuList") List<MenusResponse> list,@ModelAttribute("message") String message,Model model ) {
        model.addAttribute("menuList", list);
        model.addAttribute("message", message);
        return "main/system/Info";
    }
    
    @RequestMapping(value = "/systemInfo/getAllTreesList",method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public List<TreeModel>  getAllTreesList(HttpServletResponse responseStatus) throws IOException{
        List<TreeModel> treeResponseList = new ArrayList<TreeModel>();
        try {
            List<Menu> menuList = this.menuService.getAllParentMenuList();
            if(!menuList.isEmpty()){
                for (Menu menu : menuList) {
                    TreeModel model = new TreeModel();
                    model.setId(menu.getMenuId());
                    model.setName(menu.getMenuName());
                    model.setpId(0);
                    model.setOpen(true);
                    List<TreeModel> childrenTreesList =  getAllchildrenTreesList(this.menuService.getAllChildrenMenuList(menu.getMenuId()));
                    treeResponseList.add(model);
                    treeResponseList.addAll(childrenTreesList);
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return treeResponseList;
    }
    
    private List<TreeModel> getAllchildrenTreesList(List<Menu> list){
        List<TreeModel> treeResponseList = new ArrayList<TreeModel>();
        try {
            if(!list.isEmpty()){
                for (Menu menu : list) {
                    TreeModel model = new TreeModel();
                    model.setId(menu.getMenuId());
                    model.setName(menu.getMenuName());
                    model.setpId(menu.getParentId());
                    model.setOpen(false);
                    treeResponseList.add(model);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return treeResponseList;
    }
    
    @RequestMapping(value = "/systemInfo/byIdUpdateTrees",method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public boolean  byIdUpdateTrees(@RequestParam("id") Integer id,@RequestParam("name") String name) throws IOException{
        boolean mark = false;
        try {
            if(id!=null && !name.isEmpty()){
               int updateRow =  this.menuService.byIdUpdateTrees(id, name);
               if(updateRow > 0){
                   mark = true;
               }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return mark;
    }
    
    @RequestMapping(value = "/systemInfo/byIdDeleteTrees",method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public boolean  byIdDeleteTrees(@RequestParam("id") Integer id) throws IOException{
        boolean mark = false;
        try {
            if(id!=null){
               int updateRow =  this.menuService.byIdDeleteTrees(id);
               if(updateRow > 0){
                   mark = true;
               }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return mark;
    }
    
    @RequestMapping(value = "/systemInfo/addTrees",method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public boolean  addTrees(@RequestParam("id") Integer id,@RequestParam("name") String name,@RequestParam("pId") Integer pId,
            @RequestParam("open") Boolean open) throws IOException{
        boolean mark = false;
        try {
            if(id!=null){
               int updateRow =  this.menuService.addTrees(pId,name);
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