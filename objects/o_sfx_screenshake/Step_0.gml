if (shake) 
{ 
   shake_time -= 1; 
   var x_cur = camera_get_view_x(view_camera[0]);
   var y_cur = camera_get_view_y(view_camera[0]);
   var _xval = choose(-shake_magnitude, shake_magnitude); 
   var _yval = choose(-shake_magnitude, shake_magnitude); 
   camera_set_view_pos(view_camera[0], x_cur +_xval,y_cur + _yval); 

   if (shake_time <= 0) 
   { 
      shake_magnitude -= shake_fade; 

      if (shake_magnitude <= 0) 
      { 
         camera_set_view_pos(view_camera[0], x_cur, y_cur); 
         shake = false; 
      } 
   } 
}