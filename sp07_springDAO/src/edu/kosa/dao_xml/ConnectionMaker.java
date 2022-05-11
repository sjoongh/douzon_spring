package edu.kosa.dao_xml;

import java.sql.Connection;

// 확장 관계
public interface ConnectionMaker {
	
	Connection makeConnection() throws Exception;
}
