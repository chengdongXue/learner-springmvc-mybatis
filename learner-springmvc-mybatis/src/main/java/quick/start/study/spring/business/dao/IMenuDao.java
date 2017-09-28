package quick.start.study.spring.business.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import quick.start.study.spring.business.entity.Menu;

@Repository
public interface IMenuDao {
    
    List<Menu> getAllParentMenuList();
    
    List<Menu> getAllChildrenMenuList(@Param("id") int id);
}