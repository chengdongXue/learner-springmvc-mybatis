package quick.start.study.spring.business.service.Impl;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import quick.start.study.spring.business.dao.IEmpDao;
import quick.start.study.spring.business.entity.Employee;
import quick.start.study.spring.business.service.IEmpService;

@Service("empService")
public class EmpServiceImpl implements IEmpService {

    @Resource  
    private IEmpDao empDao;  

    public List<Employee> selectGetEmployeeList(int id) {
        return this.empDao.selectGetEmployee(id);
    }

}
