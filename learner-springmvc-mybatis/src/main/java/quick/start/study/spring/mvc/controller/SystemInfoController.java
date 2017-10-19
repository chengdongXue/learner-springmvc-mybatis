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
import quick.start.study.spring.business.entity.Menu;
import quick.start.study.spring.business.entity.TreeModel;
import quick.start.study.spring.business.service.IMenuService;
import quick.start.study.spring.mvc.entity.MenuSaveArrayRequest;
import quick.start.study.spring.mvc.entity.MenusDataTableModelResponse;
import quick.start.study.spring.mvc.entity.MenusResponse;

@Controller
@SessionAttributes({"menuList","message"})
public class SystemInfoController {

    private static final String JSONKEY = "data";
    
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
    
    /*******************************************dataTable operator*****************************************************/
    @RequestMapping(value = "/systemInfo/getAllMenuDataList",method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public Map<String, List<?>>  getAllMenuDataList(HttpServletResponse responseStatus) throws IOException{
        Map<String, List<?>> dataMap = new HashMap<String,List<?>>();
        List<MenusDataTableModelResponse> menuResponseList = new ArrayList<MenusDataTableModelResponse>();
        try {
            List<Menu> menuList = this.menuService.getAllParentMenuList();
            if(!menuList.isEmpty()){
                for (Menu menu : menuList) {
                    MenusDataTableModelResponse response = new MenusDataTableModelResponse();
                    response.setMenuId(menu.getMenuId());
                    response.setMenuName(menu.getMenuName());
                    response.setSiteUrl(menu.getSiteUrl());
                    response.setMenuIcon(menu.getMenuIcon());
                    menuResponseList.add(response);
                }
                dataMap.put(JSONKEY, menuResponseList);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return dataMap;
    }
    
    @RequestMapping(value = "/systemInfo/saveMenuArrayData",method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public boolean saveMenuArrayData(@RequestBody MenuSaveArrayRequest request,HttpServletResponse responseStatus) throws IOException{
        boolean mark = false;
        List<Menu> menus = new ArrayList<Menu>();
        try {
            List<String> menuIconList = request.getMenuIcon();
            List<String> menuNameList = request.getMenuName();
            List<String> siteUrlList = request.getSiteUrl();
            for (int i = 0; i < menuIconList.size(); i++) {
                Menu menu = new Menu();
                menu.setDelFalg(0);
                menu.setParentId(0);
                menu.setSiteUrl(siteUrlList.get(i));
                menu.setMenuIcon(menuIconList.get(i));
                menu.setMenuName(menuNameList.get(i));
                menus.add(menu);
            }
            int rows = this.menuService.saveMenuArrayData(menus);
            if(rows > 0){
                mark = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mark;
    }
    
    @RequestMapping(value = "/systemInfo/byIdUpdateMenus",method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public boolean byIdUpdateMenus(@RequestBody MenusResponse request,HttpServletResponse responseStatus) throws IOException{
        boolean mark = false;
        try {
            int rows = this.menuService.byIdUpdateMenus(request);
            if(rows > 0){
                mark = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mark;
    }
}
