# Experiment 1: ER Diagram for Indian E-commerce Platform

This directory contains the Entity-Relationship (ER) diagram for an Indian e-commerce platform.

## Files
- `ER_Diagram.drawio`: The full ER diagram in Draw.io format.
- `README.md`: Contains the Mermaid visual diagram, entities, and constraint specifications.

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
        int product_id PK, FK
        string brand
        int warranty_months
    }
    
    CLOTHING {
        int product_id PK, FK
        string size
        string fabric
    }
    
    ORDERS {
        int order_id PK
        int customer_id FK
        datetime order_date
        float total_amount
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
    CUSTOMER ||--o{ ADDRESS : "has (1:N)"
    CUSTOMER ||--o{ ORDERS : "places (1:N)"
    SELLER ||--o{ PRODUCT : "supplies (1:N)"
    CATEGORY ||--o{ PRODUCT : "contains (1:N)"
    PRODUCT ||--o| ELECTRONICS : "is-a (Specialization)"
    PRODUCT ||--o| CLOTHING : "is-a (Specialization)"
    ORDERS ||--|{ ORDER_ITEM : "contains (1:N, Total Participation)"
    PRODUCT ||--o{ ORDER_ITEM : "ordered-in (1:N)"
    ORDERS ||--|| PAYMENT : "paid-via (1:1)"
    ORDERS ||--|| DELIVERY : "fulfilled-by (1:1)"
```

## Structural Design Details
- **Primary Keys:** Every strong entity possesses an explicit unique identifier (`customer_id`, `seller_id`, `product_id`, `order_id`, etc.).
- **Composite Attributes:** The customer delivery location contains composite sub-attributes (`street`, `city`, `state`, `zip`).
- **Multi-valued Attributes:** The customer entity supports multiple contact telephone numbers.
- **Weak Entity / Total Participation:** `ORDER_ITEM` is bound to `ORDERS` via total participation (every order must contain at least one order item).
- **Specialization / Generalization:** `PRODUCT` specializes into subclass entities `ELECTRONICS` and `CLOTHING` inheriting the primary key.
