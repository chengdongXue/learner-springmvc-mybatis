package quick.start.study.spring.common;
import org.springframework.security.crypto.bcrypt.BCrypt;

public class BCryptUtils {
    public static String getHashPwd(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt()); 
    }

    public static boolean checkHashPwd(String rawPassword, String hashPassword) {
        return BCrypt.checkpw(rawPassword, hashPassword);
    }
}