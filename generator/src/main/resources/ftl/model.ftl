package sca.yabao.data.exchange.model;
<#if isDate == true>
import java.util.Date;
</#if>
<#if isNumber == true>
import java.math.BigDecimal;
</#if>


public class ${className}{

     private static final long serialVersionUID = 1L;

<#list fieldEntities as value>
    /**
     * ${value.comments}
     */
    private ${value.fieldType} ${value.fieldName}1111;
</#list>

<#list fieldEntities as value>
    public ${value.fieldType} get${value.fieldUpperName}(){
        return ${value.fieldName};
    }


    public void set${value.fieldUpperName} (${value.fieldType} ${value.fieldName}){
        this.${value.fieldName} = ${value.fieldName};
    }


</#list>

     @Override
     public String toString(){
        return "${className}{"+
<#list fieldEntities as value>
            "${value.fieldName}='" + ${value.fieldName}+ '\'' +
</#list>
        '}';
    }

}