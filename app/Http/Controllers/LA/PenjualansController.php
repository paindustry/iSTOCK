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

use App\Models\Penjualan;

class PenjualansController extends Controller
{
	public $show_action = true;
	public $view_col = 'kode_barang';
	public $listing_cols = ['id', 'kode_barang', 'jumlah_barang', 'tanggal_penjualan', 'total_harga'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Penjualans', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Penjualans', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Penjualans.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Penjualans');
		
		if(Module::hasAccess($module->id)) {
			return View('la.penjualans.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new penjualan.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created penjualan in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Penjualans", "create")) {
		
			$rules = Module::validateRules("Penjualans", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Penjualans", $request);


			$mysqli = mysqli_connect('localhost', 'root', '', 'istock');
			$kkk = mysqli_query($mysqli, "SELECT kode_barang FROM penjualans WHERE id='$insert_id'");
			if(mysqli_num_rows($kkk) > 0) {
				$row = mysqli_fetch_assoc($kkk);
				print_r($row['kode_barang']);
			}
			$var_info = print_r($row['kode_barang'],true);
			echo $var_info;

			$jumlah_laporan = mysqli_query($mysqli, "UPDATE laporans SET jumlah_penjualan=(SELECT SUM(jumlah_barang) FROM penjualans WHERE kode_barang='$var_info') WHERE kode_barang='$var_info'");
			$harga_laporan = mysqli_query($mysqli, "UPDATE laporans a, kodbars b SET a.total_harga=a.jumlah_penjualan*b.harga_jual WHERE a.id=b.id");
			$harga_total = mysqli_query($mysqli, "UPDATE penjualans a, kodbars b SET a.total_harga=a.jumlah_barang*b.harga_jual");

			return redirect()->route(config('laraadmin.adminRoute') . '.penjualans.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified penjualan.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Penjualans", "view")) {
			
			$penjualan = Penjualan::find($id);
			if(isset($penjualan->id)) {
				$module = Module::get('Penjualans');
				$module->row = $penjualan;
				
				return view('la.penjualans.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('penjualan', $penjualan);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("penjualan"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified penjualan.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Penjualans", "edit")) {			
			$penjualan = Penjualan::find($id);
			if(isset($penjualan->id)) {	
				$module = Module::get('Penjualans');
				
				$module->row = $penjualan;
				
				return view('la.penjualans.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('penjualan', $penjualan);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("penjualan"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified penjualan in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Penjualans", "edit")) {
			
			$rules = Module::validateRules("Penjualans", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Penjualans", $request, $id);


			$mysqli = mysqli_connect('localhost', 'root', '', 'istock');

			$jumlah_laporan = mysqli_query($mysqli, "UPDATE laporans a, penjualans b SET a.jumlah_penjualan=(SELECT SUM(jumlah_barang) FROM penjualans) WHERE a.kode_barang=b.kode_barang");
			$harga_laporan = mysqli_query($mysqli, "UPDATE laporans a, kodbars b SET a.total_harga=a.jumlah_penjualan*b.harga_jual WHERE a.id=b.id");
			$harga_total = mysqli_query($mysqli, "UPDATE penjualans a, kodbars b SET a.harga_total=a.jumlah_barang*b.harga_jual");
			
			return redirect()->route(config('laraadmin.adminRoute') . '.penjualans.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified penjualan from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Penjualans", "delete")) {
			Penjualan::find($id)->delete();

			$mysqli = mysqli_connect('localhost', 'root', '', 'istock');
			$result = mysqli_query($mysqli, "DELETE FROM kodbars WHERE kategori_barang = '$id'");		

			return redirect()->route(config('laraadmin.adminRoute') . '.penjualans.index');
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
		$values = DB::table('penjualans')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Penjualans');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/penjualans/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Penjualans", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/penjualans/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Penjualans", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.penjualans.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
