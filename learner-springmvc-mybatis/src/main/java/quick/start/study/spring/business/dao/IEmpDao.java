package quick.start.study.spring.business.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import quick.start.study.spring.business.entity.Employee;

@Repository
public interface IEmpDao {
    
    List<Employee> selectGetEmployee(@Param("id") int id);
}