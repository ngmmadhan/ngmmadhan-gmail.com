<aura:application >
	<aura:handler name="init" value="{!this}" action="{!c.doInit}"/>
    <aura:attribute name="map" type="map"/>
    <aura:attribute name="key" type="string"/>
    <aura:attribute name="value" type="string"/>	
    <p>Map - {!v.key} --- Key - {!v.value}</p>
</aura:application>