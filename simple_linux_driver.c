
#include <linux/init.h>
#include <linux/module.h>

/*
FOR SIMPLICITY REASONS, WE USE KERNEL MODULE FOR THIS DEVELOPMENT
STEP-1 LOAD, UNLOAD KERNEL MODULE
*/

static int my_init(void)
{
                       return  0;
}
   
static void my_exit(void)
{
                       return;
}
   
module_init(my_init);
module_exit(my_exit);

// STEP-2 Registering Character Device
/*
int register_chrdev (unsigned int   major,
                     const char *   name,
                     const struct   fops);
                     file_operations *
*/
// STEP-3 Specifying the Character Device
