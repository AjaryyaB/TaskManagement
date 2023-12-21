package com.tms.utils;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.jdbc.core.JdbcTemplate;

@Component
public class DataLoader implements CommandLineRunner {

	private final JdbcTemplate jdbcTemplate;

	public DataLoader(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public void run(String... args) throws Exception {
		// Check if the data already exists before insertion
		
		if (!isDataAlreadyInserted()) {
			// Insert data if it doesn't exist
			insertData();
		} else {
			System.out.println("Data already exists. Skipping insertion.");
		}
	}

	private boolean isDataAlreadyInserted() {
		// Write a query to check if the data exists in the database
		String query = "SELECT COUNT(*) FROM FGTMgmt.tbl_mentity";

		int count = jdbcTemplate.queryForObject(query, Integer.class);
		return count > 0;
	}

	private void insertData() {
		String mEntitiesMasterData = "INSERT INTO FGTMgmt.tbl_mentity (`entity_id`, `entity_address`, `entitycin`, `entity_contact`, `entity_desc`, `entity_email`, `entitygst`, `entity_legal_name`, `entity_name`, `entity_status`, `entityurl`) VALUES "
				+ "('1', '123 Main Street, New York City, USA', 'CIN123', '+1234567890', 'Technology Services', 'john.doe@example.com', 'GSTIN123', 'ABC Technologies Ltd', 'ABC Tech', 'Active', 'https://www.abctech.com'), "
				+ "('2', '456 Elm Street, London, UK', 'CIN456', '+447123456789', 'Financial Consulting', 'jane.smith@example.com', 'GSTIN456', 'XYZ Financial Solutions', 'XYZ Finance', 'Active', 'https://www.xyzfinance.com'), "
				+ "('3', '789 Oak Street, Sydney, Australia', 'CIN789', '+61234567890', 'Healthcare Solutions', 'michael.johnson@example.com', 'GSTIN789', 'HealthCare Innovations LLC', 'HC Innovations', 'Inactive', 'https://www.hcinnovations.com'), "
				+ "('4', '101 Pine Street, Mumbai, India', 'CIN101', '+919876543210', 'Retail & E-commerce', 'emily.brown@example.com', 'GSTIN101', 'RetailGenius Ltd', 'RetailGenius', 'Active', 'https://www.retailgenius.com'), "
				+ "('5', '202 Cedar Street, Toronto, Canada', 'CIN202', '+14165551212', 'Education Services', 'david.wilson@example.com', 'GSTIN202', 'EduSolutions Inc', 'EduSolutions', 'Inactive', 'https://www.edusolutions.com'), "
				+ "('6', '303 Maple Street, Paris, France', 'CIN303', '+33123456789', 'Hospitality & Travel', 'sophia.garcia@example.com', 'GSTIN303', 'TravelEase Ltd', 'TravelEase', 'Active', 'https://www.travelease.com'), "
				+ "('7', '404 Birch Street, Berlin, Germany', 'CIN404', '+491234567890', 'Real Estate & Property', 'william.martinez@example.com', 'GSTIN404', 'PropertyPro Solutions', 'PropertyPro', 'Active', 'https://www.propertypro.com'), "
				+ "('8', '505 Walnut Street, Tokyo, Japan', 'CIN505', '+819012345678', 'Automotive Solutions', 'olivia.turner@example.com', 'GSTIN505', 'AutoTech Innovations', 'AutoTech', 'Inactive', 'https://www.autotech.com'), "
				+ "('9', '606 Ash Street, Sao Paulo, Brazil', 'CIN606', '+5511998765432', 'Media & Entertainment', 'ethan.roberts@example.com', 'GSTIN606', 'EntertainmentHub Ltd', 'EntertainmentHub', 'Active', 'https://www.entertainmenthub.com'), "
				+ "('10', '707 Cherry Street, Cape Town, South Africa', 'CIN707', '+27821234567', 'Environmental Services', 'ava.nelson@example.com', 'GSTIN707', 'EcoSolutions Inc', 'EcoSolutions', 'Inactive', 'https://www.ecosolutions.com')";
		jdbcTemplate.update(mEntitiesMasterData);
		
		String rolesMasterData = "INSERT INTO tbl_mrole (role_name, role_desc, role_cr_date, role_en_date) " +
                "VALUES " +
                "('user', 'User Role', '2023-12-19', NULL), " +
                "('admin', 'Admin Role', '2023-12-19', NULL), " +
                "('super admin', 'Super Admin Role', '2023-12-19', NULL)";

        jdbcTemplate.update(rolesMasterData);
        
        String priorityMasterData = "INSERT INTO tbl_mtpriority (task_priority_name, task_priority_desc) " +
                "VALUES " +
                "('High', 'High Priority'), " +
                "('Medium', 'Medium Priority'), " +
                "('Low', 'Low Priority')";

        jdbcTemplate.update(priorityMasterData);
        
        String taskTypeMasterData = "INSERT INTO tbl_mtask_type (task_type_name, task_type_desc) " +
                "VALUES " +
                "('Bug', 'Task type for software bugs'), " +
                "('Feature', 'Task type for new features'), " +
                "('Improvement', 'Task type for improvements'), " +
                "('Maintenance', 'Task type for maintenance'), " +
                "('Research', 'Task type for research')";

        // Execute the SQL query
        jdbcTemplate.update(taskTypeMasterData);
	}

}
