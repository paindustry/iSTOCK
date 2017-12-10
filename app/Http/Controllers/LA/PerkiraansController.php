<?php
/**
 * Controller genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Http\Controllers\LA;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use Auth;
use DB;
use Validator;
use Datatables;
use Collective\Html\FormFacade as Form;
use Dwij\Laraadmin\Models\Module;
use Dwij\Laraadmin\Models\ModuleFields;

use App\Models\Perkiraan;

class PerkiraansController extends Controller
{
	public $show_action = true;
	public $view_col = 'kode_barang';
	public $listing_cols = ['id', 'kode_barang', 'total_barang', 'jangka_penjualan', 'perkiraan_penjualan'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Perkiraans', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Perkiraans', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Perkiraans.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Perkiraans');
		
		if(Module::hasAccess($module->id)) {
			return View('la.perkiraans.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new perkiraan.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created perkiraan in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Perkiraans", "create")) {
		
			$rules = Module::validateRules("Perkiraans", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Perkiraans", $request);
			$mysqli = mysqli_connect('localhost', 'root', '', 'istock');
			$result = mysqli_query($mysqli, "UPDATE perkiraans as p, penjualans as s  SET perkiraan_penjualan=$peramalan  WHERE id='$insert_id'");

			// foreach ($req->fetchAll() as $post) {
			// 	$a=0.5;
			// 	$single=($a*1)+(a*$post['s.jumlah_barang']);
			// 	$peramalan=($a*$single)+$a*1;
			// 	# code...
			// }
			
			return redirect()->route(config('laraadmin.adminRoute') . '.perkiraans.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified perkiraan.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Perkiraans", "view")) {
			
			$perkiraan = Perkiraan::find($id);
			if(isset($perkiraan->id)) {
				$module = Module::get('Perkiraans');
				$module->row = $perkiraan;
				
				return view('la.perkiraans.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('perkiraan', $perkiraan);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("perkiraan"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified perkiraan.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Perkiraans", "edit")) {			
			$perkiraan = Perkiraan::find($id);
			if(isset($perkiraan->id)) {	
				$module = Module::get('Perkiraans');
				
				$module->row = $perkiraan;
				
				return view('la.perkiraans.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('perkiraan', $perkiraan);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("perkiraan"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified perkiraan in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Perkiraans", "edit")) {
			
			$rules = Module::validateRules("Perkiraans", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Perkiraans", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.perkiraans.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified perkiraan from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Perkiraans", "delete")) {
			Perkiraan::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.perkiraans.index');
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}
	
	/**
	 * Datatable Ajax fetch
	 *
	 * @return
	 */
	public function dtajax()
	{
		$values = DB::table('perkiraans')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Perkiraans');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/perkiraans/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Perkiraans", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/perkiraans/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Perkiraans", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.perkiraans.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
					$output .= ' <button class="btn btn-danger btn-xs" type="submit"><i class="fa fa-times"></i></button>';
					$output .= Form::close();
				}
				$data->data[$i][] = (string)$output;
			}
		}
		$out->setData($data);
		return $out;
	}
}
