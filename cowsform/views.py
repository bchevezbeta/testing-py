from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.shortcuts import get_object_or_404, render
from django.db import IntegrityError
from django.core.mail import send_mail
from django.urls import reverse
from .models import NamePlate, CarModel, CarMake
from .forms import NamePlateForm
import datetime
 
def index(request):

    cMakeList = "{"
    for model in CarModel.objects.all():
        cMake = CarMake.objects.filter(carModel_id=model.id)
        cMakeList += model.name + ": ["
        for make in cMake:
            cMakeList += "\"" + make.name + "\", "
        cMakeList += "],"
    cMakeList += "}"

    cMakeListActive = "{"
    for model in CarModel.objects.all():
        cMake = CarMake.objects.filter(carModel_id=model.id)
        cMakeListActive += model.name + ": ["
        for make in cMake:
            cMakeListActive += "\"" + str(make.active) + "\", "
        cMakeListActive += "],"
    cMakeListActive += "}"

    # if this is a POST request we need to process the form data
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = NamePlateForm(request.POST)

        # check whether it's valid:
        if form.is_valid():
            try:
                NamePlateInst = NamePlate()

                business_center = form.cleaned_data['business_center']
                subject_name = business_center + '-' + form.cleaned_data['month'] + '-' + form.cleaned_data['car_model'] + '-' + form.cleaned_data['car_make']
                subject_name = subject_name.lower()
                subject_name = subject_name.replace(' ', '_')
                subject_name += '-{:%Y-%m-%d-%H:%M}'.format(datetime.datetime.now())

                NamePlateInst.subject_name = subject_name
                NamePlateInst.month = form.cleaned_data['month']
                NamePlateInst.business_center = business_center
                NamePlateInst.states = form.cleaned_data['states']
                NamePlateInst.zip_codes = form.cleaned_data['zip_codes']
                NamePlateInst.dma = form.cleaned_data['dma']
                NamePlateInst.car_year = form.cleaned_data['car_year']
                NamePlateInst.car_model = form.cleaned_data['car_model']
                NamePlateInst.car_make = form.cleaned_data['car_make']
                NamePlateInst.car_trim = form.cleaned_data['car_trim']
                NamePlateInst.box_size = form.cleaned_data['box_size']
                NamePlateInst.wheel_base = form.cleaned_data['wheel_base']
                NamePlateInst.co_customer_cash_program_id = form.cleaned_data['co_customer_cash_program_id']
                NamePlateInst.co_customer_cash = form.cleaned_data['co_customer_cash']
                NamePlateInst.co_bc_bonus_cash_program_id = form.cleaned_data['co_bc_bonus_cash_program_id']
                NamePlateInst.co_bc_bonus_cash = form.cleaned_data['co_bc_bonus_cash']
                NamePlateInst.co_auto_show_bonus_cash_program_id = form.cleaned_data['co_auto_show_bonus_cash_program_id']
                NamePlateInst.co_auto_show_bonus_cash = form.cleaned_data['co_auto_show_bonus_cash']
                NamePlateInst.fo_apr_and_term_program_id = form.cleaned_data['fo_apr_and_term_program_id']
                NamePlateInst.fo_apr_and_term = form.cleaned_data['fo_apr_and_term']
                NamePlateInst.fo_bc_bonus_cash_program_id = form.cleaned_data['fo_bc_bonus_cash_program_id']
                NamePlateInst.fo_bc_bonus_cash = form.cleaned_data['fo_bc_bonus_cash']
                NamePlateInst.fo_auto_show_bonus_cash_program_id = form.cleaned_data['fo_auto_show_bonus_cash_program_id']
                NamePlateInst.fo_auto_show_bonus_cash = form.cleaned_data['fo_auto_show_bonus_cash']
                NamePlateInst.ccfo_customer_cash_program_id = form.cleaned_data['ccfo_customer_cash_program_id']
                NamePlateInst.ccfo_customer_cash = form.cleaned_data['ccfo_customer_cash']
                NamePlateInst.ccfo_cc_bc_bonus_cash_program_id = form.cleaned_data['ccfo_cc_bc_bonus_cash_program_id']
                NamePlateInst.ccfo_cc_bc_bonus_cash = form.cleaned_data['ccfo_cc_bc_bonus_cash']
                NamePlateInst.ccfo_apr_and_term_program_id = form.cleaned_data['ccfo_apr_and_term_program_id']
                NamePlateInst.ccfo_apr_and_term = form.cleaned_data['ccfo_apr_and_term']
                NamePlateInst.ccfo_aat_bc_bonus_cash_program_id = form.cleaned_data['ccfo_aat_bc_bonus_cash_program_id']
                NamePlateInst.ccfo_aat_bc_bonus_cash = form.cleaned_data['ccfo_aat_bc_bonus_cash']
                NamePlateInst.lo_lease_payment_program_id = form.cleaned_data['lo_lease_payment_program_id']
                NamePlateInst.lo_lease_payment = form.cleaned_data['lo_lease_payment']
                NamePlateInst.lo_term_program_id = form.cleaned_data['lo_term_program_id']
                NamePlateInst.lo_term = form.cleaned_data['lo_term']
                NamePlateInst.lo_due_at_signing_program_id = form.cleaned_data['lo_due_at_signing_program_id']
                NamePlateInst.lo_due_at_signing = form.cleaned_data['lo_due_at_signing']
                NamePlateInst.tcv_program_id = form.cleaned_data['tca_program_id']
                NamePlateInst.total_cash_allowance = form.cleaned_data['total_cash_allowance']
                NamePlateInst.tv_program_id = form.cleaned_data['tv_program_id']
                NamePlateInst.total_values = form.cleaned_data['total_values']
                NamePlateInst.save()

                subject = business_center + ' has submitted something'
                message = business_center + ' has submitted something for you to review, subject name ' + subject_name
                '''
                send_mail(
                    subject,
                    message,
                    'bchevez@hugeinc.com',
                    ['bchevez@hugeinc.com', 'tbresnen@hugeinc.com'],
                    fail_silently=False,
                )
                '''
            except IntegrityError as e:
                form = NamePlateForm()
                return render(request, 'cowsform/form.html', {'form': form, 'error': 'Duplicate subject name', 'carModel': CarModel.objects.all(), 'carMake': cMakeList, 'carMakeActive': cMakeListActive})


            # redirect to a new URL:
            return render(request, 'cowsform/thanks.html', {'form': form, 'npi': NamePlateInst})

        else:
            return render(request, 'cowsform/form.html', {'form': form, 'carModel': CarModel.objects.all(), 'carMake': cMakeList, 'carMakeActive': cMakeListActive})


    # if a GET (or any other method) we'll create a blank form
    else:

        form = NamePlateForm()
        return render(request, 'cowsform/form.html', {'form': form, 'carModel': CarModel.objects.all(), 'carMake': cMakeList, 'carMakeActive': cMakeListActive})

def ListView(request):
    npList= NamePlate.objects.order_by('-pub_date')
    return render(request, 'cowsform/list.html', {'npList': npList})

def ListDetailView(request, npId):
    try:
        nameplate = NamePlate.objects.get(pk=npId)
    except NamePlate.DoesNotExist:
        raise Http404("NamePlate Id does not exist")
    return render(request, 'cowsform/detail.html', {'nameplate': nameplate})
