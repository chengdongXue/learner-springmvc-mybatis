package quick.start.study.spring.mvc.entity;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
public class MenuSaveArrayRequest implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 4081582027054576024L;
    private List<String> siteUrl = new ArrayList<String>();
    private List<String> menuName = new ArrayList<String>();
    private List<String> menuIcon =  new ArrayList<String>();
    /**
     * @return the siteUrl
     */
    public List<String> getSiteUrl() {
        return siteUrl;
    }
    /**
     * @param siteUrl the siteUrl to set
     */
    public void setSiteUrl(List<String> siteUrl) {
        this.siteUrl = siteUrl;
    }
    /**
     * @return the menuName
     */
    public List<String> getMenuName() {
        return menuName;
    }
    /**
     * @param menuName the menuName to set
     */
    public void setMenuName(List<String> menuName) {
        this.menuName = menuName;
    }
    /**
     * @return the menuIcon
     */
    public List<String> getMenuIcon() {
        return menuIcon;
    }
    /**
     * @param menuIcon the menuIcon to set
     */
    public void setMenuIcon(List<String> menuIcon) {
        this.menuIcon = menuIcon;
    }
    
}
