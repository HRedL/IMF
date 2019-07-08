package com.qdu.controller;

import com.qdu.entity.AJAXResult;
import com.qdu.entity.Dict;
import com.qdu.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

/**
 * @Author mqy
 * @Version 2018/11/6
 */
@Controller
@RequestMapping("/dict")
public class DictController {

    @Autowired
    DictService dictService;

//    @ResponseBody
//    @GetMapping("/getDictByCondition")
//    public AjaxJson getDictByCondition(String type){
//        AjaxJson ajaxJson=new AjaxJson();
//        try{
//            Dict dict=new Dict();
//            dict.setType(type);
//            List<Dict> dicts= dictService.getDictsByCondition(type);
//            ajaxJson.setSuccess(true);
//            ajaxJson.getBody().put("dicts",dicts);
//        }catch (Exception e){
//            ajaxJson.setSuccess(false);
//        }
//        return ajaxJson;
//    }

    @RequestMapping(value = "/get/{id}")
    public String getDict(Map<String ,Object> map,@PathVariable("id") Integer id){/*获取id*/
        Dict dict=dictService.get(id);/*根据id用get方法获取dict实体*/
        map.put("dict",dict);/*把dict放入"dict"中，在jsp页面中使用${dict.xx}获取相应属性值*/
        return "dict/lookDict";
    }

    @RequestMapping(value = "/list")
    public String getAllDict(Map<String,Object> map){
        List<Dict> dicts=dictService.findAllList();/*findAllList方法获取数据，放入dicts中*/
        map.put("dicts",dicts);
        return "dict/lookDicts";
    }


    @RequestMapping(value = "/delete/{id}")
    public String deleteUser(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes){
        try{
            dictService.delete(id);/*delete方法删除数据*/
            redirectAttributes.addAttribute("info","删除成功");/*信息为“删除成功”或“删除失败”，在jsp页面上使用${param.info}引用*/
        }
        catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addAttribute("info", "删除失败");
        }
        return "redirect:/dict/list";/*重定向*/
    }

    @RequestMapping("/toAddPage")
    public String toAddPage() {
        return "dict/addDict";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Dict dict) {
        dictService.insert(dict);
        return "redirect:/dict/list";
    }

    @RequestMapping(value = "/toUpdatePage/{id}", method = RequestMethod.GET)
    public String toUpdateDict(@PathVariable("id") Integer id, Map<String,Object> map) {
        Dict dict=dictService.get(id);
        map.put("dict",dict);
        return "dict/updateDict";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(Dict dict){
        System.out.println(dict);
        dictService.update(dict);
        return "redirect:/dict/list";
    }




    @ResponseBody
    @GetMapping("/getDictsByType")
    public AJAXResult getDictsByType (String type){
        AJAXResult ajaxResult=new AJAXResult();
        try{
            List<Dict> dicts=dictService.getDictsByType(type);
            ajaxResult.setData(dicts);
            ajaxResult.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            ajaxResult.setSuccess(false);
            ajaxResult.setMsg("查询失败");
        }

        return ajaxResult;
    }

    @ResponseBody
    @GetMapping("/getDictsByTypeAndParent")
    public AJAXResult getDictsByTypeAndParent (String type,String ptype,String pvalue){
        AJAXResult ajaxResult=new AJAXResult();
        try{
            List<Dict> dicts=dictService.getDictsByTypeAndParent(type,ptype,pvalue);
            ajaxResult.setData(dicts);
            ajaxResult.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            ajaxResult.setSuccess(false);
            ajaxResult.setMsg("查询失败");
        }

        return ajaxResult;
    }



}

