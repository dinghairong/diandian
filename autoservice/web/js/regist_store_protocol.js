function getProtocolInfo() {
	if (Form_Data) {
		var $txt_second = document.getElementById("txt_second");
		var $txt_second2 = document.getElementById("txt_second2");
		var $txt_province = document.getElementById("txt_province");
		var $txt_city = document.getElementById("txt_city");
		var $txt_place = document.getElementById("txt_place");
		var $txt_bank = document.getElementById("txt_bank");
		var $txt_account = document.getElementById("txt_account");
		var $txt_account_name = document.getElementById("txt_account_name");
		var $txt_alipay = document.getElementById("txt_alipay");
		var $txt_linkman = document.getElementById("txt_second");
		var $txt_p_address = document.getElementById("txt_p_address");
		var $txt_p_tel = document.getElementById("txt_p_tel");
		var $txt_person_in_charge = document.getElementById("txt_person_in_charge");

		Form_Data += "&second=" + encodeURIComponent($txt_second.value);
		Form_Data += "&second2=" + encodeURIComponent($txt_second2.value);
		Form_Data += "&p_province=" + encodeURIComponent($txt_province.value);
		Form_Data += "&p_city=" + encodeURIComponent($txt_city.value);
		Form_Data += "&place=" + encodeURIComponent($txt_place.value);
		Form_Data += "&bank=" + encodeURIComponent($txt_bank.value);
		Form_Data += "&account=" + encodeURIComponent($txt_account.value);
		Form_Data += "&account_name=" + encodeURIComponent($txt_account_name.value);
		Form_Data += "&alipay=" + encodeURIComponent($txt_alipay.value);
		Form_Data += "&linkman=" + encodeURIComponent($txt_linkman.value);
		Form_Data += "&p_address=" + encodeURIComponent($txt_p_address.value);
		Form_Data += "&p_tel=" + encodeURIComponent($txt_p_tel.value);
		Form_Data += "&person_in_charge=" + encodeURIComponent($txt_person_in_charge.value);

		return 'yes';
	}
}