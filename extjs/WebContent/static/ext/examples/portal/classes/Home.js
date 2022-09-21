Ext.define('Ext.app.Home', {
	extend : 'Ext.panel.Panel',
	initComponent : function() {
		var me = this;
		Ext.apply(this, {
			id : 'forestryTenantInMapHome',
			layout : 'border',
			items : 
				[ 
					Ext.create('Forestry.app.Map')
//					Ext.create('Forestry.app.report.HouseZZReprot')
				]
		});
		this.callParent(arguments);
	}
});


// 传感器在Leaflet地图的位置标识
Ext.define('Forestry.app.Map', {
	extend : 'Ext.panel.Panel',
	region : 'center',
	height : '100%',
	split : true,
	style : 'padding:10px; line-height:22px;',
	html : '</br></br></br></br><center><div><span style="color:#00CCFF;line-height:100px;font-size:48px;font-family:serif;font-weight:700;">基于 ExtJS 和 Spring Boot 的通讯录管理系统</span></br></br></br></br><span style="color:#F7C709;line-height:80px;font-size:50px;font-family:serif;font-weight:700;">人来登记 人走注销</span></br></br><span style="color:#F7C709;line-height:80px;font-size:50px;font-family:serif;font-weight:700;">不漏一户 不漏一人</span></br></br><span style="color:#C43C3C;line-height:30px;font-size:20px;font-family:serif;font-weight:700;">项目托管地址： https://gitee.com/yyzwz</span></br><span style="color:#C43C3C;line-height:30px;font-size:20px;font-family:serif;font-weight:700;">作者：  郑为中</span></br><span style="color:#C43C3C;line-height:30px;font-size:20px;font-family:serif;font-weight:700;">2020年5月20日</span></div></center>',
	initComponent : function() {
		this.callParent(arguments);
	}
});
//edit by zwz

//Ext.define('Forestry.app.report.HouseAreaZZReport', {
//	extend : 'Ext.panel.Panel',
//	initComponent : function() {
//		var me = this;
//		Ext.apply(this, {
//			layout : 'border',
//			items : 
//				[ 
//					Ext.create('Forestry.app.report.HouseZZReprot'),
//				]
//		});
//		this.callParent(arguments);
//	}
//});


var qmm=[
	{departmentName :'小于30岁', proportion : 10},
	{departmentName :'30-40岁', proportion : 40},
	{departmentName :'40-50岁', proportion : 30},
	{departmentName :'50岁以上', proportion : 20}
]

Ext.Ajax.request({
	async: false,
    url: '/ZwzTelSystem/sys/houseType/getDepartmentsInZZReport',
    method: 'POST',
    success: function (response, options) {
    	//alert(response.responseText);
    	qmm = JSON.parse(response.responseText).list;
        
    },
    failure: function (response, options) {
        Ext.MessageBox.alert('失败', '请求超时或网络故障,错误编号：' + response.status);
    }
});
var dataStore = new Ext.data.JsonStore({
	fields:['departmentName', 'proportion','tenantNum'],
	data: qmm
});
// 传感器在Leaflet地图的位置标识
Ext.define('Forestry.app.report.HouseZZReprot', {
	extend : 'Ext.panel.Panel',
	initComponent : function() {
		var housechart=Ext.create('Ext.panel.Panel', {
			title : '通讯录分类数量柱状图',
			autoScroll:true,
			layout: 'fit',
			items : [{
				xtype : 'chart',
				theme: 'Category1',//彩色主题1  Blue  Category1  Base
				store : dataStore,
				animate: true,//是否启用动画效果
				legend: {
					position: 'bottom' //图例位置
				},
				shadow: true,
				axes: [{
					type: 'Numeric',
					grid: true,//显示网格线
					position: 'left',
					minimum : 0,//数轴最小值
					maximum : 100,//数轴最大值
					fields: ['proportion'],
					title: '数量'
				}, {
					type: 'Category',
					position: 'bottom',
					fields: ['departmentName'],
					label: { rotate: { degrees: 315} },
					title: '通讯录分类数量'
				}],
				series : [{
	                type: 'column',//柱状图表序列
	                axis: 'left',
	                xField: 'departmentName',
	                yField: 'proportion',
					title : '数量'
	            }]
			}]
		});
	
		
		var panel1 = Ext.create('widget.panel', {
			layout : 'fit',
			items : housechart
		});

		Ext.apply(this, {
			layout : 'fit',
			region : "center",
			items : [ panel1 ]
		});

		this.callParent(arguments);
	}
});
