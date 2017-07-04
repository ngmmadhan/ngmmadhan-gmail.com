public with sharing class actionPollerExample {
    Integer count = 0;
    public boolean show{get;set;}
                        
    public actionPollerExample(){
        this.show = false;
    }                    
    public PageReference incrementCounter() {
            count++;
            Long startingTime = System.now().getTime(); // Num milliseconds since Jan 1 1970
            Integer delayInMilliseconds = 5000; // One-second delay
            while (System.now().getTime() - startingTime < delayInMilliseconds)  {
                        // Do nothing until desired delay has passed
             }
            this.show = !this.show;
            return null;
    }
                        
    public Integer getCount() {
        return count;
    }

}