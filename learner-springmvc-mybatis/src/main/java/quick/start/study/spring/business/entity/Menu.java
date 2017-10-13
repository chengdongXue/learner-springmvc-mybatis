package quick.start.study.spring.business.entity;

public class Menu {
    private int menuId;
    private String menuName;
    private String siteUrl;
    private int delFalg;
    private int parentId;
    private String menuIcon;
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
