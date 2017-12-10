@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/formulas') }}">Formula</a> :
@endsection
@section("contentheader_description", $formula->$view_col)
@section("section", "Formulas")
@section("section_url", url(config('laraadmin.adminRoute') . '/formulas'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Formulas Edit : ".$formula->$view_col)

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
				{!! Form::model($formula, ['route' => [config('laraadmin.adminRoute') . '.formulas.update', $formula->id ], 'method'=>'PUT', 'id' => 'formula-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'bulan_ke')
					@la_input($module, 'single_ex')
					@la_input($module, 'double_ex')
					@la_input($module, 'at')
					@la_input($module, 'bt')
					@la_input($module, 'rekomendasi')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/formulas') }}">Cancel</a></button>
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
	$("#formula-edit-form").validate({
		
	});
});
</script>
@endpush
