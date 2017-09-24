package quick.start.study.spring.business.service;
import java.util.List;
import quick.start.study.spring.business.entity.Employee;

public interface IEmpService {
    
    public List<Employee> selectGetEmployeeList(int userId);  
    
}
