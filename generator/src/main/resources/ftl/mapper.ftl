<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.example.demo.mapper.${classLowerName}Mapper">

    <update id="delete${classLowerName}ById" parameterType="java.lang.Long">
        update ${classLowerName} set delete_flag = '0' where id = #{value}
    </update>
</mapper>