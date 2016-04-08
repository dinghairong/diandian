	var Hx = Hx || {};
//依赖百度map
	var topoffset = 0;
	var flag = false;
	 var shops = {};
			
	Hx.Map = (function ()
	{
		var
			hushiIcon = "/img/Map_icon2.png",
			icon1 = "/img/Map_icon.png",
			//icon2 = Tuhu.Domain.ResourceSite + '/Image/Public/icon2.png',
			icon3 = "/img/icon3.gif";
		///	conf <map,city,level,position>
		function _init(conf)
		{
			//if (map) return;
			map = new BMap.Map(conf.map || "allmap"); // 创建Map实例
			if (conf.position)
			{
				map.centerAndZoom(new BMap.Point(conf.position.split(",")[1], conf.position.split(",")[0]), conf.level || 12);
			}
			else
			{
				if (conf.city)
				{
					map.setCurrentCity(conf.city);
					map.centerAndZoom(conf.city, conf.level);
				}
			}
			//map.enableScrollWheelZoom();//启用滚轮放大缩小			
			map.addControl(new BMap.OverviewMapControl());//OverviewMapControl：缩略地图控件，默认位于地图右下方，是一个可折叠的
			var opts = { anchor: BMAP_ANCHOR_TOP_RIGHT, offset: new BMap.Size(10, 10) };//修改NavigationControl()的显示位置
			map.addControl(new BMap.NavigationControl(opts)); 	//地图平移缩放控件，默认位于地图左上方，它包含控制地图的平移和缩放
		}
		function _search(conf)
		{
			if (conf.position)
			{
				map.centerAndZoom(new BMap.Point(conf.position.split(",")[1], conf.position.split(",")[0]), conf.level || 12);
			} else
			{
				if (conf.city)
				{
					map.setCurrentCity(conf.city);
					map.centerAndZoom(conf.city, conf.level);
				}
			}
		}

		var markerList = [];
		var provinceMarkerList = [];
		var typed_markerList = { Tire_0: [], Tire_1: [], Tire_2: [], ROF: [], JDHW: [], SLDW: [], XBY: [], DBY: [], FD: [], YS: [], KL: [], PM: [], LM: [], SCPan: [], SCP: [], FDJ: [], JQM: [], KTQX: [], SCY: [] };
		var currentMarker = [];
		var $ddlShop = $("[name=ShopID]");
	function AddShopMarker(MarkerInfo) {
        var marker;
        if (MarkerInfo.showInfo)
            marker = MarkerInfo.marker;
        else {
            marker = new BMap.Marker(new BMap.Point(MarkerInfo.Point[1], MarkerInfo.Point[0]), { icon: (MarkerInfo.ShopType & 16) == 16 ? new BMap.Icon('/img/Map_icon2.png', new BMap.Size(27, 34), { imageOffset: new BMap.Size(0, 0) }) : new BMap.Icon('/img/Map_icon.png', new BMap.Size(22, 28), { imageOffset: new BMap.Size(0, 0) }) });

            var commentRate = MarkerInfo.CommentTimes > 0 ? (1.0 * MarkerInfo.CommentR1 / MarkerInfo.CommentTimes) : 0;
            var content = $('<div>地址：' + MarkerInfo.AddressBrief + '<br/><button class="secll" type="button" style="margin-left:70px;">选择</button></div>');
            var searchInfoWindow = new BMapLib.SearchInfoWindow(map, content[0], {
                title: (MarkerInfo.ShopType & 16) == 16 ? '<span>帮你养车网' + MarkerInfo.Label + '</span><a  class="Iconhover" href="/Article_1/Article_tuhuservice.aspx" target="_blank"><label class="thService" title="您可以在此门店享受由帮你提供的11项轮胎免费服务" style="width: 20px; background-position: -23px 0px;"></label></a>' + ((MarkerInfo.ShopType & 8) == 8 ? '<label class="zhisong" title="选择此门店可享受帮你专车直送，8-16小时配送到店服务" style="width: 20px; background-position: 0px 0px;"></label>' : '') : '<span>帮你养车网' + MarkerInfo.Label + ((MarkerInfo.ShopType & 8) == 8 ? '</span><label class="zhisong" title="选择此门店可享受帮你专车直送，8-16小时配送到店服务" style="width: 20px; background-position: 0px 0px;"></label>' : '</span>'), //标题
                //width: (MarkerInfo.ShopType & 16) == 16 ? ((MarkerInfo.ShopType & 8) == 8 ? 295 : 270) : ((MarkerInfo.ShopType & 8) == 8 ? 270 : 240), //宽度
                //height: 40, //高度
                //panel : "panel", //检索结果面板
                enableAutoPan: true, //自动平移
                enableSendToPhone: false, //是否启用发送到手
                searchTypes: []
            });

            MarkerInfo.marker = marker;

            MarkerInfo.showInfo = function () {
                searchInfoWindow.close(marker);
                if (MarkerInfo.PKID == $ddlShop.val())
                    $("button", content).hide();
                else
                    $("button", content).show();

                searchInfoWindow.open(marker);
            };
            marker.addEventListener("click", MarkerInfo.showInfo);

            MarkerInfo.selectMarker = function () {
                $("button", content).hide();
                searchInfoWindow.close(marker);
                searchInfoWindow.open(marker);
            }
            $("button", content).click(function (event) {
                event.preventDefault();
                $(".shhItem>li[data-shopid=" + MarkerInfo.PKID + "]>.item_select").trigger("click");
                MarkerInfo.selectMarker();
            });

	        shops[MarkerInfo.PKID] = MarkerInfo;
        }

        //添加标注到地图
        map.addOverlay(marker); 
    }
		function AddShopMarker1(MarkerInfo)
		{
			var marker;
			if (MarkerInfo.showInfo)
				marker = MarkerInfo.marker;
			else
			{
				// marker = new BMap.Marker(new BMap.Point(MarkerInfo.Position[1], MarkerInfo.Position[0]), { icon: (MarkerInfo.ShopType & 16) == 16 ? new BMap.Icon(Tuhu.Domain.ResourceSite + '/Image/Public/Map_icon2.png', new BMap.Size(27, 34), { imageOffset: new BMap.Size(0, 0) }) : new BMap.Icon(Tuhu.Domain.ResourceSite + '/Image/Public/Map_icon.png', new BMap.Size(22, 28), { imageOffset: new BMap.Size(0, 0) }) });
				marker = new BMap.Marker(new BMap.Point(MarkerInfo.Point[1], MarkerInfo.Point[0]), { icon: (MarkerInfo.ShopType & 16) == 16 ? new BMap.Icon('/img/Map_icon2.png', new BMap.Size(27, 34), { imageOffset: new BMap.Size(0, 0) }) : new BMap.Icon('/img/Map_icon2.png', new BMap.Size(22, 28), { imageOffset: new BMap.Size(0, 0) }) });


				var commentRate = MarkerInfo.CommentTimes > 0 ? (1.0 * MarkerInfo.CommentR1 / MarkerInfo.CommentTimes) : 0;
				var content = $('<div>地址：' + MarkerInfo.AddressBrief + '<br/><button class="secll" type="button" style="margin-left:70px;">选择</button></div>');
				var searchInfoWindow = new BMapLib.SearchInfoWindow(map, content[0], {
					title: (MarkerInfo.ShopType & 16) == 16 ? '<span>帮你养车网' + MarkerInfo.CarparName + '</span>' + ((MarkerInfo.ShopType & 8) == 8 ? '' : '') : '<span>帮你养车网' + MarkerInfo.CarparName + ((MarkerInfo.ShopType & 8) == 8 ? '</span>' : '</span>'), //标题
					//width: (MarkerInfo.ShopType & 16) == 16 ? ((MarkerInfo.ShopType & 8) == 8 ? 295 : 270) : ((MarkerInfo.ShopType & 8) == 8 ? 270 : 240), //宽度
					//height: 40, //高度
					//panel : "panel", //检索结果面板
					enableAutoPan: true, //自动平移
					enableSendToPhone: false, //是否启用发送到手
					searchTypes: []
				});

				MarkerInfo.marker = marker;

				MarkerInfo.showInfo = function ()
				{
					searchInfoWindow.close(marker);
					if (MarkerInfo.PKID == $ddlShop.val())
						$("button", content).hide();
					else
						$("button", content).show();

					searchInfoWindow.open(marker);
				};
				marker.addEventListener("click", MarkerInfo.showInfo);

				MarkerInfo.selectMarker = function ()
				{
					$("button", content).hide();
					searchInfoWindow.close(marker);
					searchInfoWindow.open(marker);
				}
				$("button", content).click(function (event)
				{
					event.preventDefault();
					ddlCity.setValue({ value: MarkerInfo.Province });
					dllDis.setValue({ value: MarkerInfo.City });
					$(".areaSelect>li:eq(1)").removeClass("active");
					$(".shhItem>li[data-shopid=" + MarkerInfo.PKID + "]>.item_select").trigger("click");
					MarkerInfo.selectMarker();
				});
			}

			if (MarkerInfo.Province == Province)
			{
				markerList.push(marker);

				//添加标注到地图
				map.addOverlay(marker);
			}
		}

		function AddShopMarker2(MarkerInfo)
		{
			var marker, infoWindow, label;
			var flag = false;
			//标注自定义图片''
			var icon = MarkerInfo.isGoldenShop ? new BMap.Icon(hushiIcon, new BMap.Size(27, 34), {
				imageOffset: new BMap.Size(0, 0)
			}) : new BMap.Icon(icon1, new BMap.Size(22, 28), {
				//是引用图标的名字以及大小，注意大小要一样
				//anchor: new BMap.Size(0, 0)//这句表示图片相对于所加的点的位置
				imageOffset: new BMap.Size(0, 0)
			});
			// 创建标注
			marker = new BMap.Marker(new BMap.Point(MarkerInfo.Point[0], MarkerInfo.Point[1]), { icon: icon });
			// 信息窗口

			if (MarkerInfo.Label)
			{
				infoWindow = new BMap.InfoWindow();
				var title;
				var detaillink = "/former/shopdetail?sp_id=" + MarkerInfo.PKID;
				if (!MarkerInfo.isGoldenShop)
				{
					title = "<div style='width:518px;position: relative;top: -5px;color:#d12b3f;font-size: 14px;height: 26px;'><b style='text-align: center; overflow: hidden; line-height: 26px; height: 26px; margin-top: 1px;float:left;font-size:16px;font-family:微软雅黑;font-weight:normal;'>" + MarkerInfo.InfoMsg + "</b><div class='tuhuIcon'><a style='font-family: 宋体;'class='detailLink'href='" + detaillink + "' target='_blank'>详情>></a>" + (MarkerInfo.isDirectShop ? "<span class='Iconhover'><span class='zhisong'></span></span>" : "") + "</div></div>";
				}
				else
				{
					title = "<div style='position: relative;top: -5px;color:#d12b3f;font-size: 14px;height: 26px;'><b style='text-align: center; overflow: hidden; line-height: 26px; height: 26px; margin-top: 1px;float:left'>" + MarkerInfo.InfoMsg + "</b></b><div class='tuhuIcon'><a class='detailLink' target='_blank' style='font-family: 宋体;' href='" + detaillink + "'>详情>></a><span class='Iconhover'><span class='thService'></span>" + (MarkerInfo.isDirectShop ? "<span class='zhisong' ></span>" : "") + "</span></div></div>";
				}
				title = $(title)[0];
				infoWindow.setTitle(title);
				infoWindow.setHeight = 650;
				function showInfo()
				{
					currentMarker[MarkerInfo.PKID] = marker;
					marker.openInfoWindow(infoWindow);
					timeroutnum = 60;
					timerid = 0;
					if (!(infoWindow.isOpenInfoWindow))
					{
						$("#list .p").each(function ()
						{
							$(this).css("background-color", "#FFF");
						});
						$("#" + MarkerInfo.PKID).css("background-color", "#FAFAFA");
						topoffset = $("#product-list").scrollTop();
						var shopoffset = $("#" + MarkerInfo.PKID).offset();
						var listheight = $("#list").height();
						if (shopoffset)
						{
							if (listheight < 753)
							{
								$("#product-list").animate({
									scrollTop: 0
								}, 200);
							} else if (shopoffset.top < 415 || shopoffset.top > 1168)
							{
								$("#product-list").animate({
									scrollTop: shopoffset.top - 415 + topoffset
								}, 200);
							}
						}
					}
				}

				var item = { marker: marker, showInfo: showInfo, showTimes: 0, shop: $("#product-list  #list .p[data-pkid=" + MarkerInfo.PKID + "]") };

				// var content = "<div class='addressInfo' style='width:518px;'><div class='infoTop'><a target='_blank' href='" + detaillink + "'><img width='171' height='171' class='productImg' src='" + MarkerInfo.Images + "'/></a><div class='detailInfos'><span><span class='descrip'>门店地址：</span><span style='display:inline-block;width:270px;vertical-align:top;'>" + MarkerInfo.AddressBrief + "</span></span><br />" + "<span><span class='descrip'>所在区域：</span>" + (MarkerInfo.District || MarkerInfo.City) + "</span><br /><span><span class='descrip'>付款方式：</span>" + MarkerInfo.POS + "</span><br /><span><span class='descrip'>营业时间：</span>" + MarkerInfo.WorkTime + "</span><br /><span><span class='descrip'>门店客服：</span>" + MarkerInfo.Tel + "</span><br /><span><span class='descrip'style='margin-left: 12px;'>满意度：" + (MarkerInfo.CommentTime == 0 ? "</span>暂无评论</span>" : "</span><span class='starts' style='width:" + ((MarkerInfo.CommentRate < 5 ? MarkerInfo.CommentRate : 5) / 5 * 86.5) + "px'></span><span>" + MarkerInfo.CommentRate.toFixed(1) + "</span></span>") + "<br />" + (MarkerInfo.InstallNum == 0 ? "<span class='complete'>此门店暂无安装单</span>" : ("<a href='" + detaillink + "' target='_blank'><span class='complete'>此门店共完成<span class='numred'>" + MarkerInfo.InstallNum + "</span>个安装单，" + (MarkerInfo.CommentRate == 0 ? ("暂无评论</span></a>") : ("有<span class='numred'>" + MarkerInfo.CommentRate + "</span>条评论<span class='numred'>></span></span></a>")))) + "</div><div class='clr'></div></div><div class='mdService'><div class='mdTitle'>门店服务项目<span class='descrip'>（选择门店前，请确认门店能够提供您所需的服务）</span></div>";
				var content = "<div class='addressInfo' style='width:518px;'><div class='infoTop'><a target='_blank' href='" + detaillink + "'><img width='171' height='171' class='productImg' src='" + MarkerInfo.Images + "'/></a><div class='detailInfos'><span><span class='descrip'>门店地址：</span><span style='display:inline-block;width:270px;vertical-align:top;'>" + MarkerInfo.AddressBrief + "</span></span><br />" + "<span><span class='descrip'>所在区域：</span>" + (MarkerInfo.District || MarkerInfo.City) + "</span><br /><span><span class='descrip'>付款方式：</span>" + MarkerInfo.POS + "</span><br /><span><span class='descrip'>营业时间：</span>" + MarkerInfo.WorkTime + "</span><br /><span><span class='descrip'>门店客服：</span>" + MarkerInfo.Tel + "</span><br /><span><span class='descrip'style='margin-left: 12px;'>满意度：" + (MarkerInfo.CommentTime == 0 ? "</span>暂无评论</span>" : "</span><span class='starts' style='width:" + ((MarkerInfo.CommentRate < 5 ? MarkerInfo.CommentRate : 5) / 5 * 86.5) + "px'></span><span>" + MarkerInfo.CommentRate.toFixed(1) + "</span></span>") + "<br />" + (MarkerInfo.InstallNum == 0 ? "<span class='complete'>此门店暂无安装单</span>" : ("<a href='" + detaillink + "' target='_blank'><span class='complete'>此门店共完成<span class='numred'>" + MarkerInfo.InstallNum + "</span>个安装单，" + (MarkerInfo.CommentRate == 0 ? ("暂无评论</span></a>") : ("有<span class='numred'>" + MarkerInfo.CommentRate + "</span>条评论<span class='numred'>></span></span></a>")))) + "</div></div>";

				var service = MarkerInfo.Service["轮胎服务"];
				if (service)
				{
					content += "<div class='mdItem'><a href='http://baidu.com' target='_blank' style='display: inline-block;width: 518px;'><span class='luntaiImg'>轮胎服务</span><span class='baoyang_items'>";
					var tireService = [];
					$.each(service, function (key, value)
					{
						if (key != "FU-TUHU-DPH|")
							tireService.push(value);
					});
					if (!service["FU-TUHU-DPH|"])
						tireService.push("不支持雪铁龙及相关车系动平衡");
					content += tireService.join("、") + "</span><span class='service_to_buy'>去购买<span style='left:5px;border: 4px solid;border-color: #f4825b #f4825b #f4825b #fff;position: relative;display: inline-block;'></span></span></a></div>";

					//普通轮胎/轮毂安装 17寸及以下
					if (service["FU-TUHU-LUTAI|1"])
						typed_markerList["Tire_0"].push(item);
					//普通轮胎/轮毂安装 18-19寸
					if (service["FU-TUHU-LUTAI|2"])
						typed_markerList["Tire_1"].push(item);
					//普通轮胎/轮毂安装 20寸及以上
					if (service["FU-TUHU-LUTAI|3"])
						typed_markerList["Tire_2"].push(item);
					//防爆轮胎/轮毂安装
					if (service["FU-TUHU-LUTAI|4"])
						typed_markerList["ROF"].push(item);
					//简单换位
					if (service["FU-HUANWEI|"])
						typed_markerList["JDHW"].push(item);
					//四轮定位
					if (service["FU-SILUN|1"])
						typed_markerList["SLDW"].push(item);
				}
				var service = MarkerInfo.Service["保养服务"];
				if (service)
				{
					content += "<div class='mdItem'><a href='http://baidu.com' target='_blank'><span class='byImg'>保养服务</span><span class='baoyang_items'>";
					var byService = [];
					$.each(service, function ()
					{
						byService.push(this);
					});
					content += byService.join("、") + "</span><span class='service_to_buy'>去购买<span style='left:5px;border: 4px solid;border-color: #f4825b #f4825b #f4825b #fff;position: relative;display: inline-block;'></span></span></a></div>";

					//小保养
					if (service["FU-BY-XBY|"])
						typed_markerList["XBY"].push(item);
					//大保养
					if (service["FU-BY-DBY|"])
						typed_markerList["DBY"].push(item);
					//雨刷
					if (service["FU-BY-YUSHUA|"])
						typed_markerList["YS"].push(item);
					//空调滤清器
					if (service["FU-BY-KONGTIAO|"])
						typed_markerList["KL"].push(item);
					//PM2.5滤芯
					if (service["FU-PM-ANZHUANGFEI|"])
						typed_markerList["PM"].push(item);
					//空调制冷剂
					if (service["FU-BY-LM|"])
						typed_markerList["LM"].push(item);
					//刹车盘
					if (service["FU-TU-BBD|"] || service["FU-TU-ABD|"])
						typed_markerList["SCPan"].push(item);
					//刹车片
					if (service["FU-TU-BBP|"] || service["FU-TU-ABP|"])
						typed_markerList["SCP"].push(item);
					//发动机清洗
					if (service["FU-TU-Fadongji|"])
						typed_markerList["FDJ"].push(item);
					//节气门清洗
					if (service["FU-TU-Jieqimen|"])
						typed_markerList["JQM"].push(item);
					//空调清洗
					if (service["FU-TU-Kongtiaoguanlu|"])
						typed_markerList["KTQX"].push(item);
					//更换刹车油服务
					if (service["FU-TU-Shacheyou|"])
						typed_markerList["SCY"].push(item);
					////更换火花塞服务
					//if (service["FU-TU-Huohuasai|"])
					//	typed_markerList["HHS"].push(item);
					////VIP上门保养服务
					//if (service["FU-TU-DoorToDoor|2"])
					//	typed_markerList["VSMFW"].push(item);
					////上门保养服务
					//if (service["FU-TU-DoorToDoor|1"])
					//	typed_markerList["SMFW"].push(item);

				}

				// if (MarkerInfo.POS.indexOf("现金") >= 0 || MarkerInfo.POS.indexOf("刷卡") >= 0)
				// 	content += "<div class='btns'><a class='appointment2'  href='../browser/getbookingshop?vid=" + MarkerInfo.PKID + "' target='_blank'>预约安装门店</a>";
				// else
				// 	content += "<div class='btns'>";

				//content += "<a class='sendTel' data-flag='false'>地址发送到手机</a><div class='sendTelephone'><span style='margin-left:10px;display:block;' id='captcha'>验证码：<input type='text'class='input' maxlength='4'name='captcha' style='width: 40px;'><img alt='点击更换验证码' title='点击更换验证码'  style='vertical-align: middle; margin: 0 10px;'/><a class='ccbtn' style='width: 80px; height: 28px; background-color: #f58863; color: #fff;display: inline-block;text-align: center;line-height: 28px;'>更换验证码</a></span><span>手机号码：</span><input id='mobilenum' type='text' name='mobilenum' class='telinfo' /><a class='sendTelBtn' id='sendtoMobile' data-flag='false'>发送到手机</a><a class='sendTelBtn' id='sendtoMobile2' style='display:none;'>60秒后重发</a><a class='cancelSend'  data-flag='false'>取消</a></div>";

				content = $(content);
				infoWindow.setContent(content[0]);
				infoWindow.setHeight = 650;

				//function onMobileChange()
				//{
				//	if (/^\d{4}$/.test($("#captcha>input").val()) && /^1\d{10}$/.test($("#mobilenum").val()))
				//	{
				//		$("#sendtoMobile").attr("onclick", "submitMobile()");
				//		$("#sendtoMobile").css("background-color", "RGB(240, 130, 91)");
				//	}
				//	else
				//	{
				//		$("#sendtoMobile").removeAttr("onclick");
				//		$("#sendtoMobile").css("background-color", "RGB(210, 210, 210)");
				//	}
				//}

				$(".ccbtn", content).on("click", function ()
				{
					$("#captcha img").attr("src", "/Captcha.jpg?_=" + Date.now());
				})
				// $(".sendTel", content).on("click", function ()
				// {
				// 	$(".sendTelephone").show();
				// 	$(this).hide();
				// 	$("#captcha img", content).attr("src","/Captcha.jpg?_="+ Date.now());
				// });
				// $(".cancelSend", content).on("click", function ()
				// {
				// 	$(".sendTelephone").hide();
				// 	$(".sendTel").show();
				// });

				// $("#sendtoMobile", content).on("click", function sendtoMobileClick()
				// {
				// 	var mobilenum = $("#mobilenum").val();
				// 	var captcha = $("input[name=captcha]").val();
				// 	$.ajax({
				// 		url: "/Shop/SendSMS.aspx?s=" + MarkerInfo.PKID + "&mobilenum=" + mobilenum + "&captcha=" + captcha,
				// 		type: "post",
				// 		dataType: "html",
				// 		data: "",
				// 		success: function (data)
				// 		{
				// 			if (data > 0)
				// 			{
				// 				$("#sendtoMobile2").hide();
				// 				$("#sendtoMobile").show();
				// 				$("#sendtoMobile2").css("background-color", "RGB(210, 210, 210)");
				// 				var timeroutnum = 60;
				// 				myInterval(timeroutnum);
				// 				return;
				// 			}
				// 			else
				// 			{
				// 				var timeroutnum = 1;
				// 				myInterval(timeroutnum);
				// 				$(".ccbtn", content).click();
				// 				switch (data)
				// 				{
				// 					case -10:
				// 						alert('验证码过期！');
				// 						break;
				// 					case -11:
				// 						alert('验证码错误！');
				// 						break;
				// 					default:
				// 						alert('短信发送失败！');
				// 						break;
				// 				}
				// 				$("#sendtoMobile2").hide();
				// 				$("#sendtoMobile").show();
				// 			}
				// 		}
				// 	});
				// });
				// $("#mobilenum", content).input(function ()
				// {
				// 	onMobileChange();
				// });
				// $("input[name=captcha]", content).input(function ()
				// {
				// 	onMobileChange();
				// });
				$(".mdItem", content).on("mouseenter", function ()
				{
					$(this).find(".service_to_buy").show();
				});
				$(".mdItem", content).on("mouseleave", function ()
				{
					$(this).find(".service_to_buy").hide();
				});
				$("#allmap").click(function ()
				{
					map.enableScrollWheelZoom();//启用滚轮放大缩小
				});
				function SetTimer(timeroutnum)
				{
					timerid = setInterval(myInterval(timeroutnum), 1000);
				}

				// function myInterval(timeroutnum)
				// {
				// 	timerid = setInterval(function ()
				// 	{
				// 		if (timeroutnum >= 1)
				// 		{
				// 			$("#sendtoMobile2").show();
				// 			$("#sendtoMobile").hide();
				// 			$("#sendtoMobile2").text((timeroutnum--) + "秒后重发");
				// 		}
				// 		else
				// 		{
				// 			clearInterval(timerid);
				// 			//timeroutnum = 60;
				// 			$("#sendtoMobile").show();
				// 			$("#sendtoMobile2").hide();
				// 			$("#sendtoMobile").css("background-color", "RGB(240, 130, 91)");
				// 			$("#sendtoMobile2").text("60秒后重发");
				// 			onMobileChange();
				// 		}
				// 	}, 1000);
				// }

				// function onMobileChange()
				// {
				// 	if ($("#sendtoMobile2").is(":visible"))
				// 		return;
				// 	var tel = $.trim($("#mobilenum").val());
				// 	if (!(/^\d{4}$/.test($("#captcha>input").val()) && /^1\d{10}$/.test($("#mobilenum").val())))
				// 	{
				// 		$("#sendtoMobile").css("background-color", "#d2d2d2");
				// 		$("#sendtoMobile").attr("disabled", true);
				// 		$("#sendtoMobile").css("cursor", "default");
				// 	}
				// 	else
				// 	{
				// 		$("#sendtoMobile").css("background-color", "#d12a3e");
				// 		$("#sendtoMobile").attr("disabled", false);
				// 		$("#sendtoMobile").css("cursor", "pointer");
				// 	}
				// }
				//infoWindow.setWidth = 548;
				//infoWindow.enableAutoPan = true;
				//当信息窗口关闭时   新窗口的发送到手机回到初始状态
				infoWindow.addEventListener("close", function ()
				{
					clearInterval(timerid);
					timeroutnum = 60;
				});

				marker.addEventListener("click", showInfo);
				markerList[MarkerInfo.PKID] = item;
				if (MarkerInfo.Province == Province)
				{
					provinceMarkerList.push(item);
					//添加标注到地图
					map.addOverlay(marker);
				}

				$(".Iconhover", title).hover(function ()
				{
					$(".zhisong").css("background-position", "0 -35px").css("width", "72px");
					$(".thService").css("background-position", "-76px -35px").css("width", "72px");

				}, function ()
				{
					$(".zhisong").css("background-position", "0 0").css("width", "20px");
					$(".thService").css("background-position", "-23px 0").css("width", "20px");
				});

				if (MarkerInfo.isOpenInfoWindow)
				{
					infoWindow.disableAutoPan();
					setTimeout(function ()
					{
						marker.openInfoWindow(infoWindow);
					}, 500);
				}
			}
		}

		var markerC = null;//记录曾定位过得标注
		$("#posControl .positionBtn").click(function ()
		{
			for (var i = 0; i < currentMarker.length; i++)
			{
				currentMarker[i] && currentMarker[i].closeInfoWindow();
			}
			var localSearch = new BMap.LocalSearch(map);
			localSearch.enableAutoViewport();
			var keyword = $(".addressPos").val();
			localSearch.setSearchCompleteCallback(function (searchResult)
			{
				if (JSON.parse(JSON.stringify(searchResult)).ki.length != 0)
				{
					$(".searchposError").hide();
					if (markerC)
					{
						map.removeOverlay(markerC);
					}
					var poi = searchResult.getPoi(0);
					//alert(poi.point.lng + "," + poi.point.lat); //获取经度和纬度，将结果显示在文本框中
					map.centerAndZoom(poi.point, 13);
					var icon = new BMap.Icon(icon3, new BMap.Size(20, 40), {
						//是引用图标的名字以及大小，注意大小要一样
						anchor: new BMap.Size(10, 40),//这句表示图片相对于所加的点的位置
						imageOffset: new BMap.Size(0, 0)
					});
					var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat), { icon: icon });  // 创建标注，为要查询的地方对应的经纬度
					markerC = marker;
					map.addOverlay(marker);
					marker.setTitle((JSON.parse(JSON.stringify(searchResult))).province + (JSON.parse(JSON.stringify(searchResult)).ki[0].title));
					$('html, body').animate({ scrollTop: 199 }, 'slow');
				}
				else
				{
					$(".searchposError").show();
				}
			});
			localSearch.search(keyword);
		});

		function _render(shopList)
		{
			//_init({});

			var length = shopList.length, index = 0, count = 20;
			var action = function ()
			{
				console.log("AddShopMarker loop: " + index);
				for (var i = index++ * count; i < Math.min(index * count, length) ; i++)
				{
					var _shop = shopList[i];
					if ((_shop.ShopType & 1) == 1)
					{
						var Position = _shop.Position;
						var date = new Date();
						AddShopMarker2({
							PKID: _shop.PKID,
							Point: [Position[1], Position[0]],
							InfoMsg: "<a style='color:#333333;' href='/former/shopdetail?sp_id=" + _shop.PKID + "' target='_blank'>" + "帮你养车网" + _shop.CarparName + "</a>",
							Label: _shop.CarparName,
							isGoldenShop: (_shop.ShopType & 16) == 16,
							isDirectShop: (_shop.ShopType & 8) == 8,
							AddressBrief: _shop.AddressBrief,
							isOpenInfoWindow: false,
							WorkTime: _shop.WorkTime,
							POS: _shop.POS,
							CommentRate: _shop.CommentRate,
							CommentTime: _shop.CommentTimes,
							InstallNum: _shop.InstallNum,
							Service: _shop.Service,
							Images: _shop.Images,
							City: _shop.City,
							District: _shop.District,
							Province: _shop.Province,
							Tel:_shop.Tel
						});
					}
				}
				if (index * count < length)
					setTimeout(action, 10);
				else 
					(function ()
				{
					//左边门店点击  地图上标注相应的标注
					$("#product-list  #list").on("click", ".p", function ()
					{
						if ($(this).attr("data-stopworking").toLowerCase() == "false")
						{
							var pkid = $(this).attr("data-pkid");
							var marker = markerList[pkid];
							marker && marker.showInfo();
						}
					});

					var prevShowList = markerList;

					$(".shoplist_top").animate({ height: 151 }, 500, function ()
					{
						$(this).removeAttr("style");
					});

					function removeShop(itemID)
					{
						var temp = typed_markerList[itemID].intersect(prevShowList);
						var result = prevShowList.except(temp);
						prevShowList = temp;

						$.each(result, function ()
						{
							if (this != window)
							{
								map.removeOverlay(this.marker);
								this.shop.hide();
							}
						});
					}
					function addShop(selectedItem)
					{
						var temp = markerList;
						selectedItem.each(function ()
						{
							var itemID = $(this).attr("data-item-id");
							if (itemID != "Tire")
								temp = temp.intersect(typed_markerList[itemID]);
						});

						var result = temp.except(prevShowList);
						prevShowList = temp;

						if (!showAllMarker)
							result = result.intersect(provinceMarkerList);
						$.each(result, function ()
						{
							if (this != window)
							{
								map.addOverlay(this.marker);
								this.shop.show();
							}
						});
					}

					$(".map_city a").on("click", function ()
					{
						var self = $(this);
						var itemID = self.attr("data-item-id");
						var otherItemID = null;

						if (self.hasClass("selected"))
						{
							self.removeClass("selected");
							if (itemID == "Tire")
								itemID = $(".tyfe-list1 .tyfe_select").hide().find("a.selected").removeClass("selected").attr("data-item-id");
							else if (itemID.startsWith("Tire_"))
							{
								$(".map_city a:first").removeClass("selected");
								$(".tyfe-list1 .tyfe_select").hide(300);
							}
						}
						else
						{
							self.addClass("selected");
							if (itemID == "Tire")
							{
								itemID = $(".tyfe-list1 .tyfe_select").show(300).find("a:first").addClass("selected").attr("data-item-id");
								otherItemID = self.parent().next().find("a.selected").removeClass("selected").attr("data-item-id");
							}
							else if (itemID.startsWith("Tire_"))
								otherItemID = self.parent().siblings("li").find("a.selected").removeClass("selected").attr("data-item-id");
							else if (itemID.startsWith("ROF"))
							{
								if (self.parent().prev().find("a.selected").removeClass("selected").length)
									otherItemID = $(".tyfe-list1 .tyfe_select").hide().find("a.selected").removeClass("selected").attr("data-item-id");
							}
							else if (itemID.startsWith("XBY"))
								otherItemID = self.parent().next().find("a.selected").removeClass("selected").attr("data-item-id");
							else if (itemID.startsWith("DBY"))
								otherItemID = self.parent().prev().find("a.selected").removeClass("selected").attr("data-item-id");
						}

						var result = markerList;
						var selectedItem = $(".map_city a.selected");
						if (selectedItem.length)
						{
							if (otherItemID)
							{
								removeShop(itemID);
								addShop(selectedItem);
							}
							else
							{
								if (self.hasClass("selected"))
									removeShop(itemID);
								else
									addShop(selectedItem);
							}
						}
						else
						{
							prevShowList = markerList;
							$("#product-list  #list .p").show();
							$.each(showAllMarker ? markerList : provinceMarkerList, function ()
							{
								map.addOverlay(this.marker);
							});
						}

						$(".countMd").text("共" + $("#product-list  #list .p:visible").length + "家门店");
					});

					var prevLevel = 10;
					var showAllMarker = false;
					map.addEventListener("zoomend", function ()
					{
						var level = this.getZoom();

						if (level == 8 && prevLevel > level)
						{
							showAllMarker = true;
							$.each(prevShowList.except(provinceMarkerList), function (index, marker)
							{
								if (marker)
									map.addOverlay(marker.marker);
							});
						}
						else if (level == 10 && prevLevel < level)
						{
							showAllMarker = false;
							$.each(prevShowList.except(provinceMarkerList), function (index, marker)
							{
								if (marker)
									map.removeOverlay(marker.marker);
							});
						}
						prevLevel = level;
					});
				})();
			}
			setTimeout(action, 300);
		}
		function _renders(shopList)
		{
			//_init({});

			var length = shopList.length, index = 0, count = 20;
			var action = function ()
			{
				console.log("AddShopMarker loop: " + index);
				for (var i = index++ * count; i < Math.min(index * count, length) ; i++)
				{
					var _shop = shopList[i];
					var Position = _shop.Position;
					try
					{
						AddShopMarker({
							PKID: _shop.PKID,
							Point: [Position[1], Position[0]],
							InfoMsg: "<a style='color:#d12b3f;' href='/former/shopdetail?sp_id=" + _shop.PKID + "' target='_blank'>" + "帮你养车网" + _shop.CarparName + "</a>",
							Label: _shop.CarparName,
							isGoldenShop: (_shop.ShopType & 16) == 16,
							AddressBrief: _shop.AddressBrief,
							isOpenInfoWindow: false,
							Province: _shop.Province,
							WorkTime: _shop.WorkTime,
							Images: _shop.Image
						});
					} catch (e)
					{
						console.log(e, shopList[i]);
					}
				}
				index * count < length && setTimeout(action, 10);
			}
			setTimeout(action, 300);
		}

		function _renderbyshop(detailshop)
		{
			var Position = null;
			if (detailshop)
			{
				try
				{
					Position = detailshop.Position.split(",");
					AddShopDetailMarker({
						PKID: detailshop.PKID,
						Point: [Position[1], Position[0]],
						InfoMsg: "帮你养车网",
						isGoldenShop: (detailshop.ShopType & 16) == 16,
						isZhiSongShop: (detailshop.ShopType & 8) == 8,
						CarparName: detailshop.CarparName,
						isOpenInfoWindow: false
					});
					//shopDetailMarker && shopDetailMarker();
				} catch (e)
				{
					console.log(e, detailshop);
				}
				//map.setCenter(new Point(parseFloat(Position[1]), parseFloat(Position[0])));
			}
		}

		//var shopDetailMarker = null;
		function AddShopDetailMarker(MarkerInfo)
		{
			var infoWindow = new BMap.InfoWindow();
			var marker = new BMap.Marker(new BMap.Point(MarkerInfo.Point[0], MarkerInfo.Point[1]), { icon: (MarkerInfo.ShopType & 16) == 16 ? new BMap.Icon('/img/Map_icon2.png', new BMap.Size(27, 34), { imageOffset: new BMap.Size(0, 0) }) : new BMap.Icon('/img/Map_icon2.png', new BMap.Size(22, 28), { imageOffset: new BMap.Size(0, 0) }) });

			//var commentRate = MarkerInfo.CommentTimes > 0 ? (1.0 * MarkerInfo.CommentR1 / MarkerInfo.CommentTimes) : 0;
			//var content = $('<div style="width:180px;">' + MarkerInfo.CarparName + '</div>');
			//var title = '<div style="width:180px;color:#D12A3E;font-size:14px;">' + MarkerInfo.isGoldenShop ? '<span style="color:#D12A3E;font-size:14px;">' + MarkerInfo.InfoMsg + '</span><a  class="Iconhover" href="/Article_1/Article_tuhuservice.aspx" target="_blank"><label class="thService" title="您可以在此门店享受由途虎提供的11项轮胎免费服务" style="width: 20px; background-position: -23px 0px;"></label></a>' + (MarkerInfo.isZhiSongShop ? '<label class="zhisong" title="选择此门店可享受宏喜专车直送，8-16小时配送到店服务" style="width: 20px; background-position: 0px 0px;"></label>' : '') : '<span>' + MarkerInfo.InfoMsg + (MarkerInfo.isZhiSongShop ? '</span><label class="zhisong" title="选择此门店可享受宏喜专车直送，8-16小时配送到店服务" style="width: 20px; background-position: 0px 0px;"></label>' : '</span>') + '</div>';
			//infoWindow.setTitle($(title)[0]);
			//infoWindow.setContent($(content)[0]);
			//infoWindow.enableAutoPan = false;
			map.enableScrollWheelZoom();
			//infoWindow.setWidth = 220;
			infoWindow.setHeight = 650;
			//添加标注到地图
			map.addOverlay(marker);
			//var showInfo = function ()
			//{
			//	marker.openInfoWindow(infoWindow);
			//};
			//marker.addEventListener("click", showInfo);
			//shopDetailMarker = showInfo;
		}

		 function BindShop(shopList) {
			//  var shops = {};
			// $.each(shopList, function () {
	  //           shops[this.PKID] = this;
			//  });

			$(".hdXinxi_two_left>ul>li.select_after").mouseenter(function () {
				for(var i = 0;i < $(".hdXinxi_two_left>ul>li.select_after").length;i ++){
					$(".hdXinxi_two_left>ul>li.select_after")[i].style["background-color"] = "";
				}
				this.style["background-color"] = "#f8f8f8";
	            shops[$(this).find(".item_xiugai").data().id].showInfo();
	        }).find(".item_xiugai").click(function () {
				var shop = shops[$(this).data().id];
	            shop.selectMarker();
			});
	        $(".hdXinxi_two_left>ul>li.select_after").mouseleave(function(){
	        	this.style["background-color"] = "";
	        });
		}


		return {
			init: function (conf)
			{
				_init(conf);
			}, render: function (shoplist)
			{
				_render(shoplist);
			}, renders: function (shoplist)
			{
				_renders(shoplist);
			}, renderbyshop: function (detailshop)
			{
				_renderbyshop(detailshop);
			}, search: function (conf)
			{
				_search(conf);
			},getAllShop: function (shoplist){
				
				_renders(shoplist);
		        BindShop(shops);
			}
		};

		/*
		 * 获取当前时间功能
		 *	(月 日 时 分 秒 不足两位时， 前面补0)
		 */

		//function advanceTime(date,day)
		//{
		//	var now = "";
		//	var y = date.getFullYear();
		//	var m = date.getMonth() + 1;
		//	var d = date.getDate();
		//	if (d + day > 31)
		//	{
		//		d = d + day - 31;
		//		m += 1;
		//		if (m > 12)
		//		{
		//			m = m - 12;
		//			y += 1;
		//		}
		//	}
		//	var h = date.getHours();
		//	now = y + "-" + (m >= 10 ? m : ("0" + m)) + "-" + (d >= 10 ? d : ("0" + d)) + " " + (h > 10 ? h : ("0" + h)) + ":";
		//	var minute = date.getMinutes();
		//	now = now + (minute > 10 ? minute : ("0" + minute)) + ":";
		//	var s = date.getSeconds();
		//	now = now + (s > 10 ? s : ("0" + s)) + "";
		//	return now;
		//}

		//function dateTimeNow(date)
		//{
		//	var now = "";
		//	now = date.getFullYear() + "-";
		//	var m = date.getMonth() + 1;
		//	now = now + (m >= 10 ? m : ("0" + m)) + "-";//取月的时候取的是当前月-1如果想取当前月+1就可以了
		//	var d = date.getDate();
		//	now = now + (d >= 10 ? d : ("0" + d)) + " ";
		//	var h = date.getHours();
		//	now = now + (h > 10 ? h : ("0" + h)) + ":";
		//	var minute = date.getMinutes();
		//	now = now + (minute > 10 ? minute : ("0" + minute)) + ":";
		//	var s = date.getSeconds();
		//	now = now + (s > 10 ? s : ("0" + s)) + "";
		//	return now;
		//}


	}());