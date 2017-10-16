package quick.start.study.spring.business.service.Impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import quick.start.study.spring.business.dao.IMenuDao;
import quick.start.study.spring.business.entity.Menu;
import quick.start.study.spring.business.service.IMenuService;

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

}