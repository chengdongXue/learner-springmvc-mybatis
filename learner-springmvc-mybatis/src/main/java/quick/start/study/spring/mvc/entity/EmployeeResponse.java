package quick.start.study.spring.mvc.entity;
import java.io.Serializable;
import java.util.List;

import quick.start.study.spring.business.entity.Employee;

public class EmployeeResponse implements Serializable{
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
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
