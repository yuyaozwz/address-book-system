package ypc.zwz.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import core.dao.BaseDao;
import ypc.zwz.dao.AuthorityDao;
import ypc.zwz.model.Authority;

/**
 * 
 * @author 郑为中
 * 项目托管地址： https://gitee.com/yyzwz
 * 技术博客：https://zwz99.blog.csdn.net/
 */

@Repository
public class AuthorityDaoImpl extends BaseDao<Authority> implements AuthorityDao {

	public AuthorityDaoImpl() {
		super(Authority.class);
	}

	@Override
	public List<Authority> queryByParentIdAndRole(Short role) {
		// MySQL
		SQLQuery query = getSession().createSQLQuery("select distinct a.* from authority a,role_authority ra where a.id = ra.authority_id and a.parent_id is null and ra.role = ?"); 
		// Oracle
		// SQLQuery query = getSession().createSQLQuery("select distinct a.* from authority a,role_authority ra where to_char(a.id) = ra.authority_id and a.parent_id is null and ra.role = ?");
		// SQL Server
		// SQLQuery query = getSession().createSQLQuery("select distinct a.* from authority a,role_authority ra where convert(char(8),a.id) = ra.authority_id and a.parent_id is null and ra.role = ?");
		query.setParameter(0, role);
		query.addEntity(Authority.class);
		return query.list();
	}

	@Override
	public List<Authority> queryChildrenByParentIdAndRole(Long parentId, Short role) {
		// MySQL
		SQLQuery query = getSession().createSQLQuery("select distinct a.* from authority a,role_authority ra where a.id = ra.authority_id and a.parent_id = ? and ra.role = ?"); 
		// Oracle
		// SQLQuery query = getSession().createSQLQuery("select distinct a.* from authority a,role_authority ra where to_char(a.id) = ra.authority_id and a.parent_id = ? and ra.role = ?");
		// SQL Server
		// SQLQuery query = getSession().createSQLQuery("select distinct a.* from authority a,role_authority ra where convert(char(8),a.id) = ra.authority_id and a.parent_id = ? and ra.role = ?");
		query.setParameter(0, parentId);
		query.setParameter(1, role);
		query.addEntity(Authority.class);
		return query.list();
	}

}
