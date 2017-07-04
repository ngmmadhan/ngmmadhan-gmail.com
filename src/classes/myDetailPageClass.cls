public with sharing class myDetailPageClass {
	public myDetailPageClass() {

	}
	public component.apex.detail getmyDetailPage(){
		component.apex.detail detail = new component.apex.detail();
		detail.expressions.subject = '{!AccountType.ownerId}';
		detail.relatedList = false;
		detail.title = false;
		return detail;
	}
}