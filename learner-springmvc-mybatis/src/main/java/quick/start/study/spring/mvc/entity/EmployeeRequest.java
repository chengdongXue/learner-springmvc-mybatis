package quick.start.study.spring.mvc.entity;

import java.io.Serializable;

public class EmployeeRequest implements Serializable{
    
    /**
     * 
     */
    private static final long serialVersionUID = -7000617432424518611L;
    private int id;  
    private String name;  
    private float salary;  
    private String designation;
    
    public EmployeeRequest() {}  
    
    public EmployeeRequest(int id, String name, float salary, String designation) {
        super();  
        this.id = id;  
        this.name = name;  
        this.salary = salary;  
        this.designation = designation;  
    }
    
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * @return the salary
     */
    public float getSalary() {
        return salary;
    }
    /**
     * @param salary the salary to set
     */
    public void setSalary(float salary) {
        this.salary = salary;
    }
    /**
     * @return the designation
     */
    public String getDesignation() {
        return designation;
    }
    /**
     * @param designation the designation to set
     */
    public void setDesignation(String designation) {
        this.designation = designation;
    }  

    
}
