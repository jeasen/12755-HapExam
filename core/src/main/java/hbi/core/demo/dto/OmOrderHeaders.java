package hbi.core.demo.dto;

import com.hand.hap.system.dto.BaseDTO;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
import java.util.List;

/**
 * Created by leo on 2017/1/13.
 */
@Table(name = "hap_om_order_headers")
public class OmOrderHeaders extends BaseDTO {

    @Id
    @GeneratedValue
    private Long headerId;
    private String orderNumber;
    private Long companyId;
    private String orderStatus;
    private Long customerId;
    private Date orderDate;

    @Transient
    private OrgCompanys OrgCompanys;
    @Transient
    private ArCustomers ArCustomers;
    @Transient
    private OmOrderLines OmOrderLines;

    public Long getHeaderId() {
        return headerId;
    }

    public void setHeaderId(Long headerId) {
        this.headerId = headerId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public hbi.core.demo.dto.OrgCompanys getOrgCompanys() {
        return OrgCompanys;
    }

    public void setOrgCompanys(hbi.core.demo.dto.OrgCompanys orgCompanys) {
        OrgCompanys = orgCompanys;
    }

    public hbi.core.demo.dto.ArCustomers getArCustomers() {
        return ArCustomers;
    }

    public void setArCustomers(hbi.core.demo.dto.ArCustomers arCustomers) {
        ArCustomers = arCustomers;
    }

    public hbi.core.demo.dto.OmOrderLines getOmOrderLines() {
        return OmOrderLines;
    }

    public void setOmOrderLines(hbi.core.demo.dto.OmOrderLines omOrderLines) {
        OmOrderLines = omOrderLines;
    }

    @Override
    public String toString() {
        return "OmOrderHeaders{" +
                "headerId=" + headerId +
                ", orderNumber='" + orderNumber + '\'' +
                ", companyId=" + companyId +
                ", orderStatus='" + orderStatus + '\'' +
                ", customerId=" + customerId +
                ", orderDate=" + orderDate +
                ", OrgCompanys=" + OrgCompanys +
                ", ArCustomers=" + ArCustomers +
                ", OmOrderLines=" + OmOrderLines +
                '}';
    }
}
