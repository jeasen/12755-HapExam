package hbi.core.demo.dto;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by leo on 2017/1/13.
 */
@Table(name = "hap_om_order_lines")
public class OmOrderLines {

    @Id
    private Long lineId;
    private Long headerId;
    private Long lineNumber;
    private Long inventoryItemId;
    private Long orderdQuantity;
    private Long orderdQuantityUom;
    private Long unitSellingPrice;
    private String description;
    private Long companyId;

    public Long getLineId() {
        return lineId;
    }

    public void setLineId(Long lineId) {
        this.lineId = lineId;
    }

    public Long getHeaderId() {
        return headerId;
    }

    public void setHeaderId(Long headerId) {
        this.headerId = headerId;
    }

    public Long getLineNumber() {
        return lineNumber;
    }

    public void setLineNumber(Long lineNumber) {
        this.lineNumber = lineNumber;
    }

    public Long getInventoryItemId() {
        return inventoryItemId;
    }

    public void setInventoryItemId(Long inventoryItemId) {
        this.inventoryItemId = inventoryItemId;
    }

    public Long getOrderdQuantity() {
        return orderdQuantity;
    }

    public void setOrderdQuantity(Long orderdQuantity) {
        this.orderdQuantity = orderdQuantity;
    }

    public Long getOrderdQuantityUom() {
        return orderdQuantityUom;
    }

    public void setOrderdQuantityUom(Long orderdQuantityUom) {
        this.orderdQuantityUom = orderdQuantityUom;
    }

    public Long getUnitSellingPrice() {
        return unitSellingPrice;
    }

    public void setUnitSellingPrice(Long unitSellingPrice) {
        this.unitSellingPrice = unitSellingPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }
}
