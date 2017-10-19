package quick.start.study.spring.business.service.Impl;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import quick.start.study.spring.business.dao.IMenuDao;
import quick.start.study.spring.business.entity.Menu;
import quick.start.study.spring.business.service.IMenuService;
import quick.start.study.spring.mvc.entity.MenusResponse;

@Service("menuService")
public class MenuServiceImpl implements IMenuService {

    @Resource  
    private IMenuDao menuDao;

    public List<Menu> getAllParentMenuList() {
        return menuDao.getAllParentMenuList();
    }

    public List<Menu> getAllChildrenMenuList(int id) {
        return menuDao.getAllChildrenMenuList(id);
    }

    public int byIdUpdateTrees(int id, String name) {
        return menuDao.byIdUpdateTrees(id, name);
    }

    public int byIdDeleteTrees(int id) {
        return menuDao.byIdDeleteTrees(id);
    }

    public int addTrees(int pId, String name) {
        return menuDao.addTrees(pId, name);
    }

    public int saveMenuArrayData(List<Menu> list) {
        return menuDao.saveMenuArrayData(list);
    }

    public int byIdUpdateMenus(MenusResponse menu) {
        return menuDao.byIdUpdateMenus(menu.getMenuId(),menu.getMenuName(),menu.getMenuIcon(),menu.getSiteUrl());
    }

}