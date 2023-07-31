package com.poly.models;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class FlashSale {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int flashSale_id;

	private Date start_day;
	private Date end_day;
	private boolean is_status;

	@OneToMany(mappedBy = "flashSale", cascade = CascadeType.ALL)
	private List<PromotionalDetails> promotionalDetailsList;

	public FlashSale() {
	}

	public FlashSale(int flashSale_id, Date start_day, Date end_day, boolean is_status,
			List<PromotionalDetails> promotionalDetailsList) {
		super();
		this.flashSale_id = flashSale_id;
		this.start_day = start_day;
		this.end_day = end_day;
		this.is_status = is_status;
		this.promotionalDetailsList = promotionalDetailsList;
	}

	public List<PromotionalDetails> getPromotionalDetailsList() {
		return promotionalDetailsList;
	}

	public void setPromotionalDetailsList(List<PromotionalDetails> promotionalDetailsList) {
		this.promotionalDetailsList = promotionalDetailsList;
	}

	public int getFlashSale_id() {
		return flashSale_id;
	}

	public void setFlashSale_id(int flashSale_id) {
		this.flashSale_id = flashSale_id;
	}

	public Date getStart_day() {
		return start_day;
	}

	public void setStart_day(Date start_day) {
		this.start_day = start_day;
	}

	public Date getEnd_day() {
		return end_day;
	}

	public void setEnd_day(Date end_day) {
		this.end_day = end_day;
	}

	public boolean isIs_status() {
		return is_status;
	}

	public void setIs_status(boolean is_status) {
		this.is_status = is_status;
	}

}
