from django.db import models
from datetime import date

# Create your models here.

class Customers(models.Model):
	customer_id=models.AutoField(primary_key=True)
	first_name=models.CharField(max_length=15)
	middle_name=models.CharField(max_length=15)
	last_name=models.CharField(max_length=15)
	gender=models.CharField(max_length=6)
	email_address=models.EmailField(max_length=20)
	login_name=models.CharField(primary_key=True,max_length=50)
	login_password=models.CharField(max_length=255)
	phone_number=models.CharField(max_length=12)
	add_line1=models.CharField(max_length=100)
	add_line2=models.CharField(max_length=100)
	add_line3=models.CharField(max_length=100)
	pin_code=models.CharField(max_length=6)
	city=models.CharField(max_length=20)
	state=models.CharField(max_length=20)
	country=models.CharField(max_length=20)

	def __str__(self):
		return self.first_name+" "+self.last_name

	# if you want to menthion the table name in DB.
	#  use this code 

	# class Meta:
	# 	table_name = 'Customers'

class Ref_Order_Status_Codes(models.Model):
	order_status_code=models.AutoField(primary_key=True)
	order_status_description=models.CharField(max_length=15)


class Ref_Payment_Method(models.Model):
	payment_method_code= models.AutoField(primary_key=True)
	payment_method_description=models.CharField(max_length=20)

class Ref_Invoice_Status_Codes(models.Model):
	invoice_status_code=models.AutoField(primary_key=True)
	invoice_status_description=models.CharField(max_length=10)

class Ref_Product_Types(models.Model):
	product_type_code=models.AutoField(primary_key=True)
	product_type_description=models.CharField(max_length=15)

	def __str__(self):
		return self.product_type_description

		
class Customer_Payment_method(models.Model):
	customer_payment_id=models.AutoField(primary_key=True)
	customer_id=models.ForeignKey('Customers',on_delete=models.CASCADE)
	payment_method_code=models.ForeignKey('Ref_Payment_Method',on_delete=models.CASCADE)
	credit_card_number=models.CharField(max_length=16)
	payment_method_details=models.CharField(max_length=30)

class Orders(models.Model):
	order_id=models.AutoField(primary_key=True)
	customer_id=models.ForeignKey('Customers',on_delete=models.CASCADE)
	order_status_code=models.ForeignKey('Ref_Order_Status_Codes',on_delete=models.CASCADE)
	date_order_placed=models.DateField(("Date"),default=date.today)
	order_details=models.CharField(max_length=20)

class Invoices(models.Model):
	invoice_number=models.AutoField(primary_key=True)
	order_id=models.ForeignKey('Orders',on_delete=models.CASCADE)
	invoice_status_code=models.ForeignKey('Ref_Invoice_Status_Codes',on_delete=models.CASCADE)
	invoice_date=models.DateField(("Date"),default=date.today)
	invoice_details=models.CharField(max_length=20)

class Payments(models.Model):
	payment_id=models.AutoField(primary_key=True)
	invoice_number=models.ForeignKey('Invoices',on_delete=models.CASCADE)
	payment_date=models.DateField(("Date"),default=date.today)
	payment_amount=models.FloatField(max_length=15)

class Shipments(models.Model):
	shipment_id=models.AutoField(primary_key=True)
	order_id=models.ForeignKey('Orders',on_delete=models.CASCADE)
	invoice_number=models.ForeignKey('Invoices',on_delete=models.CASCADE)
	shipment_tracking_number=models.CharField(max_length=15)
	shipment_date=models.DateField(("Date"),default=date.today)
	other_shipment_details=models.CharField(max_length=20)

class Products(models.Model):
	product_id=models.AutoField(primary_key=True)
	product_type_code=models.ForeignKey('Ref_Product_Types',on_delete=models.CASCADE)
	return_merchandise_authorization=models.CharField(max_length=20)
	product_name=models.CharField(max_length=20)
	product_price=models.FloatField(max_length=20)
	product_color=models.CharField(max_length=15)
	product_size=models.CharField(max_length=10)
	product_img1=models.ImageField(upload_to='product_img/')
	product_img2=models.ImageField(upload_to='product_img/')
	product_img3=models.ImageField(upload_to='product_img/')
	product_img4=models.ImageField(upload_to='product_img/')
	product_description=models.CharField(max_length=50)
	other_product_details=models.CharField(max_length=255)
	def __str__(self):
		return self.product_name

class Ref_Order_Item_Status_Codes(models.Model):
	order_item_status_code=models.AutoField(primary_key=True)
	order_item_status_description=models.CharField(max_length=10)


class  Order_Items(models.Model):
	order_item_id=models.AutoField(primary_key=True)
	product_id=models.ForeignKey('Products',on_delete=models.CASCADE)
	order_id=models.ForeignKey('Orders',on_delete=models.CASCADE)
	order_item_status_code=models.ForeignKey('Ref_Order_Item_Status_Codes',on_delete=models.CASCADE)
	order_item_quantity=models.IntegerField()
	order_item_price=models.FloatField(max_length=20)
	RMA_number=models.CharField(max_length=15)
	RMA_issued_by=models.CharField(max_length=20)
	RMA_issued_date=models.DateField(("Date"),default=date.today)
	other_order_item_details=models.CharField(max_length=20)

class Shipment_Items(models.Model):
	shipment_items_id=models.AutoField(primary_key=True)
	shipment_id=models.ForeignKey('Shipments',on_delete=models.CASCADE)
	order_item_id=models.ForeignKey('Order_Items',on_delete=models.CASCADE)

