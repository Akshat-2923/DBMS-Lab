# Experiment 1: ER Diagram for Indian E-commerce Platform

This directory contains the Entity-Relationship (ER) diagram for an Indian e-commerce platform.

## Files
- `ER_Diagram.drawio`: The ER diagram in Draw.io format.
- `requirements.txt`: The initial problem statement.

## ER Diagram (Mermaid Representation)

```mermaid
erDiagram
    %% Entities
    CUSTOMER {
        int customer_id PK
        string first_name
        string last_name
        string email
        string phone_numbers "Multi-valued"
    }
    
    ADDRESS {
        int address_id PK
        string street "Composite (street, city, state, zip)"
        string city
        string state
        string zip
    }
    
    SELLER {
        int seller_id PK
        string seller_name
        string gst_number
    }
    
    CATEGORY {
        int category_id PK
        string category_name
        string description
    }
    
    PRODUCT {
        int product_id PK
        string product_name
        float price
        int category_id FK
        int seller_id FK
    }
    
    ELECTRONICS {
        int warranty_months
        string brand
    }
    
    CLOTHING {
        string size
        string fabric
    }
    
    ORDER {
        int order_id PK
        date order_date
        float total_amount
        int customer_id FK
    }
    
    ORDER_ITEM {
        int order_item_id PK
        int order_id FK
        int product_id FK
        int quantity
        float unit_price
    }
    
    PAYMENT {
        int payment_id PK
        int order_id FK
        string payment_method
        string status
    }
    
    DELIVERY {
        int delivery_id PK
        int order_id FK
        date estimated_delivery
        string delivery_status
    }

    %% Relationships
    CUSTOMER ||--o{ ORDER : "places (Participation)"
    CUSTOMER ||--o{ ADDRESS : "has"
    ORDER ||--|{ ORDER_ITEM : "contains (Weak entity)"
    PRODUCT ||--o{ ORDER_ITEM : "included in"
    SELLER ||--o{ PRODUCT : "supplies"
    CATEGORY ||--o{ PRODUCT : "belongs to"
    ORDER ||--o| PAYMENT : "has"
    ORDER ||--o| DELIVERY : "tracked by"
    
    %% Specialization (Product -> Electronics / Clothing)
    PRODUCT ||--o| ELECTRONICS : "is-a"
    PRODUCT ||--o| CLOTHING : "is-a"
```
