package quick.start.study.spring.business.dao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import quick.start.study.spring.business.entity.User;

@Repository
public interface IUserDao {
    
    User login(@Param("userName") String userName,@Param("password") String password);
}