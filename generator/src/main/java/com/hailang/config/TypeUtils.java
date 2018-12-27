package com.hailang.config;

public class TypeUtils {

    public static String mapType(String type){
        String dataType = type.toLowerCase();
        switch (dataType){
            case "varchar":
                return "String";
            case "char":
                return "String";
            case "number":
                return "BigDecimal";
            case "integer":
                return "Integer";
            case "float":
                return "Bigdecimal";
            case "date":
                return "Date";
            case "long":
                return "Long";
            case "timestamp":
                return "Date";
            default:
                return "String";
        }
    }
}
