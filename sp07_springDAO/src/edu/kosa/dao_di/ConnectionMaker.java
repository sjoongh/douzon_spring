package edu.kosa.dao_di;

import java.sql.Connection;

public interface ConnectionMaker {
	
	Connection makeConnection() throws Exception;
}
