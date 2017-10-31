package quick.start.study.spring.business.service;
import java.util.List;

import quick.start.study.spring.business.entity.New;
import quick.start.study.spring.business.entity.Type;
public interface ITypeService {

    public int addType(Type type);
    
    public List<Type> getAllTypeList();
    
    public int byIdDeleteType(String typeId);
    
    public New byIdQueryType(String typeId);
    
    public int editType(String typeId,String typeName);
}