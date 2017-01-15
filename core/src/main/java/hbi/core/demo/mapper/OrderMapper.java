package hbi.core.demo.mapper;

import com.hand.hap.mybatis.common.Mapper;
import hbi.core.demo.dto.OmOrderHeaders;

import java.util.List;

/**
 * Created by leo on 2017/1/13.
 */
public interface OrderMapper extends Mapper<OmOrderHeaders> {
    public List<OmOrderHeaders> getAllOrderHeaders();
    public List<OmOrderHeaders> setAllOrderHeaders(OmOrderHeaders OmOrderHeaders);
    public List<OmOrderHeaders> addOrderHeaders(List<OmOrderHeaders> list);
}
