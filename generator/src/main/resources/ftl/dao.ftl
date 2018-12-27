package sca.yabao.data.exchange.dao;

import sca.yabao.data.exchange.model.${className};
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ${className}Dao {

    List<${className}> list${className}();

    ${className} findBy${className}Primary(${className} ${classLowerName});

}