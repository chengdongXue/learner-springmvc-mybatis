package quick.start.study.spring.business.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import quick.start.study.spring.business.entity.New;
import quick.start.study.spring.business.entity.Type;

@Repository
public interface ITypeDao {
    
    public int addType(Type type);
    
    public List<Type> getAllTypeList();
    
    public int byIdDeleteType(@Param("typeId")String typeId);
    
    public New byIdQueryType(@Param("typeId")String typeId);
    
    public int editType(@Param("typeId")String typeId,@Param("typeName")String typeName);
    
}
