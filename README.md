# GG Final - Rails with SQLite3

API application created by using ruby on rails and sqlite3 database to store data
and make it helpfull for the manage orders.


## Installation

Run this command to your terminal:

```bash
bundle install
```

```bash
bundle exec rails db:migrate
```

(optional) only use for dummy data

```bash
bulid exec rails db:seed
```

## Run the server

Run this command to your terminal:

```bash
bundle exec rails s
```

```bash
bundle exec whenever --update-crontab
```

or, if you using replit just click run button.

## Testing

For testing with rspec run this command:

```bash
bundle exec rspec -fd
```

## Documentation

**Root Domain**

``https://Gigih-Family-Catering-dakunesu.gojek22.repl.co/``

next, sample url shortened path and parameters only.

---

**Kategori**

- for update data, use parameters for what you want to change

| Method  | URL Path                | Parameter               | Description      |
| ------- | ----------------------- | ----------------------- | ---------------- |
| GET     | `/api/kategori`         | -                       | list kategori    |
| GET     | `/api/kategori/:id`     | -                       | detail kategori  |
| POST    | `/api/kategori`         | <ul><li>nama</li></ul>  | buat kategori    |
| PATH    | `/api/kategori/:id`     | <ul><li>nama</li></ul>  | ubah kategori    |
| DELETE  | `/api/kategori/:id`     | -                       | hapus kategori   |

\
**Menu**

- for update data, use parameters for what you want to change

| Method  | URL Path            | Parameter                                                                   | Description      |
| ------- | ------------------- | --------------------------------------------------------------------------- | ---------------- |
| GET     | `/api/menu`         | -                                                                           | list menu        |
| GET     | `/api/menu/:id`     | -                                                                           | detail menu      |
| POST    | `/api/menu`         | <ul><li>nama</li><li>harga</li><li>deskripsi</li><li>kategori_id</li></ul>  | buat menu        |
| PATH    | `/api/menu/:id`     | <ul><li>nama</li><li>harga</li><li>deskripsi</li><li>kategori_id</li></ul>  | ubah menu        |
| DELETE  | `/api/menu/:id`     | -                                                                           | hapus menu       |

\
**Order**

- for update data, use parameters for what you want to change

| Method  | URL Path             | Parameter                | Description       |
| ------- | -------------------- | ------------------------ | ----------------- |
| GET     | `/api/order`         | -                        | list order        |
| GET     | `/api/order/:id`     | -                        | detail order      |
| POST    | `/api/order`         | <ul><li>email</li></ul>  | buat order        |
| POST    | `/api/order/:id/paid`| -                        | **paid order**    |
| PATH    | `/api/order/:id`     | <ul><li>email</li></ul>  | ubah order        |
| DELETE  | `/api/order/:id`     | -                        | hapus order       |

\
**Order Menu**

- for update data, use parameters for what you want to change

| Method  | URL Path                                | Parameter                                | Description            |
| ------- | --------------------------------------- | ---------------------------------------- | ---------------------- |
| GET     | `/api/order/:order_id/menu`              | -                                        | list order menu        |
| GET     | `/api/order/:order_id/menu/:menu_id`     | -                                        | detail order menu      |
| POST    | `/api/order/:order_id/menu`              | <ul><li>menu_id</li><li>porsi</li></ul>  | buat order menu        |
| PATH    | `/api/order/:order_id/menu/:menu_id`     | <ul><li>menu_id</li><li>porsi</li></ul>  | ubah order menu        |
| DELETE  | `/api/order/:order_id/menu/:menu_id`     | -                                                                           | hapus order menu       |


\
**Report**

- clear the parameters on the date filter for today only.

| Method  | URL Path                      | Parameter                                                           | Description       |
| ------- | ----------------------------- | ------------------------------------------------------------------- | ----------------- |
| GET     | `/api/report?filter=date`     | <ul><li>s = tanggal awal</li><li>e = tanggal akhir</li></ul>        | report by date    |
| GET     | `/api/report?filter=harga`    | <ul><li>s = harga minimal</li><li>e = harga maksimal</li></ul>      | report by price   |
| GET     | `/api/report?filter=email`    | <ul><li>q = email</li></ul>                                         | report by email   |

\
**Unpaid Order**

for order status below 5 p.m today, it will automatically be changed to unpaid / canceled.
\
\
or, you can use this to change the status semi-automatically.

| Method  | URL Path             | Parameter     | Description                            |
| ------- | -------------------- | ------------- | -------------------------------------- |
| POST     | `/api/order/unpaid` | -             | **unpaid all new order** under 5 p.m.  |
