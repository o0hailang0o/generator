package com.hailang.config;

import com.hailang.entity.FieldEntity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataUtils {

    public static List<FieldEntity> getAllField() throws Exception{
        List<FieldEntity> list = new ArrayList<FieldEntity>();
        final String SQL = "select  a.column_name,a.data_type,b.comments " +
                "from all_tab_columns a " +
                "left outer join all_col_comments b  " +
                "on  a.column_name = b.column_name and a.table_name = b.table_name " +
                "where a.table_name=upper(?) GROUP BY a.column_name,a.data_type,b.comments";
        Connection conn = JdbcUtils.getConnection();
        try {
            PreparedStatement pst = conn.prepareStatement(SQL);
            pst.setString(1 ,PropertiesUtils.get("tableName"));
          //  pst.setInt(2, e.getAgeend());
            ResultSet rSet = pst.executeQuery();
            while (rSet.next()) {
                FieldEntity fieldEntity = new FieldEntity();
                fieldEntity.setDataBaseFieldName(rSet.getString("column_name").toUpperCase());
                fieldEntity.setComments(rSet.getString("comments"));
                fieldEntity.setFieldName(BeanHump.underlineToCamel2(rSet.getString("column_name")));
                fieldEntity.setFieldUpperName(BeanHump.underlineToCamel(rSet.getString("column_name")));
                fieldEntity.setFieldType(TypeUtils.mapType(rSet.getString("data_type")));
                list.add(fieldEntity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
        }
        return list;
    }

    public static List<FieldEntity> getPrimary()throws Exception{
        List<FieldEntity> list = new ArrayList<FieldEntity>();
        String SQL = "select  col.constraint_name,col.table_name,column_name\n" +
                "from all_constraints con,all_cons_columns col\n" +
                "where\n" +
                "con.constraint_name=col.constraint_name and con.constraint_type='P'\n" +
                "and col.table_name= upper(?) group by col.constraint_name,col.table_name,column_name";
        Connection conn = JdbcUtils.getConnection();
        try {
            PreparedStatement pst = conn.prepareStatement(SQL);
            pst.setString(1 ,PropertiesUtils.get("tableName"));
            //  pst.setInt(2, e.getAgeend());
            ResultSet rSet = pst.executeQuery();
            while (rSet.next()) {
                FieldEntity fieldEntity = new FieldEntity();
                fieldEntity.setDataBaseFieldName(rSet.getString("column_name"));
                fieldEntity.setFieldName(BeanHump.underlineToCamel2(rSet.getString("column_name")));
                fieldEntity.setFieldUpperName(BeanHump.underlineToCamel(rSet.getString("column_name")));
                list.add(fieldEntity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
        }
        return list;
    }


    public static void main(String[] args)throws Exception{
        System.out.print(DataUtils.getPrimary());
    }
}
