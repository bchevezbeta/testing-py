# api/serializers.py

from rest_framework import serializers
from cowsform.models import NamePlate

class NamePlateSerializer(serializers.ModelSerializer):
    """Serializer to map the Model instance into JSON format."""

    class Meta:
        """Meta class to map serializer's fields with the model fields."""
        model = NamePlate
        fields = (
        	'id', 'pub_date', 
        	'subject_name', 'month', 'business_center', 'states', 'zip_codes','dma', 'car_make', 'car_model', 
        	'car_year', 'car_trim','box_size','wheel_base',
        	'co_customer_cash_program_id', 'co_customer_cash','co_bc_bonus_cash_program_id','co_bc_bonus_cash', 'co_auto_show_bonus_cash_program_id','co_auto_show_bonus_cash',
        	'fo_apr_and_term_program_id','fo_apr_and_term','fo_bc_bonus_cash_program_id','fo_bc_bonus_cash','fo_auto_show_bonus_cash_program_id','fo_auto_show_bonus_cash',
        	'ccfo_customer_cash_program_id','ccfo_customer_cash','ccfo_cc_bc_bonus_cash_program_id','ccfo_cc_bc_bonus_cash','ccfo_apr_and_term_program_id','ccfo_apr_and_term','ccfo_aat_bc_bonus_cash_program_id','ccfo_aat_bc_bonus_cash',
        	'lo_lease_payment_program_id','lo_lease_payment','lo_term_program_id','lo_term','lo_due_at_signing_program_id','lo_due_at_signing',
        	'tca_program_id','total_cash_allowance',
        	'tv_program_id','total_values',
        	)
        read_only_fields = (
        	'subject_name', 'month', 'business_center', 'states', 'zip_codes','dma', 'car_make', 'car_model',
        	)