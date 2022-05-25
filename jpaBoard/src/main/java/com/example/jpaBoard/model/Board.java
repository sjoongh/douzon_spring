package com.example.jpaBoard.model;

import java.util.Date;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
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
	
	@Id
	@GeneratedValue
	@Column(length=10)
	protected Integer id;
	
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
	// 최상위글인 경우 자신의 글번호 동일
	// 리스트보기에서 정렬시 우선적으로 reply로 정렬
	@Column(length=10, nullable=false)
	protected Integer reply=0;
	
	// 글 아래 모든 답변들에 대해 reply_level과 관계없이 1씩 증가
	@Column(length=10, nullable=false)
	protected Integer replystep;
	
	// 1차, 2차 답글인지 여부
	// 하나의 글에 답변이 두개면 그 두 답변은 reply_level이 같다
	// 리스트보기에서 reply_level에 따라 들여쓰기를 한다.
	@Column(length=10, nullable=false)
	protected Integer replylevel;
}
