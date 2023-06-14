<div class="col-md-12">
    <div class="row">
        <div class="table-responsive col-9">
            <table class="table table-borderless">
                <tr>
                    <td><b>Dealer Name</b></td><td><b>:</b></td><td>{{ $dealer->dealer->name }}</td>
                    <td><b>Year</b></td><td><b>:</b></td><td>{{ $dealer->year }}</td>
                </tr>
                @php
                     if ($dealer->month == 1) {
                    $mnth = "January";
                }
                if ($dealer->month == 2) {
                    $mnth = "February";
                }
                if ($dealer->month == 3) {
                    $mnth = "March";
                }
                if ($dealer->month == 4) {
                    $mnth = "April";
                }
                if ($dealer->month == 5) {
                    $mnth = "May";
                }
                if ($dealer->month == 6) {
                    $mnth = "June";
                }
                if ($dealer->month == 7) {
                    $mnth = "July";
                }
                if ($dealer->month == 8) {
                    $mnth = "August";
                }
                if ($dealer->month == 9) {
                    $mnth = "September";
                }
                if ($dealer->month == 10) {
                    $mnth = "October";
                }
                if ($dealer->month == 11) {
                    $mnth = "November";
                }
                if ($dealer->month == 12) {
                    $mnth = "December";
                }
                @endphp
                <tr>
                    <td><b>Month</b></td><td><b>:</b></td><td>{{ $mnth }}</td>
                    <td><b>Target Quantity</b></td><td><b>:</b></td><td>{{ $dealer->qty }}</td>
                </tr>

                <tr>
                    <td><b>Acheived Qty</b></td><td><b>:</b></td><td>{{  $dealer->acheived_qty  }}</td>
                    <td><b>Commission Amount Per Bag</b></td><td><b>:</b></td><td>{{  $dealer->commission_amount  }}</td>

                </tr>
                <tr>

                    <td><b>Created By</b></td><td><b>:</b></td><td>{{  $dealer->created_by  }}</td>
                    <td><b>Modified By</b></td><td><b>:</b></td><td>{{  $dealer->modified_by  }}</td>
                </tr>
            </table>
        </div>
    </div>
</div>
