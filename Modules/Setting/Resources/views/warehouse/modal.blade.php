<div class="modal fade" id="store_or_update_modal" tabindex="-1" role="dialog" aria-labelledby="model-1" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
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
                    <x-form.textbox labelName="Warehouse Name" name="name" required="required" col="col-md-6" placeholder="Enter warehouse name"/>
                    <x-form.textbox labelName="Store Manager" name="store_manager" required="required" col="col-md-6" placeholder="Enter Store Manager"/>
                    <x-form.textbox labelName="Phone" name="phone" col="col-md-6" placeholder="Enter phone number"/>
                    <x-form.textbox labelName="Email" type="email" name="email" col="col-md-6" placeholder="Enter email address"/>
                    <x-form.selectbox labelName="District" name="district_id" required="required" col="col-md-6" class="selectpicker">
                      @if (!$districts->isEmpty())
                          @foreach ($districts as $id => $name)
                              <option value="{{ $id }}">{{ $name }}</option>
                          @endforeach
                      @endif
                    </x-form.selectbox>
                    <x-form.textarea labelName="Address" name="address" col="col-md-6" placeholder="Enter address"/>
                    <x-form.selectbox labelName="Deletable" name="deletable" required="required" col="col-md-12" class="selectpicker">
                        @foreach ($deletable as $key => $item)
                            <option value="{{ $key }}">{{ $item }}</option>
                        @endforeach
                    </x-form.selectbox>
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
