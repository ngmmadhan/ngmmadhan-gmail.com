public class CustomAccountController {

  public Id IdParam {get; set;}

  public String getInclude() {
    System.PageReference pageReference = Page.CustomAccount;
    pageReference.getParameters().put('id', this.IdParam);
    return pageReference.getContent().toString();
  }
	public component.apex.OutputText getmyTextPage(){
		//System.debug('Account Owner Id '+ '{!Account.ownerId}');
		Component.Apex.OutputText OT = New Component.Apex.OutputText();
		OT.escape = false;
		OT.value = '<h1>This header contains HTML</h1>';
		return OT;
	}
	public component.apex.detail getmyDetailPage(){
		Component.Apex.Detail detail = new Component.Apex.Detail();
		return detail;
	}
}