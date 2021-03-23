package com.diary.dao;

<<<<<<< HEAD
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.diary.entity.DiaryType;

public class DiaryTypeDao {
	public List<DiaryType> diaryTypeCountList(Connection con)throws Exception{
		List<DiaryType> diaryTypeCountList=new ArrayList<DiaryType>();
		String sql="SELECT diaryTypeId,typeName,COUNT(diaryId) as diaryCount FROM t_diary RIGHT JOIN t_diaryType ON t_diary.typeId=t_diaryType.diaryTypeId GROUP BY typeName;";
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()){
			DiaryType diaryType=new DiaryType();
			diaryType.setDiaryTypeId(rs.getInt("diaryTypeId"));
			diaryType.setTypeName(rs.getString("typeName"));
			diaryType.setDiaryCount(rs.getInt("diaryCount"));
			diaryTypeCountList.add(diaryType);
		}
		return diaryTypeCountList;
	}
	
	/**
	 * ��־�����Ϣ�б�
	 * @param con
	 * @return
	 * @throws Exception
	 */
	public List<DiaryType> diaryTypeList(Connection con)throws Exception{
		List<DiaryType> diaryTypeList=new ArrayList<DiaryType>();
		String sql="select * from t_diaryType";
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()){
			DiaryType diaryType=new DiaryType();
			diaryType.setDiaryTypeId(rs.getInt("diaryTypeId"));
			diaryType.setTypeName(rs.getString("typeName"));
			diaryTypeList.add(diaryType);
		}
		return diaryTypeList;
	}
	
	/**
	 * �ռ�����б���ʾ
	 * @param con
	 * @param diaryTypeId
	 * @return
	 * @throws Exception
	 */
	public DiaryType diaryTypeShow(Connection con,String diaryTypeId)throws Exception{
		String sql="SELECT * from t_diaryType where diaryTypeId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, diaryTypeId);
		ResultSet rs=pstmt.executeQuery();
		DiaryType diaryType=new DiaryType();
		if(rs.next()){
			diaryType.setDiaryTypeId(rs.getInt("diaryTypeId"));
			diaryType.setTypeName(rs.getString("typeName"));
		}
		return diaryType;
	}
	
	/**
	 * ����ռ����
	 * @param con
	 * @param diaryType
	 * @return
	 * @throws Exception
	 */
	public int diaryTypeAdd(Connection con,DiaryType diaryType)throws Exception{
		String sql="insert into t_diaryType values(null,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, diaryType.getTypeName());
		return pstmt.executeUpdate();
	}
	
	/**
	 * �����ռ����
	 * @param con
	 * @param diaryType
	 * @return
	 * @throws Exception
	 */
	public int diaryTypeUpdate(Connection con,DiaryType diaryType)throws Exception{
		String sql="update t_diaryType set typeName=? where diaryTypeId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, diaryType.getTypeName());
		pstmt.setInt(2, diaryType.getDiaryTypeId());
		return pstmt.executeUpdate();
	}
	
	/**
	 * ɾ���ռ����
	 * @param con
	 * @param diaryTypeId
	 * @return
	 * @throws Exception
	 */
	public int diaryTypeDelete(Connection con,String diaryTypeId)throws Exception{
		String sql="delete from t_diaryType where diaryTypeId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, diaryTypeId);
		return pstmt.executeUpdate();
	}
=======
import java.util.List;

import org.springframework.stereotype.Repository;

import com.diary.entity.DiaryType;
import com.diary.entity.User;

@Repository
public interface DiaryTypeDao {
	
	public DiaryType findByTypeName(String typeName);
	
	public int add(DiaryType diaryType); 
	
	public int getTotalNum(); 
	
	public List<DiaryType> findList();
	
	public DiaryType findById(Integer diaryTypeId);

	public int edit(DiaryType diaryType); 
	public int deleteById(Integer diaryTypeId);
	public int deleteAll(String ids);
	
	 
>>>>>>> branch 'master' of https://github.com/lj613/MyDiary
}
