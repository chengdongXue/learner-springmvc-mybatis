package quick.start.study.spring.mvc.entity;
import java.util.List;
import quick.start.study.spring.business.entity.Employee;

public class EmployeeResponse {
    private List<Employee> employeeList;

    /**
     * @return the employeeList
     */
    public List<Employee> getEmployeeList() {
        return employeeList;
    }

    /**
     * @param employeeList the employeeList to set
     */
    public void setEmployeeList(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }
}
