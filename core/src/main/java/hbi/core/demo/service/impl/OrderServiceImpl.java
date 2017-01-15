package hbi.core.demo.service.impl;

import com.github.pagehelper.PageHelper;
import com.hand.hap.core.IRequest;
import com.hand.hap.system.service.impl.BaseServiceImpl;
import hbi.core.demo.dto.OmOrderHeaders;
import hbi.core.demo.mapper.OrderMapper;
import hbi.core.demo.service.OrderSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by leo on 2017/1/13.
 */

@Service
public class OrderServiceImpl extends BaseServiceImpl<OmOrderHeaders> implements OrderSevice {

    @Autowired
    OrderMapper OrderMapper;

    @Override
    public List<OmOrderHeaders> getAllOrderHeaders() {
        return OrderMapper.getAllOrderHeaders();
    }

    @Override
    public List<OmOrderHeaders> addOmOrderHeaders(List<OmOrderHeaders> var2) {
        return this.OrderMapper.addOrderHeaders(var2);
    }

    @Override
    public List<OmOrderHeaders> selectAllOrderHeaders(IRequest var1, OmOrderHeaders OmOrderHeaders, int page, int pagesize) {
        PageHelper.startPage(page, pagesize);
        return this.OrderMapper.setAllOrderHeaders(OmOrderHeaders);
    }
}
