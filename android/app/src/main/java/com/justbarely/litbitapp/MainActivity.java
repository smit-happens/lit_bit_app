package com.justbarely.litbitapp;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.widget.EditText;
import android.widget.ScrollView;
import android.widget.TextView;

import com.macroyau.blue2serial.BluetoothDeviceListDialog;
import com.macroyau.blue2serial.BluetoothSerial;
import com.macroyau.blue2serial.BluetoothSerialListener;


public class MainActivity extends FlutterActivity 
        implements BluetoothSerialListener, BluetoothDeviceListDialog.OnDeviceSelectedListener {

    private static final int REQUEST_ENABLE_BLUETOOTH = 1;

    private BluetoothSerial bluetoothSerial;

    private ScrollView svTerminal;
    private TextView tvTerminal;
    private EditText etSend;

    private boolean crlf = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        // Create a new instance of BluetoothSerial
        bluetoothSerial = new BluetoothSerial(this, this);
    }

    @Override
    protected void onStart() {
        super.onStart();

        // Check Bluetooth availability on the device and set up the Bluetooth adapter
        bluetoothSerial.setup();
    }

    @Override
    protected void onResume() {
        super.onResume();

        // Open a Bluetooth serial port and get ready to establish a connection
        if (bluetoothSerial.checkBluetooth() && bluetoothSerial.isBluetoothEnabled()) {
            if (!bluetoothSerial.isConnected()) {
                bluetoothSerial.start();
            }
        }
    }

    @Override
    protected void onStop() {
        super.onStop();

        // Disconnect from the remote device and close the serial port
        bluetoothSerial.stop();
    }

    // @Override
    // public boolean onCreateOptionsMenu(Menu menu) {
    //     // Inflate the menu; this adds items to the action bar if it is present.
    //     getMenuInflater().inflate(R.menu.menu_terminal, menu);

    //     actionConnect = menu.findItem(R.id.action_connect);
    //     actionDisconnect = menu.findItem(R.id.action_disconnect);

    //     return true;
    // }


    // @Override
    // public void invalidateOptionsMenu() {
    //     if (bluetoothSerial == null)
    //         return;

    //     // Show or hide the "Connect" and "Disconnect" buttons on the app bar
    //     if (bluetoothSerial.isConnected()) {
    //         if (actionConnect != null)
    //             actionConnect.setVisible(false);
    //         if (actionDisconnect != null)
    //             actionDisconnect.setVisible(true);
    //     } else {
    //         if (actionConnect != null)
    //             actionConnect.setVisible(true);
    //         if (actionDisconnect != null)
    //             actionDisconnect.setVisible(false);
    //     }
    // }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        // switch (requestCode) {
        //     case REQUEST_ENABLE_BLUETOOTH:
        //         // Set up Bluetooth serial port when Bluetooth adapter is turned on
        //         if (resultCode == Activity.RESULT_OK) {
        //             bluetoothSerial.setup();
        //         }
        //         break;
        // }
    }

    private void updateBluetoothState() {
        // Get the current Bluetooth state
        final int state;
        if (bluetoothSerial != null)
            state = bluetoothSerial.getState();
        else
            state = BluetoothSerial.STATE_DISCONNECTED;

        // Display the current state on the app bar as the subtitle
        // String subtitle;
        // switch (state) {
        //     case BluetoothSerial.STATE_CONNECTING:
        //         subtitle = getString(R.string.status_connecting);
        //         break;
        //     case BluetoothSerial.STATE_CONNECTED:
        //         subtitle = getString(R.string.status_connected, bluetoothSerial.getConnectedDeviceName());
        //         break;
        //     default:
        //         subtitle = getString(R.string.status_disconnected);
        //         break;
        // }

        // if (getSupportActionBar() != null) {
        //     getSupportActionBar().setSubtitle(subtitle);
        // }
    }

    private void showDeviceListDialog() {
        // Display dialog for selecting a remote Bluetooth device
        // BluetoothDeviceListDialog dialog = new BluetoothDeviceListDialog(this);
        // dialog.setOnDeviceSelectedListener(this);
        // dialog.setTitle(R.string.paired_devices);
        // dialog.setDevices(bluetoothSerial.getPairedDevices());
        // dialog.showAddress(true);
        // dialog.show();
    }

    /* Implementation of BluetoothSerialListener */

    @Override
    public void onBluetoothNotSupported() {
        // new AlertDialog.Builder(this)
        //         .setMessage(R.string.no_bluetooth)
        //         .setPositiveButton(R.string.action_quit, new DialogInterface.OnClickListener() {
        //             @Override
        //             public void onClick(DialogInterface dialog, int which) {
        //                 finish();
        //             }
        //         })
        //         .setCancelable(false)
        //         .show();
    }

    @Override
    public void onBluetoothDisabled() {
        Intent enableBluetooth = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
        startActivityForResult(enableBluetooth, REQUEST_ENABLE_BLUETOOTH);
    }

    @Override
    public void onBluetoothDeviceDisconnected() {
        invalidateOptionsMenu();
        updateBluetoothState();
    }

    @Override
    public void onConnectingBluetoothDevice() {
        updateBluetoothState();
    }

    @Override
    public void onBluetoothDeviceConnected(String name, String address) {
        invalidateOptionsMenu();
        updateBluetoothState();
    }

    @Override
    public void onBluetoothSerialRead(String message) {
        // Print the incoming message on the terminal screen
        // tvTerminal.append(getString(R.string.terminal_message_template,
        //         bluetoothSerial.getConnectedDeviceName(),
        //         message));
        // svTerminal.post(scrollTerminalToBottom);
    }

    @Override
    public void onBluetoothSerialWrite(String message) {
        // Print the outgoing message on the terminal screen
        // tvTerminal.append(getString(R.string.terminal_message_template,
        //         bluetoothSerial.getLocalAdapterName(),
        //         message));
        // svTerminal.post(scrollTerminalToBottom);
    }

    /* Implementation of BluetoothDeviceListDialog.OnDeviceSelectedListener */

    @Override
    public void onBluetoothDeviceSelected(BluetoothDevice device) {
        // Connect to the selected remote Bluetooth device
        bluetoothSerial.connect(device);
    }

    /* End of the implementation of listeners */

    private final Runnable scrollTerminalToBottom = new Runnable() {
        @Override
        public void run() {
            // Scroll the terminal screen to the bottom
            svTerminal.fullScroll(ScrollView.FOCUS_DOWN);
        }
    };

}
