# group_project_sql
** This is a group project during Msc Business Analytics at University of Exeter.

## Overview
This report focuses on the implementation of database technologies in a football ticketing system operated by UK Ticket Major in the United Kingdom. The system aims to simplify the process of purchasing and selling football tickets, reduce fraudulent activities, and enhance customer satisfaction. To achieve this, a polyglot persistence approach is used, combining a relational database management system (RDBMS) and a NoSQL document-based database to handle different types of data.

Key business functions of the football ticket system include:

1. Customer Registration: During registration, customer data is collected, and an optional survey gathers information about sports preferences and social media profiles for marketing analysis.
2. Ticket Purchase: Customers can easily purchase tickets through the system, receiving invoices with purchase details.
3. Ticket Verification: Customers receive tickets with unique IDs and game information for verification.
4. Real-time Availability: The system continuously updates ticket availability for each match and stadium, reducing the risk of double-selling.

The system's primary goal is to improve the overall customer experience, making it convenient for customers to access and purchase football match tickets. This report provides insights into how database technologies are effectively implemented to achieve these objectives in the event ticketing industry.

## Use Case Scenario 
The use case scenario for the football ticket system outlines the customer journey within the system, from registration to providing feedback. It includes steps such as customer registration, optional survey participation, match selection, payment, ticket generation, and post-match feedback gathering for administrators.
# <img width="569" alt="image" src="https://github.com/jiraratset/group_project_sql/assets/123735686/58cdc487-26ba-4dbb-9b21-402d5506297a">

### Database choice justification:
- For customer and ticket management, a relational database was chosen. It effectively stores structured data related to customer information, game details, stadium information, and transaction histories. Constraints ensure data accuracy, support query optimization, and allow for future scalability while maintaining data structure.
- For survey and feedback data, a NoSQL document-based database like MongoDB was selected. This choice accommodates the flexible and semi-structured nature of survey responses. It allows for easy handling of complex data and the addition of new survey questions without extensive table modifications. MongoDB was deemed suitable for merging semi-structured data with the existing structured data in SQL.

### Database Assumptions:
1. Each event occurs in a single stadium, and each stadium contains multiple sections with varying row and seat configurations.
2. Customers can purchase one or more tickets through one or multiple invoices.
3. Each ticket corresponds to one seat for a specific game.
4. Payments correspond to individual invoices, and invoices may include multiple tickets for different games.
5. Customer information is permanently stored and cannot be deleted once associated with an invoice.
6. Not all customers respond to the survey, and not all survey questions receive answers.
7. Customer feedback is assumed to be genuine and reflective of their actual game experience.
8. Managers have the ability to add new questions to the survey.
These assumptions and database choices are tailored to support the effective functioning of the football ticket system, combining the strengths of relational and NoSQL databases to handle various data types and needs.

## Entity Relationship Diagram 
The ER diagram for the football ticket system database consists of six entities: Customer, Invoice, Ticket, Stadium, Section, and Event. The relationships between these entities are as follows:
Each customer can have multiple invoices, but each invoice is associated with only one customer. This is a one-to-many relationship between the Customer and invoice entities.
Each ticket is associated with only one invoice, but an invoice can have multiple tickets. This is a one-to-many relationship between the Invoice and Ticket entities.
Each ticket is associated with only one event, and each event can have multiple tickets. This is a one-to-many relationship between the Event and Ticket entities.
Each event can be hosted in only one stadium, but a stadium can host multiple events. The relationship between Event and Stadium entities is a many-to-one relationship. 
Each stadium can have multiple sections, but each section is associated with only one stadium. This is a one-to-many relationship between the Stadium and Section entities.

# <img width="857" alt="image" src="https://github.com/jiraratset/group_project_sql/assets/123735686/74f38eb7-3fb0-4714-b093-e730c1bb42cf">

simplified version of the ER diagram
# <img width="802" alt="image" src="https://github.com/jiraratset/group_project_sql/assets/123735686/b5424555-b11e-4bb2-ac75-e5f940e5f5b9">

## NoSQL and its use case scenario 
The football ticket system uses MongoDB, a NoSQL document-oriented database, to store semi-structured data such as survey results and post-event feedback. MongoDB is flexible and adaptive to editing data needs because it does not need a predetermined schema. The system also uses a relational database for structured data such as customer information and transaction histories. By combining the strengths of both relational and NoSQL databases, the football ticket system can efficiently handle structured and semi-structured data. 


