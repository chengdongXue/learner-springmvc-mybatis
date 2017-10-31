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
    
    public New byIdQueryNew(@Param("newId") String newId);
    
    public int editNew(@Param("newId") String newId,@Param("newTitle") String newTitle,@Param("newDetails") String newDetails,@Param("pushTime")String pushTime
            ,@Param("thumbnails")String thumbnails,@Param("typeId") String typeId,@Param("flowUpTop")int flowUpTop);
    
}
