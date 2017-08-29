from django.contrib import admin

from .models import NamePlate
from .models import CarModel
from .models import CarMake
from simple_history.admin import SimpleHistoryAdmin

#admin.site.register(CarMake)

# Define the admin class
class NamePlateAdmin(SimpleHistoryAdmin):
    list_display = ('subject_name', 'business_center', 'car_model', 'car_make', 'car_year')
    list_filter = ('pub_date', 'business_center', 'car_model', 'car_year')
    search_fields = ['subject_name', 'car_model', 'car_make']
    readonly_fields = ('subject_name', 'business_center', 'month', 'car_model', 'car_make', )

    fieldsets = (
        (None, {
            'fields': ('subject_name','business_center', 'month')
        }),
        ('Business Center Info', {
            'fields': ('states','zip_codes', 'dma')
        }),
        ('Car Info', {
            'fields': ('car_model','car_make', 'car_year', 'car_trim', 'box_size', 'wheel_base')
        }),
        ('Cash Offer', {
            'fields': ('co_customer_cash', 'co_customer_cash_program_id', 'co_bc_bonus_cash', 'co_bc_bonus_cash_program_id', 'co_auto_show_bonus_cash', 'co_auto_show_bonus_cash_program_id')
        }),
        ('Finance Offer', {
            'fields': ('fo_apr_and_term', 'fo_apr_and_term_program_id', 'fo_bc_bonus_cash', 'fo_bc_bonus_cash_program_id', 'fo_auto_show_bonus_cash', 'fo_auto_show_bonus_cash_program_id')
        }),
        ('Combo Cash or Finance Offer', {
            'fields': ('ccfo_customer_cash', 'ccfo_customer_cash_program_id', 'ccfo_cc_bc_bonus_cash', 'ccfo_cc_bc_bonus_cash_program_id', 'ccfo_apr_and_term', 'ccfo_apr_and_term_program_id', 'ccfo_aat_bc_bonus_cash', 'ccfo_aat_bc_bonus_cash_program_id')
        }),
        ('Lease Offer', {
            'fields': ('lo_lease_payment', 'lo_lease_payment_program_id', 'lo_term', 'lo_term_program_id', 'lo_due_at_signing', 'lo_due_at_signing_program_id')
        }),
        ('Total Cash Allowance Offer', {
            'fields': ('tca_program_id', 'total_cash_allowance')
        }),
        ('Total Values Offer', {
            'fields': ('tv_program_id', 'total_values')
        }),
    )

class CarModelAdmin(admin.ModelAdmin):
    list_display = ('name', 'value', 'active')

class CarMakeAdmin(admin.ModelAdmin):
    list_display = ('name', 'value', 'active', 'carModel_list')
    list_filter = ('active', 'carModel_id')

    def carModel_list(self, obj):
        carModel = CarModel.objects.get(id=obj.carModel_id)
        return carModel.name
    carModel_list.short_description = "Car Model"


# Register the admin class with the associated model
admin.site.register(NamePlate, NamePlateAdmin)
admin.site.register(CarModel, CarModelAdmin)
admin.site.register(CarMake, CarMakeAdmin)
