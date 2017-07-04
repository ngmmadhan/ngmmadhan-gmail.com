/** *****************************************************************************
 * BB_LTG_BlogPostController
 *
 * Description: 
 *
 * Apex controller for the blog post lightning application
 *
 * Test Method Class: BB_LTG_BlogPostController_Test
 *
 * If you are the kind of person that likes Apex code, you might be interested in
 * a career at BrightGen - see http://www.brightgen.com/careersBG or send your
 * CV to recruitment@brightgen.com
 *
 * Author kbowden
 * Date 28 Sep 2015
 *
 * Changes:
 ********************************************************************************/
public class BB_LTG_BlogPostController 
{

    @AuraEnabled
    public static List<BB_LTG_BlogWrapper> SearchBlogs(String searchStr)
    {
        List<List<Blog_Post__c>> allObjs=[find :searchStr returning Blog_Post__c(id) limit 5];
        return setupBlogs(allObjs[0]);
    }
    
    @AuraEnabled
    public static List<BB_LTG_BlogWrapper> GetBlogs()
    {
        return SetupBlogs(null);    
    }
    
    @AuraEnabled
    public static BB_LTG_BlogWrapper NewComment(String blogIdStr, String name, String body)
    {
        Blog_Comment__c bc=new Blog_Comment__c(Blog_Post__c=blogIdStr,
                                               Name__c=name,
                                               Body__c=body,
                                               Posted__c=System.today());
        insert bc;
        List<BB_LTG_BlogWrapper> bws=SetupBlogs(new List<Blog_Post__c>{new Blog_Post__c(Id=blogIdStr)});
        
        return bws[0];
    }
    
    private static List<BB_LTG_BlogWrapper> SetupBlogs(List<Blog_Post__c> posts)
    {
        List<BB_LTG_BlogWrapper> blogWrappers=new List<BB_LTG_BlogWrapper>(); 
        
        String query='select id, Name, Content__c, Date_Posted__c, Author__r.Name, Small_Image_Id__c, Medium_Image_Id__c, Large_Image_Id__c, ' +
                    '     (select Name__c, Email__c, Body__c, Posted__c from Blog_Comments__r order by Posted__c desc) ' +  
                    '               from Blog_Post__c ' +
                    '               where Status__c=\'Published\' ';
        if (null!=posts)
        {
            query+=' and id IN :posts ';
        }
        
        query+='                order by Date_Posted__c desc limit 5 ';
        
        List<Blog_Post__c> blogs=Database.query(query);

        for (Blog_Post__c blog : blogs)
        {
            System.debug('Record = ' + blog);
            BB_LTG_BlogWrapper wrap=new BB_LTG_BlogWrapper(blog);
            blogWrappers.add(wrap);
        }
        
        return blogWrappers;
    }
}