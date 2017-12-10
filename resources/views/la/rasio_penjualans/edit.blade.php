@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/rasio_penjualans') }}">Rasio penjualan</a> :
@endsection
@section("contentheader_description", $rasio_penjualan->$view_col)
@section("section", "Rasio penjualans")
@section("section_url", url(config('laraadmin.adminRoute') . '/rasio_penjualans'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Rasio penjualans Edit : ".$rasio_penjualan->$view_col)

@section("main-content")

@if (count($errors) > 0)
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="box">
	<div class="box-header">
		
	</div>
	<div class="box-body">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				{!! Form::model($rasio_penjualan, ['route' => [config('laraadmin.adminRoute') . '.rasio_penjualans.update', $rasio_penjualan->id ], 'method'=>'PUT', 'id' => 'rasio_penjualan-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'bulan_ke')
					@la_input($module, 'kode_barang')
					@la_input($module, 'jumlah_penjualan')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/rasio_penjualans') }}">Cancel</a></button>
					</div>
				{!! Form::close() !!}
			</div>
		</div>
	</div>
</div>

@endsection

@push('scripts')
<script>
$(function () {
	$("#rasio_penjualan-edit-form").validate({
		
	});
});
</script>
@endpush
