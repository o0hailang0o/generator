<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="sca.yabao.data.exchange.dao.${className}Dao">

    <resultMap id="${className}ResultMap" type="sca.yabao.data.exchange.model.${className}">
         <#list primaries as value>
             <id property="${value.fieldName}" column="${value.dataBaseFieldName}"/>
        </#list>
         <#list fields as value>
             <result property="${value.fieldName}" column="${value.dataBaseFieldName}"/>
         </#list>
    </resultMap>

    <select id="list${className}" parameterType="${className}" resultMap="${className}ResultMap">
        SELECT
           <#list fieldEntities as value>
               ${value.dataBaseFieldName}<#if value_has_next>,</#if>
           </#list>
        FROM
               ${tableName}
    </select>

    <select id="findBy${className}Primary" parameterType="${className}" resultMap="${className}ResultMap">
        SELECT
           <#list fieldEntities as value>
               ${value.dataBaseFieldName}<#if value_has_next>,</#if>
           </#list>
        FROM
               ${tableName}
        WHERE
           <#list primaries as value>
               ${value.dataBaseFieldName} = ${'#'}${'{'}${value.fieldName}${'}'}<#if value_has_next>  and</#if>
           </#list>
    </select>
</mapper>