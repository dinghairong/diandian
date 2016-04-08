function getSelects() {
	var result;
	log(Form_Data);

	if (Form_Data) {
		var $cbs = document.getElementsByName("sel_projects");

		if ($cbs) {
			var sel = '';

			for (var i = 0; i < $cbs.length; i++) {
				var $cb = $cbs[i];

				if ($cb.checked) {
					result = "yes";
					sel += $cb.value + ',';
				}
			}

			Form_Data += "&product_sel=" + sel;
		}

		if (!result) {
			showToast("请选择服务项", 2000);
		}
	} else{
		showToast("系统逻辑错误", 2000);
	}

	return result;
}