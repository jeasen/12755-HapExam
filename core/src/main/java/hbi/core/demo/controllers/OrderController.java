package hbi.core.demo.controllers;

import com.hand.hap.core.IRequest;
import com.hand.hap.fnd.dto.Company;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;
import hbi.core.demo.dto.OmOrderHeaders;
import hbi.core.demo.service.OrderSevice;
import jxl.write.WritableWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by leo on 2017/1/13.
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

    @Autowired
    OrderSevice OrderSevice;

    @RequestMapping({"/getAll"})
    @ResponseBody
    public ResponseData select(OmOrderHeaders OmOrderHeaders, HttpServletRequest request, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int pagesize) {
        IRequest requestCtx = this.createRequestContext(request);
        System.err.println("--------------------------------------------------------");
        System.err.println(OmOrderHeaders.toString());
        return new ResponseData(this.OrderSevice.selectAllOrderHeaders(requestCtx, OmOrderHeaders, page, pagesize));
    }

    @RequestMapping({"/update"})
    @ResponseBody
    public ResponseData update(@RequestBody List<OmOrderHeaders> OmOrderHeaderss, HttpServletRequest request) {
        IRequest requestCtx = this.createRequestContext(request);
        for (OmOrderHeaders omOrderHeaders: OmOrderHeaderss) {
            System.err.println("--------------------------------------------------------");
            System.err.println(omOrderHeaders.toString());
            System.err.println("状态呢:::::"+omOrderHeaders.get__status());
        }
        System.err.println("--------遍历借宿了---------------------");
//        return null;
//        return new ResponseData(this.OrderSevice.batchUpdate(requestCtx, OmOrderHeaders));
        List<OmOrderHeaders> OmOrderHeaders = new ArrayList<>();
        OmOrderHeaders.add(new OmOrderHeaders());
        if (requestCtx == null){
            System.err.println("--------nullllll---------------------");
        }else {
            System.err.println("--------nnnnnnnnnnnnn---------------------");
        }

        ResponseData ResponseData =  new ResponseData(this.OrderSevice.batchUpdate(requestCtx, OmOrderHeaderss));

        return null;
//        return  new ResponseData(this.OrderSevice.addOmOrderHeaders(OmOrderHeaders));
    }


}
