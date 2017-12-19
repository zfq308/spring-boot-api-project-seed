package ${basePackage}.web;

import ${basePackage}.core.Result;
import ${basePackage}.core.ResultGenerator;
import ${basePackage}.model.${modelNameUpperCamel};
import ${basePackage}.service.${modelNameUpperCamel}Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

import javax.annotation.Resource;
import java.util.List;

/**
* @author  ${author}
* @date ${date}
*/
@RestController
@RequestMapping("${baseRequestMapping}")
@Api("${modelNameUpperCamel} API")
public class ${modelNameUpperCamel}Controller {
    @Resource
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    @PostMapping
    @ApiOperation(value = "Add ${modelNameUpperCamel}", notes = "Add ${modelNameUpperCamel}")
    @ApiImplicitParam(name = "Add", value = "Add", required = true, dataType = "${modelNameUpperCamel}")
    public Result add(@RequestBody ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.save(${modelNameLowerCamel});
        return ResultGenerator.genSuccessResult();
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "delete ${modelNameUpperCamel}", notes = "delete ${modelNameUpperCamel}")
    @ApiImplicitParam(paramType = "path", name = "id", value = "Delete by Id", required = true, dataType = "Integer")
    public Result delete(@PathVariable Integer id) {
        ${modelNameLowerCamel}Service.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @PutMapping
    @ApiOperation(value = "update ${modelNameUpperCamel}", notes = "update ${modelNameUpperCamel}")
    @ApiImplicitParam(name = "Update", value = "Update", required = true, dataType = "${modelNameUpperCamel}")
    public Result update(@RequestBody ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.update(${modelNameLowerCamel});
        return ResultGenerator.genSuccessResult();
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "get detail by Id", notes = "get detail by Id")
    @ApiImplicitParam(paramType = "path", name = "id", value = "get id", required = true, dataType = "Integer")
    public Result detail(@PathVariable Integer id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.findById(id);
        return ResultGenerator.genSuccessResult(${modelNameLowerCamel});
    }

    @GetMapping
    @ApiOperation(value = "get user list", notes = "get user list")
    @ApiImplicitParams(value = {@ApiImplicitParam(paramType = "query", name = "page", value = "PageNumber", required = true, dataType = "Integer"), @ApiImplicitParam(paramType = "query", name = "size", value = "page size", required = true, dataType = "Integer")})
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
