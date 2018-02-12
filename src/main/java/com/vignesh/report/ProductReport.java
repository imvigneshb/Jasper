package com.vignesh.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.vignesh.entity.Product;
import com.vignesh.model.ProductModel;

/**
 * @author vigneshwaran.b
 *
 */
public class ProductReport {

	public List<Map<String, ?>> findAllProducts() {
		List<Map<String, ?>> products = new ArrayList<Map<String, ?>>();
		ProductModel productModel = new ProductModel();
		for (Product p : productModel.listAllProducts()) {
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("id", p.getId());
			m.put("name", p.getName());
			m.put("quantity", p.getQuantity());
			m.put("price", p.getPrice());
			products.add(m);
		}
		return products;
	}
}
