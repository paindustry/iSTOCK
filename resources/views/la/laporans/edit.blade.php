@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/laporans') }}">Laporan</a> :
@endsection
@section("contentheader_description", $laporan->$view_col)
@section("section", "Laporans")
@section("section_url", url(config('laraadmin.adminRoute') . '/laporans'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Laporans Edit : ".$laporan->$view_col)

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
				{!! Form::model($laporan, ['route' => [config('laraadmin.adminRoute') . '.laporans.update', $laporan->id ], 'method'=>'PUT', 'id' => 'laporan-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'kode_barang')
					@la_input($module, 'jumlah_penjualan')
					@la_input($module, 'total_harga')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/laporans') }}">Cancel</a></button>
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
	$("#laporan-edit-form").validate({
		
	});
});
</script>
@endpush
