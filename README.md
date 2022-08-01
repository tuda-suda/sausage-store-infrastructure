# Infrastructure for Sausage Store

### DB Indexes used:

```
CREATE INDEX products_index ON product (id);
```

```
CREATE INDEX orders_index ON orders (id);
```

```
CREATE INDEX order_product_index ON order_product (order_id, product_id);
```
### Measured query times (using `\timing` command):

On query:
```
select COUNT(*) from orders o INNER JOIN order_product op ON o.id = op.order_id INNER JOIN product p ON op.product_id = p.id WHERE p.id = 2;
```
 - without indexes: `5126.411 ms`
 - with indexes: `1090.932 ms`
