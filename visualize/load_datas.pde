void load_datas() {
  Table table = loadTable("attitudes.csv", "header");

  if ( table == null ) {
    empty = true;
    return ;
  }

  for (TableRow row : table.rows()) {
    float x_angle = float(row.getString("angle_x"));
    float y_angle = float(row.getString("angle_y"));
    float z_angle = float(row.getString("angle_z"));
    float rocket_height = float(row.getString("height"));

    //println("data:\t" + x_angle + "\t" + y_angle + "\t" + z_angle );

    x_angles.add(x_angle);
    y_angles.add(y_angle);
    z_angles.add(z_angle);
    rocket_heights.add(rocket_height);
  }
}