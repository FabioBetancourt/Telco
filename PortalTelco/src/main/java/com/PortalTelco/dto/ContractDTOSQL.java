package com.PortalTelco.dto;

import java.sql.SQLData;
import java.sql.SQLException;
import java.sql.SQLInput;
import java.sql.SQLOutput;

public class ContractDTOSQL extends ContractDTO implements SQLData {
    @Override
    public String getSQLTypeName() {
        return "TYRC_CUSTOMER_SERVICES";
    }

    @Override
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        setFkIdCustomer(stream.readLong());
        setFkIdService(stream.readLong());
    }

    @Override
    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeLong(getFkIdCustomer());
        stream.writeLong(getFkIdService());
    }
}
