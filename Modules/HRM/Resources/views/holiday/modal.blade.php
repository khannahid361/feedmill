<div class="modal fade" id="store_or_update_modal" tabindex="-1" role="dialog" aria-labelledby="model-1" aria-hidden="true">
    <div class="modal-dialog" role="document">

        <!-- Modal Content -->
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header bg-primary">
                <h3 class="modal-title text-white" id="model-1"></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close text-white"></i>
                </button>
            </div>
            <!-- /modal header -->
            <form id="store_or_update_form" method="post">
                @csrf
                <!-- Modal Body -->
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" name="update_id" id="update_id"/>
                        <x-form.textbox labelName="Title" name="title" col="col-md-12"/>
                        <x-form.selectbox labelName="Type" name="type" col="col-md-12" class="selectpicker">
                            @foreach (TYPE_STATUS as $key => $value)
                                <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </x-form.selectbox>
                        <div class="form-group col-md-12 required">
                            <label for="start_date">Start Date</label>
                            <input type="date" class="form-control" name="start_date" id="start_date"
                                   value="{{ date("Y-m-d") }}" />
                        </div>
                        <div class="form-group col-md-12 required">
                            <label for="end_date">End Date</label>
                            <input type="date" class="form-control" name="end_date" id="end_date"
                                   value="{{ date("Y-m-d") }}" />
                        </div>
                        <div class="form-group col-md-12 required">
                            <label for="description">Description</label>
                            <textarea name="description" class="form-control" id="description" cols="30" rows="10"></textarea>
                        </div>
                    </div>
                </div>
                <!-- /modal body -->

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btn-sm" id="save-btn"></button>
                </div>
                <!-- /modal footer -->
            </form>
        </div>
        <!-- /modal content -->

    </div>
</div>
