package com.kaishengit.controller;

import com.kaishengit.dto.AjaxResult;
import com.kaishengit.dto.WorkOutDto;
import com.kaishengit.exception.ServiceException;
import com.kaishengit.pojo.Work;
import com.kaishengit.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/work/out")
public class WorkOutController {

    @Autowired
    private WorkService workService;

    @GetMapping
    public String list(){
        return "work/out/list";
    }

    @GetMapping("/add")
    public String addOut(Model model){
        List<Work> workList = workService.findAllWork();
        model.addAttribute("workList",workList);
        return "work/out/add";
    }

    @GetMapping("/work.json")
    @ResponseBody
    public AjaxResult addJson(Integer id){
        Work work = workService.findWorkById(id);
        if(work == null){
            return new AjaxResult(AjaxResult.ERROR,"员工不存在");
        }else {
            return new AjaxResult(work);
        }
    }

    @PostMapping("/new")
    @ResponseBody
    public AjaxResult saveWork(@RequestBody WorkOutDto workOutDto){
        try {
            String serialNumber = workService.saveWork(workOutDto);
            AjaxResult result = new AjaxResult();
            result.setData(serialNumber);
            result.setStatus(AjaxResult.SUCCESS);
            return result;
        }catch (ServiceException ex){
            return new AjaxResult(AjaxResult.ERROR,ex.getMessage());
        }

    }
}
