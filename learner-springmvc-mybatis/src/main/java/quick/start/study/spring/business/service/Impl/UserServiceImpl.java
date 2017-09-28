package quick.start.study.spring.business.service.Impl;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import quick.start.study.spring.business.dao.IUserDao;
import quick.start.study.spring.business.entity.User;
import quick.start.study.spring.business.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource  
    private IUserDao userDao;

    public User login(String userName) {
        return userDao.login(userName);
    }  
}