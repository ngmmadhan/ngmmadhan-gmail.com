public class exampleCon {

    public id attachmentId { get; set; }
    public boolean ShowProgress { get; set; }
    Integer count = 0;
    
    public exampleCon(){
        this.attachmentId = '06928000002xzH5';
        this.ShowProgress = true;
    }
                        
    public PageReference incrementCounter() {
         this.ShowProgress = !this.ShowProgress;
         return null;
    }
                        
    public Integer getCount() {
        return count;
    }
}