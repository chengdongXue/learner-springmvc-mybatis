package quick.start.study.spring.mvc.entity;

import java.util.List;

import quick.start.study.spring.business.entity.Menu;

public class MenusDataTableModelResponse {
    private int menuId;
    private String menuName;
    private String siteUrl;
    private String menuIcon;
    private List<Menu> childrenMenuList;
    
    /**
     * @return the childrenMenuList
     */
    public List<Menu> getChildrenMenuList() {
        return childrenMenuList;
    }
    /**
     * @param childrenMenuList the childrenMenuList to set
     */
    public void setChildrenMenuList(
            List<Menu> childrenMenuList) {
        this.childrenMenuList = childrenMenuList;
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
    
}
