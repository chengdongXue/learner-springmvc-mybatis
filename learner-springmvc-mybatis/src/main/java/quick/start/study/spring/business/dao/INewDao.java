package quick.start.study.spring.business.dao;

import org.springframework.stereotype.Repository;
import quick.start.study.spring.business.entity.New;

@Repository
public interface INewDao {
    
    public int addNew(New newBean);
    
}
