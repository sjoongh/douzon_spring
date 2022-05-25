package com.example.jpaBoard.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name="boardjpa")
@SequenceGenerator(name="BOARD_SEQ_GENERATOR", 
					sequenceName="SEQ_BOARD", 
					initialValue=1, 
					allocationSize=1) // 시퀀스의 기본 allocationSize는 50, 번호가 50부터 생기므로 1
public class Board {
	
	@Column(length=30, nullable=false)
	protected String name;
	
	@Column(length=20, nullable=false)
	protected String passwd;
	
	@Column(length=500, nullable=false)
	protected String title;
	
	@Column(length=4000, nullable=false)
	protected String content;
	
	// 날짜 기본 형식 time, day, month, year 형태 저장
	@Column(nullable=false) // null 허용
	@Temporal(TemporalType.TIMESTAMP)
	protected Date regdate;
	
	@Column(length=10, nullable=false)
	protected Integer readcount;
	
	// 답변인경우 어느글의 답변인지 상위 글번호
	
	@Column(length=10, nullable=false)
	protected Integer reply=0;
	
	@Column(length=10, nullable=false)
	protected Integer replylevel;
}
