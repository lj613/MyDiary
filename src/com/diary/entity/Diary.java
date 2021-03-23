package com.diary.entity;

import java.util.Date;

<<<<<<< HEAD
public class Diary {
	private int diaryId;
	private String title;
	private String content;
	private int typeId=-1;
	private Date releaseDate;
	private String releaseDateStr;
	private int diaryCount;
	private String typeName;
	
	public Diary(String title, String content, int typeId) {
		super();
		this.title = title;
		this.content = content;
		this.typeId = typeId;
	}
	public Diary() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getDiaryId() {
		return diaryId;
	}
	public void setDiaryId(int diaryId) {
		this.diaryId = diaryId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getReleaseDateStr() {
		return releaseDateStr;
	}
	public void setReleaseDateStr(String releaseDateStr) {
		this.releaseDateStr = releaseDateStr;
	}
	public int getDiaryCount() {
		return diaryCount;
	}
	public void setDiaryCount(int diaryCount) {
		this.diaryCount = diaryCount;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
=======
import org.springframework.stereotype.Component;

/**
 *    日记实体类
 * @author Lenovo
 *
 */
@Component
public class Diary {
	private Integer id;  //id
	private String title;  //标题
	private Date releaseDate; //发布时间
	private String content; //内容
	private DiaryType diaryType; //日记类别
	private User user; //用户
//	private Integer typeId; //日记类别
	
   // private Integer userId; //用户
	 	
	//日记数量
	private Integer diaryCount;
	
	/* 纯文本格式的内容*/
	private String contentNoTag;
	private String releaseDateStr; //发布时间 str
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public DiaryType getDiaryType() {
		return diaryType;
	}
	public void setDiaryType(DiaryType diaryType) {
		this.diaryType = diaryType;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getContentNoTag() {
		return contentNoTag;
	}
	public void setContentNoTag(String contentNoTag) {
		this.contentNoTag = contentNoTag;
	}
	public String getReleaseDateStr() {
		return releaseDateStr;
	}
	public void setReleaseDateStr(String releaseDateStr) {
		this.releaseDateStr = releaseDateStr;
	}
	public Integer getDiaryCount() {
		return diaryCount;
	}
	public void setDiaryCount(Integer diaryCount) {
		this.diaryCount = diaryCount;
	}
	
	
	
	
	  public String toString() { return "Diary[id="+ id +",title="+ title
	  +",content="+ content +"]"; }
	 
	
>>>>>>> branch 'master' of https://github.com/lj613/MyDiary
}
