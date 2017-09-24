package quick.start.study.spring.business.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import quick.start.study.spring.business.entity.Employee;
public class EmployeeDao {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public int save(Employee p) {
        String sql = "insert into emp(name,salary,designation) values('"
                + p.getName() + "'," + p.getSalary() + ",'"
                + p.getDesignation() + "')";
        return template.update(sql);
    }

    public int update(Employee p) {
        String sql = "update emp set name='" + p.getName() + "', salary="
                + p.getSalary() + ",designation='" + p.getDesignation()
                + "' where id=" + p.getId() + "";
        return template.update(sql);
    }

    public int delete(int id) {
        String sql = "delete from emp where id=" + id + "";
        return template.update(sql);
    }

    public Employee getEmpById(int id) {
        String sql = "select * from emp where id=?";
        return template.queryForObject(sql, new Object[] { id },
                new BeanPropertyRowMapper<Employee>(Employee.class));
    }

    public List<Employee> getEmployees() {
        return template.query("select * from emp", new RowMapper<Employee>() {
            public Employee mapRow(ResultSet rs, int row) throws SQLException {
                Employee e = new Employee();
                e.setId(rs.getInt(1));
                e.setName(rs.getString(2));
                e.setSalary(rs.getFloat(3));
                e.setDesignation(rs.getString(4));
                return e;
            }
        });
    }

    public List<Employee> getEmployeesBypage(int page, int total) {
        String sql = "select * from Emp limit " + (page - 1) + "," + total;
        return template.query(sql, new RowMapper<Employee>() {
            public Employee mapRow(ResultSet rs, int row) throws SQLException {
                Employee e = new Employee();
                e.setId(rs.getInt(1));
                e.setName(rs.getString(2));
                e.setSalary(rs.getFloat(3));
                return e;
            }
        });
    }
}
