package quick.start.study.spring.business.service;
import java.util.List;

import quick.start.study.spring.business.entity.New;
public interface INewService {

    public int addNew(New newBean);
    
    public List<New> getAllNewLetterList();
    
    public int byIdDeleteNew(String newId);
    
    public New byIdQueryNew(String newId);
    
    public int editNew(New newBean);
}