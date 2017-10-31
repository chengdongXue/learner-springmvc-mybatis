package quick.start.study.spring.business.entity;

import java.io.Serializable;

public class Type implements Serializable{
    /**
     * 
     */
    private static final long serialVersionUID = -1501777505603237639L;
    private String typeId;
    private String typeName;
    private int delFlag;
    /**
     * @return the typeId
     */
    public String getTypeId() {
        return typeId;
    }
    /**
     * @param typeId the typeId to set
     */
    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }
    /**
     * @return the typeName
     */
    public String getTypeName() {
        return typeName;
    }
    /**
     * @param typeName the typeName to set
     */
    public void setTypeName(String typeName) {
        this.typeName = typeName;
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
