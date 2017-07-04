public class DailyLeadProcessor implements schedulable {
    
    public void execute(Schedulablecontext ctx){
        List<Lead> UpdateLst = New List<Lead>();
        List<LEAD> LeadLst = [SELECT ID,LeadSource FROM LEAD LIMIT 200];
        for(Lead L : LeadLst) {
            L.LeadSource = 'Dreamforce';
            UpdateLst.add(L);
        }
        if(UpdateLst.size() > 0) {
        	Upsert UpdateLst;
        }
    }
}