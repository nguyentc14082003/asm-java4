package com.poly.models;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class Invoice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int invoice_id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private UserCustom user;

	private Date invoice_date;
	private double total_amount;
	private String description;

	@OneToMany(mappedBy = "invoice", cascade = CascadeType.ALL)
	private List<InvoiceDetail> invoiceDetails;

	public Invoice() {
	}

	public Invoice(int invoice_id, UserCustom user, Date invoice_date, double total_amount, String description,
			List<InvoiceDetail> invoiceDetails) {
		super();
		this.invoice_id = invoice_id;
		this.user = user;
		this.invoice_date = invoice_date;
		this.total_amount = total_amount;
		this.description = description;
		this.invoiceDetails = invoiceDetails;
	}

	public int getInvoice_id() {
		return invoice_id;
	}

	public void setInvoice_id(int invoice_id) {
		this.invoice_id = invoice_id;
	}

	public UserCustom getUser() {
		return user;
	}

	public void setUser(UserCustom user) {
		this.user = user;
	}

	public Date getInvoice_date() {
		return invoice_date;
	}

	public void setInvoice_date(Date invoice_date) {
		this.invoice_date = invoice_date;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<InvoiceDetail> getInvoiceDetails() {
		return invoiceDetails;
	}

	public void setInvoiceDetails(List<InvoiceDetail> invoiceDetails) {
		this.invoiceDetails = invoiceDetails;
	}

}
