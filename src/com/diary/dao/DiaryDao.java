package com.diary.dao;

<<<<<<< HEAD
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.diary.entity.Diary;
import com.diary.entity.PageBean;
import com.diary.util.DateUtil;
import com.diary.util.StringUtil;

public class DiaryDao {
	public List<Diary> diaryList(Connection con,PageBean pageBean,Diary s_diary)throws Exception{
		List<Diary> diaryList=new ArrayList<Diary>();
		StringBuffer sb=new StringBuffer("select * from t_diary t1,t_diaryType t2 where t1.typeId=t2.diaryTypeId ");
		
		if(s_diary.getTypeId()!=-1){
			sb.append(" and t1.typeId="+s_diary.getTypeId());
		}
		if(StringUtil.isNotEmpty(s_diary.getReleaseDateStr())){
			sb.append(" and DATE_FORMAT(t1.releaseDate,'%Y��%m��')='"+s_diary.getReleaseDateStr()+"'");
		}
		if(StringUtil.isNotEmpty(s_diary.getTitle())){
			sb.append(" and t1.title like '%"+s_diary.getTitle()+"%'");
		}
		
		sb.append(" order by t1.releaseDate desc");
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getPageSize());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()){
			Diary diary=new Diary();
			diary.setDiaryId(rs.getInt("diaryId"));
			diary.setTitle(rs.getString("title"));
			diary.setContent(rs.getString("content"));
			diary.setReleaseDate(DateUtil.formatString(rs.getString("releaseDate"), "yyyy-MM-dd HH:mm:ss"));
			diaryList.add(diary);
		}
		return diaryList;
	}
	public int diaryCount(Connection con,Diary s_diary)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_diary t1,t_diaryType t2 where t1.typeId=t2.diaryTypeId ");
		
		if(StringUtil.isNotEmpty(s_diary.getTitle())){
			sb.append(" and t1.title like '%"+s_diary.getTitle()+"%'");
		}
		if(s_diary.getTypeId()!=-1){
			sb.append(" and t1.typeId="+s_diary.getTypeId());
		}
		if(StringUtil.isNotEmpty(s_diary.getReleaseDateStr())){
			sb.append(" and DATE_FORMAT(t1.releaseDate,'%Y��%m��')='"+s_diary.getReleaseDateStr()+"'");
		}
		
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	/**
	 * ��ѯ�ռ������б���ʾ
	 * @param con
	 * @return
	 * @throws Exception
	 */
	public List<Diary> diaryCountList(Connection con)throws Exception{
		List<Diary> diaryCountList=new ArrayList<Diary>();
		String sql="SELECT DATE_FORMAT(releaseDate,'%Y��%m��') as releaseDateStr ,COUNT(*) AS diaryCount  FROM t_diary GROUP BY DATE_FORMAT(releaseDate,'%Y��%m��') ORDER BY DATE_FORMAT(releaseDate,'%Y��%m��') DESC;";
		PreparedStatement pstmt=con.prepareStatement(sql);
		//Statement stmt = con.createStatement();
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()){
			Diary diary=new Diary();
			diary.setReleaseDateStr(rs.getString("releaseDateStr"));
			diary.setDiaryCount(rs.getInt("diaryCount"));
			diaryCountList.add(diary);
		}
		return diaryCountList;
	}
	
	/**
	 * �ռ�������ʾ
	 * @param con
	 * @param diaryId
	 * @return
	 * @throws Exception
	 */
	public Diary diaryShow(Connection con,String diaryId)throws Exception{
		String sql="select * from t_diary t1,t_diaryType t2 where t1.typeId=t2.diaryTypeId and t1.diaryId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, diaryId);
		ResultSet rs=pstmt.executeQuery();
		Diary diary=new Diary();
		if(rs.next()){
			diary.setDiaryId(rs.getInt("diaryId"));
			diary.setTitle(rs.getString("title"));
			diary.setContent(rs.getString("content"));
			diary.setTypeId(rs.getInt("typeId"));
			diary.setTypeName(rs.getString("typeName"));
			diary.setReleaseDate(DateUtil.formatString(rs.getString("releaseDate"),"yyyy-MM-dd HH:mm:ss"));
		}
		return diary;
	}
	
	/**
	 * ����ռ�
	 * @param con
	 * @param diary
	 * @return
	 * @throws Exception
	 */
	public int diaryAdd(Connection con,Diary diary)throws Exception{
		String sql="insert into t_diary values(null,?,?,?,now())";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, diary.getTitle());
		pstmt.setString(2, diary.getContent());
		pstmt.setInt(3, diary.getTypeId());
		return pstmt.executeUpdate();
	}
	
	/**
	 * ɾ���ռ�
	 * @param con
	 * @param diaryId
	 * @return
	 * @throws Exception
	 */
	public int diaryDelete(Connection con,String diaryId)throws Exception{
		String sql="delete from t_diary where diaryId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, diaryId);
		return pstmt.executeUpdate();
	}
	
	/**
	 * �޸��ռ�
	 * @param con
	 * @param diary
	 * @return
	 * @throws Exception
	 */
	public int diaryUpdate(Connection con,Diary diary)throws Exception{
		String sql="update t_diary set title=?,content=?,typeId=? where diaryId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, diary.getTitle());
		pstmt.setString(2, diary.getContent());
		pstmt.setInt(3, diary.getTypeId());
		pstmt.setInt(4, diary.getDiaryId());
		return pstmt.executeUpdate();
	}
	
	/**
	 * �жϸ��ռ�������Ƿ����ռ�
	 * @param con
	 * @param typeId
	 * @return
	 * @throws Exception
	 */
	public boolean existDiaryWithTypeId(Connection con,String typeId)throws Exception{
		String sql="select * from t_diary where typeId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, typeId);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return true;
		}else{
			return false;
		}
	}
=======
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.diary.entity.Diary;
import com.diary.entity.DiaryType;

@Repository
public interface DiaryDao {
	/*
	 * public DiaryType findByTypeName(String typeName);
	 */
	
	//无参数查找所有日记
	public List<Diary> findList();
	
	//带参数查询日记列表
	public List<Diary> list(Map<String,Object> map);
	
	//带参数查询日记数量
	public Long getTotalNum(Map<String,Object> map); 
	
	
	
	//根据id查询日记
	public Diary findById(Integer id);

	//添加日记
	public int add(Diary diary); 
	
	//修改日记
	public int edit(Diary diary); 
	
	//根据id单个删除日记
	public int deleteById(Integer id);
	
	//批量删除日记
	public int deleteAll(String ids);
	
	 
>>>>>>> branch 'master' of https://github.com/lj613/MyDiary
}
