package hbi.core.demo.service;

import com.hand.hap.core.IRequest;
import com.hand.hap.core.ProxySelf;
import com.hand.hap.fnd.dto.Company;
import com.hand.hap.system.service.IBaseService;
import hbi.core.demo.dto.OmOrderHeaders;

import java.util.List;

/**
 * Created by leo on 2017/1/13.
 */
public interface OrderSevice extends IBaseService<OmOrderHeaders>,ProxySelf<OrderSevice>{

    List<OmOrderHeaders> getAllOrderHeaders();
    List<OmOrderHeaders> addOmOrderHeaders(List<OmOrderHeaders> var2);
    List<OmOrderHeaders> selectAllOrderHeaders(IRequest var1, OmOrderHeaders var2, int var3, int var4);

}
