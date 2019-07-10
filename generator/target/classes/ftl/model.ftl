package com.example.demo.model;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.demo.exception.NotNullException;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
<#if isDate == true>
import java.util.Date;
</#if>
<#if isNumber == true>
import java.math.BigDecimal;
</#if>

@Data
@ApiModel
@TableName(value = "${tableName}")
public class ${className}{

     private static final long serialVersionUID = 1L;

<#list fieldEntities as value>
    @ApiModelProperty(${value.comments})
    private ${value.fieldType} ${value.fieldName};
</#list>

}