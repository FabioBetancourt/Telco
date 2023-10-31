package com.PortalTelco.dto;

import java.sql.*;

public class CampaignDTOSQL extends CampaignDTO implements SQLData {
    @Override
    public String getSQLTypeName() {
        return "TYRC_CAMPAIGN";
    }

    @Override
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        setNumberOfServices(stream.readLong());
        setCustomerSeniority(stream.readLong());
        setDiscount(stream.readLong());
        setDiscountStartDate(stream.readDate());
        setDiscountEndDate(stream.readDate());
    }

    @Override
    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeLong(getNumberOfServices());
        stream.writeLong(getCustomerSeniority());
        stream.writeLong(getDiscount());
        stream.writeDate(new java.sql.Date(getDiscountStartDate().getTime()));
        stream.writeDate(new java.sql.Date(getDiscountEndDate().getTime()));
    }
}
