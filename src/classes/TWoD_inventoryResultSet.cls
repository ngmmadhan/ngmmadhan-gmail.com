/************************************************
     * Class Name: TWoD_inventoryResultSet
     * Description: Result Object for Single/Bulk return messages
     * Author  : Tavant
     * History:
     * VERSION     AUTHOR               DATE                    DETAIL                    UserStory/Req#
     *  1.0 -     Tavant             02/22/2017           INITIAL DEVELOPMENT               
************************************************/
public class TWoD_inventoryResultSet {

	public ID InventoryId;
	// success or failure
    public String Status;
    public String Error;
    public Map<Id,String> FailedWarrantyRegMap = new Map<Id,String>();
    public Map<Id,String> FailedClaimMap = new Map<Id,String>();

    public TWoD_inventoryResultSet() {
        // do initialization
    }

}