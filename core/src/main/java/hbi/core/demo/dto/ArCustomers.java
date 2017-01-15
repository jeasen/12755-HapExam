package hbi.core.demo.dto;

import com.hand.hap.system.dto.BaseDTO;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by leo on 2017/1/13.
 */
@Table(name = "hap_ar_customers")
public class ArCustomers extends BaseDTO{

    @Id
    @GeneratedValue
    private Long customerId;
    private String customerNumber;
    private String customerName;
    private String companyId;

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getCustomerNumber() {
        return customerNumber;
    }

    public void setCustomerNumber(String customerNumber) {
        this.customerNumber = customerNumber;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCompantId() {
        return companyId;
    }

    public void setCompantId(String compantId) {
        this.companyId = compantId;
    }
}
