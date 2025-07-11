({
	add : function(component) {
		var addVal = component.get("v.num1")+component.get("v.num2");
        component.set("v.sum", addVal);
	}
})