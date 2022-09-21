package ypc.zwz.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import core.dao.BaseDao;
import core.util.QRCodeUtil;
import ypc.zwz.dao.TelDao;
import ypc.zwz.model.SysUser;
import ypc.zwz.model.Tel;

/**
 * 
 * @author 郑为中
 * 项目托管地址： https://gitee.com/yyzwz
 * 技术博客：https://zwz99.blog.csdn.net/
 */

@Repository
public class TelDaoImpl extends BaseDao<Tel> implements TelDao {

	public TelDaoImpl() {
		super(Tel.class);
	}
	
	@Override
	public List<Object[]> queryExportedTel(Long[] ids) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < ids.length; i++) {
			sb.append(ids[i] + ",");
		}
		Query query = getSession().createSQLQuery(
				"select h.id,h.name,h.tel,h.relationshipName,h.address,h.registDate from tel h where h.id in (" + sb.deleteCharAt(sb.toString().length() - 1).toString() + ")");
		return query.list();
	}
	@Override
	public int saveTelTwoDimensionalCode(HttpServletRequest request, String filePath,Long id){
		
		String[] conditionName= {"id"};
		Long[] conditionValue= {id}; 
		String[] propertyName= {"houseTwoDimensionalCode"};
		String[] propertyValue= {"house_"+String.valueOf(id)+".png"};
		// 存放在二维码中的请求内容
		//ArrayList<String> contents=new ArrayList<String>();
		//contents.add("id:1111");
		//contents.add("right:1111");
		//contents.add("ruquestURL:"+request.getRequestURL()+"/sys/house/getHouseByTwoDimensionalCode");
		String text = request.getRequestURL()+"/sys/house/getHouseByTwoDimensionalCode?id="+String.valueOf(id);
		// 嵌入二维码的图片路径
		String imgPath = filePath+"\\qmm2.jpg";
		// 生成的二维码的路径及名称
		String destPath = filePath+"\\house_"+String.valueOf(id)+".png";
		//生成二维码
		try {
			QRCodeUtil.encode(text, imgPath, destPath, true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			updateByProperties(conditionName,conditionValue,propertyName,propertyValue);
		}
		
		return 1;

	}
	
	@Override
	public void updateTel(Tel tel) {
		updateQmm(tel);
	}

}
