package quick.start.study.spring.mvc.entity;
import java.io.Serializable;

public class NewRequest implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = -1530440705164533668L;
    private String newTitle;
    private String newDetails;
    private String pushTime;
    private String pushPerson;
    private String thumbnails;
    private int flowUpTop;
    /**
     * @return the newTitle
     */
    public String getNewTitle() {
        return newTitle;
    }
    /**
     * @param newTitle the newTitle to set
     */
    public void setNewTitle(String newTitle) {
        this.newTitle = newTitle;
    }
    /**
     * @return the newDetails
     */
    public String getNewDetails() {
        return newDetails;
    }
    /**
     * @param newDetails the newDetails to set
     */
    public void setNewDetails(String newDetails) {
        this.newDetails = newDetails;
    }
    /**
     * @return the pushTime
     */
    public String getPushTime() {
        return pushTime;
    }
    /**
     * @param pushTime the pushTime to set
     */
    public void setPushTime(String pushTime) {
        this.pushTime = pushTime;
    }
    /**
     * @return the pushPerson
     */
    public String getPushPerson() {
        return pushPerson;
    }
    /**
     * @param pushPerson the pushPerson to set
     */
    public void setPushPerson(String pushPerson) {
        this.pushPerson = pushPerson;
    }
    /**
     * @return the thumbnails
     */
    public String getThumbnails() {
        return thumbnails;
    }
    /**
     * @param thumbnails the thumbnails to set
     */
    public void setThumbnails(String thumbnails) {
        this.thumbnails = thumbnails;
    }
    /**
     * @return the flowUpTop
     */
    public int getFlowUpTop() {
        return flowUpTop;
    }
    /**
     * @param flowUpTop the flowUpTop to set
     */
    public void setFlowUpTop(int flowUpTop) {
        this.flowUpTop = flowUpTop;
    }
    
}
