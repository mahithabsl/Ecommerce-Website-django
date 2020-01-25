from django.http import JsonResponse
from django.shortcuts import render
from django.contrib.auth import authenticate,login
from django.conf import settings
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from .models import *
import base64
# Create your views here.

def index(request):
		mobile=Products.objects.filter(product_type_code=1)
		mobile_count=Products.objects.filter(product_type_code=1).count()
		mobile_pro=Ref_Product_Types.objects.get(product_type_description='Mobile')
		shoes=Products.objects.filter(product_type_code=2)
		watch=Products.objects.filter(product_type_code=4)
		clothes=Products.objects.filter(product_type_code=10)|Products.objects.filter(product_type_code=11)|Products.objects.filter(product_type_code=12)
		men_count=Products.objects.filter(product_type_code=10).count()
		wemen_count=Products.objects.filter(product_type_code=11).count()
		kids_count=Products.objects.filter(product_type_code=12).count()
		return render(request, 'index.html',{'mobile':mobile,'mobile_count':mobile_count,'mobile_pro':mobile_pro,'shoes':shoes,'watch':watch,'clothes':clothes,'men_count':men_count,'wemen_count':wemen_count,'kids_count':kids_count})
	

def u_register(request):
	return render(request, 'user_register.html',{})

def userlogin(request):
	return render(request, 'userlogin.html',{})

def signup(request):
	if request.method=='POST':
		first_name=request.POST.get('fname')
		middle_name=request.POST.get('mname')
		last_name=request.POST.get('lname')
		gender=request.POST.get('gender')
		email_address=request.POST.get('email')
		login_name=request.POST.get('username')
		login_password=request.POST.get('pass')
		login_password=base64.b64encode(login_password.encode())
		login_password=login_password.decode()
		phone_number=str(request.POST.get('phone'))
		add_line1=request.POST.get('add1')
		add_line2=request.POST.get('add2')
		add_line3=request.POST.get('add3')
		pin_code=str(request.POST.get('pincode'))
		city=request.POST.get('city')
		state=request.POST.get('state')
		country=request.POST.get('country')
		customer=Customers()
		customer.first_name=first_name
		customer.middle_name=middle_name
		customer.last_name=last_name
		customer.gender=gender
		customer.email_address=email_address
		customer.login_name=login_name
		customer.login_password=login_password
		customer.phone_number=phone_number
		customer.add_line1=add_line1
		customer.add_line2=add_line2
		customer.add_line3=add_line3
		customer.pin_code=pin_code
		customer.city=city
		customer.state=state
		customer.country=country
		customer.save()
		print(customer)
		return HttpResponse('ok')
	else:
		return HttpResponse('error')


def productdetails(request):
	product_id=request.GET['product_id']
	product=Products.objects.get(product_id=product_id)
	return render(request, 'productdetail.html',{'product':product})

def userauth(request):
	if request.method=='POST':
		loginid=request.POST.get('loginid')
		# print(loginid)
		loginpass=request.POST.get('loginpass')
		loginpass=base64.b64encode(loginpass.encode())
		loginpass=loginpass.decode()
		try:
			user=Customers.objects.get(login_name=loginid,login_password=loginpass)
			if user:
				f_name=user.first_name
				m_name=user.middle_name
				l_name=user.last_name
				u_name=f_name+" "+m_name+" "+l_name
				mobile=Products.objects.filter(product_type_code=1)
				mobile_count=Products.objects.filter(product_type_code=1).count()
				mobile_pro=Ref_Product_Types.objects.get(product_type_description='Mobile')
				shoes=Products.objects.filter(product_type_code=2)
				watch=Products.objects.filter(product_type_code=4)
				clothes=Products.objects.filter(product_type_code=10)|Products.objects.filter(product_type_code=11)|Products.objects.filter(product_type_code=12)
				men_count=Products.objects.filter(product_type_code=10).count()
				wemen_count=Products.objects.filter(product_type_code=11).count()
				kids_count=Products.objects.filter(product_type_code=12).count()
				return render(request, 'login_home.html',{'user':u_name,'mobile':mobile,'mobile_count':mobile_count,'mobile_pro':mobile_pro,'shoes':shoes,'watch':watch,'clothes':clothes,'men_count':men_count,'wemen_count':wemen_count,'kids_count':kids_count})
			else:
				msg={'Error':'User id or Password is wrong'}
				return render(request, 'userlogin.html',context=msg)
		except:
			msg={'Error':'User id or Password is wrong'}
			return render(request, 'userlogin.html',context=msg)
		else:

			return render(request, 'login_home.html')


def logout(request):
	return render(request, 'userlogin.html')