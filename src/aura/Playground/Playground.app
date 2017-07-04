<aura:application extends="force:slds">
		<c:DataGridWithSearch aura:id="JobCodeList" fieldLabel="Parent Job Code, Job Code, Description,Standard Labor Hours,Additional Labor Hours,Reason Additional Labor hour" query="SELECT ID,Parent_Warranty_Code__r.Name, Warranty_Code__c,Description__c,Standard_Labor_Hours__c FROM Warranty_Codes__c"
			Placeholder="Search by Parent Job Code / Job Code / Description"/>
</aura:application>