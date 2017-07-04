public class BB_LTG_BlogWrapper {
    @AuraEnabled
    public Blog_Post__c blog {get; set;}
        
    @AuraEnabled
    public Integer commentCount {get; set;}
        
    @AuraEnabled
    public String showHideText {get; set;}
        
    public BB_LTG_BlogWrapper(Blog_Post__c inBlog)
    {
        blog=inBlog;
        commentCount=blog.Blog_Comments__r.size();
        showHideText='Show';
    }
}