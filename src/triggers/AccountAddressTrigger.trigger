trigger AccountAddressTrigger on Account (before insert, before update) {
    System.debug('Trigger AccountAddressTrigger');
    system.debug('Trigger.new' + Trigger.new);
    if(Trigger.isUpdate && Trigger.IsBefore) {
        for(Account a: [SELECT ID,Match_Billing_Address__c,BillingPostalCode,ShippingPostalCode FROM ACCOUNT WHERE ID IN :Trigger.new]){
            system.debug('a.Match_Billing_Address__c' + a.Match_Billing_Address__c);
            system.debug('a.BillingPostalCode' + a.BillingPostalCode);
            system.debug('a.ShippingPostalCode' + a.ShippingPostalCode);
            if(a.Match_Billing_Address__c==true && a.BillingPostalCode != null || a.BillingPostalCode != '') {
                if(a.BillingPostalCode != a.ShippingPostalCode) {
                    Trigger.NewMap.get(a.id).addError('Billing Address should match Shipping Address');
                }
            }
        }
    }
    if(Trigger.isInsert && Trigger.IsBefore){
        for(Account a: Trigger.new  ){
            system.debug('a.Match_Billing_Address__c' + a.Match_Billing_Address__c);
            system.debug('a.BillingPostalCode' + a.BillingPostalCode);
            system.debug('a.ShippingPostalCode' + a.ShippingPostalCode);
            if(a.Match_Billing_Address__c==true && (a.BillingPostalCode != null || a.BillingPostalCode != '' )) {
                a.ShippingPostalCode = a.BillingPostalCode;
                //if(a.BillingPostalCode != a.ShippingPostalCode) {
                //    a.addError('Billing Address should match Shipping Address');
                //}
            }
        }
    }

}