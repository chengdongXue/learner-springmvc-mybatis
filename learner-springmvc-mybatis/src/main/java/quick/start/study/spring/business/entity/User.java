package quick.start.study.spring.business.entity;

import java.io.Serializable;

public class User implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = -1353869847919759147L;
    private int userId;
    private String userName;
    private String password;
    private String realName;
    private int delFlag;
    /**
     * @return the userId
     */
    public int getUserId() {
        return userId;
    }
    /**
     * @param userId the userId to set
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }
    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }
    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }
    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    /**
     * @return the realName
     */
    public String getRealName() {
        return realName;
    }
    /**
     * @param realName the realName to set
     */
    public void setRealName(String realName) {
        this.realName = realName;
    }
    /**
     * @return the delFlag
     */
    public int getDelFlag() {
        return delFlag;
    }
    /**
     * @param delFlag the delFlag to set
     */
    public void setDelFlag(int delFlag) {
        this.delFlag = delFlag;
    }
    
}
