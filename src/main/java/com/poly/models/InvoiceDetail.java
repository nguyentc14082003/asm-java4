package com.poly.models;

import javax.persistence.*;

@Entity
public class InvoiceDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int invoice_detail_id;

    @ManyToOne
    @JoinColumn(name = "invoice_id")
    private Invoice invoice;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    private int quantity;
    private double price;

    public InvoiceDetail() {
    }

	public InvoiceDetail(int invoice_detail_id, Invoice invoice, Product product, int quantity, double price) {
		super();
		this.invoice_detail_id = invoice_detail_id;
		this.invoice = invoice;
		this.product = product;
		this.quantity = quantity;
		this.price = price;
	}

	public int getInvoice_detail_id() {
		return invoice_detail_id;
	}

	public void setInvoice_detail_id(int invoice_detail_id) {
		this.invoice_detail_id = invoice_detail_id;
	}

	public Invoice getInvoice() {
		return invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
    
  
}
