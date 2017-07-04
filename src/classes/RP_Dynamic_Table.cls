public with sharing class RP_Dynamic_Table
{
        private class sexception extends exception {}

        public class sObjectWrapper
        {
                @AuraEnabled
                public List<String> lstFieldApi { get; set; }

                @AuraEnabled
                public List<String> lstFieldLabel { get; set; }

                @AuraEnabled
                public List<SObject> lstSobject { get; set; }

                public sObjectWrapper(List<String> lstFieldApi, List<String> lstFieldLabel, List<SObject> lstSobject)
                {
                        this.lstFieldApi = lstFieldApi;
                        this.lstFieldLabel = lstFieldLabel;
                        this.lstSobject = lstSobject;
                }
        }

        public static Boolean getFieldAccessibility(String strQuery)
        {
                String[] lstFieldsToCheck = new String[] {};
                Map<String, Schema.SObjectField> mapFields;
                String strObject = '';

                if(strQuery.contains('WHERE'))
                    strObject = strQuery.substringBetween('FROM','WHERE').trim();
                else
                    strObject = strQuery.split('FROM')[1].trim();

                SObjectType objSObjectType = Schema.getGlobalDescribe().get(strObject);

                //Check accessisibility for sobject object
                if(objSObjectType.getDescribe().isAccessible())
                   mapFields = objSObjectType.getDescribe().fields.getMap();
                else
                   return false;

                String strFields = strQuery.substringBetween('SELECT','FROM');

                for(String strField : strFields.split(','))
                {
                    lstFieldsToCheck.add(strField.trim());
                }
                //Check accessisibility for fields
                for (String strField : lstFieldsToCheck)
                {
                    if (!mapFields.get(strField).getDescribe().isAccessible())
                    {
                        return false;
                    }
                }
                return true;
        }

        @AuraEnabled
        public static sObjectWrapper fetchRecords(String strQuery)
        {
            List<String> lstFieldAPIs = new List<String>();
            List<String> lstFields = new List<String>();
            List<SObject> lstSobject = new List<SObject>();

            String queryString = '';

            if(!getFieldAccessibility(strQuery))
            {
                sexception e = new sexception();
                e.setMessage('You does not have access to o. Please contact to your administrator.');
                throw e;
            }

            lstSobject = database.query(strQuery);

            String strFields = strQuery.substringBetween('SELECT','FROM');

            Map<String, Schema.SObjectField> mfields = lstSobject[0].Id.getSObjectType().getDescribe().fields.getMap();
            for(String strField : strFields.split(','))
            {
                lstFieldAPIs.add(strField.trim());
                lstFields.add(String.valueOf(mfields.get(strField.trim()).getDescribe().getlabel()));
            }

            return new sObjectWrapper(lstFieldAPIs, lstFields, lstSobject);
        }
}