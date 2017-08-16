from django.db import models
from django.utils import timezone
from django import forms

BC_CHOICES = (
    ('CBC', 'CBC'),
    ('DBC', 'DBC'),
    ('GLBC', 'GLBC'),
    ('MABC', 'MABC'),
    ('MWBC', 'MWBC'),
    ('NEBC', 'NEBC'),
    ('SEBC', 'SEBC'),
    ('SWBC', 'SWBC'),
    ('WBC', 'WBC'),
)

MODEL_CHOICES = (
    ('CHRYSLER', 'CHRYSLER'),
    ('DODGE', 'DODGE'),
    ('JEEP', 'JEEP'),
    ('RAM', 'RAM'),
    ('FIAT', 'FIAT'),
)

MAKE_CHOICES = (
    ('200', '200'),
    ('300', '300'),
    ('Town and Country', 'Town and Country'),
    ('Pacifica', 'Pacifica'),
    ('Challenger','Challenger'),
    ('Charger','Charger'),
    ('Dart','Dart'),
    ('Durango','Durango'),
    ('Grand Caravan','Grand Caravan'),
    ('Journey','Journey'),
    ('Cherokee', 'Cherokee'),
    ('Compass', 'Compass'),
    ('Grand Cherokee', 'Grand Cherokee'),
    ('Patriot', 'Patriot'),
    ('Renegade','Renegade'),
    ('Wrangler','Wrangler'),
    ('Wrangler Unlimited','Wrangler Unlimited'),
    ('Durango','Durango'),
    ('1500','1500'),
    ('2500','2500'),
    ('3500','3500'),
    ('CV', 'CV'),
    ('4500/5500', '4500/5500'),
    ('PROMASTER', 'PROMASTER'),
    ('Promaster CITY', 'Promaster CITY'),
    ('500','500'),
    ('500e','500e'),
    ('500L','500L'),
    ('500X','500X'),
    ('Spider 124','Spider 124'),
)

MONTH_CHOICES = (
    ('JANUARY', 'JANUARY'),
    ('FEBRUARY', 'FEBRUARY'),
    ('MARCH', 'MARCH'),
    ('APRIL', 'APRIL'),
    ('MAY', 'MAY'),
    ('JUNE','JUNE'),
    ('JULY','JULY'),
    ('AUGUST','AUGUST'),
    ('SEPTEMBER','SEPTEMBER'),
    ('OCTOBER','OCTOBER'),
    ('NOVEMBER','NOVEMBER'),
    ('DECEMBER','DECEMBER'),
)

class NamePlate(models.Model):
    pub_date = models.DateTimeField('date published', auto_now_add=True)
    subject_name = models.CharField(max_length=200, verbose_name='Subject Name', unique=True)

    month = models.CharField(
        max_length=100, 
        choices=MONTH_CHOICES,
        verbose_name='Month'
    )

    business_center = models.CharField(
        max_length=4, 
        choices=BC_CHOICES, 
        verbose_name='Business Center'
    )

    states = models.TextField(blank=True)
    zip_codes = models.TextField(blank=True)
    dma = models.TextField(blank=True)
    car_year = models.CharField(max_length=4)
    car_model = models.CharField(
        max_length=100,
        choices=MODEL_CHOICES,
    )
    car_make = models.CharField(
        max_length=100, 
        choices=MAKE_CHOICES
    )
    car_trim = models.CharField(max_length=200, blank=True)
    box_size = models.CharField(max_length=200, blank=True, verbose_name='Box Size')
    wheel_base = models.CharField(max_length=200, blank=True, verbose_name='Wheel Base')
    co_program_id = models.CharField(max_length=200, blank=True, verbose_name='Programe ID')
    co_customer_cash = models.CharField(max_length=200, blank=True, verbose_name='Customer Cash')
    co_bc_bonus_cash = models.CharField(max_length=200, blank=True, verbose_name='BC Bonus Cash')
    co_auto_show_bonus_cash = models.CharField(max_length=200, blank=True, verbose_name='Auto Show Bonus Cash')
    fo_program_id = models.CharField(max_length=200, blank=True, verbose_name='Programe ID')
    fo_apr_and_term = models.CharField(max_length=200, blank=True, verbose_name='APR & Term')
    fo_bc_bonus_cash = models.CharField(max_length=200, blank=True, verbose_name='BC Bonus Cash')
    fo_auto_show_bonus_cash = models.CharField(max_length=200, blank=True, verbose_name='Auto Show Bonus Cash')
    ccfo_program_id = models.CharField(max_length=200, blank=True, verbose_name='Program ID')
    ccfo_customer_cash = models.CharField(max_length=200, blank=True, verbose_name='Customer Cash')
    ccfo_cc_bc_bonus_cash = models.CharField(max_length=200, blank=True, verbose_name='Bonus Cash')
    ccfo_apr_and_term = models.CharField(max_length=200, blank=True, verbose_name='APR & Term')
    ccfo_aat_bc_bonus_cash = models.CharField(max_length=200, blank=True, verbose_name='Bonus Cash')
    lo_program_id = models.CharField(max_length=200, blank=True, verbose_name='Programe ID')
    lo_lease_payment = models.CharField(max_length=200, blank=True, verbose_name='Lease Payment')
    lo_term = models.CharField(max_length=200, blank=True, verbose_name='Term')
    lo_due_at_signing = models.CharField(max_length=200, blank=True, verbose_name='Due at Signing')
    tca_program_id = models.CharField(max_length=200, blank=True, verbose_name='Programe ID')
    total_cash_allowance = models.CharField(max_length=200, blank=True, verbose_name='Total Cash Allowance')
    tv_program_id = models.CharField(max_length=200, blank=True, verbose_name='Programe ID')
    total_values = models.CharField(max_length=200, blank=True, verbose_name='Total Values')
    def __str__(self):
        return self.subject_name

class CarModel(models.Model):
    name = models.CharField(max_length=200)
    value = models.CharField(max_length=200)
    active = models.BooleanField(default=0)
    def __str__(self):
        return self.name

class CarMake(models.Model):
    carModel = models.ForeignKey(CarModel, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    value = models.CharField(max_length=200)
    active = models.BooleanField(default=0)
    def __str__(self):
        return self.name
