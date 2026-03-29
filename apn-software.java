package cu.slam.apnseeditor;

import java.io.File;
import java.io.OutputStream;
import java.util.List;

import android.os.Bundle;
import android.os.Parcel;
import android.app.ActionBar;
import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.service.notification.StatusBarNotification;
import android.telephony.TelephonyManager;
import android.util.Pair;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {

	EditText txtApn;
	String apn = "";
	Button boton;
	TextView debug;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		txtApn = (EditText) findViewById(R.id.editText1);
		boton = (Button) findViewById(R.id.button1);
		debug  = (TextView)findViewById(R.id.textView1DebugInfo);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	/*
	 * // Para escribir un APN manualmente public static final Uri APN_TABLE_URI
	 * = Uri .parse("content://telephony/carriers"); public static final Uri
	 * APN_PREFER_URI = Uri .parse("content://telephony/carriers/preferapn");	
	 */

	public void cargarBDapn(String apn) {
		try {
			String ruta = "/data/data/com.android.providers.telephony/databases/telephony.db";
			String ruta1 = getCacheDir()+"/telephony.db";
			Process p = Runtime.getRuntime().exec("su");
			OutputStream os = p.getOutputStream();
			os.write(("cp /data/data/com.android.providers.telephony/databases/telephony.db "+ getCacheDir()).getBytes());
			os.write(("chmod -R 777 " + getCacheDir()).getBytes());
			SQLiteDatabase db = SQLiteDatabase.openDatabase(ruta1, null, 0);
			String sql = "INSERT INTO carriers (name,numeric,mcc,mnc,apn,authtype,type,current,sourcetype,protocol,roaming_protocol,carrier_enabled,bearer)"
					+ " VALUES ('"+apn+"','36801','368','01','"+apn+"','-1','default','1','1','IP','IP','1','0')";
			
			if (db != null) {				
				db.execSQL(sql);		
				Toast.makeText(getApplicationContext(),"Registro insertado", Toast.LENGTH_LONG).show();
				db.close();
				os.write(("cp "+ruta1+" "+ruta+"\n").getBytes());				
				Intent it = new Intent("android.settings.APN_SETTINGS");				
				//Activity actApn = new Activity();
				
				startActivity(it);				
			}
		} catch (Exception e) {
			Toast.makeText(getApplicationContext(), "No funcionó",Toast.LENGTH_LONG).show();
			e.printStackTrace();
			debug.setText(e.getMessage());
		}
	}
	
	/* public static boolean setActiveAPN(Context context, int id) throws
	 IllegalArgumentException {
	    boolean res = false;
	    ContentResolver resolver = context.getContentResolver();
	    ContentValues values = new ContentValues();

	    values.put("apn_id", id);
	    try {
	     resolver.update(PREFERRED_APN_URI, values, null, null);
	     Cursor c = resolver.query(PREFERRED_APN_URI, new String[] { "name", "apn" }, "_id=" + id, null, null);
	     if (c != null) {
	      res = true;
	      c.close();
	     }
	    } catch (SQLException e) {
	     Log.d(TAG, e.getMessage());
	     throw new IllegalArgumentException("APN cannot be set! (probably wrong name");
	    }
	    return res;
	   }
*/
	public void AplicarCambios(View v) {
		apn = txtApn.getText().toString();
		if (apn != null) {
			cargarBDapn(apn);
		}		
		//finish();		
	}	
}
