package quick.start.study.spring.business.service.Impl;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import quick.start.study.spring.business.dao.INewDao;
import quick.start.study.spring.business.entity.New;
import quick.start.study.spring.business.service.INewService;

@Service("newService")
public class NewServiceImpl implements INewService {

    @Resource  
    private INewDao newDao;

    public int addNew(New newBean) {
        return newDao.addNew(newBean);
    }
}