<div class="modal fade" id="store_or_update_modal" tabindex="-1" role="dialog" aria-labelledby="model-1" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-primary">
          <h3 class="modal-title text-white" id="model-1"></h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i aria-hidden="true" class="ki ki-close text-white"></i></button>
        </div>
        <form id="store_or_update_form" method="post">
          @csrf
            <div class="modal-body">
                <div class="row">
                    <input type="hidden" name="update_id" id="update_id"/>
                    <input type="hidden" name="type" value="3"/>
                    <x-form.selectbox labelName="District" name="grand_parent_id" required="required" col="col-md-12" class="selectpicker"  onchange="getUpazilaList(this.value,2)">
                      @if (!$districts->isEmpty())
                          @foreach ($districts as $district)
                              <option value="{{ $district->id }}">{{ $district->name }}</option>
                          @endforeach
                      @endif
                  </x-form.selectbox>
                  <x-form.selectbox labelName="Upazila" name="parent_id" required="required" col="col-md-12" class="selectpicker"/>
                  <x-form.textbox labelName="Area Name" name="name" required="required" col="col-md-12" placeholder="Enter route name"/>
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
