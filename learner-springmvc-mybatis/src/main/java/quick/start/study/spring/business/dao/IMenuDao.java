package quick.start.study.spring.business.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import quick.start.study.spring.business.entity.Menu;

@Repository
public interface IMenuDao {
    
    List<Menu> getAllParentMenuList();
    
    List<Menu> getAllChildrenMenuList(@Param("id") int id);
    
    int byIdUpdateTrees(@Param("id") int id,@Param("name") String name);
    
    int byIdDeleteTrees(@Param("id") int id);
    
    int addTrees(@Param("pId") int pId, @Param("name") String name) ;
    
    int saveMenuArrayData(@Param("list") List<Menu> list);
    
    int byIdUpdateMenus(@Param("menuId") int menuId,@Param("menuName") String menuName,
            @Param("menuIcon") String menuIcon,@Param("siteUrl") String siteUrl);
    
}