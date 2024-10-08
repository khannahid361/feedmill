<div class="modal fade" id="store_or_update_modal" tabindex="-1" role="dialog" aria-labelledby="model-1" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h3 class="modal-title text-white" id="model-1"></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close text-white"></i>
                </button>
            </div>
            <form id="store_or_update_form" method="post">
            @csrf
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" name="update_id" id="update_id"/>
                        <div class="col-md-6">
                            <label for="salesmen_id">Sales Men</label>
                            <select class="form-control selectpicker" id="salesmen_id" name="salesmen_id" data-live-search="true">
                                <option value="">Select Please</option>
                                @foreach($salesmen as $value)
                                    <option value="{{$value->id}}">{{$value->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="product_commission_id">Commission Name</label>
                            <select class="form-control selectpicker" id="product_commission_id" name="product_commission_id" data-live-search="true">
                                <option value="">Select Please</option>
                                @foreach($commissions as $value)
                                    <option value="{{$value->id}}">{{$value->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6"><br/><br/><input type = "date" class="form-control" id="start_date" name="start_date"/></div>
                        <div class="col-md-6"><br/><br/><input type = "date" class="form-control" id="end_date" name="end_date"/></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btn-sm" id="save-btn"></button>
                </div>
            </form>
        </div>
    </div>
</div>
