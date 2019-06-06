controls[CTRL.upPressed] = keyboard_check_pressed(vk_up);
controls[CTRL.rightPressed] = keyboard_check_pressed(vk_right);
controls[CTRL.downPressed] = keyboard_check_pressed(vk_down);
controls[CTRL.leftPressed] = keyboard_check_pressed(vk_left);
controls[CTRL.action1Pressed] = keyboard_check_pressed(ord("Z"));
controls[CTRL.action2Pressed] = keyboard_check_pressed(ord("X"));
controls[CTRL.startPressed] = keyboard_check_pressed(vk_enter);
controls[CTRL.selectPressed] = keyboard_check_pressed(vk_backspace);

controls[CTRL.upHeld] = keyboard_check(vk_up);
controls[CTRL.rightHeld] = keyboard_check(vk_right);
controls[CTRL.downHeld] = keyboard_check(vk_down);
controls[CTRL.leftHeld] = keyboard_check(vk_left);
controls[CTRL.action1Held] = keyboard_check(ord("Z"));
controls[CTRL.action2Held] = keyboard_check(ord("X"));
