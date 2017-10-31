package quick.start.study.spring.mvc.entity;

import java.io.Serializable;

public class TypeRequest implements Serializable {

    private static final long serialVersionUID = 3501345199901637361L;
    
    private String typeId;
    private String typeName;
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
    
}
