@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/koddivs') }}">Koddiv</a> :
@endsection
@section("contentheader_description", $koddiv->$view_col)
@section("section", "Koddivs")
@section("section_url", url(config('laraadmin.adminRoute') . '/koddivs'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Koddivs Edit : ".$koddiv->$view_col)

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
				{!! Form::model($koddiv, ['route' => [config('laraadmin.adminRoute') . '.koddivs.update', $koddiv->id ], 'method'=>'PUT', 'id' => 'koddiv-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'kode_divisi')
					@la_input($module, 'nama_divisi')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/koddivs') }}">Cancel</a></button>
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
	$("#koddiv-edit-form").validate({
		
	});
});
</script>
@endpush
