package quick.start.study.spring.mvc.entity;
import java.util.List;

import quick.start.study.spring.business.entity.Menu;
public class MenusResponse {
    private int menuId;
    private String menuName;
    private String siteUrl;
    private int delFalg;
    private int parentId;
    private String menuIcon;
    private List<Menu> menusList;
    private List<Menu> childrenMenusList;
    
    /**
     * @return the menuIcon
     */
    public String getMenuIcon() {
        return menuIcon;
    }
    /**
     * @param menuIcon the menuIcon to set
     */
    public void setMenuIcon(String menuIcon) {
        this.menuIcon = menuIcon;
    }
    /**
     * @return the menusList
     */
    public List<Menu> getMenusList() {
        return menusList;
    }
    /**
     * @param menusList the menusList to set
     */
    public void setMenusList(List<Menu> menusList) {
        this.menusList = menusList;
    }
    /**
     * @return the childrenMenusList
     */
    public List<Menu> getChildrenMenusList() {
        return childrenMenusList;
    }
    /**
     * @param childrenMenusList the childrenMenusList to set
     */
    public void setChildrenMenusList(List<Menu> childrenMenusList) {
        this.childrenMenusList = childrenMenusList;
    }
    /**
     * @return the menuId
     */
    public int getMenuId() {
        return menuId;
    }
    /**
     * @param menuId the menuId to set
     */
    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }
    /**
     * @return the menuName
     */
    public String getMenuName() {
        return menuName;
    }
    /**
     * @param menuName the menuName to set
     */
    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }
    /**
     * @return the siteUrl
     */
    public String getSiteUrl() {
        return siteUrl;
    }
    /**
     * @param siteUrl the siteUrl to set
     */
    public void setSiteUrl(String siteUrl) {
        this.siteUrl = siteUrl;
    }
    /**
     * @return the delFalg
     */
    public int getDelFalg() {
        return delFalg;
    }
    /**
     * @param delFalg the delFalg to set
     */
    public void setDelFalg(int delFalg) {
        this.delFalg = delFalg;
    }
    /**
     * @return the parentId
     */
    public int getParentId() {
        return parentId;
    }
    /**
     * @param parentId the parentId to set
     */
    public void setParentId(int parentId) {
        this.parentId = parentId;
    }
}