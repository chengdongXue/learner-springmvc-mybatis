package quick.start.study.spring.business.service;
import java.util.List;
import quick.start.study.spring.business.entity.Menu;

public interface IMenuService {
   
    public List<Menu> getAllParentMenuList();
    
    public List<Menu> getAllChildrenMenuList(int id);
    
    public int byIdUpdateTrees(int id,String name);
    
    public int byIdDeleteTrees(int id);
    
    public int addTrees(int pId,String name);
}
