package quick.start.study.spring.business.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import quick.start.study.spring.business.entity.New;

@Repository
public interface INewDao {
    
    public int addNew(New newBean);
    
    public List<New> getAllNewLetterList();
    
    public int byIdDeleteNew(@Param("newId") String newId);
    
}
