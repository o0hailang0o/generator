package com.demo.controller;

import com.demo.model.${className};
import com.demo.service.${className}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/${classLowerName}")
public class ${className}Controller {

    @Autowired
    private ${className}Service ${classLowerName}Service;

    @GetMapping
    public List<${className}> list${className}(){
        return  ${classLowerName}Service.list${className}();
    }

    @GetMapping("/primary")
    public ${className} select${className}Primary(@RequestBody ${className} ${classLowerName}){
        return  ${classLowerName}Service.select${className}Primary(${classLowerName});
    }

}