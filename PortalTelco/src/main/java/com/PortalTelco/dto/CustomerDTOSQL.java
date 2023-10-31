package com.PortalTelco.dto;

import java.sql.SQLData;
import java.sql.SQLException;
import java.sql.SQLInput;
import java.sql.SQLOutput;

public class CustomerDTOSQL extends CustomerDTO implements SQLData {
    @Override
    public String getSQLTypeName() {
        return "TYRC_CUSTOMER";
    }

    @Override
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        setDocument(stream.readLong());
        setFirstName(stream.readString());
        setLastName(stream.readString());
        setEmail(stream.readString());
        setPhoneNumber(stream.readString());
        setAddress(stream.readString());
    }

    @Override
    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeLong(getDocument());
        stream.writeString(getFirstName());
        stream.writeString(getLastName());
        stream.writeString(getEmail());
        stream.writeString(getPhoneNumber());
        stream.writeString(getAddress());
    }
}
