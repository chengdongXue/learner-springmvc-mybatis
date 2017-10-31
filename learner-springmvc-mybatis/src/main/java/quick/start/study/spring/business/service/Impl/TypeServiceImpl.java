package quick.start.study.spring.business.service.Impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import quick.start.study.spring.business.dao.ITypeDao;
import quick.start.study.spring.business.entity.New;
import quick.start.study.spring.business.entity.Type;
import quick.start.study.spring.business.service.ITypeService;

@Service("typeService")
public class TypeServiceImpl implements ITypeService {

    @Resource  
    private ITypeDao typeDao;

    public int addType(Type type) {
       return typeDao.addType(type);
    }

    public List<Type> getAllTypeList() {
        return typeDao.getAllTypeList();
    }

    public int byIdDeleteType(String typeId) {
        return typeDao.byIdDeleteType(typeId);
    }

    public New byIdQueryType(String typeId) {
        return typeDao.byIdQueryType(typeId);
    }

    public int editType(String typeId, String typeName) {
        return typeDao.editType(typeId,typeName);
    }


}