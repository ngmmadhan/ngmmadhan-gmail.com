public class MyMapController {
   
    @AuraEnabled
    public static map<String,String> getMyMap(){
        Map<String,String> Mymap = new Map<String,String>();
       // put value in Map 
          Mymap.put('Key1','Value1');
          Mymap.put('Key2','Value2');  
          Mymap.put('Key3','Value3');  
          Mymap.put('Key4','Value4');  
          return Mymap;
      }
}